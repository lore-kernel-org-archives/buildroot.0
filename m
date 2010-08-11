From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 11 Aug 2010 09:04:01 +0000 (UTC)
Subject: [Buildroot] [Bug 2371] QT MYSQL Module does not build
In-Reply-To: <bug-2371-163@https.bugs.busybox.net/>
References: <bug-2371-163@https.bugs.busybox.net/>
Message-ID: <20100811090401.3F6C08740F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2371

--- Comment #3 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com>  ---
Ok, strange, when MySQL is enabled we give Qt a set of custom CFLAGS/LDFLAGS so
it shouldn't be looking at the host versions.

What distro are you using ? Which MySQL-related packages are installed on your
host ? (here on my Ubuntu system, the libmysqlclient.so file is not in the same
directory as you).

Can you turn on the -v switch for Qt configure step ? I.e, something like:

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index baf6539..8ab70ac 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -503,7 +503,7 @@ endif
                PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
               
PKG_CONFIG_PATH="$(STAGING_DIR)/usr/lib/pkgconfig:$(PKG_CONFIG_PATH)" \
                ./configure \
-               $(if $(VERBOSE),-verbose,-silent) \
+               -verbose \
                -force-pkg-config \
                -embedded $(BR2_PACKAGE_QT_EMB_PLATFORM) \
                $(QT_QCONFIG_COMMAND) \

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
