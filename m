From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Jul 2018 23:27:56 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] utils/test-pkg: log the
 output of merge-config
Message-ID: <20180719213040.A70B68904E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4e62ea88beae53aca45c617cc119f4b603b906b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Currently, the stdout is consigned to oblivion, while the stderr is not
redirected at all. So, when the configuration under test redefines a
symbol, like is the case when testing busybox for example, there is an
ugly warning.

So, just redirect both stdout and stderr to the logfile.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 2664022787eb396125b5696a2d42c460ef54d359)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/test-pkg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/utils/test-pkg b/utils/test-pkg
index 54951276fa..aa91ee02cf 100755
--- a/utils/test-pkg
+++ b/utils/test-pkg
@@ -131,7 +131,7 @@ build_one() {
 
     support/kconfig/merge_config.sh -O "${dir}" \
         "${toolchainconfig}" "support/config-fragments/minimal.config" "${cfg}" \
-        > /dev/null
+        >> "${dir}/logfile" 2>&1
     # We want all the options from the snippet to be present as-is (set
     # or not set) in the actual .config; if one of them is not, it means
     # some dependency from the toolchain or arch is not available, in
