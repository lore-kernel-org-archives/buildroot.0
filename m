From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 19 Jan 2021 22:17:58 +0100
Subject: [Buildroot] [git commit] package/unzip: switch to debian
Message-ID: <20210119205850.667F3886F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f238791b6aa5141539c0dab288d69f1d4367e446
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://sources.debian.org/data/main/u/unzip/6.0-25 is unreachable so
switch to the debian archive provided by snapshot.debian.org to retrieve
all debian patches at once.

While at it, also update indentation in hash file and add
UNZIP_IGNORE_CVES entries.

The Debian patch archive we refernce brings in a large set of patches,
some of them fixing CVEs. Since we only cary the Debian patch archive
as a single entity, just refer to it to identify all the CVEs the
individual patches there in are fixng.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr:
  - don't wrap _SITE line that is anyway too long even when wrapped
  - don't enumerate Debian patches one by one, just refere to them
    globally
  - as a consequence, reorder CVEs
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/unzip/unzip.hash | 24 +++++-------------------
 package/unzip/unzip.mk   | 36 ++++++++++++++++--------------------
 2 files changed, 21 insertions(+), 39 deletions(-)

diff --git a/package/unzip/unzip.hash b/package/unzip/unzip.hash
index d05957d5e2..8b3f275533 100644
--- a/package/unzip/unzip.hash
+++ b/package/unzip/unzip.hash
@@ -1,20 +1,6 @@
+# From https://snapshot.debian.org/archive/debian/20210110T204103Z/pool/main/u/unzip/unzip_6.0-26.dsc
+sha256  036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37  unzip_6.0.orig.tar.gz
+sha256  88cb7c0f1fd13252b662dfd224b64b352f9e75cd86389557fcb23fa6d2638599  unzip_6.0-26.debian.tar.xz
+
 # Locally computed:
-sha256 036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37 unzip60.tgz
-sha256 7469b81d5d29ac4fd670f7c86ba0cb9fa34f137a2d4d5198437d92ddf918984b LICENSE
-sha256 66a364d75cea29363768ca6d43dd11b9913a59e42b8da16c4f63516c3e4ce7c1 07-increase-size-of-cfactorstr.patch
-sha256 3a8cfd2702d220c6c119eaf805b018b66460284e585e92adc8a572d190471724 08-allow-greater-hostver-values.patch
-sha256 0a1b23118b2f4a3ed097348ab33050d4f79b3863ab30e6d64ac382589834e3de 09-cve-2014-8139-crc-overflow.patch
-sha256 32b1eda30644c44a8bdb9a02ff08bb2eca107f8eb16dda6992a9b778a0de395e 10-cve-2014-8140-test-compr-eb.patch
-sha256 1f60f6e28b36f3cddb7da64c528cfe29160cefa1232e13bb8a47561f574067a9 11-cve-2014-8141-getzip64data.patch
-sha256 c05885bb48b41603f0893ada88f15c0fae3b3f9f6489f24ad630a400f6271351 12-cve-2014-9636-test-compr-eb.patch
-sha256 788c29727ff0689c3b1828466127758426f6d2c769048aa985950373747c76f3 14-cve-2015-7696.patch
-sha256 e85dab65c3ebf3c4ab3359a4143cfd0efccfd1cac517a4e7bd5f518f41a02b6f 15-cve-2015-7697.patch
-sha256 95dd15d5d9cdf5cea18c357b152930d6d52660599e0fd4907d6405870fdd9fe1 16-fix-integer-underflow-csiz-decrypted.patch
-sha256 ea04cfc8b7ca3b3c03117da0d891870b8c542d26188ef5593fd7e479f4f29f4e 17-restore-unix-timestamps-accurately.patch
-sha256 1872ffdd4d82edd7b1e62c469642bf16a1ca12dd26d41bd3f0b44f0f7602eb63 18-cve-2014-9913-unzip-buffer-overflow.patch
-sha256 60840ea8f5d11a276972fb5b43652cdd49a9ed93b2cc0586ad309bf52104b012 19-cve-2016-9844-zipinfo-buffer-overflow.patch
-sha256 4eabc3faeddd56ebc3d5053486b61f8758d840902725fd555d3472cffb094437 20-cve-2018-1000035-unzip-buffer-overflow.patch
-sha256 df3b0eeea8dcc161a2565e306b5dda13d27de43145e198baaf0eab822321ee7e 21-fix-warning-messages-on-big-files.patch
-sha256 2cf5a89e921da99e883bcde0ea03e2c77ae9185f57efaf35e7d43bc24353cfdc 22-cve-2019-13232-fix-bug-in-undefer-input.patch
-sha256 c8e82c80fc7760f90567118a465e4cfa1b8e5d0a5723f9c70e3d21247e550615 23-cve-2019-13232-zip-bomb-with-overlapped-entries.patch
-sha256 37ba0bea723beeb22670babda18bd980368cc6591bc7bd9caa04f62692c7e5ac 24-cve-2019-13232-do-not-raise-alert-for-misplaced-central-directory.patch
+sha256  7469b81d5d29ac4fd670f7c86ba0cb9fa34f137a2d4d5198437d92ddf918984b  LICENSE
diff --git a/package/unzip/unzip.mk b/package/unzip/unzip.mk
index 231abc86be..2997d33a28 100644
--- a/package/unzip/unzip.mk
+++ b/package/unzip/unzip.mk
@@ -5,29 +5,25 @@
 ################################################################################
 
 UNZIP_VERSION = 6.0
-UNZIP_SOURCE = unzip$(subst .,,$(UNZIP_VERSION)).tgz
-UNZIP_SITE = ftp://ftp.info-zip.org/pub/infozip/src
+UNZIP_SOURCE = unzip_$(UNZIP_VERSION).orig.tar.gz
+UNZIP_PATCH = unzip_$(UNZIP_VERSION)-26.debian.tar.xz
+UNZIP_SITE = https://snapshot.debian.org/archive/debian/20210110T204103Z/pool/main/u/unzip
 UNZIP_LICENSE = Info-ZIP
 UNZIP_LICENSE_FILES = LICENSE
 UNZIP_CPE_ID_VALID = YES
 
-UNZIP_PATCH = \
-	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/07-increase-size-of-cfactorstr.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/08-allow-greater-hostver-values.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/09-cve-2014-8139-crc-overflow.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/10-cve-2014-8140-test-compr-eb.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/11-cve-2014-8141-getzip64data.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/12-cve-2014-9636-test-compr-eb.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/14-cve-2015-7696.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/15-cve-2015-7697.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/16-fix-integer-underflow-csiz-decrypted.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/17-restore-unix-timestamps-accurately.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/18-cve-2014-9913-unzip-buffer-overflow.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/19-cve-2016-9844-zipinfo-buffer-overflow.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/20-cve-2018-1000035-unzip-buffer-overflow.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/21-fix-warning-messages-on-big-files.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/22-cve-2019-13232-fix-bug-in-undefer-input.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/23-cve-2019-13232-zip-bomb-with-overlapped-entries.patch \
-	https://sources.debian.org/data/main/u/unzip/6.0-25/debian/patches/24-cve-2019-13232-do-not-raise-alert-for-misplaced-central-directory.patch
+# unzip_$(UNZIP_VERSION)-26.debian.tar.xz has patches to fix:
+UNZIP_IGNORE_CVES = \
+	CVE-2014-8139 \
+	CVE-2014-8140 \
+	CVE-2014-8141 \
+	CVE-2014-9636 \
+	CVE-2014-9913 \
+	CVE-2015-7696 \
+	CVE-2015-7697 \
+	CVE-2016-9844 \
+	CVE-2018-18384 \
+	CVE-2018-1000035 \
+	CVE-2019-13232
 
 $(eval $(cmake-package))
