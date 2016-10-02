From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Oct 2016 11:09:56 +0200
Subject: [Buildroot] [PATCH 07/10] docs/manual: add appendix to convert old
	br2-external trees
In-Reply-To: <cover.1475399381.git.yann.morin.1998@free.fr>
References: <cover.1475399381.git.yann.morin.1998@free.fr>
Message-ID: <389817fcbe593d7073e5c69da858d1693d414db2.1475399381.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Romain Naour <romain.naour@openwide.fr>
Cc: Julien CORJON <corjon.j@ecagroup.com>
---
 docs/manual/appendix.txt                |  1 +
 docs/manual/br2-external-converting.txt | 36 +++++++++++++++++++++++++++++++++
 docs/manual/customize-outside-br.txt    |  5 +++++
 support/scripts/br2-external            |  7 ++++++-
 4 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 docs/manual/br2-external-converting.txt

diff --git a/docs/manual/appendix.txt b/docs/manual/appendix.txt
index 03dbbd1..4d4bbec 100644
--- a/docs/manual/appendix.txt
+++ b/docs/manual/appendix.txt
@@ -3,3 +3,4 @@
 
 include::makedev-syntax.txt[]
 include::makeusers-syntax.txt[]
+include::br2-external-converting.txt[]
diff --git a/docs/manual/br2-external-converting.txt b/docs/manual/br2-external-converting.txt
new file mode 100644
index 0000000..b207601
--- /dev/null
+++ b/docs/manual/br2-external-converting.txt
@@ -0,0 +1,36 @@
+// -*- mode:doc; -*-
+// vim: set syntax=asciidoc:
+
+[[br2-external-converting]]
+== Converting old br2-external trees
+
+Buildroot 2016.11 introduced a backward-incompatible change in the way
+br2-external trees are handled. A minor change has to be made: adding
+a name to your br2-external tree, see xref:outside-br-custom[].
+
+This can be done very easily in just a few steps:
+
+ * First, create a new file named +external.desc+, at the root of your
+   br2-external tree, with a single line defining the name of your
+   br2-external tree:
++
+----
+$ echo 'name: NAME_OF_YOUR_TREE' >external.desc
+----
++
+.Note
+Be careful when choosing a name: it has to be relatively unique, be made
+with only ASCII characters from the set +[A-Za-z0-9_]+.
+
+ * Then, change every occurence of +BR2_EXTERNAL+ in your br2-external
+   tree with the new variable:
++
+----
+$ find . -type f | xargs sed -i 's/BR2_EXTERNAL/BR2_EXTERNAL_NAME_OF_YOUR_TREE_PATH/g'
+----
+
+Now, your br2-external tree can be used with Buildroot 2016.11 onward.
+
+.Note:
+This change makes your br2-external tree incompatible with Buildroot
+before 2016.11.
diff --git a/docs/manual/customize-outside-br.txt b/docs/manual/customize-outside-br.txt
index f2a83a6..3ad0bc0 100644
--- a/docs/manual/customize-outside-br.txt
+++ b/docs/manual/customize-outside-br.txt
@@ -33,6 +33,11 @@ If it is passed as a relative path, it is important to note that it is
 interpreted relative to the main Buildroot source directory, *not* to
 the Buildroot output directory.
 
+.Note:
+If using an br2-external tree from before Buildroot 2016.11, you need to
+convert it before you can use it with Buildroot 2016.11 onward. See
+xref:br2-external-converting[] for help on doing so.
+
 Some examples:
 
 -----
diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 21d7351..281a084 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -5,6 +5,10 @@ set -e
 declare BR2_NAME
 declare BR2_EXT
 
+# URL to manual for help in converting old br2-external trees.
+# Escape '#' so that make does not consider it a comment.
+MANUAL_URL='https://buildroot.org/manual/manual.html\#br2-external-converting'
+
 main() {
     local OPT OPTARG
     local br2_ext ofile ofmt
@@ -70,7 +74,8 @@ do_validate() {
         error "'%s': permission denied\n" "${br2_ext}"
     fi
     if [ ! -f "${br2_ext}/external.desc" ]; then
-        error "'%s': does not have a name (in 'external.desc')\n" "${br2_ext}"
+        error "'%s': does not have a name (in 'external.desc'). See %s\n" \
+            "${br2_ext}" "${MANUAL_URL}"
     fi
     br2_name="$(sed -r -e '/^name: +(.*)$/!d; s//\1/' "${br2_ext}/external.desc")"
     if [ -z "${br2_name}" ]; then
-- 
2.7.4
