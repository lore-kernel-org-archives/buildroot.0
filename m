From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 19 May 2020 23:08:45 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/mfgtools: bump to version
 1.3.154
In-Reply-To: <20200413214249.206017-1-joerg.krause@embedded.rocks>
References: <20200413214249.206017-1-joerg.krause@embedded.rocks>
Message-ID: <20200519230845.447c80c6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Apr 2020 23:42:49 +0200
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> +MFGTOOLS_VERSION = 1.3.154
> +MFGTOOLS_SITE = $(call github,NXPmicro,mfgtools,uuu_$(MFGTOOLS_VERSION))
> +MFGTOOLS_LICENSE = BSD-3-Clause
> +MFGTOOLS_LICENSE_FILES = LICENSE
> +HOST_MFGTOOLS_DEPENDENCIES = host-libusb host-libzip host-zlib

This is missing host-bzip2, otherwise the build fails with:

CMake Error at /home/br-user/output/host/share/cmake-3.15/Modules/FindPackageHandleStandardArgs.cmake:137 (message):
  Could NOT find BZip2 (missing: BZIP2_LIBRARIES BZIP2_INCLUDE_DIR)
Call Stack (most recent call first):
  /home/br-user/output/host/share/cmake-3.15/Modules/FindPackageHandleStandardArgs.cmake:378 (_FPHSA_FAILURE_MESSAGE)
  /home/br-user/output/host/share/cmake-3.15/Modules/FindBZip2.cmake:63 (FIND_PACKAGE_HANDLE_STANDARD_ARGS)
  libuuu/CMakeLists.txt:6 (find_package)

It also fails to build without host-openssl:

-- Could NOT find OpenSSL, try to set the path to OpenSSL root folder in the system variable OPENSSL_ROOT_DIR (missing: OPENSSL_CRYPTO_LIBRARY OPENSSL_INCLUDE_DIR) 
CMake Error: The following variables are used in this project, but they are set to NOTFOUND.
Please set them or make sure they are set and tested correctly in the CMake files:
OPENSSL_CRYPTO_LIBRARY (ADVANCED)
    linked by target "uuu" in directory /home/br-user/output/build/host-mfgtools-1.3.154/uuu
OPENSSL_SSL_LIBRARY (ADVANCED)
    linked by target "uuu" in directory /home/br-user/output/build/host-mfgtools-1.3.154/uuu

But looking more at the source code, uuu/CMakeLists.txt is checking for
openssl, but the code in uuu/ does not use it. libuuu/ is using it, and
makes it conditional.

This all seems to be pretty broken :-/

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
