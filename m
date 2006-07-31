From: Claus Klein <claus.klein@arcormail.de>
Date: Mon Jul 31 12:16:32 2006
Subject: [Buildroot] how to add monit package in buildroot
In-Reply-To: <20060731143003.25363.qmail@webmail32.rediffmail.com>
References: <20060731143003.25363.qmail@webmail32.rediffmail.com>
Message-ID: <200607312109.32936.claus.klein@arcormail.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 31 July 2006 16:30, amit bhosale wrote:
> 
>  hi list
> 
>         i want to compile monit for my root file system.
>     In my buildroot (buildroot-20060606.tar) there is no option for  
>     monit package like modutils.
> 
>     so i download monit-4.5.tar.gz in dl directory and add entry in 
>    pakage directory Config.in file 
>         source "package/monit/Config.in"
>    
>   then i download monit4.5.tgz from  
>                http://busybox.net/bugs/view.php?id=175
>   and then untar it as monit it contains
>             Config.in  Makefile.in  
>             monit-4.5-cross.patch  monit-4.5-summary.patch  
>              monit.mk 
>   i save monit dir in Pakages dir in buildroot
> 
>   i made few changes in monit.mk
> 
>    change:-#$(DL_DIR)/$(MONIT_SOURCE):
>            # $(WGET) -P $(DL_DIR) $(MONIT_SITE)/$(MONIT_SOURCE)
>    because i already download the code from that side
>    
>   then monit option is visible in make menuconfig after that i select that option and see it in .config file
>                 
>            BR2_PACKAGE_MONIT=y
>  after that i give command make but monit code is not compiled
> 
>  so please guide me to compile monit
> 
>   amit

Hi amit,
    
    the current monit version is 4.8.1 and needs no patch!
    
    Please try my makefile without changes.
    simly do 'make monit'
    
    If you have still problems, send me the log of your make.
    
claus
-------------- next part --------------
#############################################################
#
# monit
#
#############################################################
###orig: MONIT_VERSION:=4.5.1
# http://www.tildeslash.com/monit/dist/monit-4.5.tar.gz
MONIT_VERSION:=4.8.1
MONIT_SOURCE:=monit-$(MONIT_VERSION).tar.gz
MONIT_SITE:=http://www.tildeslash.com/monit/dist
MONIT_DIR:=$(BUILD_DIR)/monit-$(MONIT_VERSION)
MONIT_BINARY:=monit
MONIT_TARGET_BINARY:=usr/bin/monit

$(DL_DIR)/$(MONIT_SOURCE):
	$(WGET) -P $(DL_DIR) $(MONIT_SITE)/$(MONIT_SOURCE)

$(MONIT_DIR)/.source: $(DL_DIR)/$(MONIT_SOURCE) \
 ###tbd### package/monit/monit-4.5-cross.patch ### package/monit/monit-4.5-summary.patch
	zcat $(DL_DIR)/$(MONIT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
	toolchain/patch-kernel.sh $(MONIT_DIR) package/monit monit-$(MONIT_VERSION)-\*.patch
	touch $(MONIT_DIR)/.source

$(MONIT_DIR)/.configured: $(MONIT_DIR)/.source
	(cd $(MONIT_DIR); rm -f config.cache; autoconf; \
		$(TARGET_CONFIGURE_OPTS) \
		CFLAGS="$(TARGET_CFLAGS)" \
		./configure \
		--cache-file=config.cache \
		--target=$(GNU_TARGET_NAME) \
		--host=$(GNU_TARGET_NAME) \
		--build=$(GNU_HOST_NAME) \
		--prefix=/usr \
		--with-ssl-dir=$(STAGING_DIR) \
		--without-ssl \
		--disable-strip \
	);
	touch $(MONIT_DIR)/.configured;

# --without-ssl \
# or if enabled:
# --with-ssl-dir=$(STAGING_DIR) \
# or explicit:
# --with-ssl-incl-dir=$(STAGING_DIR)/include/openssl	# location of installed SSL include files
# --with-ssl-lib-dir=$(STAGING_DIR)/lib/	# location of installed SSL library files

$(MONIT_DIR)/$(MONIT_BINARY): $(MONIT_DIR)/.configured
	$(MAKE) CC=$(TARGET_CC) -C $(MONIT_DIR) \

$(TARGET_DIR)/$(MONIT_TARGET_BINARY): $(MONIT_DIR)/$(MONIT_BINARY)
	$(STRIP) --strip-unneeded $(MONIT_DIR)/$(MONIT_BINARY)
	$(MAKE) DESTDIR=$(TARGET_DIR) -C $(MONIT_DIR) install
	rm -Rf $(TARGET_DIR)/usr/man

monit: openssl $(TARGET_DIR)/$(MONIT_TARGET_BINARY)

monit-source: $(DL_DIR)/$(MONIT_SOURCE)

monit-clean:
	$(MAKE) prefix=$(TARGET_DIR)/usr -C $(MONIT_DIR) uninstall
	-$(MAKE) -C $(MONIT_DIR) clean

monit-dirclean:
	rm -rf $(MONIT_DIR)


#############################################################
#
# Toplevel Makefile options
#
#############################################################
ifeq ($(strip $(BR2_PACKAGE_MONIT)),y)
TARGETS+=monit
endif
