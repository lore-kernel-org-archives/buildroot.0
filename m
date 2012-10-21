From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 21 Oct 2012 21:37:56 +0200
Subject: [Buildroot] [PATCH 1/1] newt: convert to autotools-package infra
In-Reply-To: <1349984799-25887-1-git-send-email-s.martin49@gmail.com> (Samuel
 Martin's message of "Thu, 11 Oct 2012 21:46:39 +0200")
References: <1349984799-25887-1-git-send-email-s.martin49@gmail.com>
Message-ID: <87mwzfsjjf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 Samuel> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Committed with minor tweaks, see below:

 Samuel> +NEWT_VERSION         = 0.51.0
 Samuel> +NEWT_SITE            = http://www.uclibc.org/
 Samuel> +NEWT_SOURCE          = newt-$(NEWT_VERSION).tar.bz2
 Samuel> +NEWT_LICENSE         = GPLv2
 Samuel> +NEWT_LICENSE_FILES   = COPYING
 Samuel> +NEWT_INSTALL_STAGING = YES
 Samuel> +
 Samuel> +NEWT_DEPENDENCIES = slang
 Samuel> +
 Samuel> +NEWT_CONF_OPT += \
 Samuel> +	--prefix=/usr \
 Samuel> +	--exec-prefix=/usr \
 Samuel> +	--bindir=/usr/bin \
 Samuel> +	--sbindir=/usr/sbin \
 Samuel> +	--libdir=/lib \
 Samuel> +	--libexecdir=/usr/lib \
 Samuel> +	--sysconfdir=/etc \
 Samuel> +	--datadir=/usr/share \
 Samuel> +	--localstatedir=/var \
 Samuel> +	--mandir=/usr/man \
 Samuel> +	--infodir=/usr/info \
 Samuel> +	$(DISABLE_NLS)

All of these are handled by pkg-autotools, so can be dropped.

 Samuel> +
 Samuel> +NEWT_MAKE_ENV += $(TARGET_CONFIGURE_OPTS)
 Samuel> +NEWT_MAKE = $(MAKE1)
 Samuel> +
 Samuel> +define NEWT_INSTALL_STAGING_CMDS
 Samuel> +	$(INSTALL) -D -m644 $(@D)/newt.h    $(STAGING_DIR)/usr/include/newt.h
 Samuel> +	$(INSTALL) -D -m644 $(@D)/libnewt.a $(STAGING_DIR)/usr/lib/libnewt.a
 Samuel> +	$(INSTALL) -m755 $(@D)/libnewt.so*  $(STAGING_DIR)/usr/lib/
 Samuel> +	ln -fs libnewt.so.$(NEWT_VERSION)   $(STAGING_DIR)/usr/lib/libnewt.so
 Samuel> +	ln -fs libnewt.so.$(NEWT_VERSION)   $(STAGING_DIR)/usr/lib/libnewt.so.0.51
 Samuel> +endef
 Samuel> +
 Samuel> +define NEWT_INSTALL_TARGET_CMDS
 Samuel> +	$(INSTALL) -d $(TARGET_DIR)/usr/lib/
 Samuel>  	cp -a $(STAGING_DIR)/usr/lib/libnewt.so* $(TARGET_DIR)/usr/lib/
 Samuel> -	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libnewt.so*

We normally install everything into target as well (which then gets
cleaned up by target-finalize if needed), so I changed
_INSTALL_TARGET_CMDS to do the same as for STAGING.

-- 
Bye, Peter Korsgaard
