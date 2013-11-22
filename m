From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 22 Nov 2013 22:17:32 +0100
Subject: [Buildroot] [PATCH 2 of 2] beecrypt: unconditionally disable openpm
In-Reply-To: <patchbomb.1385155050@argentina>
References: <patchbomb.1385155050@argentina>
Message-ID: <aa0f108d67651a57a395.1385155052@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

beecrypt does not properly handle its dependency on openpm, so that
applications using libbeecrypt are not aware that they also need openmp
(libgomp). This causes error messages during linking, such as (rpm):

..-gcc [..] -lbeecrypt  -lbz2 -lz -lpopt -lpthread
libbecrypt.so: undefined reference to `GOMP_sections_end_nowait'
libbecrypt.so: undefined reference to `GOMP_parallel_end'
libbecrypt.so: undefined reference to `GOMP_sections_next'
libbecrypt.so: undefined reference to `GOMP_parallel_sections_start'

Because the openpm dependency of beecrypt is only used by rsa.c, to
parallelize the calculation of RSA cyphers, we can simply disable openmp in
beecrypt instead of trying to fix the way -lgomp is passed.

Fixes http://autobuild.buildroot.net/results/bcf/bcff4b81bfbb1191f97317b0945c74d948c9774b/

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/beecrypt/beecrypt.mk |  3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)


Note: this is an alternative fix to the above autobuild than the one Vicente
posted earlier today.

diff --git a/package/beecrypt/beecrypt.mk b/package/beecrypt/beecrypt.mk
--- a/package/beecrypt/beecrypt.mk
+++ b/package/beecrypt/beecrypt.mk
@@ -19,7 +19,8 @@ BEECRYPT_CONF_ENV = \
 
 BEECRYPT_CONF_OPT = \
 		--without-java \
-		--without-python
+		--without-python \
+		--disable-openmp
 
 ifeq ($(BR2_PACKAGE_ICU),y)
 # C++ support needs icu
