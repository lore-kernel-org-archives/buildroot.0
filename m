From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 27 Jan 2012 00:41:27 +0100
Subject: [Buildroot] [PATCH 1/6] dbus: make it easier to select an XML
	library (select rather than depends on)
In-Reply-To: <CAFbHwiTmVeZYM_OBKzzNLkdvbr30RG06wi8FxFzbhVhP9KcTbw@mail.gmail.com>
References: <CAFbHwiTmVeZYM_OBKzzNLkdvbr30RG06wi8FxFzbhVhP9KcTbw@mail.gmail.com>
Message-ID: <1327621292-13580-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

D-Bus requires an XML library, expat or libxml2.  There already is a choice
between them in the config menu, but it requires the user to first select
one of the libraries, and then select dbus.  With this patch, the choice
automatically selects the XML library.  Note that this removes the
automatic choice of libxml2 for dbus if libxml2 had already been selected,
i.e. in that case both libxml2 and expat will be selected unless the user
takes action.

An alternative would be to remove the choice completely, and to take the
path of bluez-utils: select BR2_PACKAGE_EXPAT if !BR2_PACKAGE_DBUS_LIBXML2

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/dbus/Config.in |    9 ++-------
 1 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/dbus/Config.in b/package/dbus/Config.in
index c625382..54a8540 100644
--- a/package/dbus/Config.in
+++ b/package/dbus/Config.in
@@ -1,18 +1,13 @@
 config BR2_PACKAGE_DBUS
 	bool "dbus"
-	depends on BR2_PACKAGE_EXPAT || BR2_PACKAGE_LIBXML2
 	help
 	  The D-Bus message bus system.
 
 	  http://www.freedesktop.org/wiki/Software/dbus
 
-comment "dbus not available (need expat or libxml2)"
-	depends on !BR2_PACKAGE_EXPAT && !BR2_PACKAGE_LIBXML2
-
 choice
 	prompt "XML library to use"
 	depends on BR2_PACKAGE_DBUS
-	default BR2_DBUS_LIBXML2 if (BR2_PACKAGE_LIBXML2 && !BR2_PACKAGE_EXPAT)
 	default BR2_DBUS_EXPAT
 	help
 	  Select the XML library to use with D-Bus. Select Expat
@@ -21,10 +16,10 @@ choice
 
 	config BR2_DBUS_EXPAT
 		bool "Expat"
-		depends on BR2_PACKAGE_EXPAT
+		select BR2_PACKAGE_EXPAT
 
 	config BR2_DBUS_LIBXML2
 		bool "libxml2"
-		depends on BR2_PACKAGE_LIBXML2
+		select BR2_PACKAGE_LIBXML2
 
 endchoice
-- 
1.7.8.3
