From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 14 Dec 2014 17:24:24 +0100
Subject: [Buildroot] [PATCH v2] legacy: update the BR2_PREFER_STATIC_LIB
	option
Message-ID: <1418574264-25196-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since the refactoring of the type of libraries in the target filesystem,
these options belong to a choice, and the default is "shared only".

The former option BR2_PREFER_STATIC_LIB has been moved in the legacy
menu, and only selects the BR2_STATIC_LIBS ("static only") option.
However, because BR2_STATIC_LIBS belongs to a choice, when
BR2_PREFER_STATIC_LIB is selected, it does not affect the choice.
So, existing Buildroot configurations, which have BR2_PREFER_STATIC_LIB
set, will silently end with BR2_SHARED_LIBS ("shared only") enabled.

So, the backward compatibility is not kept.

Besides, the legacy BR2_PREFER_STATIC_LIB option does not select
BR2_LEGACY, so the user is not notified of this legacy option, and the
build silently continues with some undesired changes.

This patch removes the inefficient BR2_STATIC_LIBS selection, correctly
selects the BR2_LEGACY option and extend the help message so the user
can easily know how to update his/her Buildroot configuration.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
changes v1->v2:
- fix typos in commit log
- update A/R/T tags
---
 Config.in.legacy | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 09c025c..a969662 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -104,13 +104,16 @@ comment "Legacy options removed in 2015.02"
 
 config BR2_PREFER_STATIC_LIB
 	bool "static library option renamed"
-	select BR2_STATIC_LIBS
+	select BR2_LEGACY
 	help
 	  The BR2_PREFER_STATIC_LIB was renamed to BR2_STATIC_LIBS. It
 	  highlights the fact that the option no longer "prefers"
 	  static libraries, but "enforces" static libraries (i.e
 	  shared libraries are completely unused).
 
+	  Take care of updating the type of libraries you want under the
+	  "Build options" menu.
+
 comment "Legacy options removed in 2014.11"
 
 config BR2_x86_generic
-- 
2.1.3
