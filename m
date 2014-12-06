From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  6 Dec 2014 12:13:53 +0100
Subject: [Buildroot] [PATCH 3/9 v2] docs/manual: document the new variable
	FOO_UPSTREAM_SOURCE
In-Reply-To: <cover.1417863715.git.yann.morin.1998@free.fr>
References: <cover.1417863715.git.yann.morin.1998@free.fr>
Message-ID: <32f7fa03dafe834f9d38336ac788879d3610e4a0.1417863715.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the documentation for the new _UPSTREAM_SOURCE variable.
Explain that the local filename is to be used in the .hash file.

Fix a .Note section marking at the same time.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Baruch Siach <baruch@tkos.co.il>

---
Changes v1 -> v2:
  - add blurb in .hash file, that the filename is the local one, not the
    remote one  (Baruch)
---
 docs/manual/adding-packages-directory.txt |  8 +++++++-
 docs/manual/adding-packages-generic.txt   | 12 ++++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
index 0ea03f9..07f6427 100644
--- a/docs/manual/adding-packages-directory.txt
+++ b/docs/manual/adding-packages-directory.txt
@@ -390,6 +390,11 @@ hash, each line being space-separated, with these three fields:
 ** for +sha512+, 128 hexadecimal characters
 * the name of the file, without any directory component
 
+.Note
+If the remote and the local filenames differ, you must use the local
+filename, that is the filename referenced in +LIBFOO_SOURCE+, not the one
+referenced in +LIBFOO_UPSTREAM_SOURCE+.
+
 Lines starting with a +#+ sign are considered comments, and ignored. Empty
 lines are ignored.
 
@@ -403,7 +408,8 @@ best to add all those hashes in the +.hash+ file. If upstream does not
 provide any hash, then compute at least one yourself, and mention this in a
 comment line above the hashes.
 
-*Note:* the number of spaces does not matter, so one can use spaces to
+.Note
+The number of spaces does not matter, so one can use spaces to
 properly align the different fields.
 
 The example below defines a +sha1+ and a +sha256+ published by upstream for
diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 67a7453..69d1cfa 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -211,6 +211,18 @@ information is (assuming the package name is +libfoo+) :
   +libfoo-$(LIBFOO_VERSION).tar.gz+. +
   Example: +LIBFOO_SOURCE = foobar-$(LIBFOO_VERSION).tar.bz2+
 
+* +LIBFOO_UPSTREAM_SOURCE+ may contain the name of the tarball as
+  known by upstream. If +HOST_LIBFOO_UPSTREAM_SOURCE+ is not specified,
+  it defaults to +LIBFOO_UPSTREAM_SOURCE+. If none is specified, then
+  the value is assumed to be the same as +LIBFOO_SOURCE+.
+
+.Note
++LIBFOO_SOURCE+ is the filename Buildroot will save the tarball as,
+while +LIBFOO_UPSTREAM_SOURCE+ is the name by which upstream names
+that tarball. The two are usually the same, except in very rare cases
+where upstream has a strange naming convention, so you normally should
+not have to set +LIBFOO_UPSTREAM_SOURCE+.
+
 * +LIBFOO_PATCH+ may contain a space-separated list of patch file
   names, that will be downloaded from the same location as the tarball
   indicated in +LIBFOO_SOURCE+, and then applied to the package source
-- 
1.9.1
