From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Nov 2013 00:20:40 +0100
Subject: [Buildroot] [git commit] beecrypt: unconditionally disable openpm
Message-ID: <20131122232146.B26FF9BCCC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cc2c75b0ec8b1b24ddbeecc1b00a6aa5d498878a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/beecrypt/beecrypt.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/beecrypt/beecrypt.mk b/package/beecrypt/beecrypt.mk
index 5805bda..223b44f 100644
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
