From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 15 Aug 2014 20:39:59 +0200
Subject: [Buildroot] [PATCHv2 3/3] docs/manual: update documentation about
	gettext handling
In-Reply-To: <1408127999-2352-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1408127999-2352-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1408127999-2352-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-gettext.txt | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/docs/manual/adding-packages-gettext.txt b/docs/manual/adding-packages-gettext.txt
index d265607..580787f 100644
--- a/docs/manual/adding-packages-gettext.txt
+++ b/docs/manual/adding-packages-gettext.txt
@@ -8,10 +8,16 @@ library. Dependencies for this library are fairly complicated and
 therefore, deserve some explanation.
 
 The 'uClibc' C library doesn't implement gettext functionality;
-therefore with this C library, a separate gettext must be compiled. On
-the other hand, the 'glibc' C library does integrate its own gettext,
-and in this case the separate gettext library should not be compiled,
-because it creates various kinds of build failures.
+therefore with this C library, a separate gettext must be compiled,
+which will provide the libintl library.
+
+On the other hand, the 'glibc' C library does integrate its own
+gettext library functions, so it is not necessary to build a separate
+libintl library.
+
+However, certain packages will need some gettext utilities on the
+target, such as the +gettext+ program itself, which allows, from the
+command line, to retrieve translated strings.
 
 Additionally, some packages (such as +libglib2+) do require gettext
 unconditionally, while other packages (those who support
@@ -44,3 +50,11 @@ should:
 * use +$(if $(BR2_NEEDS_GETTEXT),gettext)+ in the package
   +DEPENDENCIES+ variable in the +.mk+ file.
 
+Packages that need the +gettext+ utilities on the target (should be
+rare) should:
+
+* use +select BR2_PACKAGE_GETTEXT+ in their +Config.in+ file,
+  indicating in a comment above that it's a runtime dependency only.
+
+* not add any dependency to their +.mk+ file +DEPENDENCIES+ variable.
+
-- 
2.0.0
