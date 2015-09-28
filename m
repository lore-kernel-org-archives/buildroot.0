From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Sep 2015 21:27:48 +0200
Subject: [Buildroot] [git commit] libstrophe: add a patch to fix static
	builds
Message-ID: <20150928192752.9F9C680E59@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=124b3f76dbcd3bde52d1c73514f89e47acbf23eb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libstrophe.a and libcrypto.a have symbols with equal names, so
executables can't be statically linked with libstrophe and openssl:

sha1dgst.c:(.text+0x1b4c): multiple definition of `SHA1_Update'
sha1dgst.c:(.text+0x1cc0): multiple definition of `SHA1_Final'
sha1dgst.c:(.text+0x1e78): multiple definition of `SHA1_Init

Renaming the internal SHA functions fixes the problem.

Issue reported upstream:

  https://github.com/strophe/libstrophe/issues/40

Fixes:

  http://autobuild.buildroot.net/results/047/047e319b9d7bf0cdaabc007326a6d67de2c1ee52/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libstrophe/libstrophe.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libstrophe/libstrophe.mk b/package/libstrophe/libstrophe.mk
index e6eb834..60e29d3 100644
--- a/package/libstrophe/libstrophe.mk
+++ b/package/libstrophe/libstrophe.mk
@@ -12,6 +12,7 @@ LIBSTROPHE_AUTORECONF = YES
 LIBSTROPHE_LICENSE = MIT or GPLv3
 LIBSTROPHE_LICENSE_FILES = MIT-LICENSE.txt GPL-LICENSE.txt
 LIBSTROPHE_INSTALL_STAGING = YES
+LIBSTROPHE_PATCH = https://github.com/msantos/libstrophe/commit/b08766c8e46956daba010044b00c97f78b598780.patch
 
 ifeq ($(BR2_PACKAGE_EXPAT),y)
 # Passing --without-libxml2 doesn't work, due to how AC_ARG_WITH is
