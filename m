From: Vadim Kochan <vadim4j@gmail.com>
Date: Sun,  7 Apr 2019 11:46:24 +0300
Subject: [Buildroot] [PATCH 1/1] package/gettext-tiny: Do not install headers
Message-ID: <20190407084624.25271-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since:

    https://github.com/sabotage-linux/gettext-tiny/commit/58187329ad9f00eb8c39379e7ee0b608dd14bab8

gettext macrosesss are used by default (if no LIBINTL_NO_MACROS is
included in CPPFLAGS). It causes such packages like libglib2 fail
with argument format error because in case of error the formatted
string is passed as argument.

Fix it by prevent installation of libintl.h header from gettext-tiny
by passing LIBINTL=NONE, because each kind of toolchain already provides
gettext stubs. Also with this change the following patch is not needed:

	0001-libintl-Fix-format-not-a-string-literal-error-for-gc.patch

Fixes:
	http://autobuild.buildroot.net/results/89fcc4e80ea8c031c1abb350362c19c57eb80e7c/
	http://autobuild.buildroot.net/results/84f3eb70fc1c58986dfa7c79d45aaabdf4c011cf/

and a lot other autobuild reports.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 ...-format-not-a-string-literal-error-for-gc.patch | 55 ----------------------
 package/gettext-tiny/gettext-tiny.mk               |  5 +-
 2 files changed, 3 insertions(+), 57 deletions(-)
 delete mode 100644 package/gettext-tiny/0001-libintl-Fix-format-not-a-string-literal-error-for-gc.patch

diff --git a/package/gettext-tiny/0001-libintl-Fix-format-not-a-string-literal-error-for-gc.patch b/package/gettext-tiny/0001-libintl-Fix-format-not-a-string-literal-error-for-gc.patch
deleted file mode 100644
index 44cda55998..0000000000
--- a/package/gettext-tiny/0001-libintl-Fix-format-not-a-string-literal-error-for-gc.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 34f631ce80700aa1eaadc032026f12f86584bd8a Mon Sep 17 00:00:00 2001
-From: Vadim Kochan <vadim4j@gmail.com>
-Date: Mon, 31 Dec 2018 00:40:29 +0200
-Subject: [PATCH] gettext-tiny: Fix format not a string literal error
-
-Add 'format_arg' attribute for the functions which may return string
-as formatted parameter, otherwise it fails to compile on high versions
-of gcc.
-
-Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
----
- include/libintl.h | 27 +++++++++++++++++++++------
- 1 file changed, 21 insertions(+), 6 deletions(-)
-
-diff --git a/include/libintl.h b/include/libintl.h
-index b1af2b4..1883e1b 100644
---- a/include/libintl.h
-+++ b/include/libintl.h
-@@ -4,12 +4,27 @@
- #ifdef __cplusplus
- extern "C" {
- #endif
--char *gettext(const char *msgid);
--char *dgettext(const char *domainname, const char *msgid);
--char *dcgettext(const char *domainname, const char *msgid, int category);
--char *ngettext(const char *msgid1, const char *msgid2, unsigned long n);
--char *dngettext(const char *domainname, const char *msgid1, const char *msgid2, unsigned long n);
--char *dcngettext(const char *domainname, const char *msgid1, const char *msgid2, unsigned long n, int category);
-+/* _INTL_MAY_RETURN_STRING_ARG(n) declares that the given function may return
-+ *    its n-th argument literally.  This enables GCC to warn for example about
-+ *       printf (gettext ("foo %y")).  */
-+#if defined __GNUC__ && __GNUC__ >= 3 && !(defined __APPLE_CC__ && __APPLE_CC__ > 1 && defined __cplusplus)
-+# define _INTL_MAY_RETURN_STRING_ARG(n) __attribute__ ((__format_arg__ (n)))
-+#else
-+# define _INTL_MAY_RETURN_STRING_ARG(n)
-+#endif
-+
-+char *gettext(const char *msgid)
-+	_INTL_MAY_RETURN_STRING_ARG(1);
-+char *dgettext(const char *domainname, const char *msgid)
-+	_INTL_MAY_RETURN_STRING_ARG(2);
-+char *dcgettext(const char *domainname, const char *msgid, int category)
-+	_INTL_MAY_RETURN_STRING_ARG(2);
-+char *ngettext(const char *msgid1, const char *msgid2, unsigned long n)
-+	_INTL_MAY_RETURN_STRING_ARG(1) _INTL_MAY_RETURN_STRING_ARG(2);
-+char *dngettext(const char *domainname, const char *msgid1, const char *msgid2, unsigned long n)
-+	_INTL_MAY_RETURN_STRING_ARG(2) _INTL_MAY_RETURN_STRING_ARG(3);
-+char *dcngettext(const char *domainname, const char *msgid1, const char *msgid2, unsigned long n, int category)
-+	_INTL_MAY_RETURN_STRING_ARG(2) _INTL_MAY_RETURN_STRING_ARG(3);
- 
- char *textdomain(const char *domainname);
- char *bind_textdomain_codeset(const char *domainname, const char *codeset);
--- 
-2.14.1
-
diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
index e3a6d11399..4fa014e8dd 100644
--- a/package/gettext-tiny/gettext-tiny.mk
+++ b/package/gettext-tiny/gettext-tiny.mk
@@ -57,7 +57,7 @@ define HOST_GETTEXT_TINY_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
 		$(HOST_CONFIGURE_OPTS) \
 		CFLAGS="$(HOST_CFLAGS) -fPIC" \
-		LIBINTL=NOOP
+		LIBINTL=NONE
 
 	cp $(@D)/extra/gettextize.in $(@D)/gettextize
 
@@ -79,7 +79,8 @@ define HOST_GETTEXT_TINY_INSTALL_CMDS
 
 	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) \
 		$(HOST_CONFIGURE_OPTS) \
-		prefix=$(HOST_DIR) install
+		prefix=$(HOST_DIR) \
+		LIBINTL=NONE install
 
 	$(SED) '/read dummy/d' $(@D)/gettextize
 
-- 
2.14.1
