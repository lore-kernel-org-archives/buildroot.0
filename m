From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Aug 2015 23:29:17 +0200
Subject: [Buildroot] [PATCH 0/4] xtensa: toolchain fix for compiling
 huge functions
In-Reply-To: <1439418003-23805-1-git-send-email-jcmvbkbc@gmail.com>
References: <1439418003-23805-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20150818212917.GG3799@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Max, All,

On 2015-08-13 01:19 +0300, Max Filippov spake thusly:
> this series backports binutils and gcc patches that add auto-litpools option
> and replaces text-section-literals ABI flag for xtensa with auto-litpools.
> With that change compiling huge functions should no longer be an issue on
> xtensa. Obviously that change will break builds with pre-built toolchain.

I'm not a huge fan of this series.

  - First, they are "feature patches" (even if backported) to critical
    components (gcc, binutils).

  - Then, patches 3 and 4 will break external toolchains.

  - Finally, it seems to me quite some efforst for "just" one package.

So, I'd say we wait for gcc + binutils to spew out releases with those
changes, then we can incorporate those versions in Buildroot, and make
OpenCV depend on _GCC_AT_LEAST_X_Y ...

Note: those comments are also valid for the unwind patch you sent
later...

Note-2: I know this might be a very difficult job you've made,
backporting those fixes. Still, I don;t think they are fit for having
in Buldroot.

Regards,
Yann E. MORIN.

> Max Filippov (4):
>   binutils: backport auto-litpools xtensa gas option
>   gcc: backport mauto-litpools xtensa option
>   xtensa: switch from text-section-literals to auto-litpools
>   Revert "opencv: mark as not available on Xtensa"
> 
>  package/Makefile.in                                |   4 +-
>  .../2.24/913-xtensa-add-auto-litpools-option.patch | 698 ++++++++++++++++++++
>  .../913-xtensa-add-auto-litpools-option.patch      | 699 +++++++++++++++++++++
>  .../870-xtensa-add-mauto-litpools-option.patch     | 290 +++++++++
>  .../870-xtensa-add-mauto-litpools-option.patch     | 290 +++++++++
>  .../870-xtensa-add-mauto-litpools-option.patch     | 290 +++++++++
>  package/gcc/gcc.mk                                 |   6 +-
>  package/opencv/Config.in                           |   3 -
>  8 files changed, 2272 insertions(+), 8 deletions(-)
>  create mode 100644 package/binutils/2.24/913-xtensa-add-auto-litpools-option.patch
>  create mode 100644 package/binutils/2.25.1/913-xtensa-add-auto-litpools-option.patch
>  create mode 100644 package/gcc/4.8.5/870-xtensa-add-mauto-litpools-option.patch
>  create mode 100644 package/gcc/4.9.3/870-xtensa-add-mauto-litpools-option.patch
>  create mode 100644 package/gcc/5.2.0/870-xtensa-add-mauto-litpools-option.patch
> 
> -- 
> 1.8.1.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
