From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 23:00:22 +0100
Subject: [Buildroot] [PATCH v2] package/ply: add new package
In-Reply-To: <20210106194703.GA5083@arbad>
References: <20210106194703.GA5083@arbad>
Message-ID: <20210123230022.307e9019@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andreas,

Thanks, I applied your patch, but with a good number of changes. See
below.

On Wed, 6 Jan 2021 20:47:04 +0100
Andreas Klinger <ak@it-klinger.de> wrote:

> diff --git a/package/ply/0001-configure.ac-fix-error-with-version-string.patch b/package/ply/0001-configure.ac-fix-error-with-version-string.patch
> new file mode 100644
> index 0000000000..7532b3be29
> --- /dev/null
> +++ b/package/ply/0001-configure.ac-fix-error-with-version-string.patch
> @@ -0,0 +1,29 @@
> +From 684bae6043fa2242a5c6551c3f260c9db0cf7dc8 Mon Sep 17 00:00:00 2001
> +From: Andreas Klinger <ak@it-klinger.de>
> +Date: Mon, 4 Jan 2021 08:40:50 +0100
> +Subject: [PATCH 1/2] configure.ac: fix error with version string

We don't use [PATCH 1/2] in patches, but just [PATCH]. This is detected
and reported by "make check-package".


> diff --git a/package/ply/Config.in b/package/ply/Config.in
> new file mode 100644
> index 0000000000..7b88a397e8
> --- /dev/null
> +++ b/package/ply/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_PLY
> +	bool "ply"

This was missing a significant number of dependencies:

 - ply is only available for ARM, AArch64, PowerPC and x86-64
 - ply uses fork(), so a dependency on BR2_USE_MMU was needed
 - ply uses a number of BPF features, including some only available in
   Linux >= 4.6, so a dependency on >= 4.6 headers was needed

> +	help
> +	  ply is a light-weight dynamic tracer for Linux. By means of using
> +	  the BPF it can attach probes to the linux kernel (e. g. kprobes).

Some of those lines were too long, causing "make check-package"
warnings.

> +
> +	  It's a small alternative to LLVM based tracers for embedded
> +	  systems.
> +
> +	  When using debugfs needs to be mounted on /sys/kernel/debug.
> +
> +	  Project page:
> +	  https://github.com/wkz/ply
> +
> +	  Documentation can be found here:
> +	  https://wkz.github.io/ply/

We typically keep only the home page of the project, so I kept only
this last URL.

> diff --git a/package/ply/ply.hash b/package/ply/ply.hash
> new file mode 100644
> index 0000000000..0c8de6f8e8
> --- /dev/null
> +++ b/package/ply/ply.hash
> @@ -0,0 +1,4 @@
> +# Locally calculated
> +sha256	cecf0913c65027750ac3272e936110c9f843435938f9ca2edbc34e99ba6c00e2  ply-2.1.1.tar.gz
> +sha256	0e7bf51b014d4ad5be999b8b35eeefb8c99fe63454685b52a5c0c728290b1570  0001-configure.ac-fix-error-with-version-string.patch
> +sha256	b445002ea0869a667e1195aad1b118d13eb3396adf10b85b80037669a59c6657  0002-printxf.h-add-stdarg.h-in-include.patch

Having the hashes of the patches is useless, as they are bundled with
Buildroot. However, what is useful is to have the hash of the license
file. Also, we separate fields in this file with two spaces.

I've applied after fixing the above issues. Many thanks for your
contribution!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
