From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Oct 2014 19:02:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/boost: enable building of
 boost_log
In-Reply-To: <1413811644-28525-1-git-send-email-yannickkiekens@gmail.com>
References: <1413811644-28525-1-git-send-email-yannickkiekens@gmail.com>
Message-ID: <20141020170223.GC3742@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yannick, All,

On 2014-10-20 15:27 +0200, Yannick Kiekens spake thusly:
> Signed-off-by: Yannick Kiekens <yannickkiekens@gmail.com>
> ---
>  package/boost/Config.in | 3 +++
>  package/boost/boost.mk  | 4 ++--
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/package/boost/Config.in b/package/boost/Config.in
> index a15b849..5ac1d0e 100644
> --- a/package/boost/Config.in
> +++ b/package/boost/Config.in
> @@ -85,6 +85,9 @@ config BR2_PACKAGE_BOOST_LOCALE
>  comment "boost-locale needs a toolchain w/ wchar"
>  	depends on !BR2_USE_WCHAR
>  
> +config BR2_PACKAGE_BOOST_LOG
> +        bool "boost-log"
> +
>  config BR2_PACKAGE_BOOST_MATH
>  	bool "boost-math"
>  
> diff --git a/package/boost/boost.mk b/package/boost/boost.mk
> index 46a98e8..06969b4 100644
> --- a/package/boost/boost.mk
> +++ b/package/boost/boost.mk
> @@ -25,8 +25,7 @@ HOST_BOOST_FLAGS = --without-icu \
>  
>  # atomic library compile only with upstream version, wait for next release
>  # coroutine breaks on some weak toolchains and it's new for 1.54+
> -# log breaks with some toolchain combinations and it's new for 1.54+

As you remove a comment that warns that log is broken in some cases, it
would be nice if you were to explain why this comment no longer applies.

For example, you could format your commit log as thus (reason totally
made up for the sake of the example, adapt):

    package/boost: enable building of boost_log

    In the current version of boost, boost_log is now considered stable
    and maintained. The failures caused by "some toolchain combinations"
    no longer occur.

    Signed-off-by: [YOU]

    ---
    Tested with these toolchains:
      - uClibc, arm, static only
      - uClibc, x86_64

Note the '---' line: you can add such a line in your commit log, and it
will appear as-is in the mail you send. However, git is smart enough so
that when the maintainer applies the patch, git removes it.

Otherwise, I'm no boost expert, but the patch looks OK.

Regards,
Yann E. MORIN.

> -BOOST_WITHOUT_FLAGS = atomic coroutine log
> +BOOST_WITHOUT_FLAGS = atomic coroutine
>  
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTEXT),,context)
> @@ -37,6 +36,7 @@ BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_GRAPH),,graph)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_GRAPH_PARALLEL),,graph_parallel)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_IOSTREAMS),,iostreams)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_LOCALE),,locale)
> +BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_LOG),,log)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_MATH),,math)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_MPI),,mpi)
>  BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_PROGRAM_OPTIONS),,program_options)
> -- 
> 1.9.1
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
