From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 2 Jan 2020 14:34:20 +0100
Subject: [Buildroot] [PATCH 1/2] package/perl-dbd-mysql: bump to version
 4.050
In-Reply-To: <20200102114347.2403649-1-chrismcc@gmail.com>
References: <20200102114347.2403649-1-chrismcc@gmail.com>
Message-ID: <20200102143420.3e0a9343@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Fran?ois Perrad in Cc.

On Thu,  2 Jan 2020 11:43:46 +0000
Christopher McCrory <chrismcc@gmail.com> wrote:

> diff --git a/package/perl-dbd-mysql/0001-Allow-cross-compile-on-buildroot.patch b/package/perl-dbd-mysql/0001-Allow-cross-compile-on-buildroot.patch
> new file mode 100644
> index 0000000000..0431e0092a
> --- /dev/null
> +++ b/package/perl-dbd-mysql/0001-Allow-cross-compile-on-buildroot.patch
> @@ -0,0 +1,46 @@
> +From e6689e55fb56a83f227e59d3fa258553d32524fa Mon Sep 17 00:00:00 2001
> +From: Christopher McCrory <chrismcc@gmail.com>
> +Date: Thu, 2 Jan 2020 07:53:20 +0000
> +Subject: [PATCH 1/1] Allow cross compile on buildroot
> +
> +starting in 4.046_01 Devel::CheckLib is used to check if all needed libraries
> +are available. It is not cross compile friendly.  Disable it and hope for the
> +best.
> +
> +Signed-off-by: Christopher McCrory <chrismcc@gmail.com>

Has this issue been reported upstream? Can we make the Makefile.PL
smarter and avoid this check when cross-compiling ?


> diff --git a/package/perl-dbd-mysql/perl-dbd-mysql.mk b/package/perl-dbd-mysql/perl-dbd-mysql.mk
> index 98521a78cf..c17788598c 100644
> --- a/package/perl-dbd-mysql/perl-dbd-mysql.mk
> +++ b/package/perl-dbd-mysql/perl-dbd-mysql.mk
> @@ -4,9 +4,19 @@
>  #
>  ################################################################################
>  
> -PERL_DBD_MYSQL_VERSION = 4.046
> +# version 4.046_01 fixes compiling against mariadb and also introduces a patch
> +# that brakes with cross compiling, see patch 0001.

This comment is not relevant in the .mk file.

> +# Also the buildroot host-perl ModuleManager gets somthing wrong looking for
> +# libraries. Instead of checking in the build sysroot, it looks in the host
> +# systems /lib, /usr/lib, etc.  For a successful build, the host system will
> +# also need the matching mysql libraries installed.

This is not acceptable for Buildroot, and needs to be fixed before we
can apply this version bump.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
