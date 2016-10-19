From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2016 23:40:32 +0200
Subject: [Buildroot] [git commit] package/vlc: backport upstream patches to
	fix compat function for static_assert
Message-ID: <20161019214102.16E5381DDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=70dbd3227db8b6856cc95b3afbecd36e9a1847a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/3b9/3b9d15f226057706c185270788050dace7b7b535/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/vlc/0010-static-assert.patch | 25 +++++++++++++++++++++++++
 package/vlc/0011-static-assert.patch | 28 ++++++++++++++++++++++++++++
 2 files changed, 53 insertions(+)

diff --git a/package/vlc/0010-static-assert.patch b/package/vlc/0010-static-assert.patch
new file mode 100644
index 0000000..87fd56b
--- /dev/null
+++ b/package/vlc/0010-static-assert.patch
@@ -0,0 +1,25 @@
+From: Thomas Guillem <thomas@gllm.fr>
+Date: Thu, 30 Apr 2015 13:29:50 +0000 (+0200)
+Subject: Fix build when using C99 and C++11
+X-Git-Url: http://git.videolan.org/?p=vlc.git;a=commitdiff_plain;h=51ce6cdaf598754e617900994c1943c6cba6d604
+
+Fix build when using C99 and C++11
+
+Indeed, C99 doesn't have static_assert and C++11 has it.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+
+diff --git a/include/vlc_fixups.h b/include/vlc_fixups.h
+index b949d24..ee168d7 100644
+--- a/include/vlc_fixups.h
++++ b/include/vlc_fixups.h
+@@ -239,7 +239,7 @@ static inline locale_t newlocale(int mask, const char * locale, locale_t base)
+ }
+ #endif
+ 
+-#if !defined (HAVE_STATIC_ASSERT)
++#if !defined (HAVE_STATIC_ASSERT) && !defined(__cpp_static_assert)
+ # define _Static_assert(x, s) ((void) sizeof (struct { unsigned:-!(x); }))
+ # define static_assert _Static_assert
+ #endif
diff --git a/package/vlc/0011-static-assert.patch b/package/vlc/0011-static-assert.patch
new file mode 100644
index 0000000..3ce23e1
--- /dev/null
+++ b/package/vlc/0011-static-assert.patch
@@ -0,0 +1,28 @@
+From: Thomas Guillem <thomas@gllm.fr>
+Date: Mon, 14 Dec 2015 09:08:25 +0000 (+0100)
+Subject: compat: fix static_assert
+X-Git-Url: http://git.videolan.org/?p=vlc.git;a=commitdiff_plain;h=6faf9066670db6e0d241ead6a3926b2d9cc6a041
+
+compat: fix static_assert
+
+It was not possible to use it outside of functions.
+
+Signed-off-by: R??mi Denis-Courmont <remi@remlab.net>
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+
+diff --git a/include/vlc_fixups.h b/include/vlc_fixups.h
+index 213d3f3..bd798d0 100644
+--- a/include/vlc_fixups.h
++++ b/include/vlc_fixups.h
+@@ -273,7 +273,9 @@ static inline locale_t newlocale(int mask, const char * locale, locale_t base)
+ #endif
+ 
+ #if !defined (HAVE_STATIC_ASSERT) && !defined(__cpp_static_assert)
+-# define _Static_assert(x, s) ((void) sizeof (struct { unsigned:-!(x); }))
++# define STATIC_ASSERT_CONCAT_(a, b) a##b
++# define STATIC_ASSERT_CONCAT(a, b) STATIC_ASSERT_CONCAT_(a, b)
++# define _Static_assert(x, s) extern char STATIC_ASSERT_CONCAT(static_assert_, __LINE__)[sizeof(struct { unsigned:-!(x); })]
+ # define static_assert _Static_assert
+ #endif
+ 
