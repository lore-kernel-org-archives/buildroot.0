From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Jul 2009 15:24:12 +0200
Subject: [Buildroot] [git commit] qt: the GUI module requires the network
	module to work properly
Message-ID: <20090727132435.CB65C777EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=314cdcbd2541cae9fb1709831ec67e36508ac793
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Running a simple Qt GUI application on an embedded systems without
QtNetwork installed doesn't work, the dynamic loader complains that
QtNetwork is not present.

While I'm not a Qt build system expert, it looks like this dependency
really exists, since the src/gui/gui.pri file in Qt sources contains
the following line:

embedded: QT += network

Which would mean that the GUI module needs the network module to
operate properly. And a few files in src/gui/embedded/ also include
some QtNetwork stuff. This isn't really surprising since the Qt QWS
mechanism uses communication between processes through a Unix socket.

Therefore, we add a dependency on the network module in the GUI
module. We use a 'select' dependency here, since it's might not be
really obvious to the user that the GUI module requires the network
one.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 59c691f..b7fe0f9 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -77,6 +77,7 @@ config BR2_PACKAGE_QT_QT3SUPPORT
 
 config BR2_PACKAGE_QT_GUI_MODULE
 	bool "Gui Module"
+	select BR2_PACKAGE_QT_NETWORK
 	default y
 	help
 	  Turns on support to Gui applications. If your board don't have
-- 
1.6.3.3
