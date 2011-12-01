From: Jeff Krasky <jeff.krasky@dspcg.com>
Date: Thu, 1 Dec 2011 09:55:47 -0600
Subject: [Buildroot] LIBFOO_SITE in .mk file
In-Reply-To: <201112010903.10324.minimod@morethan.org>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <20111201091152.68aa9433 @skate>
 <000f01ccb039$aceba2d0$0400a8c0@dspcgrnzks9p98>
 <201112010903.10324.minimod@morethan.org>
Message-ID: <001001ccb041$b197cc20$0400a8c0@dspcgrnzks9p98>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> You don't even have to do that, just save the e-mail as a plain text
> file using your e-mail client.
> 
> Patch will ignore the leading, non-patch, discussion.
> 
> It was designed that way, back in the days when the only way to
> pass patches was by e-mail.  ;-)

Ok, I saved the entire email in notepad as an ANSI text document, then
renamed it to have the .patch extension.

I went to run 'make linux-menuconfig' and I got this message:

package/igh-ethercat/igh-ethercat.mk:11: *** missing separator.  Stop.

When using Buildroot-2011.05 I needed to run 'make linux-menuconfig'.  Here
is the .mk file:

IGH_ETHERCAT_VERSION = stable-1.5
IGH_ETHERCAT_SITE    =
http://etherlabmaster.hg.sourceforge.net/hgweb/etherlabmaster/etherlabmaster
/archive/
IGH_ETHERCAT_SOURCE  = $(IGH_ETHERCAT_VERSION).tar.bz2 
IGH_ETHERCAT_AUTORECONF = YES IGH_ETHERCAT_DEPENDENCIES = linux 
IGH_ETHERCAT_INSTALL_STAGING = YES

IGH_ETHERCAT_CONF_OPT = \
	--with-linux-dir=$(LINUX_DIR)

IGH_ETHERCAT_CONF_OPT += $(if 
$(BR2_PACKAGE_IGH_ETHERCAT_8139TOO),--enable-8139too,--disable-8139too)
IGH_ETHERCAT_CONF_OPT += $(if 
$(BR2_PACKAGE_IGH_ETHERCAT_E100),--enable-e100,--disable-e100)
IGH_ETHERCAT_CONF_OPT += $(if 
$(BR2_PACKAGE_IGH_ETHERCAT_E1000),--enable-e1000,--disable-e1000)
IGH_ETHERCAT_CONF_OPT += $(if 
$(BR2_PACKAGE_IGH_ETHERCAT_R8169),--enable-r8169,--disable-r8169)

define IGH_ETHERCAT_CREATE_CHANGELOG
	touch $(@D)/ChangeLog
endef

IGH_ETHERCAT_POST_PATCH_HOOKS += IGH_ETHERCAT_CREATE_CHANGELOG

define IGH_ETHERCAT_BUILD_MODULES
	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) modules endef

IGH_ETHERCAT_POST_BUILD_HOOKS += IGH_ETHERCAT_BUILD_MODULES

define IGH_ETHERCAT_INSTALL_MODULES
	$(MAKE) -C $(@D) $(LINUX_MAKE_FLAGS) modules_install endef

IGH_ETHERCAT_POST_INSTALL_TARGET_HOOKS += IGH_ETHERCAT_INSTALL_MODULES



Line 11 appears to be
"$(BR2_PACKAGE_IGH_ETHERCAT_8139TOO),--enable-8139too,--disable-8139too)".
Does this need to be tabbed in or something?  The build takes about 30
minutes and so I'd like to correct in advance if I could.

Thanks again.
