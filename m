From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  2 May 2015 12:43:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/vlc: Fix strerror_l related compile
	error
Message-ID: <1430563403-22945-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/ae3/ae31f4585d2c2f850473c446f1ccfba7699c711b/
http://autobuild.buildroot.net/results/504/504cf78a08315e2fc6eaeb9a29ae791972753830/
http://autobuild.buildroot.net/results/092/09280c5d63da9b8b58916c32e6040a98f7ff0ee8/
http://autobuild.buildroot.net/results/da6/da62d97ea060ce03db94f59a91d84a235d03e8f0/
http://autobuild.buildroot.net/results/7a4/7a40f66b3be8cd71a27df04415c4851cd4426cc3/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vlc/0007-strerror.patch |   41 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/vlc/0007-strerror.patch

diff --git a/package/vlc/0007-strerror.patch b/package/vlc/0007-strerror.patch
new file mode 100644
index 0000000..5d65ff7
--- /dev/null
+++ b/package/vlc/0007-strerror.patch
@@ -0,0 +1,41 @@
+Fix compile error
+
+  CCLD     vlc
+/home/br/br3/output/build/vlc-2.2.1/src/.libs/libvlccore.so: undefined reference to `strerror_l'
+
+Patch downloaded from
+http://patches.osdyson.org/patch/series/view/vlc/2.2.0~rc2-1+dyson2/dyson.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr vlc-2.2.1.org/src/posix/error.c vlc-2.2.1/src/posix/error.c
+--- vlc-2.2.1.org/src/posix/error.c	2014-08-14 09:20:04.000000000 +0200
++++ vlc-2.2.1/src/posix/error.c	2015-05-02 12:35:30.000000000 +0200
+@@ -31,26 +31,7 @@
+ 
+ static const char *vlc_strerror_l(int errnum, const char *lname)
+ {
+-    int saved_errno = errno;
+-    locale_t loc = newlocale(LC_MESSAGES_MASK, lname, (locale_t)0);
+-
+-    if (unlikely(loc == (locale_t)0))
+-    {
+-        if (errno == ENOENT) /* fallback to POSIX locale */
+-            loc = newlocale(LC_MESSAGES_MASK, "C", (locale_t)0);
+-
+-        if (unlikely(loc == (locale_t)0))
+-        {
+-            assert(errno != EINVAL && errno != ENOENT);
+-            errno = saved_errno;
+-            return "Error message unavailable";
+-        }
+-        errno = saved_errno;
+-    }
+-
+-    const char *buf = strerror_l(errnum, loc);
+-
+-    freelocale(loc);
++    const char *buf = strerror(errnum);
+     return buf;
+ }
+ 
-- 
1.7.10.4
