From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Feb 2019 19:35:16 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/unzip: add
 security and bug fix patches from Debian
Message-ID: <20190223183311.126878A6CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1f83d442dd11fa17cb106f6a2220c770b86c8efc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Debian bug #741384: Buffer overflow

Debian bug #744212: Buffer overflow

CVE-2014-8139: CRC32 verification heap-based overflow

CVE-2014-8140: Out-of-bounds write issue in test_compr_eb()

CVE-2014-8141: Out-of-bounds read issues in getZip64Data()

CVE-2014-9636: Heap overflow

CVE-2015-7696: Heap overflow when extracting password-protected archive

CVE-2015-7697: Infinite loop when extracting password-protected archive

Red Hat Bugzilla #1260944: Unsigned overflow on invalid input

Debian bug #842993: Do not ignore Unix Timestamps

CVE-2014-9913: Buffer overflow

CVE-2016-9844: Buffer overflow in zipinfo

CVE-2018-1000035: Buffer overflow in password protected ZIP archives

Cc: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 872561cd5b35d0516338cd2530a4ac1236d3efb1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/unzip/unzip.hash | 13 +++++++++++++
 package/unzip/unzip.mk   | 15 +++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/package/unzip/unzip.hash b/package/unzip/unzip.hash
index a138cc27c9..fbf2615ad6 100644
--- a/package/unzip/unzip.hash
+++ b/package/unzip/unzip.hash
@@ -1,2 +1,15 @@
 # Locally computed:
 sha256 036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37 unzip60.tgz
+sha256 66a364d75cea29363768ca6d43dd11b9913a59e42b8da16c4f63516c3e4ce7c1 07-increase-size-of-cfactorstr.patch
+sha256 3a8cfd2702d220c6c119eaf805b018b66460284e585e92adc8a572d190471724 08-allow-greater-hostver-values.patch
+sha256 0a1b23118b2f4a3ed097348ab33050d4f79b3863ab30e6d64ac382589834e3de 09-cve-2014-8139-crc-overflow.patch
+sha256 32b1eda30644c44a8bdb9a02ff08bb2eca107f8eb16dda6992a9b778a0de395e 10-cve-2014-8140-test-compr-eb.patch
+sha256 1f60f6e28b36f3cddb7da64c528cfe29160cefa1232e13bb8a47561f574067a9 11-cve-2014-8141-getzip64data.patch
+sha256 c05885bb48b41603f0893ada88f15c0fae3b3f9f6489f24ad630a400f6271351 12-cve-2014-9636-test-compr-eb.patch
+sha256 788c29727ff0689c3b1828466127758426f6d2c769048aa985950373747c76f3 14-cve-2015-7696.patch
+sha256 e85dab65c3ebf3c4ab3359a4143cfd0efccfd1cac517a4e7bd5f518f41a02b6f 15-cve-2015-7697.patch
+sha256 95dd15d5d9cdf5cea18c357b152930d6d52660599e0fd4907d6405870fdd9fe1 16-fix-integer-underflow-csiz-decrypted.patch
+sha256 ea04cfc8b7ca3b3c03117da0d891870b8c542d26188ef5593fd7e479f4f29f4e 17-restore-unix-timestamps-accurately.patch
+sha256 1872ffdd4d82edd7b1e62c469642bf16a1ca12dd26d41bd3f0b44f0f7602eb63 18-cve-2014-9913-unzip-buffer-overflow.patch
+sha256 60840ea8f5d11a276972fb5b43652cdd49a9ed93b2cc0586ad309bf52104b012 19-cve-2016-9844-zipinfo-buffer-overflow.patch
+sha256 4eabc3faeddd56ebc3d5053486b61f8758d840902725fd555d3472cffb094437 20-cve-2018-1000035-unzip-buffer-overflow.patch
diff --git a/package/unzip/unzip.mk b/package/unzip/unzip.mk
index 7d48d25309..6807257524 100644
--- a/package/unzip/unzip.mk
+++ b/package/unzip/unzip.mk
@@ -12,4 +12,19 @@ UNZIP_DEPENDENCIES = $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 UNZIP_LICENSE = Info-ZIP
 UNZIP_LICENSE_FILES = LICENSE
 
+UNZIP_PATCH = \
+	https://sources.debian.org/data/main/u/unzip/6.0-22/debian/patches/07-increase-size-of-cfactorstr.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-22/debian/patches/08-allow-greater-hostver-values.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-22/debian/patches/09-cve-2014-8139-crc-overflow.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-22/debian/patches/10-cve-2014-8140-test-compr-eb.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-22/debian/patches/11-cve-2014-8141-getzip64data.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-22/debian/patches/12-cve-2014-9636-test-compr-eb.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-22/debian/patches/14-cve-2015-7696.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-22/debian/patches/15-cve-2015-7697.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-22/debian/patches/16-fix-integer-underflow-csiz-decrypted.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-22/debian/patches/17-restore-unix-timestamps-accurately.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-22/debian/patches/18-cve-2014-9913-unzip-buffer-overflow.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-22/debian/patches/19-cve-2016-9844-zipinfo-buffer-overflow.patch \
+	https://sources.debian.org/data/main/u/unzip/6.0-22/debian/patches/20-cve-2018-1000035-unzip-buffer-overflow.patch
+
 $(eval $(cmake-package))
