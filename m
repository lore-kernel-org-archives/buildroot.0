From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Nov 2016 16:47:21 +0100
Subject: [Buildroot] [PATCH] gcc: add patch to support musl on ppc
In-Reply-To: <20161127153912.GA28195@waldemar-brodkorb.de>
References: <20161127153912.GA28195@waldemar-brodkorb.de>
Message-ID: <20161127164721.6f9b3b86@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 27 Nov 2016 16:39:12 +0100, Waldemar Brodkorb wrote:

> +diff -Nur gcc-5.4.0.orig/foo gcc-5.4.0/foo
> +--- gcc-5.4.0.orig/foo	1970-01-01 01:00:00.000000000 +0100
> ++++ gcc-5.4.0/foo	2016-11-27 13:14:17.473658991 +0100
> +@@ -0,0 +1,16 @@
> ++diff -Nur gcc-5.4.0-adk/gcc/config.gcc gcc-5.4.0-br/gcc/config.gcc
> ++--- gcc-5.4.0-adk/gcc/config.gcc        2016-11-27 06:58:59.316076489 +0100
> +++++ gcc-5.4.0-br/gcc/config.gcc 2016-11-27 07:01:08.780403758 +0100
> ++@@ -2416,10 +2416,6 @@
> ++            powerpc*-*-linux*paired*)
> ++                tm_file="${tm_file} rs6000/750cl.h" ;;
> ++        esac
> ++-        case ${target} in
> ++-            *-linux*-musl*)
> ++-                enable_secureplt=yes ;;
> ++-        esac
> ++        if test x${enable_secureplt} = xyes; then
> ++                tm_file="rs6000/secureplt.h ${tm_file}"
> ++        fi
> ++
> ++

This chunk seems to be exactly the opposite of:

> +diff -Nur gcc-5.4.0.orig/gcc/config.gcc gcc-5.4.0/gcc/config.gcc
> +--- gcc-5.4.0.orig/gcc/config.gcc	2015-09-10 16:17:53.000000000 +0200
> ++++ gcc-5.4.0/gcc/config.gcc	2016-11-27 13:14:17.149638148 +0100
> +@@ -2413,6 +2413,10 @@
> + 	    powerpc*-*-linux*paired*)
> + 		tm_file="${tm_file} rs6000/750cl.h" ;;
> + 	esac
> ++	case ${target} in
> ++	    powerpc*-*-linux*-musl*)
> ++		enable_secureplt=yes ;;
> ++	esac
> + 	if test x${enable_secureplt} = xyes; then
> + 		tm_file="rs6000/secureplt.h ${tm_file}"
> + 	fi

This one.

Am I missing something? It looks like a badly generated patch.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
