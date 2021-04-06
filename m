From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Apr 2021 09:38:31 +0200
Subject: [Buildroot] [git commit] package/xen: add upstream xsa-36{0, 4,
 8} security fixes
Message-ID: <20210406071628.3358C8D3EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=34ff4fc32d4b835fa22a5d4620f065837f1e1191
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issues:

- CVE-2021-3308: IRQ vector leak on x86
  https://xenbits.xenproject.org/xsa/advisory-360.html

- CVE-2021-26933: arm: The cache may not be cleaned for newly allocated
  scrubbed pages
  https://xenbits.xenproject.org/xsa/advisory-364.html

- CVE-2021-28687: HVM soft-reset crashes toolstack
  https://xenbits.xenproject.org/xsa/advisory-368.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xen/xen.hash |  6 ++++++
 package/xen/xen.mk   | 13 +++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index 95061c3fc8..6893414313 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -1,3 +1,9 @@
 # Locally computed
 sha256  cf0d7316ad674491f49b7ef0518cb1d906a2e3bfad639deef0ef2343b119ac0c  xen-4.14.1.tar.gz
 sha256  ecca9538e9d3f7e3c2bff827502f4495e2ef9e22c451298696ea08886b176c2c  COPYING
+# https://xenbits.xenproject.org/xsa/advisory-360.html
+sha256  809515011efb781a2a8742e9acfd76412d3920c2d4142bb187588cd36f77383e  xsa360-4.14.patch
+# https://xenbits.xenproject.org/xsa/advisory-364.html
+sha256  dc313c70bb07b4096bbc4612cbbc180589923277411dede2fda37f04ecc846d6  xsa364.patch
+# https://xenbits.xenproject.org/xsa/advisory-368.html
+sha256  55bbe59c75b69f493e364dfcf6cdbc7db4acd32dbf0b4d2466815b7c1f1823ce  xsa368-4.14.patch
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index 3a758b7b20..533882e05b 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -11,6 +11,19 @@ XEN_LICENSE_FILES = COPYING
 XEN_CPE_ID_VENDOR = xen
 XEN_CPE_ID_PREFIX = cpe:2.3:o
 XEN_DEPENDENCIES = host-acpica host-python3
+XEN_PATCH = \
+	https://xenbits.xenproject.org/xsa/xsa360-4.14.patch \
+	https://xenbits.xenproject.org/xsa/xsa364.patch \
+	https://xenbits.xenproject.org/xsa/xsa368-4.14.patch
+
+# xsa360-4.14.patch
+XEN_IGNORE_CVES += CVE-2021-3308
+
+# xsa364.patch
+XEN_IGNORE_CVES += CVE-2021-26933
+
+# xsa368-4.14.patch
+XEN_IGNORE_CVES += CVE-2021-28687
 
 # Calculate XEN_ARCH
 ifeq ($(ARCH),aarch64)
