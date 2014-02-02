From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 02 Feb 2014 13:11:24 +0100
Subject: [Buildroot] [PATCH 9 of 9] supervisor: automatically select python
In-Reply-To: <patchbomb.1391343075@argentina>
References: <patchbomb.1391343075@argentina>
Message-ID: <8d082e3d9cb20e83f780.1391343084@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Packages that have a required dependency on python should select python
instead of depending on it, as this is most logical towards the user (which
may not clearly realize the python dependency).

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/supervisor/Config.in |  9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/supervisor/Config.in b/package/supervisor/Config.in
--- a/package/supervisor/Config.in
+++ b/package/supervisor/Config.in
@@ -1,12 +1,15 @@
 config BR2_PACKAGE_SUPERVISOR
 	bool "supervisor"
-	depends on BR2_PACKAGE_PYTHON
+	select BR2_PACKAGE_PYTHON
 	select BR2_PACKAGE_PYTHON_MELD3
+	depends on BR2_USE_MMU # python
+	depends on BR2_USE_WCHAR # python
 	help
 	  A client/server system that allows its users to control a
 	  number of processes on UNIX-like operating systems.
 
 	  http://supervisord.org/
 
-comment "supervisor needs the python interpreter"
-	depends on !BR2_PACKAGE_PYTHON
+comment "supervisor needs a toolchain w/ wchar"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR
