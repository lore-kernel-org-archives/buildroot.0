From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 11 Dec 2016 22:40:43 +0100
Subject: [Buildroot] [PATCH] usbip: add a new package
In-Reply-To: <3fae2ec3-3be6-e839-f854-210b223b65af@mind.be>
References: <1481272671-6491-1-git-send-email-tal.shorer@gmail.com>
 <20161211135617.GB3599@free.fr>
 <CAFDyS3ON-Wc-wzKZ4Le81Ak7z0wOpxYbH0hURobu38S87gXUcg@mail.gmail.com>
 <3fae2ec3-3be6-e839-f854-210b223b65af@mind.be>
Message-ID: <20161211214043.GG3599@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-12-11 20:59 +0100, Arnout Vandecappelle spake thusly:
> On 11-12-16 18:39, Tal Shorer wrote:
> > On Sun, Dec 11, 2016 at 3:56 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >> Tal, Thomas, All,
> >>
> >> On 2016-12-09 10:37 +0200, Tal Shorer spake thusly:
> [snip]
> >>> diff --git a/package/usbip/usbip.mk b/package/usbip/usbip.mk
> >>> new file mode 100644
> >>> index 0000000..e6bd7f7
> >>> --- /dev/null
> >>> +++ b/package/usbip/usbip.mk
> >>> @@ -0,0 +1,18 @@
> >>> +################################################################################
> >>> +#
> >>> +# usbib
> >>> +#
> >>> +################################################################################
> >>> +
> >>> +USBIP_SITE = $(LINUX_DIR)/tools/usb/usbip
> 
>  There's one little problem with this approach: it breaks 'make source-check' on
> a clean tree. 'make source-check' doesn't extract the source, so "test -d
> $$($(2)_OVERRIDE_SRCDIR)" will fail.

Hmm... Bad... :-(

But see below...

> >> This location is only valid since linux-3.17. Before that, it was in
> >> drivers/staging/usbip/userspace/ so maybe you want to allow for the two
> >> cases.
> >> In Config.in:
> >>
> >>     if BR2_PACKAGE_USBIP
> >>
> >>     config BR2_PACKAGE_USBIP_3_17_OR_LATER
> >>         bool "Linux kernel >= 3.17"
> > I did this, but the other way around. The option is whether or not to
> > use the _old_ path, so the unsuspecting user will get the new path for
> > compatibility. Is this ok?
> >>
> >>     endif
> >>
> >> And then in usb.mk:
> >>
> >>     ifeq ($(BR2_PACKAGE_USBIP_3_17_OR_LATER),y)
> >>     USBIP_BASE_DIR = tools/usb/usbip
> >>     else
> >>     USBIP_BASE_DIR = drivers/staging/usbip/userspace/
> >>     endif
> >>     USBIP_SITE = $(LINUX_DIR)/$(USBIP_BASE_DIR)
> >>
> >>     define USBIP_CHECK_SRC
> >>         if [ ! -d $(USBIP_SITE) ]; then \
> >>             echo "Your kernel does not have usbip in $(USBIP_BASE_DIR)" >&2; \
> >>             exit 1; \
> >>         fi
> >>     endef
> >>     USBIP_PRE_EXTRACT_HOOKS += USBIP_CHECK_SRC
> 
>  I really don't like this approach where the user has to specify it is Linux >=
> 3.17. If we start introducing version symbols, we should do it for all possible
> versions and at the level of the BR2_KERNEL_LINUX symbol itself, similar like
> for the external toolchain kernel headers symbol.

That's quite a bit of an overhead...

>  However, doesn't something like this work? Or is it considered too much of a hack?
> 
> # Before v3.17 it was in staging.
> # USBIP_SITE is only used inside rules, after linux has already been extracted.
> USBIP_SITE = $(wildcard \
> 	$(LINUX_DIR)/tools/usb/usbip \
> 	$(LINUX_DIR)/drivers/staging/usbip/userspace)

I like this approach as well; it is better than mine.

However, it does not really solve the source-check issue, does it?

Hmm... It probably does, because:

  - in an empty build tree, the linux source are not extracted, so there
    would be nothing to $(wildcard), so USBIP_SITE would be empty, so
    the download infra would not try to download anything (fortunately,
    we do not enforce an empty _SITE_METHOD when _SITE is empty; we only
    enforce an empty _VERSION);

  - in an already-extracted tree, $(wildcard would return an existign
    directory, so the source-check test would be happy.

So yes, this is a hack. A tricky one, for sure, but it looks like it
would work.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
