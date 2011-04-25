From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 25 Apr 2011 23:23:08 +0200
Subject: [Buildroot] [PATCH] New package: gdisk
In-Reply-To: <1298819986-24787-1-git-send-email-m-starostik@versanet.de>
	(Malte Starostik's message of "Sun, 27 Feb 2011 16:19:46 +0100, Sun,
	27 Feb 2011 16:19:45 +0100")
References: <1298819986-24787-1-git-send-email-m-starostik@versanet.de>
Message-ID: <8762q26n5v.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Malte" == Malte Starostik <m-starostik@versanet.de> writes:

Hi,

 Malte> This includes two separately configurable parition manipulation
 Malte> utilities: gdsik and sgdisk are to GPT disks what fdisk and sfdisk are
 Malte> in MBR land.

Thanks, and sorry for the slow response. Committed with some tweaks (see
below).

First of all, the gdisk sources have to be patched to not hardcode
/usr/include/uuid/uuid.h, and instead use the cross compiled one in
STAGING_DIR.


 Malte> Signed-off-by: Malte Starostik <m-starostik@versanet.de>
 Malte> ---
 Malte>  package/Config.in       |    1 +
 Malte>  package/gdisk/Config.in |   34 ++++++++++++++++++++++++++++++++++
 Malte>  package/gdisk/gdisk.mk  |   33 +++++++++++++++++++++++++++++++++
 Malte>  3 files changed, 68 insertions(+), 0 deletions(-)
 Malte>  create mode 100644 package/gdisk/Config.in
 Malte>  create mode 100644 package/gdisk/gdisk.mk

 Malte> diff --git a/package/Config.in b/package/Config.in
 Malte> index f459c1b..8a754e2 100644
 Malte> --- a/package/Config.in
 Malte> +++ b/package/Config.in
 Malte> @@ -165,6 +165,7 @@ source "package/eeprog/Config.in"
 Malte>  source "package/fconfig/Config.in"
 Malte>  source "package/fis/Config.in"
 Malte>  source "package/gadgetfs-test/Config.in"
 Malte> +source "package/gdisk/Config.in"
 Malte>  source "package/genext2fs/Config.in"
 Malte>  source "package/genromfs/Config.in"
 Malte>  source "package/gpsd/Config.in"
 Malte> diff --git a/package/gdisk/Config.in b/package/gdisk/Config.in
 Malte> new file mode 100644
 Malte> index 0000000..a49bac6
 Malte> --- /dev/null
 Malte> +++ b/package/gdisk/Config.in
 Malte> @@ -0,0 +1,34 @@
 Malte> +config BR2_PACKAGE_GDISK
 Malte> +	bool "gdisk"
 Malte> +	depends on BR2_LARGEFILE && BR2_INSTALL_LIBSTDCPP
 Malte> +	help
 Malte> +	  GPT fdisk (consisting of the gdisk and sgdisk programs) is a
 Malte> +	  text-mode partitioning tool that works on Globally Unique Identifier
 Malte> +	  (GUID) Partition Table (GPT) disks, rather than on the more common
 Malte> +	  (through 2010) Master Boot Record (MBR) partition tables.
 Malte> +
 Malte> +	  http://www.rodsbooks.com/gdisk/
 Malte> +
 Malte> +config BR2_PACKAGE_GDISK_GDISK
 Malte> +	bool "interactive gdisk"
 Malte> +	depends on BR2_PACKAGE_GDISK
 Malte> +	select BR2_PACKAGE_E2FSPROGS
 Malte> +	select BR2_PACKAGE_E2FSPROGS_LIBUUID
 Malte> +	help
 Malte> +	  Install the interactive GUID partition table (GPT) manipulator
 Malte> +	  /usr/sbin/gdsik which is modelled after and quite similar in use

s/gdsik/gdisk/

 Malte> +++ b/package/gdisk/gdisk.mk
 Malte> @@ -0,0 +1,33 @@
 Malte> +#############################################################
 Malte> +#
 Malte> +# gdisk
 Malte> +#
 Malte> +#############################################################
 Malte> +
 Malte> +GDISK_VERSION = 0.6.14
 Malte> +GDISK_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/gptfdisk
 Malte> +GDISK_SOURCE = gdisk-$(GDISK_VERSION).tgz
 Malte> +

You need to fix build when no sub option is selected, and only build the
selected sub options (otherwise linking fails because of missing popt).


 Malte> +GDISK_DEPENDENCIES += e2fsprogs
 Malte> +ifeq ($(BR2_PACKAGE_GDISK_SGDISK),y)
 Malte> +    GDISK_DEPENDENCIES += popt
 Malte> +endif
 Malte> +
 Malte> +GDISK_TARGETS_$(BR2_PACKAGE_GDISK_GDISK) += gdisk
 Malte> +GDISK_TARGETS_$(BR2_PACKAGE_GDISK_SGDISK) += sgdisk
 Malte> +
 Malte> +define GDISK_BUILD_CMDS
 Malte> +	$(MAKE) CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" -C $(@D)

You should use TARGET_CONFIGURE_OPTS to ensure CFLAGS/CXXFLAGS/LDFLAGS
are properly set.

-- 
Bye, Peter Korsgaard
