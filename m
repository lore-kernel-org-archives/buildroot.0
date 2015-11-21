From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Sat, 21 Nov 2015 17:25:42 -0200
Subject: [Buildroot] [PATCH] ustr: using debian patches to compile w/
	GCC 5.x
In-Reply-To: <CALq67GARizwy4sboFoBhw22MZmWb2yj+8aFYUHWC=qrP2rgdeQ@mail.gmail.com>
References: <1447983556-28274-1-git-send-email-ryanbarnett3@gmail.com>
 <564F9306.3090608@mind.be>
 <CALq67GARizwy4sboFoBhw22MZmWb2yj+8aFYUHWC=qrP2rgdeQ@mail.gmail.com>
Message-ID: <CANu7NGvcVvN=a1dkr3Dv7bQvi5VPMSGczwEZHg+JMVY-4VkTMg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan, All,

Since I have already prepared a patch, I will send it to the list and let
you guys decide the best approach to fix this problem.

Regards,

Sergio Prado
Embedded Labworks
Office: +55 11 2628-3461
Mobile: +55 11 97123-3420

2015-11-20 22:08 GMT-02:00 Ryan Barnett <ryanbarnett3@gmail.com>:

> Hi Arnount,
>
>
> On Fri, Nov 20, 2015 at 3:39 PM, Arnout Vandecappelle <arnout@mind.be>
> wrote:
> > On 20-11-15 02:39, Ryan Barnett wrote:
> >> To fix issues with compiling with GCC 5.x, switch to utilzing the
> >> debian patches for cross compiling. The debian tar was tired but the
> >> series file in the folder is not compatiable with buildroot as it has
> >> a 'p1' after each file.
> >
> >  Peter merged 7caf46439 (apply-patches.sh: use everything from the
> series file)
> > so this should no longer be the case. Could you give it another go?
>
> When trying to use the Debian tar found here:
>
> http://http.debian.net/debian/pool/main/u/ustr/ustr_1.0.4-5.debian.tar.xz
>
> The following error occurs:
>
> Applying -p1 using series:
> Error: missing patch file
>
> /opt/project/tmp/150fa803fc3b65f75dce2847907ee768fc94c7a7/output/build/ustr-1.0.4/.patches-ustr_1.0.4-5.debian.tar.xz-unpacked/debian/patches/-p1
> make[1]: ***
> [/opt/project/tmp/150fa803fc3b65f75dce2847907ee768fc94c7a7/output/build/ustr-1.0.4/.stamp_patched]
> Error 1
>
> This is due to the fact that the series file is as follows
>
>   fixes/autoconf.diff -p1
>   fixes/doc-html-local-css.diff -p1
>   fixes/gnu-inline.diff -p1
>   fixes/man-cleanup.diff -p1
>   fixes/man-spelling.diff -p1
>   fixes/nonlinux.diff -p1
>   fixes/stdarg-va_copy.diff -p1
>   fixes/unused-vars.diff -p1
>
> Any ideas on how to handle this?
>
> I'm using the latest master:
>
> 90d6fe5ae093438514ddee8bd68ca2b08a336eac
>
> >> diff --git a/package/ustr/ustr.mk b/package/ustr/ustr.mk
> >> index 3144c0b..0daed3f 100644
> >> --- a/package/ustr/ustr.mk
> >> +++ b/package/ustr/ustr.mk
> >> @@ -9,46 +9,16 @@ USTR_SOURCE = ustr-$(USTR_VERSION).tar.bz2
> >>  USTR_SITE = http://www.and.org/ustr/$(USTR_VERSION)
> >>  USTR_LICENSE = BSD-2c MIT LGPLv2+
> >>  USTR_LICENSE_FILES = LICENSE LICENSE_BSD LICENSE_LGPL LICENSE_MIT
> >> +USTR_AUTORECONF = YES
> >> +USTR_PATCH = \
> >> +
> https://anonscm.debian.org/cgit/users/zito-guest/pkg-ustr.git/plain/debian/patches/fixes/autoconf.diff?id=b09545eda93cc75d0510bc100a236b432e3c81b8
> \
> >> +
> https://anonscm.debian.org/cgit/users/zito-guest/pkg-ustr.git/plain/debian/patches/fixes/doc-html-local-css.diff?id=b09545eda93cc75d0510bc100a236b432e3c81b8
> \
> >> +
> https://anonscm.debian.org/cgit/users/zito-guest/pkg-ustr.git/plain/debian/patches/fixes/gnu-inline.diff?id=b09545eda93cc75d0510bc100a236b432e3c81b8
> \
> >> +
> https://anonscm.debian.org/cgit/users/zito-guest/pkg-ustr.git/plain/debian/patches/fixes/nonlinux.diff?id=b09545eda93cc75d0510bc100a236b432e3c81b8
> \
> >> +
> https://anonscm.debian.org/cgit/users/zito-guest/pkg-ustr.git/plain/debian/patches/fixes/stdarg-va_copy.diff?id=b09545eda93cc75d0510bc100a236b432e3c81b8
> \
> >> +
> https://anonscm.debian.org/cgit/users/zito-guest/pkg-ustr.git/plain/debian/patches/fixes/unused-vars.diff?id=b09545eda93cc75d0510bc100a236b432e3c81b8
> >>
> >>  USTR_INSTALL_STAGING = YES
> >>
> >> -ifeq ($(BR2_STATIC_LIBS),y)
> >> -USTR_BUILD_TARGETS = all
> >> -USTR_INSTALL_TARGETS = install
> >> -else ifeq ($(BR2_SHARED_LIBS),y)
> >> -USTR_BUILD_TARGETS = all-shared
> >> -USTR_INSTALL_TARGETS = install-shared
> >> -else
> >> -USTR_BUILD_TARGETS = all all-shared
> >> -USTR_INSTALL_TARGETS = all install-shared
> >> -endif
> >> -
> >> -define USTR_BUILD_CMDS
> >> -     $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) $(USTR_BUILD_TARGETS)
> >> -endef
> >> -
> >> -define USTR_INSTALL_STAGING_CMDS
> >> -     $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(STAGING_DIR) \
> >> -             $(USTR_INSTALL_TARGETS)
> >> -     $(RM) -f $(STAGING_DIR)/usr/lib/libustr-debug*
> >> -     $(RM) -f $(STAGING_DIR)/usr/lib/pkgconfig/libustr-debug.pc
> >> -endef
> >> -
> >> -define USTR_INSTALL_TARGET_CMDS
> >> -     $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) DESTDIR=$(TARGET_DIR) \
> >> -             $(USTR_INSTALL_TARGETS)
> >> -     $(RM) -f $(TARGET_DIR)/usr/lib/libustr-debug*
> >> -     $(RM) -rf $(TARGET_DIR)/usr/share/ustr-$(USTR_VERSION)
> >> -endef
> >> -
> >> -define HOST_USTR_BUILD_CMDS
> >> -     $(MAKE) -C $(@D) $(HOST_CONFIGURE_OPTS) all-shared
> >> -endef
> >> -
> >> -define HOST_USTR_INSTALL_CMDS
> >> -     $(MAKE) -C $(@D) $(HOST_CONFIGURE_OPTS) DESTDIR=$(HOST_DIR) \
> >> -             install-shared
> >> -endef
> >> -
> >> -$(eval $(generic-package))
> >> -$(eval $(host-generic-package))
> >> +$(eval $(autotools-package))
> >> +$(eval $(host-autotools-package))
> >
> >  Wow, so there's a Debian patch that converts it into an autotools
> package?
> > That's definitely worth mentioning explicitly in the commit log.
>
> I will update the commit log - however, do you think that we should
> proceed with utilizing these Debian patches?
>
> Thanks,
> -Ryan
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151121/68acaa81/attachment.html>
