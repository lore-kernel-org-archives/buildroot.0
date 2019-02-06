From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 6 Feb 2019 11:13:20 +0100
Subject: [Buildroot] [git commit] testing/tests/download: test git special
 ref
Message-ID: <20190206101205.9F542837AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=81771cfcdc40e5909a4ec663e7c88b3a32068c05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a special ref to the static repo and check on the git refs test case
the download of a git package:
 - with the sha1 of a special ref as version;

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Cc: Arnout Vandecappelle <arnout@mind.be>
[Arnout: change to use the sha1 of a special ref instead of the name]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../git-refs/package/git-special-ref/git-special-ref.hash  |   2 ++
 .../git-refs/package/git-special-ref/git-special-ref.mk    |  11 +++++++++++
 .../objects/17/c409592968d17600ff9912e96fdd461bb72e74      | Bin 0 -> 48 bytes
 .../objects/53/122a7b0454b33c6d9e159c10657173db77899e      | Bin 0 -> 27 bytes
 .../objects/b7/2ff6078f62522a87f5cae5e9f34dedf5ec3885      |   3 +++
 .../tests/download/git-remote/repo.git/refs/changes/01/1/2 |   1 +
 support/testing/tests/download/test_git.py                 |   1 +
 7 files changed, 18 insertions(+)

diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-special-ref/git-special-ref.hash b/support/testing/tests/download/br2-external/git-refs/package/git-special-ref/git-special-ref.hash
new file mode 100644
index 0000000000..00e45b6da3
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-special-ref/git-special-ref.hash
@@ -0,0 +1,2 @@
+sha256  e78abd24049c6acac81a02fb8fa6dfa60db74a19772d41e28ad9d6b9b77c8054  git-special-ref-b72ff6078f62522a87f5cae5e9f34dedf5ec3885.tar.gz
+sha256  b252b594be4679764e2e06cfea77a3e50638dd445af9b472b0f298c43b134518  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-special-ref/git-special-ref.mk b/support/testing/tests/download/br2-external/git-refs/package/git-special-ref/git-special-ref.mk
new file mode 100644
index 0000000000..d3d0913067
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-special-ref/git-special-ref.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# git-special-ref
+#
+################################################################################
+
+GIT_SPECIAL_REF_VERSION = b72ff6078f62522a87f5cae5e9f34dedf5ec3885
+GIT_SPECIAL_REF_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+GIT_SPECIAL_REF_LICENSE_FILES = file
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/git-remote/repo.git/objects/17/c409592968d17600ff9912e96fdd461bb72e74 b/support/testing/tests/download/git-remote/repo.git/objects/17/c409592968d17600ff9912e96fdd461bb72e74
new file mode 100644
index 0000000000..8c19de6455
Binary files /dev/null and b/support/testing/tests/download/git-remote/repo.git/objects/17/c409592968d17600ff9912e96fdd461bb72e74 differ
diff --git a/support/testing/tests/download/git-remote/repo.git/objects/53/122a7b0454b33c6d9e159c10657173db77899e b/support/testing/tests/download/git-remote/repo.git/objects/53/122a7b0454b33c6d9e159c10657173db77899e
new file mode 100644
index 0000000000..d72d49eed5
Binary files /dev/null and b/support/testing/tests/download/git-remote/repo.git/objects/53/122a7b0454b33c6d9e159c10657173db77899e differ
diff --git a/support/testing/tests/download/git-remote/repo.git/objects/b7/2ff6078f62522a87f5cae5e9f34dedf5ec3885 b/support/testing/tests/download/git-remote/repo.git/objects/b7/2ff6078f62522a87f5cae5e9f34dedf5ec3885
new file mode 100644
index 0000000000..6727b2e808
--- /dev/null
+++ b/support/testing/tests/download/git-remote/repo.git/objects/b7/2ff6078f62522a87f5cae5e9f34dedf5ec3885
@@ -0,0 +1,3 @@
+x??AN!@Q?????
+h??1^?????????L\x{;q???}???{kujk?a?!;????<@)Dh?|av?-	N???}?dl??K?hVv??u???c???	X?????~?9??5?Y?????????/??[??S??Y?
+?<?z?=???SN?o?k?)J???.??R????/???m?
\ No newline@end of file
diff --git a/support/testing/tests/download/git-remote/repo.git/refs/changes/01/1/2 b/support/testing/tests/download/git-remote/repo.git/refs/changes/01/1/2
new file mode 100644
index 0000000000..7066394dd0
--- /dev/null
+++ b/support/testing/tests/download/git-remote/repo.git/refs/changes/01/1/2
@@ -0,0 +1 @@
+b72ff6078f62522a87f5cae5e9f34dedf5ec3885
diff --git a/support/testing/tests/download/test_git.py b/support/testing/tests/download/test_git.py
index 2455557298..40cf1afe05 100644
--- a/support/testing/tests/download/test_git.py
+++ b/support/testing/tests/download/test_git.py
@@ -76,6 +76,7 @@ class TestGitRefs(GitTestBase):
         self.check_download("git-sha1-reachable-by-tag")
         self.check_download("git-sha1-tag-itself")
         self.check_download("git-sha1-tag-points-to")
+        self.check_download("git-special-ref")
         self.check_download("git-submodule-disabled")
         self.check_download("git-submodule-enabled")
         self.check_download("git-tag")
