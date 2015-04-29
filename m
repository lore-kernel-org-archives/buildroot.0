From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 29 Apr 2015 22:10:15 +0200
Subject: [Buildroot] [autobuild v2 1/3] autobuild-run: prevent send_result
	from failing when gathering config files
Message-ID: <1430338217-25518-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

os.makedirs() can fail if the directory already exists, so only create it
when needed.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1->v2
- remove useless abspath call
---
 scripts/autobuild-run | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 0e12080..6e83de9 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -661,7 +661,8 @@ def send_results(result, **kwargs):
 
             for fname in files:
                 if fname == 'config.log':
-                    os.makedirs(dest)
+                    if not os.path.exists(dest):
+                        os.makedirs(dest)
                     shutil.copy(os.path.join(root, fname), os.path.join(dest, fname))
 
     copy_config_log_files()
-- 
2.3.7
