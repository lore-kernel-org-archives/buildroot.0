From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 11 Dec 2016 18:45:28 +0100
Subject: [Buildroot] [PATCH] usbip: add a new package
In-Reply-To: <CAFDyS3ON-Wc-wzKZ4Le81Ak7z0wOpxYbH0hURobu38S87gXUcg@mail.gmail.com>
References: <1481272671-6491-1-git-send-email-tal.shorer@gmail.com>
 <20161211135617.GB3599@free.fr>
 <CAFDyS3ON-Wc-wzKZ4Le81Ak7z0wOpxYbH0hURobu38S87gXUcg@mail.gmail.com>
Message-ID: <20161211174528.GD3599@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Tal, All,

On 2016-12-11 19:39 +0200, Tal Shorer spake thusly:
> On Sun, Dec 11, 2016 at 3:56 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2016-12-09 10:37 +0200, Tal Shorer spake thusly:
> >> Add usbip tools (usbip, usbipd) from the running linux source
[--SNIP--]
> >> diff --git a/package/usbip/usbip.mk b/package/usbip/usbip.mk
> >> new file mode 100644
> >> index 0000000..e6bd7f7
> >> --- /dev/null
> >> +++ b/package/usbip/usbip.mk
> >> @@ -0,0 +1,18 @@
> >> +################################################################################
> >> +#
> >> +# usbib
> >> +#
> >> +################################################################################
> >> +
> >> +USBIP_SITE = $(LINUX_DIR)/tools/usb/usbip
> >
> > This location is only valid since linux-3.17. Before that, it was in
> > drivers/staging/usbip/userspace/ so maybe you want to allow for the two
> > cases.
> > In Config.in:
> >
> >     if BR2_PACKAGE_USBIP
> >
> >     config BR2_PACKAGE_USBIP_3_17_OR_LATER
> >         bool "Linux kernel >= 3.17"
> I did this, but the other way around. The option is whether or not to
> use the _old_ path, so the unsuspecting user will get the new path for
> compatibility. Is this ok?

Yes, totally OK. One way or the other is equivalent to me. :-)

However, you mentioned compatibility. There's no compatibility to have
here in Buildroot, because there were no release which would have
defaulted one way or the other. So, whatever we choose, it is OK.

> >     endif
> >
> > And then in usb.mk:
> >
> >     ifeq ($(BR2_PACKAGE_USBIP_3_17_OR_LATER),y)
> >     USBIP_BASE_DIR = tools/usb/usbip
> >     else
> >     USBIP_BASE_DIR = drivers/staging/usbip/userspace/
> >     endif
> >     USBIP_SITE = $(LINUX_DIR)/$(USBIP_BASE_DIR)
> >
> >     define USBIP_CHECK_SRC
> >         if [ ! -d $(USBIP_SITE) ]; then \
> >             echo "Your kernel does not have usbip in $(USBIP_BASE_DIR)" >&2; \
> >             exit 1; \
> >         fi
> >     endef
> >     USBIP_PRE_EXTRACT_HOOKS += USBIP_CHECK_SRC
> >
> I tried getting this hook to run, but since the site method is "local",
> the package just gets rsynced. However, trying to add this to
> USBIP_PRE_RSYNC_HOOKS doesn't help either because the rsync rule checks
> for the source directory before calling the PRE_RSYNC_HOOKS.

Damn it...

I think this is a shortcoming in the rsync method: the hooks should be
called even before we try to run-or-test anything. I.e. the hooks should
be called before we do the test.

Care to send a patch for that?

Regards,
Yann E. MORIN.

> The error
> this outputs to the user is as follows:
> 
> tal at tal-N552VW-FY117T:~/Dev/lfs/buildroot|0 $ make usbip
> >>> usbip  Syncing from source dir /home/tal/Dev/lfs/buildroot/output/build/linux-master/drivers/staging/usbip/userspace
> ERROR: /home/tal/Dev/lfs/buildroot/output/build/linux-master/drivers/staging/usbip/userspace
> does not exist
> package/pkg-generic.mk:163: recipe for target
> '/home/tal/Dev/lfs/buildroot/output/build/usbip/.stamp_rsynced' failed
> make[1]: *** [/home/tal/Dev/lfs/buildroot/output/build/usbip/.stamp_rsynced]
> Error 1
> Makefile:76: recipe for target '_all' failed
> make: *** [_all] Error 2
> tal at tal-N552VW-FY117T:~/Dev/lfs/buildroot|2 $
> 
> which is not as nice as the one you suggested, but I find it somewhat
> acceptable. Your thoughts?
> >> +USBIP_SITE_METHOD = local
> >> +USBIP_LICENSE = GPLv2+
> >> +USBIP_LICENSE_FILES = COPYING
> >> +USBIP_INSTALL_STAGING = YES
> >> +USBIP_DEPENDENCIES = linux
> >
> > I think it is better to use USBIP_PATCH_DEPENDENCIES here, because we
> > don't really need the kernel to be built; we just need it to be
> > extracted and patched.
> >
> > For the records, we introduced the linux-tools package because we
> > encountered a circular dependency chain, and we want to avoid that in
> > the future; see 20b1446 (linux/tools: make it a real, separate package)
> > for the explanations.
> >
> >> +
> >> +USBIP_AUTORECONF = YES
> >> +
> >> +USBIP_DEPENDENCIES += host-automake host-autoconf host-libtool
> >
> > You don't need those dependencies; they are brought in automatically by
> > the autotools-package infrastructure.
> >
> > Regards,
> > Yann E. MORIN.
> >
> >> +$(eval $(autotools-package))
> >> --
> >> 2.7.4
> >>
> >> _______________________________________________
> >> buildroot mailing list
> >> buildroot at busybox.net
> >> http://lists.busybox.net/mailman/listinfo/buildroot
> >
> > --
> > .-----------------.--------------------.------------------.--------------------.
> > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > '------------------------------^-------^------------------^--------------------'

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
