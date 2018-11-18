From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Nov 2018 08:37:11 +0100
Subject: [Buildroot] [git commit] utils/genrandconfig: add missing new line
 when creating the configuration
Message-ID: <20181118073519.E100A8256F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3eb49f59d6804c452e784759d9b3869215a8098f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When adding the custom BR2_WGET value in the configuration,
genrandconfig forgets to add a newline. Due to this, the next option
that is added is printed on the same line as BR2_WGET="", which causes
it to be ignored.

Due to this, in all builds, the line right after BR2_WGET was
ignored. It could have been BR2_ENABLE_DEBUG, BR2_INIT_BUSYBOX,
BR2_INIT_SYSTEMD, BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV,
BR2_STATIC_LIBS or BR2_PACKAGE_PYTHON_PY_ONLY depending on the
randomization.

Fix that by adding a proper newline at the end of the BR2_WGET option.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/genrandconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 27f84ea555..1d6ff990f5 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -351,7 +351,7 @@ def gen_config(args):
         configlines += minimalf.readlines()
 
     # Allow hosts with old certificates to download over https
-    configlines.append("BR2_WGET=\"wget --passive-ftp -nd -t 3 --no-check-certificate\"")
+    configlines.append("BR2_WGET=\"wget --passive-ftp -nd -t 3 --no-check-certificate\"\n")
 
     # Amend the configuration with a few things.
     if randint(0, 20) == 0:
