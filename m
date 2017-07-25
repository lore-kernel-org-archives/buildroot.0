From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Jul 2017 22:41:57 +0200
Subject: [Buildroot] [git commit] genrandconfig: use subprocess.check_output
	instead of Popen
Message-ID: <20170725210433.D16E380093@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59419cdac1af86abbd780305b33136d28f11d3ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Popen is more complicated and more difficult to understand.

check_output raises an exception if the exit code is non-zero, but
that's probably what we want if ldd can't be executed.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 utils/genrandconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 6d32692..a7fe7ce 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -184,7 +184,7 @@ def is_toolchain_usable(**kwargs):
         if 'BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM=y\n' in configlines or \
            'BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y\n' in configlines or \
            'BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB=y\n' in configlines:
-            ldd_version_output = subprocess.Popen(['ldd', '--version'], stdout=subprocess.PIPE).communicate()[0]
+            ldd_version_output = subprocess.check_output(['ldd', '--version'])
             glibc_version = ldd_version_output.splitlines()[0].split()[-1]
             if StrictVersion('2.14') > StrictVersion(glibc_version):
                 log_write(log, "WARN: ignoring the Linaro ARM toolchains becausee too old host glibc")
