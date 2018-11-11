From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 11 Nov 2018 21:39:26 +0100
Subject: [Buildroot] [PATCH 1/1] libkrb5: fix build on riscv
In-Reply-To: <20181111213112.417acc8b@windsurf.home>
References: <20181111175210.14031-1-fontaine.fabrice@gmail.com>
 <20181111205343.76b10bff@windsurf.home>
 <CAPi7W839q1wsnB9u99kUy8BnGAQg61inS=2+aEh+jO9_Yc5ftA@mail.gmail.com>
 <20181111213112.417acc8b@windsurf.home>
Message-ID: <CAPi7W80ucvAmN6PDtBbNxfYFniJ1kveZ_Q3yTHiXbpabYkhbSQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,
Le dim. 11 nov. 2018 ? 21:31, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> a ?crit :
>
> Hello,
>
> On Sun, 11 Nov 2018 21:15:10 +0100, Fabrice Fontaine wrote:
>
> > > You did a similar change in libmicrothttpd, for which the same fix was
> > > already done for ARC. Any idea why libmicrohttpd needs this hack for
> > > both ARC and RISC-V, while libkrb5 would need it only for RISC-V ?
> > I didn't try to build libkrb5 on ARC but I found that back in 2016,
> > for libmicrohttpd, you were writing that "Fixing the compilers is
> > definitely the right thing to do":
> > https://patchwork.ozlabs.org/patch/643857.
> > Perhaps since that time, the ARC toolchains have been fixed?
>
> Indeed! It was fixed in the following gcc commit:
>
> commit de4c7f60f2891193bf3f5da823b17fa0d7fd4830
> Author: claziss <claziss@138bc75d-0d04-0410-961f-82ee72b054a4>
> Date:   Tue Mar 28 08:56:44 2017 +0000
>
>     [ARC] Define _REENTRANT when -pthread is passed.
>
>     The compiler is supposed to have the builtin defined _REENTRANT defined
>     when -pthread is passed, which wasn't done on the ARC architecture.
>
>     When _REENTRANT is not passed, the C library will not use reentrant
>     functions, and the latest version of ax_pthread.m4 from the
>     autoconf-archive will no longer detect that thread support is
>     available (see https://savannah.gnu.org/patch/?8186).
>
>     gcc/
>     2017-03-28  Claudiu Zissulescu  <claziss@synopsys.com>
>                 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
>             * config/arc/arc.h (CPP_SPEC): Add subtarget_cpp_spec.
>             (EXTRA_SPECS): Define.
>             (SUBTARGET_EXTRA_SPECS): Likewise.
>             (SUBTARGET_CPP_SPEC): Likewise.
>             * config/arc/elf.h (EXTRA_SPECS): Renamed to
>             SUBTARGET_EXTRA_SPECS.
>             * config/arc/linux.h (SUBTARGET_CPP_SPEC): Define.
>
>     git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk at 246524 138bc75d-0d04-0410-961f-82ee72b054a4
>
> diff --git a/gcc/config/arc/linux.h b/gcc/config/arc/linux.h
> index 6e1a96efc23..83e5a1d61f2 100644
> --- a/gcc/config/arc/linux.h
> +++ b/gcc/config/arc/linux.h
> @@ -78,3 +78,8 @@ along with GCC; see the file COPYING3.  If not see
>  /* Linux toolchains use r25 as the thread pointer register.  */
>  #undef TARGET_ARC_TP_REGNO_DEFAULT
>  #define TARGET_ARC_TP_REGNO_DEFAULT 25
> +
> +#undef SUBTARGET_CPP_SPEC
> +#define SUBTARGET_CPP_SPEC "\
> +   %{pthread:-D_REENTRANT} \
> +"
>
> This commit is in gcc upstream since gcc 7.1.0. So I guess we could
> drop the ARC-specific workaround on libmicrohttpd, since we don't
> really support "old" gcc versions on ARC anyway.
OK, are you ok to do this patch? I assume that the patch on
libmicrohttpd for riscv is still valid or do you want that I made a
patch serie on libmicrohttpd?
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
Best Regards,

Fabrice
