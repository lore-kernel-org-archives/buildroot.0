From: =?UTF-8?q?Beno=C3=AEt=20Allard?= <benoit.allard@greenbone.net>
Date: Mon, 27 Mar 2017 10:32:10 +0200
Subject: [Buildroot] [PATCH v4] dc3dd: new package
In-Reply-To: <1489069259-4866-1-git-send-email-benoit.allard@greenbone.net>
References: <1489069259-4866-1-git-send-email-benoit.allard@greenbone.net>
Message-ID: <1490603530-12631-1-git-send-email-benoit.allard@greenbone.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We actually prefer the version 7.2.641 (over 7.2.646) as the
content of the release is identical and the 641 has the advantage
of providing a proper .tar.xz file.

Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
---
Changes v1 -> v2 (Suggestions by Arnoud)
   - Fix line lengths in Config.in
   - Add a locally calculated sha256
   - Use a version that has a proper tar.xz file
   - Correct license to be GPLv3+
   - Add patch to not build the manpage
Changes v2 -> v3
   - Add dependency on THREADS
   - Add conflict with musl
Changes v3 -> v4
   - Fix the alphabetical order in Config.in (Suggestion by Jerzy)
   - Add MAJOR variable in mk file (Suggestion by Jerzy)
   - patch the Makefile.am file and add autoreconf (Suggestion by Thomas)
   - Add a comment about the thread dependency in Config.in (Suggestion by Thomas)

---
 DEVELOPERS                      |  3 +++
 package/Config.in               |  1 +
 package/dc3dd/0001-no_man.patch | 14 ++++++++++++++
 package/dc3dd/Config.in         | 15 +++++++++++++++
 package/dc3dd/dc3dd.hash        |  4 ++++
 package/dc3dd/dc3dd.mk          | 16 ++++++++++++++++
 6 files changed, 53 insertions(+)
 create mode 100644 package/dc3dd/0001-no_man.patch
 create mode 100644 package/dc3dd/Config.in
 create mode 100644 package/dc3dd/dc3dd.hash
 create mode 100644 package/dc3dd/dc3dd.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 215a3b4..5f4a635 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -149,6 +149,9 @@ F:	package/taskd/
 N:	Benjamin Kamath <kamath.ben@gmail.com>
 F:	package/lapack/
 
+N:	Beno?t Allard <benoit.allard@greenbone.net>
+F:	package/dc3dd/
+
 N:	Bernd Kuhls <bernd.kuhls@t-online.de>
 F:	package/apache/
 F:	package/apr/
diff --git a/package/Config.in b/package/Config.in
index 9a78e0a..6d91fba 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1779,6 +1779,7 @@ menu "System tools"
 	source "package/coreutils/Config.in"
 	source "package/cpuload/Config.in"
 	source "package/dcron/Config.in"
+	source "package/dc3dd/Config.in"
 	source "package/ddrescue/Config.in"
 	source "package/debianutils/Config.in"
 	source "package/docker-containerd/Config.in"
diff --git a/package/dc3dd/0001-no_man.patch b/package/dc3dd/0001-no_man.patch
new file mode 100644
index 0000000..9abdeac
--- /dev/null
+++ b/package/dc3dd/0001-no_man.patch
@@ -0,0 +1,14 @@
+Remove the man directory to the subdirs to prevent building the man pages
+
+Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
+--- a/Makefile.am	2017-03-27 09:53:19.988820588 +0200
++++ b/Makefile.am	2017-03-27 09:54:14.325817466 +0200
+@@ -15,7 +15,7 @@
+ # You should have received a copy of the GNU General Public License
+ # along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ 
+-SUBDIRS = lib src man po
++SUBDIRS = lib src po
+ EXTRA_DIST = cfg.mk maint.mk \
+   .prev-version THANKS-to-translators THANKStt.in \
+   .version \
diff --git a/package/dc3dd/Config.in b/package/dc3dd/Config.in
new file mode 100644
index 0000000..0383897
--- /dev/null
+++ b/package/dc3dd/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_DC3DD
+	bool "dc3dd"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_USES_MUSL
+	help
+	  dc3dd is a patch to the GNU dd program, this version has
+	  several features intended for forensic acquisition of data.
+	  Highlights include hashing on-the-fly, split output files,
+	  pattern writing, a progress meter, and file verification.
+
+	  https://sourceforge.net/projects/dc3dd/
+
+comment "dc3dd needs a glibc or uClibc toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
+		BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/dc3dd/dc3dd.hash b/package/dc3dd/dc3dd.hash
new file mode 100644
index 0000000..5490d8d
--- /dev/null
+++ b/package/dc3dd/dc3dd.hash
@@ -0,0 +1,4 @@
+# From https://sourceforge.net/projects/dc3dd/files/dc3dd/7.2/
+sha1 1bfe81a921a8473a6ecb46f328ecaab761afb55d dc3dd-7.2.641.tar.xz
+# Locally computed
+sha256 7f50aadc38649845ab11014d11013928411c9d2128c941e9630939d4c28cae6d  dc3dd-7.2.641.tar.xz
diff --git a/package/dc3dd/dc3dd.mk b/package/dc3dd/dc3dd.mk
new file mode 100644
index 0000000..fef9093
--- /dev/null
+++ b/package/dc3dd/dc3dd.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# dc3dd
+#
+################################################################################
+
+DC3DD_VERSION_MAJOR = 7.2
+DC3DD_VERSION = $(DC3DD_VERSION_MAJOR).641
+DC3DD_SOURCE = dc3dd-$(DC3DD_VERSION).tar.xz
+DC3DD_SITE = https://downloads.sourceforge.net/project/dc3dd/dc3dd/$(DC3DD_VERSION_MAJOR)
+DC3DD_LICENSE = GPLv3+
+DC3DD_LICENSE_FILES = COPYING
+# We are patching the Makefile.am
+DC3DD_AUTORECONF = yes
+
+$(eval $(autotools-package))
-- 
2.1.4
