From: unixmania at gmail.com <unixmania@gmail.com>
Date: Tue, 17 Dec 2019 09:50:54 -0300
Subject: [Buildroot] [PATCH] package/tpm2-tss: fix build without C++
Message-ID: <20191217125054.9956-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

C++ is required because of a test that we don't build, so simply drop
the requirement while we work on a definitive solution upstream.

Fixes:
    http://autobuild.buildroot.net/results/13f5e37b47b255da4158bec34e5459136f7e60d4
    http://autobuild.buildroot.net/results/1c26db2509c79e00c0de1165945277eaa57b149f
    http://autobuild.buildroot.net/results/b7b6b7b7aca79e847b442cbd2305427d91fe5d70
    http://autobuild.buildroot.net/results/1cd5a82a0e799aa5027e2e2c03b246332cc3a15d
    http://autobuild.buildroot.net/results/d7ec878907f714377c83e9a496e97cbf9382d787
    http://autobuild.buildroot.net/results/1c7f0c1b3ce4871cd87bd6059b1f0a6dc4e74a9c
    http://autobuild.buildroot.net/results/196b81d580325607c8da90beeb79e1f6b8ab8b47
    http://autobuild.buildroot.net/results/f90f7b4ac710b56686635f8ae27059c11b963e47

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 package/tpm2-tss/tpm2-tss.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/tpm2-tss/tpm2-tss.mk b/package/tpm2-tss/tpm2-tss.mk
index 425a6703af..80bd18995b 100644
--- a/package/tpm2-tss/tpm2-tss.mk
+++ b/package/tpm2-tss/tpm2-tss.mk
@@ -11,6 +11,12 @@ TPM2_TSS_LICENSE_FILES = LICENSE
 TPM2_TSS_INSTALL_STAGING = YES
 TPM2_TSS_DEPENDENCIES = liburiparser openssl host-pkgconf
 TPM2_TSS_CONF_OPTS = --with-crypto=ossl --disable-doxygen-doc --disable-defaultflags
+TPM2_TSS_AUTORECONF = YES
+
+define TPM2_TSS_NO_CXX
+	$(SED) /^AC_PROG_CXX$$/d $(@D)/configure.ac
+endef
+TPM2_TSS_POST_PATCH_HOOKS += TPM2_TSS_NO_CXX
 
 # uses C99 code but forgets to pass -std=c99 when --disable-defaultflags is used
 TPM2_TSS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
-- 
2.18.1
