From: Vadim Kochan <vadim4j@gmail.com>
Date: Sat, 25 Aug 2018 23:15:31 +0300
Subject: [Buildroot] [PATCH v2 1/1] git: Fix libintl linking if there is
 no full gettext support
In-Reply-To: <20180825194042.41917ea0@windsurf>
References: <20180825131027.6048-1-vadim4j@gmail.com>
 <20180825194042.41917ea0@windsurf>
Message-ID: <CAMw6YJJVo16zKQqpiBcbH98cnRwHXEysAPhm=vRoyRW5vTTegw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Aug 25, 2018 at 8:40 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Sat, 25 Aug 2018 16:10:27 +0300, Vadim Kochan wrote:
> > From: Vadim Kochan <vadim.kochan@petcube.com>
>
> Thanks for this new iteration.
>
> > Git could not resolve libntl_xxx symbols if toolchain does no provide
> > full gettext support but the gettext package is selected.
> >
> > Steps to reproduce:
> >     1) make menuconfig
> >     2) Toolchain -> Sele> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.comct WCHAR
> >     3) System -> select NLS
> >     4) Target packages -> Development -> select git
>
> Instead of this, it is often simpler to include a minimal defconfig
> that exhibits the problem. I.e, when you have your .config that shows
> the problem, run "make savedefconfig", and look at the generated
> "defconfig" file. It shows only the values that are different from the
> default ones, so for an example like what you gave above, it would be
> just three lines of configuration.
>
> > In case of ulibc/musl toolchain there is no full getttext support, but
> > they still provides libintl stub which makes git think there is full
> > gettext support hence -lintl is not passed to the linker.
>
> Are you sure this is what is happening ? The stub in uclibc and musl
> provide all the gettext functions, that's the whole point of the stub.
>
> However, when you have the full gettext support enabled, the libintl.h
> header installed is the one from the full gettext, and it redefines the
> gettext functions with a different name, and that different name is
> only provided by the full-blown gettext libintl library.
>
> Could you double check this ?
>
As I understood, in case of non-glibc toolchain the gettext macroses calls
libintl functions with libintl_ prefix (_INTL_REDIRECT_MACROS in
gettext sources).
And because there is no such in the uclibc/musl, the git can't resolve them
because the '-lintl' is not passed to be linked with shared library
(gettext version).

Regards,
