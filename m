From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Sep 2020 00:38:41 +0200
Subject: [Buildroot] [git commit] docs/manual: Add section about
 contributing to maintenance branches
Message-ID: <20200908223158.97F7486E50@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=76ed69499d63ffb1e9167d36d794ebda6b17cd1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
[yann.morin.1998 at free.fr:
  - s/release branch/maintenance branch/
  - extend the master-then-backport section
  - slight eye-candy on the rest
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 docs/manual/contribute.txt | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/docs/manual/contribute.txt b/docs/manual/contribute.txt
index 11d8811b44..14ecdbd66c 100644
--- a/docs/manual/contribute.txt
+++ b/docs/manual/contribute.txt
@@ -371,6 +371,37 @@ in the following cases:
 * whenever you feel it will help presenting your work, your choices,
   the review process, etc.
 
+==== Patches for maintenance branches
+
+When fixing bugs on a maintenance branch, bugs should be fixed on the
+master branch first. The commit log for such a patch may then contain a
+post-commit note specifying what branches are affected:
+
+----
+package/foo: fix stuff
+
+Signed-off-by: Your Real Name <your@email.address>
+---
+Backport to: 2020.02.x, 2020.05.x
+(2020.08.x not affected as the version was bumped)
+----
+
+Those changes will then be backported by a maintainer to the affected
+branches.
+
+However, some bugs may apply only to a specific release, for example
+because it is using an older version of a package. In that case, patches
+should be based off the maintenance branch, and the patch subject prefix
+must include the maintenance branch name (for example "[PATCH 2020.02.x]").
+This can be done with the +git format-patch+ flag +--subject-prefix+:
+
+---------------------
+$ git format-patch --subject-prefix "PATCH 2020.02.x" \
+    -M -s -o outgoing origin/2020.02.x
+---------------------
+
+Then send the patches with +git send-email+, as described above.
+
 ==== Patch revision changelog
 
 When improvements are requested, the new revision of each commit
