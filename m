From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 16 Oct 2014 21:16:02 +0200
Subject: [Buildroot] [PATCH buildroot-test 6/8] autobuild-run: create main
	method to locally-scope all variables
In-Reply-To: <1413486964-5183-1-git-send-email-patrickdepinguin@gmail.com>
References: <1413486964-5183-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <1413486964-5183-6-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

In the current autobuild-run script, all variables created in the 'main'
part are in fact global, even though the script does not intend them to
be. For example, sysinfo is global, even though it is passed as function
argument to run_instance.

To avoid this accidental globalization, create a main method instead.
All variables created therein are now local to that method.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 scripts/autobuild-run | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 57654de..95f2390 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -575,7 +575,7 @@ def merge(dict_1, dict_2):
     return dict((str(key), dict_1.get(key) or dict_2.get(key))
                 for key in set(dict_2) | set(dict_1))
 
-if __name__ == '__main__':
+def main():
     check_version()
     sysinfo = SystemInfo()
 
@@ -604,3 +604,6 @@ if __name__ == '__main__':
     signal.signal(signal.SIGTERM, sigterm_handler)
     for p in processes:
         p.join()
+
+if __name__ == '__main__':
+    main()
-- 
1.8.5.1
