From: John Stile <john@stilen.com>
Date: Tue, 05 Mar 2013 08:21:17 -0800
Subject: [Buildroot] adding dhcpcd
In-Reply-To: <5130F7CA.6090203@zacarias.com.ar>
References: <1362163072.19802.25.camel@genx.eng.msli.com>
 <5130F7CA.6090203@zacarias.com.ar>
Message-ID: <1362500477.20183.74.camel@genx>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2013-03-01 at 15:47 -0300, Gustavo Zacarias wrote:
> On 03/01/2013 03:37 PM, John Stile wrote:
> 
> > I have a need for an RFC2131 compliant DHCP client, which dhcpcd
> > advertises to be (specifically  it needs to detect if a dhcp server
> > becomes available).
> > 
> > I am using buildroot-2011.11.
> > 
> > I tried to add my own package to buildroot, to build dhcpcd, but I have
> > no idea how to go about integrating into the system.
> > 
> > I configure static vs. dynamic via /etc/network/interfaces, but should I
> > do next?  
> > 
> > How does the default system decide what to do with networking?
> > What is the default dhcp client, and why isn't it RFC2131 compliant?
> 
> Hi.
> If you're using a default buildroot skeleton without touching much then
> /etc/init.d/S40network is called on system startup (from
> /etc/init.d/rcS, which is invoked by init [/etc/inittab]).
> S40network does an "ifup -a" (interface up, all) which is a busybox
> applet/command that reads /etc/network/interfaces and does what it's
> appropiate according to the configuration.
> If your busybox config is default then udhcpc is built (busybox's dhcp
> client) and that's what's used for DHCP.
> For dhcpcd you probably don't want to use ifup nor S40network, you
> probably want to run dhcpcd directly, something like "dhcpcd -b eth0" or
> so. If link status messages are available it'll wait until carrier is
> detected, and do the usual DHCP dance.
> Regards.
> 
Does this look like a good make file for buildroot?  
Is this the right place to get advice on a make file, or even submit?
I put this together from various sources/references.
---------------
Makefile
---------------
# -*-makefile-*-
#############################################################
#
# dhcpcd
#
#############################################################

DHCPCD_VERSION=3.2.3
DHCPCD_SOURCE=dhcpcd-$(DHCPCD_VERSION).tar.bz2
DHCPCD_SITE=http://roy.marples.name/downloads/dhcpcd/
DHCPCD_DIR=$(BUILD_DIR)/dhcpcd-$(DHCPCD_VERSION)
DHCPCD_CAT:=$(BZCAT)
DHCPCD_BINARY:=dhcpcd
DHCPCD_TARGET_BINARY:=usr/bin/$(DHCPCD_BINARY)
#DHCPCD_DEPENDENCIES += ntp
DHCPCD_PATH	:= PATH=$(CROSS_PATH)
DHCPCD_ENV 	:= $(CROSS_ENV)
# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

$(DL_DIR)/$(DHCPCD_SOURCE):
	$(call DOWNLOAD,$(DHCPCD_SITE),$(DHCPCD_SOURCE))

# ----------------------------------------------------------------------------
# Extract
# ----------------------------------------------------------------------------

$(DHCPCD_DIR)/.unpacked: $(DL_DIR)/$(DHCPCD_SOURCE)
	$(DHCPCD_CAT) $(DL_DIR)/$(DHCPCD_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
	touch $@

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

$(DHCPCD_DIR)/.patched: $(DHCPCD_DIR)/.unpacked
	support/scripts/apply-patches.sh $(DHCPCD_DIR) package/dhcpcd dhcpcd-$(DHCPCD_VERSION)\*.patch\* 
	touch $@

$(DHCPCD_DIR)/.configured: $(DHCPCD_DIR)/.patched
	@$(cd $(DHCPCD_DIR) && \
	$(DHCPCD_PATH) $(DHCPCD_ENV)  \
	./configure --target="armv5te"
	@$(call clean, $(DHCPCD_DIR)/config.cache)
	touch $@

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

$(DHCPCD_DIR)/$(DHCPCD_BINARY): $(DHCPCD_DIR)/.configured
	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
	HAVE_FORK=yes HAVE_INIT=SYSV \
	-C $(DHCPCD_DIR)
	@$(call touch $(DHCPCD_DIR)/.stamp_built )

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

$(TARGET_DIR)/$(DHCPCD_TARGET_BINARY): $(DHCPCD_DIR)/$(DHCPCD_BINARY)
	cp -dpf $(DHCPCD_DIR)/dhcpcd $@
	$(STRIPCMD) --strip-unneeded $@
	cp -dfp $(DHCPCD_DIR)/dhcpcd.sh $(TARGET_DIR)/etc/init.d/

# ----------------------------------------------------------------------------
# One rule to rule them all
# ----------------------------------------------------------------------------
dhcpcd: $(TARGET_DIR)/$(DHCPCD_TARGET_BINARY)

# Source download rule. Main purpose to download the source package. Since some
# people would like to work offline, it is mandotory to implement a rule which
# downloads everything this package needs.
dhcpcd-source: $(DL_DIR)/$(DHCPCD_SOURCE)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

dhcpcd-clean:
	-$(MAKE) -C $(DHCPCD_DIR) clean

# Directory clean rule. Main purpose is to remove the build directory, forcing
# a new extraction, patching and rebuild the next time Buildroot is made.
dhcpcd-dirclean:
	rm -rf $(DHCPCD_DIR)

#############################################################
#
# Toplevel Makefile options
#
#############################################################
# This is how the dhcpcd package is added to the list of rules to build.
ifeq ($(BR2_PACKAGE_DHCPCD),y)
TARGETS+=dhcpcd
endif

# vim: syntax=make

-------------
Config.in
-------------
config BR2_PACKAGE_DHCPCD
	        bool "dhcpcd"
	        help
	          an RFC2131 compliant DHCP client
