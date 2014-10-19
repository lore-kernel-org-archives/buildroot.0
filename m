From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 19 Oct 2014 21:29:59 +0200
Subject: [Buildroot] [PATCHv2 buildroot-test 03/11] autobuild-run: create
	main method to locally-scope all variables
In-Reply-To: <1413747007-24990-1-git-send-email-patrickdepinguin@gmail.com>
References: <1413747007-24990-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <1413747007-24990-4-git-send-email-patrickdepinguin@gmail.com>
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
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>
---
v2: no changes

 scripts/autobuild-run | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 66f6e1b..589b1d1 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -569,7 +569,7 @@ Format of the configuration file:
 
     return (ninstances, njobs, http_login, http_password, submitter)
 
-if __name__ == '__main__':
+def main():
     check_version()
     sysinfo = SystemInfo()
     (ninstances, njobs, http_login, http_password, submitter) = config_get()
@@ -593,3 +593,6 @@ if __name__ == '__main__':
     signal.signal(signal.SIGTERM, sigterm_handler)
     for p in processes:
         p.join()
+
+if __name__ == '__main__':
+    main()
-- 
1.8.5.1
