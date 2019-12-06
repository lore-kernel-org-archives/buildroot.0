From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Dec 2019 09:52:34 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] utils/genrandconfig: fix
 runtime issue with Python 3
Message-ID: <20191206084458.83D4188352@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c0670606bdd2f1f66531ca4f5fbc0d159570e12
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

With Python 3.7, genrandconfig fails with:

'str' object has no attribute 'decode'

We are already working on str objects, and there is no need to decode
them, so we drop the call to decode_byte_list() and its definition as
it was only used there.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 5cfe5d789796919d815c5707928bd5f4febad3bf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 utils/genrandconfig | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index a2190d6d25..5f7aed0218 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -39,14 +39,6 @@ def urlopen_closing(uri):
     return contextlib.closing(_urllib.urlopen(uri))
 
 
-if sys.hexversion >= 0x3000000:
-    def decode_byte_list(bl):
-        return [b.decode() for b in bl]
-else:
-    def decode_byte_list(e):
-        return e
-
-
 class SystemInfo:
     DEFAULT_NEEDED_PROGS = ["make", "git", "gcc", "timeout"]
     DEFAULT_OPTIONAL_PROGS = ["bzr", "java", "javac", "jar"]
@@ -128,7 +120,7 @@ def get_toolchain_configs(toolchains_csv, buildrootdir):
     with open(toolchains_csv) as r:
         # filter empty lines and comments
         lines = [t for t in r.readlines() if len(t.strip()) > 0 and t[0] != '#']
-        toolchains = decode_byte_list(lines)
+        toolchains = lines
     configs = []
 
     (_, _, _, _, hostarch) = os.uname()
