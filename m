From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 7 Aug 2019 16:34:44 +0200
Subject: [Buildroot] [git commit] utils/genrandconfig: only do reproducible
 builds with diffoscope
Message-ID: <20190807143147.8E0E18E587@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7d14a659dbc2a4b93e0b62327330a4848d78e1df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

After a few weeks of running reproducible builds in the autobuilders,
we found out that such builds without a diffoscope analysis are pretty
useless: the cmp on the tarballs doesn't help us fix the
reproducibility issue.

So, let's only do reproducible builds when diffoscope is available.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by: Atharva Lele <itsatharva@gmail.com>
Acked-by: Atharva Lele <itsatharva@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 859996cfd5..d6b7fd56b7 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -49,7 +49,7 @@ else:
 
 class SystemInfo:
     DEFAULT_NEEDED_PROGS = ["make", "git", "gcc", "timeout"]
-    DEFAULT_OPTIONAL_PROGS = ["bzr", "java", "javac", "jar"]
+    DEFAULT_OPTIONAL_PROGS = ["bzr", "java", "javac", "jar", "diffoscope"]
 
     def __init__(self):
         self.needed_progs = list(self.__class__.DEFAULT_NEEDED_PROGS)
@@ -369,7 +369,7 @@ def gen_config(args):
 
     # Randomly enable BR2_REPRODUCIBLE 10% of times
     # also enable tar filesystem images for testing
-    if randint(0, 10) == 0:
+    if sysinfo.has("diffoscope") and randint(0, 10) == 0:
         configlines.append("BR2_REPRODUCIBLE=y\n")
         configlines.append("BR2_TARGET_ROOTFS_TAR=y\n")
 
