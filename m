From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Dec 2018 22:29:23 +0100
Subject: [Buildroot] [PATCH 1/1] package/libftdi1: fix swig build error
 when using cmake 3.12
In-Reply-To: <20181223195714.17155-1-mark.corbin@embecosm.com>
References: <20181223195714.17155-1-mark.corbin@embecosm.com>
Message-ID: <20181223212923.GB24194@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mark, All,

On 2018-12-23 19:57 +0000, Mark Corbin spake thusly:
> The build fails with 'Unable to find' swig.swg and python.swg when
> using cmake version 3.12.

We've another user on IRC, reporting issues with cmake-3.13. Should we
now black=list cmake 3.12 and above, and always build our own?

Did you try to investigate and find the change in cmake that caused this
regression?

> This commit adds a patch from upstream libftdi.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/cc54fec0cd6e35e99dde2f43e0eb28b9d628cd19
> 
> Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>

This is indeed an adaptation of an upstream libftdi1 commit.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libftdi1/0004-cmake-find-swig.patch | 26 +++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 package/libftdi1/0004-cmake-find-swig.patch
> 
> diff --git a/package/libftdi1/0004-cmake-find-swig.patch b/package/libftdi1/0004-cmake-find-swig.patch
> new file mode 100644
> index 0000000000..25922cca53
> --- /dev/null
> +++ b/package/libftdi1/0004-cmake-find-swig.patch
> @@ -0,0 +1,26 @@
> +From fcda9c6a208d3a7fe651ef661b2eb6e462a89c17 Mon Sep 17 00:00:00 2001
> +From: Eneas U de Queiroz <cote2004-github@yahoo.com>
> +Date: Tue, 31 Jul 2018 17:44:57 -0300
> +Subject: [PATCH] CMake: use find_package (SWIG) for cmake >= 3.0.0
> +
> +There's a workaround for a bug (fixed in cmake 3.0.0) that does not
> +work in CMake 3.12.  Only use the workaround with cmake < 3.0.0.
> +
> +Signed-off-by: Eneas U de Queiroz <cote2004-github@yahoo.com>
> +[Mark: patch retrieved and updated from
> +http://developer.intra2net.com/git/?p=libftdi;a=commit;h=fcda9c6a208d3a7fe651ef661b2eb6e462a89c17]
> +Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
> +---
> +diff --git a/python/CMakeLists.txt b/python/CMakeLists.txt
> +index 31ef1c6..eefc344 100644
> +--- a/python/CMakeLists.txt
> ++++ b/python/CMakeLists.txt
> +@@ -3,7 +3,7 @@ option ( LINK_PYTHON_LIBRARY "Link against python libraries" ON )
> + 
> + if ( PYTHON_BINDINGS )
> +   # workaround for cmake bug #0013449
> +-  if ( NOT DEFINED CMAKE_FIND_ROOT_PATH )
> ++  if ( NOT DEFINED CMAKE_FIND_ROOT_PATH OR CMAKE_VERSION VERSION_GREATER_EQUAL 3.0.0 )
> +     find_package ( SWIG )
> +   else ()
> +     find_program ( SWIG_EXECUTABLE NAMES swig2.0 swig )
> -- 
> 2.19.1
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
