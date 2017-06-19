From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Date: Mon, 19 Jun 2017 18:26:05 +0200
Subject: [Buildroot] [PATCH v3 1/1] fcgiwrap: Disable -Werror in CFLAGS set
	by configure.
In-Reply-To: <20170619162605.30831-1-thomas.claveirole@green-communications.fr>
References: <20170619162605.30831-1-thomas.claveirole@green-communications.fr>
Message-ID: <20170619162605.30831-2-thomas.claveirole@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thus, fix
http://autobuild.buildroot.net/results/8e0/8e04bf5a85ecd7f120bc9dedeedc891def6c46c1/

fcgiwrap's configure script appends -Werror to AM_CFLAGS, then use it
to build the package.  This is an issue when Buildroot supports a new
compiler version and this version makes some warnings appear.
Luckily, one can provide CFLAGS=-Wno-error to the configure script so
it appends -Wno-error to AM_CFLAGS.

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
---
 package/fcgiwrap/fcgiwrap.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fcgiwrap/fcgiwrap.mk b/package/fcgiwrap/fcgiwrap.mk
index dd74c1ef72..62c4c1369d 100644
--- a/package/fcgiwrap/fcgiwrap.mk
+++ b/package/fcgiwrap/fcgiwrap.mk
@@ -10,6 +10,7 @@ FCGIWRAP_DEPENDENCIES = host-pkgconf libfcgi
 FCGIWRAP_LICENSE = MIT
 FCGIWRAP_LICENSE_FILES = COPYING
 FCGIWRAP_AUTORECONF = YES
+FCGIWRAP_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -Wno-error"
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 FCGIWRAP_DEPENDENCIES += systemd
-- 
2.11.0
