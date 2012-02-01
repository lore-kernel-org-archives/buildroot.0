From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed,  1 Feb 2012 18:09:57 +0100
Subject: [Buildroot] [PATCH] dbus: deprecate libxml2 support
In-Reply-To: <87bopkjaaf.fsf@macbook.be.48ers.dk>
References: <87bopkjaaf.fsf@macbook.be.48ers.dk>
Message-ID: <1328116197-2106-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>


Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/dbus/Config.in |   23 +++++++++++++++++------
 1 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/package/dbus/Config.in b/package/dbus/Config.in
index 54a8540..850753d 100644
--- a/package/dbus/Config.in
+++ b/package/dbus/Config.in
@@ -1,25 +1,36 @@
 config BR2_PACKAGE_DBUS
 	bool "dbus"
+	select BR2_DBUS_EXPAT if !BR2_DEPRECATED
 	help
 	  The D-Bus message bus system.
 
 	  http://www.freedesktop.org/wiki/Software/dbus
 
+config BR2_DBUS_EXPAT
+	bool
+	select BR2_PACKAGE_EXPAT
+
+if BR2_DEPRECATED
 choice
 	prompt "XML library to use"
 	depends on BR2_PACKAGE_DBUS
-	default BR2_DBUS_EXPAT
+	default BR2_DBUS_CHOICE_EXPAT
 	help
 	  Select the XML library to use with D-Bus. Select Expat
 	  unless you have specific reasons for using libxml2 as
 	  Expat is significant smaller.
 
-	config BR2_DBUS_EXPAT
+	config BR2_DBUS_CHOICE_EXPAT
 		bool "Expat"
-		select BR2_PACKAGE_EXPAT
+		select BR2_DBUS_EXPAT
 
-	config BR2_DBUS_LIBXML2
+	config BR2_DBUS_CHOICE_LIBXML2
 		bool "libxml2"
-		select BR2_PACKAGE_LIBXML2
-
+		select BR2_DBUS_LIBXML2
 endchoice
+
+config BR2_DBUS_LIBXML2
+	bool
+	select BR2_PACKAGE_LIBXML2
+
+endif
-- 
1.7.8.3
