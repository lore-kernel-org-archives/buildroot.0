From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 Oct 2016 14:06:12 +0200
Subject: [Buildroot] [PATCH v2] skeleton: /etc/network/interface.d/*
	support
In-Reply-To: <20161022232831.030a10ad@free-electrons.com> (Thomas Petazzoni's
 message of "Sat, 22 Oct 2016 23:28:31 +0200")
References: <1471361908-51757-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20161022232831.030a10ad@free-electrons.com>
Message-ID: <8737jnnubv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 > Sorry for the late answer. I believe none of this should go in the main
 > skeleton, as it is really specific to ifupdown.

Indeed. From what I can see, the busybox applet doesn't support
wildcards in the source lines (and doesn't support source-directory).

What is the reason to use source with a wildcard instead of
source-directory? From the man page:

       source interfaces.d/machine-dependent

       source-directory interfaces.d

It does say though:

Currently, "source-directory" isn't supported by network-manager and guessnet.

By default, on a freshly installed Debian system, the interfaces file
includes a line to source files in the /etc/network/interfaces.d
directory.

From the postinst script:

  if [ ! -f /etc/network/interfaces ] ; then
    if [ -z "$2" ]; then
      echo "Creating /etc/network/interfaces."
      echo "# interfaces(5) file used by ifup(8) and ifdown(8)" > /etc/network/interfaces
      echo "# Include files from /etc/network/interfaces.d:" >> /etc/network/interfaces
      echo "source-directory /etc/network/interfaces.d" >> /etc/network/interfaces

 > adding the following in ifupdown.mk:

 > ifeq ($(BR2_ROOTFS_SKELETON_DEFAULT),y)
 > define IFUPDOWN_TUNE_ETC_NETWORK_INTERFACES
 > 	mkdir -p $(TARGET_DIR)/etc/network/interfaces.d
 > 	echo "source interfaces.d/*" >> $(TARGET_DIR)/etc/network/interfaces
 > endef
 > IFUPDOWN_TARGET_FINALIZE_HOOKS += IFUPDOWN_TUNE_ETC_NETWORK_INTERFACES

We afaik provide no explicit guarantees on the ordering of the various
_TARGET_FINALIZE hooks, but it afaik will run in (package-)alphabetical
order, E.G. before the finalize hooks of skeleton so this doesn't work
:/

-- 
Bye, Peter Korsgaard
