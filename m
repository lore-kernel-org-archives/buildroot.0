From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Aug 2014 15:47:22 +0200
Subject: [Buildroot] [PATCHv4 3/3] docs/manual: update documentation about
	gettext handling
In-Reply-To: <1408196842-16740-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1408196842-16740-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1408196842-16740-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit updates the Buildroot manual regarding how gettext related
issues are handled, now that we have cases where the gettext package
should be selected even with glibc toolchains.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 docs/manual/adding-packages-gettext.txt | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/docs/manual/adding-packages-gettext.txt b/docs/manual/adding-packages-gettext.txt
index d265607..c955b1f 100644
--- a/docs/manual/adding-packages-gettext.txt
+++ b/docs/manual/adding-packages-gettext.txt
@@ -8,15 +8,22 @@ library. Dependencies for this library are fairly complicated and
 therefore, deserve some explanation.
 
 The 'uClibc' C library doesn't implement gettext functionality;
-therefore with this C library, a separate gettext must be compiled. On
-the other hand, the 'glibc' C library does integrate its own gettext,
-and in this case the separate gettext library should not be compiled,
-because it creates various kinds of build failures.
+therefore with this C library, a separate gettext must be compiled,
+which is provided by the additional +libintl+ library, part of the
++gettext+ package.
+
+On the other hand, the 'glibc' C library does integrate its own
+gettext library functions, so it is not necessary to build a separate
++libintl+ library.
+
+However, certain packages need some gettext utilities on the target,
+such as the +gettext+ program itself, which allows to retrieve
+translated strings, from the command line.
 
 Additionally, some packages (such as +libglib2+) do require gettext
-unconditionally, while other packages (those who support
-+--disable-nls+ in general) only require gettext when locale support
-is enabled.
+functions unconditionally, while other packages (in general, those who
+support +--disable-nls+) only require gettext functions when locale
+support is enabled.
 
 Therefore, Buildroot defines two configuration options:
 
@@ -44,3 +51,11 @@ should:
 * use +$(if $(BR2_NEEDS_GETTEXT),gettext)+ in the package
   +DEPENDENCIES+ variable in the +.mk+ file.
 
+Packages that need the +gettext+ utilities on the target (should be
+rare) should:
+
+* use +select BR2_PACKAGE_GETTEXT+ in their +Config.in+ file,
+  indicating in a comment above that it's a runtime dependency only.
+
+* not add any +gettext+ dependency in the +DEPENDENCIES+ variable of
+  their +.mk+ file.
-- 
2.0.0
