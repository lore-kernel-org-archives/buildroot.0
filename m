From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 1 Mar 2019 11:09:41 +0100
Subject: [Buildroot] [git commit] Revert "testing/tests/download: test git
 special ref"
Message-ID: <20190301100742.3A232810D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7b2dd942d023d40be177a37a61f98c2cb7524f69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 81771cfcdc40e5909a4ec663e7c88b3a32068c05.

The download of sha1 of a special ref currently works or not depending
on the git client version in use.
With git version 2.11.0 (present in the docker image) it does not work.
With git version 2.17.1 it works.

For the sake of reproducibility, remove this part of the TestGitRefs
test case until some code gets added to the download infra to handle
sha1 of a special ref for any git client version.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/158295269

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../git-refs/package/git-special-ref/git-special-ref.hash  |   2 --
 .../git-refs/package/git-special-ref/git-special-ref.mk    |  11 -----------
 .../objects/17/c409592968d17600ff9912e96fdd461bb72e74      | Bin 48 -> 0 bytes
 .../objects/53/122a7b0454b33c6d9e159c10657173db77899e      | Bin 27 -> 0 bytes
 .../objects/b7/2ff6078f62522a87f5cae5e9f34dedf5ec3885      |   3 ---
 .../tests/download/git-remote/repo.git/refs/changes/01/1/2 |   1 -
 support/testing/tests/download/test_git.py                 |   1 -
 7 files changed, 18 deletions(-)

diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-special-ref/git-special-ref.hash b/support/testing/tests/download/br2-external/git-refs/package/git-special-ref/git-special-ref.hash
deleted file mode 100644
index 00e45b6da3..0000000000
--- a/support/testing/tests/download/br2-external/git-refs/package/git-special-ref/git-special-ref.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-sha256  e78abd24049c6acac81a02fb8fa6dfa60db74a19772d41e28ad9d6b9b77c8054  git-special-ref-b72ff6078f62522a87f5cae5e9f34dedf5ec3885.tar.gz
-sha256  b252b594be4679764e2e06cfea77a3e50638dd445af9b472b0f298c43b134518  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-special-ref/git-special-ref.mk b/support/testing/tests/download/br2-external/git-refs/package/git-special-ref/git-special-ref.mk
deleted file mode 100644
index d3d0913067..0000000000
--- a/support/testing/tests/download/br2-external/git-refs/package/git-special-ref/git-special-ref.mk
+++ /dev/null
@@ -1,11 +0,0 @@
-################################################################################
-#
-# git-special-ref
-#
-################################################################################
-
-GIT_SPECIAL_REF_VERSION = b72ff6078f62522a87f5cae5e9f34dedf5ec3885
-GIT_SPECIAL_REF_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
-GIT_SPECIAL_REF_LICENSE_FILES = file
-
-$(eval $(generic-package))
diff --git a/support/testing/tests/download/git-remote/repo.git/objects/17/c409592968d17600ff9912e96fdd461bb72e74 b/support/testing/tests/download/git-remote/repo.git/objects/17/c409592968d17600ff9912e96fdd461bb72e74
deleted file mode 100644
index 8c19de6455..0000000000
Binary files a/support/testing/tests/download/git-remote/repo.git/objects/17/c409592968d17600ff9912e96fdd461bb72e74 and /dev/null differ
diff --git a/support/testing/tests/download/git-remote/repo.git/objects/53/122a7b0454b33c6d9e159c10657173db77899e b/support/testing/tests/download/git-remote/repo.git/objects/53/122a7b0454b33c6d9e159c10657173db77899e
deleted file mode 100644
index d72d49eed5..0000000000
Binary files a/support/testing/tests/download/git-remote/repo.git/objects/53/122a7b0454b33c6d9e159c10657173db77899e and /dev/null differ
diff --git a/support/testing/tests/download/git-remote/repo.git/objects/b7/2ff6078f62522a87f5cae5e9f34dedf5ec3885 b/support/testing/tests/download/git-remote/repo.git/objects/b7/2ff6078f62522a87f5cae5e9f34dedf5ec3885
deleted file mode 100644
index 6727b2e808..0000000000
--- a/support/testing/tests/download/git-remote/repo.git/objects/b7/2ff6078f62522a87f5cae5e9f34dedf5ec3885
+++ /dev/null
@@ -1,3 +0,0 @@
-x??AN!@Q?????
-h??1^?????????L\x{;q???}???{kujk?a?!;????<@)Dh?|av?-	N???}?dl??K?hVv??u???c???	X?????~?9??5?Y?????????/??[??S??Y?
-?<?z?=???SN?o?k?)J???.??R????/???m?
\ No newline@end of file
diff --git a/support/testing/tests/download/git-remote/repo.git/refs/changes/01/1/2 b/support/testing/tests/download/git-remote/repo.git/refs/changes/01/1/2
deleted file mode 100644
index 7066394dd0..0000000000
--- a/support/testing/tests/download/git-remote/repo.git/refs/changes/01/1/2
+++ /dev/null
@@ -1 +0,0 @@
-b72ff6078f62522a87f5cae5e9f34dedf5ec3885
diff --git a/support/testing/tests/download/test_git.py b/support/testing/tests/download/test_git.py
index 40cf1afe05..2455557298 100644
--- a/support/testing/tests/download/test_git.py
+++ b/support/testing/tests/download/test_git.py
@@ -76,7 +76,6 @@ class TestGitRefs(GitTestBase):
         self.check_download("git-sha1-reachable-by-tag")
         self.check_download("git-sha1-tag-itself")
         self.check_download("git-sha1-tag-points-to")
-        self.check_download("git-special-ref")
         self.check_download("git-submodule-disabled")
         self.check_download("git-submodule-enabled")
         self.check_download("git-tag")
