From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jul 2020 12:48:30 +0200
Subject: [Buildroot] [PATCH v3 3/7] package/odb: new package
In-Reply-To: <20200706153040.427457-4-kamel.bouhara@bootlin.com>
References: <20200706153040.427457-1-kamel.bouhara@bootlin.com>
 <20200706153040.427457-4-kamel.bouhara@bootlin.com>
Message-ID: <20200712124830.1f4d618a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  6 Jul 2020 17:30:36 +0200
Kamel Bouhara <kamel.bouhara@bootlin.com> wrote:

> From: Adam Duskett <aduskett@gmail.com>
> 
> ODB is an open-source, cross-platform, and cross-database
> object-relational
> mapping (ORM) system for C++. It allows you to persist C++ objects to a
> relational database without having to deal with tables, columns, or SQL
> and without manually writing any mapping code.
> 
> ODB supports MySQL, SQLite, PostgreSQL, Oracle, and Microsoft SQL Server
> relational databases as well as C++98/03 and C++11 language standards.
> It also comes with optional profiles for Boost and Qt which allow you to
> seamlessly use value types, containers, and smart pointers from these
> libraries in your persistent C++ classes.
> 
> This package is used for auto-generating ODB specific header files into
> useable code that can be linked against a seperate libodb and a specific
> libodb database library.  As such, it is only needed as a host program
> and is not user selectable.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> [Kamel: Fix incorrect odb license]
> Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>

I've applied, after doing a few changes. See below.

>  DEVELOPERS                                    |   1 +
>  package/Config.in.host                        |   1 +
>  package/odb/0001-no-need-of-tm.h.patch        |  32 ++
>  .../odb/0002-Remove-gratuitous-classes.patch  | 444 ++++++++++++++++++
>  ...rk-to-make-ODB-compatible-with-GCC-6.patch | 311 ++++++++++++
>  ...e-compilable-with-GCC-6-in-C-14-mode.patch |  47 ++
>  ...-in-GCC-6-input_location-translation.patch |  33 ++
>  .../odb/0006-Adapt-to-changes-in-GCC-8.patch  | 226 +++++++++
>  ...itch-to-C-11-get-rid-of-auto_ptr-use.patch | 350 ++++++++++++++
>  ...tion-to-be-compatible-with-previous-.patch |  32 ++
>  ...espace-aliases-when-parsing-GCC-tree.patch |  29 ++
>  .../0010-Add-initial-support-for-GCC-9.patch  | 232 +++++++++

Several of those patches did not contain a reference to the
corresponding upstream commit. Some had a reference to a Debian patch,
but in fact, the patch came from upstream, so I replaced such
references to the corresponding upstream commits.

In addition, host-odb did not build on my system, which has gcc 10. I
backported another (simple) patch from upstream to fix that.

> diff --git a/package/Config.in.host b/package/Config.in.host
> index dfea478868..7dc1e46e97 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -81,5 +81,6 @@ menu "Host utilities"
>  	source "package/xorriso/Config.in.host"
>  	source "package/zip/Config.in.host"
>  	source "package/zstd/Config.in.host"
> +	source "package/odb/Config.in.host"

Alphabetic ordering was not correct. "make check-package" warns about
this.

> diff --git a/package/odb/0001-no-need-of-tm.h.patch b/package/odb/0001-no-need-of-tm.h.patch
> new file mode 100644
> index 0000000000..9f4b7ad498
> --- /dev/null
> +++ b/package/odb/0001-no-need-of-tm.h.patch
> @@ -0,0 +1,32 @@
> +From bb4eda4847752b04369afc88fdbb8b43a458be3c Mon Sep 17 00:00:00 2001
> +From: Kamel Bouhara <kamel.bouhara@bootlin.com>
> +Date: Thu, 14 May 2020 17:31:27 +0200
> +Subject: [PATCH 01/10] no need of tm.h

Patches should have been generated with "git format-patch -N", so that
there is no 01/10, 02/10, etc. This is also reported as a mistake by
"make check-package".


> diff --git a/package/odb/Config.in.host b/package/odb/Config.in.host
> new file mode 100644
> index 0000000000..e45677095c
> --- /dev/null
> +++ b/package/odb/Config.in.host
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_HOST_ODB
> +	bool "host-odb"
> +	select BR2_NEEDS_HOST_GCC_PLUGIN_SUPPORT
> +	help
> +	  This is a compiler that takes a specially crafted c++ header
> +	  file and auto-generates a schema that works with libodb and
> +	  the subsequent libodb-database library.

An upstream URL was missing here, so I've added it.

> diff --git a/package/odb/series b/package/odb/series
> new file mode 100644
> index 0000000000..d41253abf9
> --- /dev/null
> +++ b/package/odb/series
> @@ -0,0 +1,10 @@
> +0001-no-need-of-tm.h.patch
> +0002-Remove-gratuitous-classes.patch
> +0003-Initial-work-to-make-ODB-compatible-with-GCC-6.patch
> +0004-Make-compilable-with-GCC-6-in-C-14-mode.patch
> +0005-Fix-bug-in-GCC-6-input_location-translation.patch
> +0006-Adapt-to-changes-in-GCC-8.patch
> +0007-Switch-to-C-11-get-rid-of-auto_ptr-use.patch
> +0008-Fix-GCC-8-adaptation-to-be-compatible-with-previous-.patch
> +0009-Handle-namespace-aliases-when-parsing-GCC-tree.patch
> +0010-Add-initial-support-for-GCC-9.patch

A series file is not needed, and we don't have such series file in any
other package in Buildroot.

As I said, I fixed up those issues when applying. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
