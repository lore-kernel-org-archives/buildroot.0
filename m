From: jonsmirl at gmail.com <jonsmirl@gmail.com>
Date: Sun, 31 Mar 2019 22:57:54 -0400
Subject: [Buildroot] Help making package file for libp11
Message-ID: <CAKON4OzT+DFQ2n4ic7CF+YD66UojXOjxyo2+ZVCZ7XyQdhng3w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I made up a package file for libp11 based off from other posts to the list...

LIBP11_VERSION = e1210903291b1de9eabcad26e740a4b2fbcca692
LIBP11_SITE = $(call github,OpenSC,libp11,$(LIBP11_VERSION))
LIBP11_DEPENDENCIES = openssl
LIBP11_INSTALL_STAGING = YES
LIBP11_LICENSE = LGPLv2.1
LIBP11_LICENSE_FILES = COPYING
LIBP11_AUTORECONF = YES

LIBP11_CONF_OPTS += --with-enginesdir=/usr/lib
ifeq ($(BR2_PACKAGE_P11_KIT),y)
LIBP11_CONF_OPTS += --with-pkcs11-module=/usr/lib/p11-kit-proxy.so
endif

$(eval $(autotools-package))

-----------------------------

I'm getting an error with the path at the install stage...
Can anyone give me a clue as to what is wrong?

make[2]: Entering directory
`/home/jonsmirl/aosp/lindenis/out/eagle/lindeni-v5/buildroot/build/libp11-e1210903291b1de9eabcad26e740a4b2fbcca692'
make[3]: Entering directory
`/home/jonsmirl/aosp/lindenis/out/eagle/lindeni-v5/buildroot/build/libp11-e1210903291b1de9eabcad26e740a4b2fbcca692'
make[3]: Nothing to be done for `install-exec-am'.
 /bin/mkdir -p '/home/jonsmirl/aosp/lindenis/out/eagle/lindeni-v5/buildroot/host/arm-buildroot-linux-gnueabi/sysroot/usr/share/doc/libp11'
 /usr/bin/install -c -m 644 NEWS
'/home/jonsmirl/aosp/lindenis/out/eagle/lindeni-v5/buildroot/host/arm-buildroot-linux-gnueabi/sysroot/usr/share/doc/libp11'
make[3]: Leaving directory
`/home/jonsmirl/aosp/lindenis/out/eagle/lindeni-v5/buildroot/build/libp11-e1210903291b1de9eabcad26e740a4b2fbcca692'
make[2]: Leaving directory
`/home/jonsmirl/aosp/lindenis/out/eagle/lindeni-v5/buildroot/build/libp11-e1210903291b1de9eabcad26e740a4b2fbcca692'
make[1]: Leaving directory
`/home/jonsmirl/aosp/lindenis/out/eagle/lindeni-v5/buildroot/build/libp11-e1210903291b1de9eabcad26e740a4b2fbcca692'
>>> libp11 e1210903291b1de9eabcad26e740a4b2fbcca692 Fixing libtool files
for la in $(find
/home/jonsmirl/aosp/lindenis/out/eagle/lindeni-v5/buildroot/host/arm-buildroot-linux-gnueabi/sysroot/usr/lib*
-name "*.la"); do \
cp -a "${la}" "${la}.fixed" && \
/bin/sed -i -e "s:/home/jonsmirl/aosp/lindenis/out/eagle/lindeni-v5/buildroot:@BASE_DIR@:g"
\
-e "s:/home/jonsmirl/aosp/lindenis/out/eagle/lindeni-v5/buildroot/host/arm-buildroot-linux-gnueabi/sysroot:@STAGING_DIR@:g"
\
-e "s:/home/jonsmirl/aosp/lindenis/out/external-toolchain/gcc-linaro-5.3.1-arm:@TOOLCHAIN_EXTERNAL_INSTALL_DIR@:g"
\
-e "s:\(['= ]\)/usr:\\1 at STAGING_DIR@/usr:g" \
-e "s:@TOOLCHAIN_EXTERNAL_INSTALL_DIR@:/home/jonsmirl/aosp/lindenis/out/external-toolchain/gcc-linaro-5.3.1-arm:g"
\
-e "s:@STAGING_DIR@:/home/jonsmirl/aosp/lindenis/out/eagle/lindeni-v5/buildroot/host/arm-buildroot-linux-gnueabi/sysroot:g"
\
-e "s:@BASE_DIR@:/home/jonsmirl/aosp/lindenis/out/eagle/lindeni-v5/buildroot:g"
\
"${la}.fixed" && \
if cmp -s "${la}" "${la}.fixed"; then \
rm -f "${la}.fixed"; \
else \
mv "${la}.fixed" "${la}"; \
fi || exit 1; \
done
libp11: installs files in
/home/jonsmirl/aosp/lindenis/out/eagle/lindeni-v5/buildroot/host/arm-buildroot-linux-gnueabi/sysroot//home/jonsmirl/aosp/lindenis/out/eagle/lindeni-v5/buildroot
make: *** [/home/jonsmirl/aosp/lindenis/out/eagle/lindeni-v5/buildroot/build/libp11-e1210903291b1de9eabcad26e740a4b2fbcca692/.stamp_staging_installed]
Error 1
make: Leaving directory `/home/jonsmirl/aosp/lindenis/buildroot'


-- 
Jon Smirl
jonsmirl at gmail.com
