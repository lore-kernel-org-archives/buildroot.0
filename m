From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Wed, 15 Mar 2017 17:10:57 +0200
Subject: [Buildroot] cmake is not building anymore
In-Reply-To: <544671010.14659188.1489539751977.JavaMail.zimbra@datacom.ind.br>
References: <1489417019.20145.214.camel@linux.intel.com>
 <1489420484.20145.218.camel@linux.intel.com>
 <544671010.14659188.1489539751977.JavaMail.zimbra@datacom.ind.br>
Message-ID: <1489590657.19767.1.camel@linux.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2017-03-14 at 22:02 -0300, Carlos Santos wrote:
> > From: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>
> > To: "buildroot" <buildroot@busybox.net>
> > Sent: Monday, March 13, 2017 12:54:44 PM
> > Subject: Re: [Buildroot] cmake is not building anymore
> > On Mon, 2017-03-13 at 16:56 +0200, Andy Shevchenko wrote:
> > > Hi!
> > > 
> > > After update to 2017.02 followed by origin/2017.02.x cmake fails
> > > to
> > > compile.
> > > 
> > > output/build/host-cmake-
> > > 3.6.3/Utilities/cmlibarchive/libarchive/archive_hmac.c: In
> > > function
> > > ?__hmac_sha1_cleanup?:
> > > output/build/host-cmake-
> > > 3.6.3/Utilities/cmlibarchive/libarchive/archive_hmac.c:203:24:
> > > error:
> > > dereferencing pointer to incomplete type ?archive_hmac_sha1_ctx
> > > {aka
> > > struct hmac_ctx_st}?
> > > ? memset(ctx, 0, sizeof(*ctx));
> > > ????????????????????????^~~~
> > > 
> > > Is it known issue?
> > 
> > Just did a clean build. Issue still stays.
> 
> I attempted to reproduce your problem but cmake build flawlessly:
> 
> ????$ git checkout -b 2017.02.x origin/2017.02.x
> ????$ git --no-pager log -n 1 --pretty=oneline
> ????3bf15bfc84f646efbdeead006378265fa56855a9 libiio: explicitly
> disable matlab bindings
> ????[...]
> ????$ make host-cmake
> 
> Please provide some context information:
> 
> ????$ make BR2_DEFCONFIG=$PWD/my_defconfig savedefconfig; cat
> my_defconfig
> ????$ uname -a
> ????$ cat /etc/lsb-release?
> ????$ gcc --version
> 

Below you may find the information you asked for

What I did (2017.02):

$ git clean -xdf
# I suppose you agree this is more stronger than make clean

$ make defconfig
$ make

--- 8< --- 8< ---

[ 65%] Linking C static library libcmcurl.a

In file included from .../output/build/host-cmake-
3.6.3/Utilities/cmlibarchive/libarchive/archive_write_set_format_zip.c:5
2:0:
.../output/build/host-cmake-
3.6.3/Utilities/cmlibarchive/libarchive/archive_cryptor_private.h:107:17
: error: field ?ctx? has incomplete type
??EVP_CIPHER_CTX ctx;
?????????????????^~~
--- 8< --- 8< ---

100% reproducible

$ uname -a

Linux XXX 4.9.0-1-amd64 #1 SMP Debian 4.9.6-3 (2017-01-28) x86_64
GNU/Linux

$ cat /etc/lsb-release
There is no such file, it's Debian testing system.

$ gcc --version
gcc (Debian 6.2.0-6) 6.2.0 20161010

Here is defconfig I'm using:

# Architecture
BR2_i386=y
BR2_x86_i586=y

# Misc
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y

# Root FS
# BR2_TARGET_ROOTFS_TAR is not set
BR2_TARGET_ROOTFS_CPIO=y
BR2_TARGET_ROOTFS_CPIO_BZIP2=y

# Root FS hooks
BR2_ROOTFS_POST_BUILD_SCRIPT="board/intel/common/post-build.sh"
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/intel/common/post-image.sh"
BR2_ROOTFS_POST_SCRIPT_ARGS=""

# Common
BR2_TOOLCHAIN_BUILDROOT_WCHAR=y

# Host tools
BR2_PACKAGE_HOST_ACPICA=y
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_MTOOLS=y
BR2_PACKAGE_HOST_PARTED=y

# Packages
BR2_PACKAGE_EFIBOOTMGR=y
BR2_PACKAGE_KEXEC=y
BR2_PACKAGE_KEXEC_ZLIB=y
BR2_PACKAGE_LRZSZ=y
BR2_PACKAGE_SCREEN=y
BR2_PACKAGE_PCIUTILS=y
BR2_PACKAGE_MTD=y
BR2_PACKAGE_MTD_MKFSUBIFS=y
BR2_PACKAGE_MTD_MTDPART=y
BR2_PACKAGE_MMC_UTILS=y
BR2_PACKAGE_DMIDECODE=y
BR2_PACKAGE_ARGP_STANDALONE=y
BR2_PACKAGE_LINUX_FIRMWARE=y
BR2_PACKAGE_LINUX_FIRMWARE_INTEL_SST_DSP=y
BR2_PACKAGE_ALSA_UTILS=y
BR2_PACKAGE_ALSA_UTILS_SPEAKER_TEST=y
BR2_PACKAGE_LIBIIO=y
BR2_PACKAGE_LIBIIO_TESTS=y
BR2_PACKAGE_ACPID=y
BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XXX=y
BR2_PACKAGE_IW=y
BR2_PACKAGE_RFKILL=y
BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL=y
BR2_PACKAGE_BLUEZ5_UTILS=y
BR2_PACKAGE_FB_TEST_APP=y
BR2_PACKAGE_FBV=y
BR2_PACKAGE_MSR_TOOLS=y

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
