From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 27 Oct 2015 18:20:23 +0100
Subject: [Buildroot] [PATCH v3] rfkill: new package
In-Reply-To: <562FAE13.8070507@inbox.ru>
References: <1445957711-10417-1-git-send-email-sv99@inbox.ru>
 <20151027152544.GB3555@free.fr> <562FAE13.8070507@inbox.ru>
Message-ID: <20151027172023.GE3555@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Viacheslav, All,

On 2015-10-27 20:02 +0300, Viacheslav Volkov spake thusly:
> Exists questions with license information.
> 
> In the distributions exists file COPYING:
> 
> Copyright 2009 Johannes Berg <johannes@sipsolutions.net>
> Copyright 2009 Marcel Holtmann <marcel@holtmann.org>
> Copyright 2009 Tim Gardner <tim.gardner@canonical.com>
> 
> Permission to use, copy, modify, and/or distribute this software for any
> purpose with or without fee is hereby granted, provided that the above
> copyright notice and this permission notice appear in all copies.
> 
> THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
> WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
> MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
> ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
> WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
> ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
> OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

Indeed, this is not a traditional license. It is not BSD (not even
0BSD), it is not MIT... I could not find it in the SPDX list;
    https://spdx.org/licenses/

However, it is very close to 0BSD...

> RFKILL_LICENSE_FILES = 
> RFKILL_LICENSE = ?? icence not set ?

In this case, I'd write:

    RFKILL_LICENSE = BSD-like
    RFKILL_LICENSE_FILE = COPYING

Regards,
Yann E. MORIN.

> 27.10.15 18:25, Yann E. MORIN ?????:
> > Viacheslav, All,
> >
> > Thanks for this new iteration.
> >
> > However, there are still a few issues with it, see below...
> >
> > On 2015-10-27 17:55 +0300, Viacheslav Volkov spake thusly:
> >> Add rfkill package.
> >>
> >> Signed-off-by: Viacheslav Volkov <sv99@inbox.ru>
> > [--SNIP--]
> >> diff --git a/package/rfkill/Config.in b/package/rfkill/Config.in
> >> new file mode 100644
> >> index 0000000..3cb7c18
> >> --- /dev/null
> >> +++ b/package/rfkill/Config.in
> >> @@ -0,0 +1,7 @@
> >> +config BR2_PACKAGE_RFKILL
> >> +	bool "rfkill"
> >> +	help
> >> +	  rfkill is a small userspace tool to query the state of the 
> > Trailing space.
> >
> >> +	  rfkill switches.
> >> +
> >> +	  https://wireless.wiki.kernel.org/en/users/documentation/rfkill/
> > That help text is much better. Thanks! :-)
> >
> > However, the trailing slash in the URL should be removed (it's a WiKi
> > page).
> >
> >> diff --git a/package/rfkill/rfkill.hash b/package/rfkill/rfkill.hash
> >> new file mode 100644
> >> index 0000000..21be0a2
> >> --- /dev/null
> >> +++ b/package/rfkill/rfkill.hash
> >> @@ -0,0 +1,2 @@
> >> +# From: https://www.kernel.org/pub/software/network/rfkill/sha256sums.asc
> >> +sha256	e0ae3004215e39a6c5c36e0726558740728d16f67ebdb8bea621250f6091d86a  rfkill-0.5.tar.xz
> >> diff --git a/package/rfkill/rfkill.mk b/package/rfkill/rfkill.mk
> >> new file mode 100644
> >> index 0000000..b377c03
> >> --- /dev/null
> >> +++ b/package/rfkill/rfkill.mk
> >> @@ -0,0 +1,20 @@
> >> +################################################################################
> >> +#
> >> +# rfkill
> >> +#
> >> +################################################################################
> >> +
> >> +RFKILL_VERSION = 0.5
> >> +RFKILL_SOURCE = rfkill-$(RFKILL_VERSION).tar.xz
> >> +RFKILL_SITE = https://www.kernel.org/pub/software/network/rfkill
> > Missing legal info. You must provide the license and the license files,
> > like so;
> >
> >     RFKILL_LICENSE = blablabla
> >     RFKILL_LICENSE_FILES = relative/path/to/license-file(s)
> >
> > (note: the paths are relative to the top-directory of the package source
> > tree.)
> >
> >> +define RFKILL_BUILD_CMDS
> >> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
> >> +		VERSION_SUFFIX="-br"
> >> +endef
> >> +
> >> +define RFKILL_INSTALL_TARGET_CMDS
> >> +	$(INSTALL) -D -m 755 $(@D)/rfkill $(TARGET_DIR)/usr/bin/rfkill
> >> +endef
> > Why don't you simply use:
> >
> >     $(MAKE) DESTDIR=$(TARGET_DIR) install
> >
> > It does basically the same install as your do, so I'd prefer we use the
> > package provided install method, in case it changes when we later bump
> > it.
> >
> > You may also have noticed that it also installs the manpage, which we
> > indeed o not want on the target, but Buildroot will clean it up anyway,
> > so that's not too much of a concern.
> >
> > Care to fix and resend, please?
> >
> > (Note: wait a bit before you respin, in case someone else wants to
> > provide more comments.)
> >
> > Thanks! :-)
> >
> > Regards,
> > Yann E. MORIN.
> >
> >> +$(eval $(generic-package))
> >> -- 
> >> 2.6.1
> >>
> >> _______________________________________________
> >> buildroot mailing list
> >> buildroot at busybox.net
> >> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
