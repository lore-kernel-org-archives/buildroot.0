From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Oct 2020 17:04:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/binutils: build host binutils
 w/o debuginfod
In-Reply-To: <20201019170533.3297066-1-egorenar@linux.ibm.com> (Alexander
 Egorenkov's message of "Mon, 19 Oct 2020 19:05:33 +0200")
References: <20201019170533.3297066-1-egorenar@linux.ibm.com>
Message-ID: <87eelhggsd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexander" == Alexander Egorenkov <egorenar@linux.ibm.com> writes:

 > Since version 2.34 binutils enables debuginfod support
 > by default if the debuginfod library is present on the host.
 > This leads to a problem with host-openssl's libcrypto and hosts's
 > libk5crypto which are both linked by the host's libdebuginfod and
 > are incompatible.

 > This behavior has been observed on Fedora 32 which ships libdebuginfod.

 > $ nm -D /lib64/libk5crypto.so.3 | grep 'U EVP_KDF_ctrl'
 >                  U EVP_KDF_ctrl

 > $ ldd $BUILD_DIR/host/bin/s390x-buildroot-linux-gnu-objdump
 >         linux-vdso.so.1 (0x00007ffd7ed9b000)
 >         libz.so.1 => $BUILD_DIR/host/lib/libz.so.1 (0x00007f7ad0dcd000)
 >         libdebuginfod.so.1 => /lib64/libdebuginfod.so.1 (0x00007f7ad0da1000)
 >         libdl.so.2 => /lib64/libdl.so.2 (0x00007f7ad0d9a000)
 >         libc.so.6 => /lib64/libc.so.6 (0x00007f7ad0bd0000)
 >         libcurl.so.4 => /lib64/libcurl.so.4 (0x00007f7ad0b3c000)
 >         /lib64/ld-linux-x86-64.so.2 (0x00007f7ad0de9000)
 >         libnghttp2.so.14 => /lib64/libnghttp2.so.14 (0x00007f7ad0b10000)
 >         libidn2.so.0 => /lib64/libidn2.so.0 (0x00007f7ad0aec000)
 >         libssh.so.4 => /lib64/libssh.so.4 (0x00007f7ad0a7a000)
 >         libpsl.so.5 => /lib64/libpsl.so.5 (0x00007f7ad0a67000)
 >         libssl.so.1.1 => $BUILD_DIR/host/lib/libssl.so.1.1 (0x00007f7ad09d8000)
 >         libcrypto.so.1.1 => $BUILD_DIR/host/lib/libcrypto.so.1.1 (0x00007f7ad0718000)
 >         libgssapi_krb5.so.2 => /lib64/libgssapi_krb5.so.2 (0x00007f7ad06c1000)
 >         libkrb5.so.3 => /lib64/libkrb5.so.3 (0x00007f7ad05d4000)
 >         libk5crypto.so.3 => /lib64/libk5crypto.so.3 (0x00007f7ad05bb000)
 >         libcom_err.so.2 => $BUILD_DIR/host/lib/libcom_err.so.2 (0x00007f7ad05b5000)
 >         libldap-2.4.so.2 => /lib64/libldap-2.4.so.2 (0x00007f7ad0563000)
 >         liblber-2.4.so.2 => /lib64/liblber-2.4.so.2 (0x00007f7ad0551000)
 >         libbrotlidec.so.1 => /lib64/libbrotlidec.so.1 (0x00007f7ad0543000)
 >         libpthread.so.0 => /lib64/libpthread.so.0 (0x00007f7ad051f000)
 >         libunistring.so.2 => /lib64/libunistring.so.2 (0x00007f7ad039a000)
 >         libkrb5support.so.0 => /lib64/libkrb5support.so.0 (0x00007f7ad0388000)
 >         libkeyutils.so.1 => /lib64/libkeyutils.so.1 (0x00007f7ad0381000)
 >         libresolv.so.2 => /lib64/libresolv.so.2 (0x00007f7ad0367000)
 >         libsasl2.so.3 => /lib64/libsasl2.so.3 (0x00007f7ad0345000)
 >         libbrotlicommon.so.1 => /lib64/libbrotlicommon.so.1 (0x00007f7ad0322000)
 >         libselinux.so.1 => /lib64/libselinux.so.1 (0x00007f7ad02f5000)
 >         libcrypt.so.2 => /lib64/libcrypt.so.2 (0x00007f7ad02ba000)
 >         libpcre2-8.so.0 => /lib64/libpcre2-8.so.0 (0x00007f7ad0221000)

 > $ $BUILD_DIR/host/bin/s390x-buildroot-linux-gnu-objdump
 > qemu-s390x/host/bin/s390x-buildroot-linux-gnu-objdump: symbol lookup error: /lib64/libk5crypto.so.3: undefined symbol: EVP_KDF_ctrl, version OPENSSL_1_1_1b

 > Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>

Committed to 2020.08.x (2.34 is not in 2020.02), thanks.

-- 
Bye, Peter Korsgaard
