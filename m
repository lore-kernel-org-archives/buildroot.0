From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Jun 2017 00:29:35 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] fcgiwrap: disable -Werror
	in CFLAGS
Message-ID: <20170625223455.0E6E68189F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac1bb15f779fb3e797c646282a3f7c53d5ac7e1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

fcgiwrap's configure script appends -Werror to AM_CFLAGS, then use it
to build the package.  This is an issue when Buildroot supports a new
compiler version and this version makes some warnings appear.
Luckily, one can provide CFLAGS=-Wno-error to the configure script so
it appends -Wno-error to AM_CFLAGS.

Fixes:

  http://autobuild.buildroot.net/results/8e04bf5a85ecd7f120bc9dedeedc891def6c46c1/

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 6a20a98f4b5e576b7c3dc844951b0153963b739a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fcgiwrap/fcgiwrap.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fcgiwrap/fcgiwrap.mk b/package/fcgiwrap/fcgiwrap.mk
index dd74c1e..62c4c13 100644
--- a/package/fcgiwrap/fcgiwrap.mk
+++ b/package/fcgiwrap/fcgiwrap.mk
@@ -10,6 +10,7 @@ FCGIWRAP_DEPENDENCIES = host-pkgconf libfcgi
 FCGIWRAP_LICENSE = MIT
 FCGIWRAP_LICENSE_FILES = COPYING
 FCGIWRAP_AUTORECONF = YES
+FCGIWRAP_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -Wno-error"
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 FCGIWRAP_DEPENDENCIES += systemd
