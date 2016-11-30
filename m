From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Nov 2016 22:20:04 +0100
Subject: [Buildroot] [PATCH v3,1/1] cjson: bump to version v1.0.2
In-Reply-To: <1480447908-67837-1-git-send-email-fabrice.fontaine@orange.com>
References: <1480447908-67837-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20161130222004.2a25f907@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 29 Nov 2016 20:31:48 +0100, Fabrice Fontaine wrote:
> This is a major update in cjson:
>  - project site moved from sourceforge to github
>  - project recommends to use the new cmake buildsystem instead of the
>    legacy make
>  - BR2_STATIC_LIBS is now OK (README does not mention issue anymore)
>  - As include path and library name have changed, tinycbor has to be
>    updated
> 
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>

Unfortunately, with this patch applied to the next branch, the
following defconfig:

BR2_arm=y
BR2_STATIC_LIBS=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-static-2016.08-613-ge98b4dd.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_14=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_CJSON=y
BR2_PACKAGE_TINYCBOR=y
# BR2_TARGET_ROOTFS_TAR is not set

does not build:

/home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-gcc -o bin/cbordump -static tools/cbordump/cbordump.o lib/libtinycbor.a  -lm
/home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-gcc -o bin/json2cbor -static -lcjson tools/json2cbor/json2cbor.o lib/libtinycbor.a  -lm
tools/json2cbor/json2cbor.o: In function `get_meta_data':
json2cbor.c:(.text.get_meta_data+0x3c): undefined reference to `cJSON_GetObjectItem'
tools/json2cbor/json2cbor.o: In function `main':
json2cbor.c:(.text.startup.main+0x244): undefined reference to `cJSON_ParseWithOpts'
json2cbor.c:(.text.startup.main+0x294): undefined reference to `cJSON_Delete'
collect2: error: ld returned 1 exit status
Makefile:118: recipe for target 'bin/json2cbor' failed
make[2]: *** [bin/json2cbor] Error 1
package/pkg-generic.mk:216: recipe for target '/home/thomas/projets/buildroot/output/build/tinycbor-v0.4/.stamp_built' failed
make[1]: *** [/home/thomas/projets/buildroot/output/build/tinycbor-v0.4/.stamp_built] Error 2
Makefile:79: recipe for target '_all' failed

Could you have a look and send an updated version?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
