From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 5 Jun 2013 20:58:30 +0200
Subject: [Buildroot] [git commit] p11-kit: fix argp_standalone build error
Message-ID: <20130605191224.E8B689A967@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a7e8b6237458922f0a75103fb5c28e6fe713db7c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When BR2_PACKAGE_ARGP_STANDALONE is enabled and built before p11-kit the
configure script detects it and a conflict arises because libc already
includes and defines program_invocation_short_name.
Avoid this by forcing the detection to true otherwise the configure
script tries to use argp-standalone and it clashes with libc. Fixes:
http://autobuild.buildroot.net/results/a39/a39fe81a356b922a891d4225a56ce2427ab5bca7/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/p11-kit/p11-kit.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/p11-kit/p11-kit.mk b/package/p11-kit/p11-kit.mk
index 2ddb27c..89774dc 100644
--- a/package/p11-kit/p11-kit.mk
+++ b/package/p11-kit/p11-kit.mk
@@ -9,6 +9,8 @@ P11_KIT_SITE = http://p11-glue.freedesktop.org/releases
 P11_KIT_DEPENDENCIES = host-pkgconf libtasn1
 P11_KIT_INSTALL_STAGING = YES
 P11_KIT_CONF_OPT = --disable-static
+P11_KIT_CONF_ENV = ac_cv_have_decl_program_invocation_short_name=yes \
+	ac_cv_have_decl___progname=yes
 P11_KIT_LICENSE = BSD-3c
 P11_KIT_LICENSE_FILES = COPYING
 
