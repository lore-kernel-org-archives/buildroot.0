From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 26 Feb 2019 00:02:09 -0300
Subject: [Buildroot] [PATCH-for-master] Revert "testing/tests/download: test
 git special ref"
Message-ID: <20190226030209.19322-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
TestGitRefs after this patch:
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/167428144
---
 .../package/git-special-ref/git-special-ref.hash  |   2 --
 .../package/git-special-ref/git-special-ref.mk    |  11 -----------
 .../17/c409592968d17600ff9912e96fdd461bb72e74     | Bin 48 -> 0 bytes
 .../53/122a7b0454b33c6d9e159c10657173db77899e     | Bin 27 -> 0 bytes
 .../b7/2ff6078f62522a87f5cae5e9f34dedf5ec3885     | Bin 186 -> 0 bytes
 .../git-remote/repo.git/refs/changes/01/1/2       |   1 -
 support/testing/tests/download/test_git.py        |   1 -
 7 files changed, 15 deletions(-)
 delete mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-special-ref/git-special-ref.hash
 delete mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-special-ref/git-special-ref.mk
 delete mode 100644 support/testing/tests/download/git-remote/repo.git/objects/17/c409592968d17600ff9912e96fdd461bb72e74
 delete mode 100644 support/testing/tests/download/git-remote/repo.git/objects/53/122a7b0454b33c6d9e159c10657173db77899e
 delete mode 100644 support/testing/tests/download/git-remote/repo.git/objects/b7/2ff6078f62522a87f5cae5e9f34dedf5ec3885
 delete mode 100644 support/testing/tests/download/git-remote/repo.git/refs/changes/01/1/2

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
index 8c19de6455168ac65c81d70219e01eb2431c069e..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 48
zcmb<m)YkO!4K*-JGB7bPFg6VIIDN)5l|$^(sx;1<Ig_pZOZptL5<kBEbgq)&X$db2
E0EbQzfdBvi

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/53/122a7b0454b33c6d9e159c10657173db77899e b/support/testing/tests/download/git-remote/repo.git/objects/53/122a7b0454b33c6d9e159c10657173db77899e
deleted file mode 100644
index d72d49eed56298f84aaf85967dbf051da94f3871..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 27
icmb<m^geacKghr&MMKZS_ngleO)uZaObmAQY+e9~zX?PD

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/b7/2ff6078f62522a87f5cae5e9f34dedf5ec3885 b/support/testing/tests/download/git-remote/repo.git/objects/b7/2ff6078f62522a87f5cae5e9f34dedf5ec3885
deleted file mode 100644
index 6727b2e8083f2a31c48e849caa4cd772a6778e07..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 186
zcmV;r07d_J0j<tKP6QzkKvCD6f(!Jd3TU8=F<!upo`9x`k<8Fc7+iRJJ8|LOxP6PC
zpL=U{YHR3W4iSwZJD`;e`N$YNKq*9MgnVIk9=9zR2~OS8kbUZ8Y}}Ab=4e)SfunV)
z*t{BJ-4TlpkqKC(&-u}ZeyceR?)o*2S@+!Um#Uw}51!gDzMNaC*HiB8S>p<UJc0{)
o0SllGJ*KDpQ%>D)l54sSDN4Q9^DeyfQkL!O at h`vX8x-PgzB#pAi~s-t

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
-- 
2.17.1
