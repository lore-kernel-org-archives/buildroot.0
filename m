From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Oct 2020 17:02:32 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/binutils: build
 host binutils w/o debuginfod
Message-ID: <20201029155213.C17658643D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=07c6102683e9644f8afe9f1be71f4ad0fe473d2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Since version 2.34 binutils enables debuginfod support by default if the
debuginfod library is found to be available at build time.

On Fedora 32, libdebuginfod may be present on the system, and the
dependency chain of interest is then:

    libdebuginfod.so
     -> libcurl.so
         -> libk5crypto.so
             -> libcrypto.so

If the Buildroot configuration ever needs to build host-openssl, which
may happen when building the kernel to sign modules for example, this
leads to an inconsistency between the system-provided libcrypto and
ours, leading to missing symbols:

    $ make defconfig
    $ make host-binutils
    $ ./output/host/bin/i686-buildroot-linux-uclibc-objdump --help
    [--snip some help text--]
    $ make host-openssl
    $ ./output/host/bin/i686-buildroot-linux-uclibc-objdump --help
    ./output/host/bin/i686-buildroot-linux-uclibc-objdump: symbol lookup
    error: /lib64/libk5crypto.so.3: undefined symbol: EVP_KDF_ctrl, version
    OPENSSL_1_1_1b

EVP_KDF_ctrl comes from libcrypto:

    $ nm -D /usr/lib64/libcrypto.so.1.1 |grep EVP_KDF_ctrl
    0000000000176000 T EVP_KDF_ctrl
    $ nm -D output/host/lib/libcrypto.so.1.1 |grep EVP_KDF_ctrl
    [--empty--]

So, if host-binutils tools, like objdump et al., are called after our
host-openssl is built, then when run, the system-provided libk5crypto.so
is used, but our libcrypto.so is used, because of the RPATH we set on
our host tools.

And boom.

Note that there is also a latent similar issue if we were to build our
host-libcurl too...

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
[yann.morin.1998 at free.fr: rewrite commit log with a bit more info]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a2b344a34d042021d8ceaabfe371dd824b1cc440)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/binutils/binutils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 326e6e2639..d301b315b8 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -93,6 +93,7 @@ HOST_BINUTILS_CONF_OPTS = \
 	--enable-static \
 	--with-sysroot=$(STAGING_DIR) \
 	--enable-poison-system-directories \
+	--without-debuginfod \
 	$(BINUTILS_DISABLE_GDB_CONF_OPTS) \
 	$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
