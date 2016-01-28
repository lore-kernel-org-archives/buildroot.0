From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Jan 2016 12:06:00 +0100
Subject: [Buildroot] [PATCH v2] rabbitmq-c: link against zlib and libintl
In-Reply-To: <CACt6We30Dq0ztHQbO2x0+MyC2gGXW8LkJdMVH2biD4_utBetKw@mail.gmail.com>
References: <1453970725-12387-1-git-send-email-joris.lijssens@gmail.com>
 <20160128095950.6960050d@free-electrons.com>
 <CACt6We30Dq0ztHQbO2x0+MyC2gGXW8LkJdMVH2biD4_utBetKw@mail.gmail.com>
Message-ID: <20160128120600.5d445d77@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joris,

(Please don't top post, this is considered bad practice on most mailing
list.)

I'm adding Samuel Martin in Cc, he is our CMake expert :)

On Thu, 28 Jan 2016 10:11:21 +0100, Joris Lijssens wrote:

> I know that libcrypto is using zlib and libpopt is using libintl, but i
> have no idea how to query opensll and popt in cmake. Can you give some
> pointers?

So, for the libcrypto -> zlib case, I had a look. rabbitmq-c properly
uses find_package(OpenSSL), which uses pkg-config internally, and there
knows about the -lz dependency. Building the rabbitmq-c library (in the
librabbitmq/ directory) works fine.

However, the problem occurs when linking the tools (in the tools/
directory): they are linked against the librabbitmq library. They know
that they should link with -lssl -lcrypto (and I couldn't figure out
how) but they don't know they should link with -lz.

Samuel, what is the usual solution for such situations with CMake ?

If you want to reproduce by yourself, here is a minimal defconfig:

BR2_arm=y
BR2_STATIC_LIBS=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-static-2015.11-rc1-71-g90d1299.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_14=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_RABBITMQ_C=y
BR2_PACKAGE_POPT=y
# BR2_TARGET_ROOTFS_TAR is not set

(This one produces only the libcrypto -> zlib problem. To produce the
popt problem, you need to add BR2_PACKAGE_GETTEXT=y).

The popt problem is exactly the same: pkg-config is used to detect
popt,  popt.pc contains -lintl, but it isn't used when linking the
tools.

Samuel, help :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
