From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 21 Jul 2017 03:05:09 +0200
Subject: [Buildroot] [PATCH v7 02/23] genrandconfig: use
	subprocess.check_output instead of Popen
In-Reply-To: <20170721010530.4747-1-arnout@mind.be>
References: <20170721010530.4747-1-arnout@mind.be>
Message-ID: <20170721010530.4747-3-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Popen is more complicated and more difficult to understand.

check_output raises an exception if the exit code is non-zero, but
that's probably what we want if ldd can't be executed.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
This is actually part of the following patch, to reduce the line length :-)
---
v7: new patch
---
 utils/genrandconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 6d3269225d..a7fe7ceca9 100755
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
-- 
2.13.2
