From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Dec 2015 11:53:39 +0100
Subject: [Buildroot] [git commit] package/gauche: fix musl build issue
Message-ID: <20151217105348.2D00F81FB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=98cdafb254ad1cecd15f1ef487767aca6163d754
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a patch from upstream to fix a musl build issue:

  In file included from os_dep.c:44:0:
  /home/peko/autobuild/instance-0/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/asm/sigcontext.h:9:8: error: redefinition of 'struct sigcontext'
   struct sigcontext {
          ^
  In file included from /home/peko/autobuild/instance-0/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/signal.h:243:0,
                   from ./include/private/../gc_pthread_redirects.h:42,
                   from ./include/private/../gc.h:1443,
                   from ./include/private/gc_priv.h:46,
                   from os_dep.c:17:
  /home/peko/autobuild/instance-0/output/host/usr/arm-buildroot-linux-musleabihf/sysroot/usr/include/bits/signal.h:11:16: note: originally defined here
   typedef struct sigcontext

The Linux headers sigcontext and asm/sigcontext are no longer used and were
replaced with ucontext_t in GC 7.0alpha1 (gauche uses a private copy of bdwgc).

Fixes:
http://autobuild.buildroot.net/results/411/4111ea586143410649b78c8dfc737f0f83d78441/
http://autobuild.buildroot.net/results/b19/b19dbcc7ddf0f24472afcecf4c684915045550bf/
http://autobuild.buildroot.net/results/9eb/9ebf7ad0d721433dcc8523a55d08ca074d037e58/
http://autobuild.buildroot.net/results/223/22328dbe8ea86c59ceff3ba40da1d9ef39e10533/
and many more.

Fetch from:
https://github.com/shirok/Gauche/commit/13a196557848f22a1607a300643131345e9f32b3

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gauche/gauche.hash | 1 +
 package/gauche/gauche.mk   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/gauche/gauche.hash b/package/gauche/gauche.hash
index 9ec106a..975e958 100644
--- a/package/gauche/gauche.hash
+++ b/package/gauche/gauche.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 7b18bcd70beaced1e004594be46c8cff95795318f6f5830dd2a8a700410fc149  Gauche-0.9.4.tgz
+sha256 0ff5986540d8ad89eee595de766810f09e489a6a3363b47a65ce7ad18701ee01  13a196557848f22a1607a300643131345e9f32b3.patch
diff --git a/package/gauche/gauche.mk b/package/gauche/gauche.mk
index 95a448b..85fcc71 100644
--- a/package/gauche/gauche.mk
+++ b/package/gauche/gauche.mk
@@ -10,6 +10,7 @@ GAUCHE_SITE = http://downloads.sourceforge.net/project/gauche/Gauche
 GAUCHE_LICENSE = BSD-3c, Boehm-gc, SRFI (srfi-11.scm), reload (reload.scm)
 GAUCHE_LICENSE_FILES = COPYING
 GAUCHE_DEPENDENCIES = host-gauche
+GAUCHE_PATCH = https://github.com/shirok/Gauche/commit/13a196557848f22a1607a300643131345e9f32b3.patch
 
 HOST_GAUCHE_CONF_OPTS = --without-zlib
 GAUCHE_CONF_OPTS = --without-libatomic-ops
