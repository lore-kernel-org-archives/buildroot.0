From: Romain Naour <romain.naour@smile.fr>
Date: Tue, 19 Nov 2019 21:36:25 +0100
Subject: [Buildroot] [PATCH v4 1/2] package/bmap-tools: new package
In-Reply-To: <20191105125039.1443-1-nicolas.carrier@orolia.com>
References: <20191105125039.1443-1-nicolas.carrier@orolia.com>
Message-ID: <0f8747b6-557e-6e06-45a5-7755b0228432@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nicolas,


Le 05/11/2019 ? 13:51, Nicolas Carrier a ?crit?:
> ---
> 
> I need bmap-tools on the target since it's what our flashing / upgrade procudure
> uses to speed up the process (flashing ~8GB disk images full of zeroes).
> 
> Changes v3 -v4:
>   - added the upstream URL to the package's help
> 
> Changes v2 -> v3:
>   - double-checked that setuptools is required by bmap-tools at runtime too
>   - moved the "v" from BMAP_TOOLS_VERSION to BMAP_TOOLS_SITE (in the .hash too)
>   - changed license name from GPLv2 to GPL-2.0
> 
> Changes v1 -> v2:
>   - no change
> 
> ---
> 
> Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
> ---
>  DEVELOPERS                         |  3 +++
>  package/Config.in                  |  1 +
>  package/bmap-tools/Config.in       | 15 +++++++++++++++
>  package/bmap-tools/bmap-tools.hash |  2 ++
>  package/bmap-tools/bmap-tools.mk   | 15 +++++++++++++++
>  5 files changed, 36 insertions(+)
>  create mode 100644 package/bmap-tools/Config.in
>  create mode 100644 package/bmap-tools/bmap-tools.hash
>  create mode 100644 package/bmap-tools/bmap-tools.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 24c57b25f7..947722a8c7 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1728,6 +1728,9 @@ F:	package/libevdev/
>  N:	Nicola Di Lieto <nicola.dilieto@gmail.com>
>  F:	package/uacme/
>  
> +N:	Nicolas Carrier <nicolas.carrier@orolia.com>
> +F:	package/bmap-tools/
> +
>  N:	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
>  F:	package/libgit2/
>  
> diff --git a/package/Config.in b/package/Config.in
> index 1ad1d49a8a..52852ac2fc 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -184,6 +184,7 @@ menu "Filesystem and flash utilities"
>  	source "package/aufs/Config.in"
>  	source "package/aufs-util/Config.in"
>  	source "package/autofs/Config.in"
> +	source "package/bmap-tools/Config.in"
>  	source "package/btrfs-progs/Config.in"
>  	source "package/cifs-utils/Config.in"
>  	source "package/cpio/Config.in"
> diff --git a/package/bmap-tools/Config.in b/package/bmap-tools/Config.in
> new file mode 100644
> index 0000000000..e582270c44
> --- /dev/null
> +++ b/package/bmap-tools/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_BMAP_TOOLS
> +	bool "bmap-tools"
> +	depends on BR2_PACKAGE_PYTHON3 || \
> +		BR2_PACKAGE_PYTHON
> +	select BR2_PACKAGE_PYTHON_SIX # runtime
> +	select BR2_PACKAGE_PYTHON_SETUPTOOLS
> +	help
> +	  Tool to flash image files to block devices using the block map
> +	  bmaptool is a generic tool for creating the block map (bmap)
> +	  for a file, and copying files using the block map. The idea is
> +	  that large file containing unused blocks, like raw system
> +	  image files, can be copied or flashed a lot faster with
> +	  bmaptool than with traditional tools like "dd" or "cp".
> +
> +	  https://github.com/intel/bmap-tools
> diff --git a/package/bmap-tools/bmap-tools.hash b/package/bmap-tools/bmap-tools.hash
> new file mode 100644
> index 0000000000..794765b633
> --- /dev/null
> +++ b/package/bmap-tools/bmap-tools.hash
> @@ -0,0 +1,2 @@
> +sha256  d410e2d97192d0fc2f88ef160a0bb6ed83fce99da97a606d7f6890cc654ec594  bmap-tools-3.5.tar.gz
> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/bmap-tools/bmap-tools.mk b/package/bmap-tools/bmap-tools.mk
> new file mode 100644
> index 0000000000..4c2465876e
> --- /dev/null
> +++ b/package/bmap-tools/bmap-tools.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# bmap-tools
> +#
> +################################################################################
> +
> +BMAP_TOOLS_VERSION = 3.5
> +BMAP_TOOLS_SITE = $(call github,intel,bmap-tools,v$(BMAP_TOOLS_VERSION))
> +BMAP_TOOLS_LICENSE = GPL-2.0
> +BMAP_TOOLS_LICENSE_FILES = COPYING
> +BMAP_TOOLS_SETUP_TYPE = setuptools
> +BMAP_TOOLS_DEPENDENCIES = \
> +	python-setuptools
When you create a new package for a software in Buildroot, it can be useful to
check how the software is packaged for other Linux distribution or build tool
(Yocto).

For example, Fedora, ArchLinux and Debian

https://github.com/intel/bmap-tools/blob/master/packaging/bmap-tools.spec#L20
https://github.com/intel/bmap-tools/blob/master/debian/control#L13

         python-gpgme,
         ${misc:Depends},
         ${python:Depends},
         bzip2,
         pbzip2,
         gzip,
         pigz,
         lzop,
         liblz4-tool,
         xz-utils,
         tar,
         unzip

Some of theses (maybe optional) dependencies are missing in your patch.
Can you check them?

Best regards,
Romain

> +
> +$(eval $(python-package))
> 
