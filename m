From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 29 Apr 2018 11:33:46 -0300
Subject: [Buildroot] [PATCH v4] testing/tests/download: test git tag/branch
 precedence
In-Reply-To: <20180429143349.24010-1-ricardo.martincoski@gmail.com>
References: <20180429143349.24010-1-ricardo.martincoski@gmail.com>
Message-ID: <20180429143349.24010-10-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>

Add a tag and a branch with the same name to the static repo and check
on the git refs test case:
 - given there is a tag and a branch with the same name, download the
   branch (this is the default behavior from git command line and thus
   our git download infra must do the same);

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
Layout of static repo with the series applied until this patch:
 $ git -C support/testing/tests/download/git-remote/repo.git \
   log --all --decorate --graph --oneline --decorate
 * 2fa37f6 (submodule) sub0-2
 * a9dbc1e sub0-1
 | * a8f7364 (tag: mybranchandtag) tag
 |/
 | * 83e0f40 (mybranchandtag) branch
 |/
 | * 68c197d (mybranch) branch2
 | * 3174063 branch1
 |/
 | * 516c9c5 (tag: mytag) tag2
 | * 46bae5b tag1
 |/
 * a238b1d (HEAD -> master) initial

Changes v1 -> v4:
  - not included on v2 or v3;
  - rewrite from v1 using new git test infra with static repo;
---
 .../git-branch-takes-precedence-over-tag.hash             |   3 +++
 .../git-branch-takes-precedence-over-tag.mk               |  11 +++++++++++
 .../objects/42/c7c82cc86a07a73cb4499345eff2eccfe668bc     | Bin 0 -> 19 bytes
 .../objects/47/3b7c2f803ad64eac57695ff57a5a6a8b34cbdd     | Bin 0 -> 49 bytes
 .../objects/80/858c1ab821392fd59a897dbaedd7d07e1ac403     | Bin 0 -> 22 bytes
 .../objects/83/e0f402891d9de91e7007f8534884ec4b9c7c2c     | Bin 0 -> 183 bytes
 .../objects/8e/a6edb6df557ee935de556113bab2b5f9ecbabf     | Bin 0 -> 49 bytes
 .../objects/a8/f73649910ce50c48626de0329a0174263ebb5b     | Bin 0 -> 183 bytes
 .../objects/e0/de76f5d12508fa80efca376f0e2a822fedcfdd     | Bin 0 -> 144 bytes
 .../git-remote/repo.git/refs/heads/mybranchandtag         |   1 +
 .../download/git-remote/repo.git/refs/tags/mybranchandtag |   1 +
 support/testing/tests/download/test_git.py                |   1 +
 12 files changed, 17 insertions(+)
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-branch-takes-precedence-over-tag/git-branch-takes-precedence-over-tag.hash
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-branch-takes-precedence-over-tag/git-branch-takes-precedence-over-tag.mk
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/42/c7c82cc86a07a73cb4499345eff2eccfe668bc
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/47/3b7c2f803ad64eac57695ff57a5a6a8b34cbdd
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/80/858c1ab821392fd59a897dbaedd7d07e1ac403
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/83/e0f402891d9de91e7007f8534884ec4b9c7c2c
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/8e/a6edb6df557ee935de556113bab2b5f9ecbabf
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/a8/f73649910ce50c48626de0329a0174263ebb5b
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/e0/de76f5d12508fa80efca376f0e2a822fedcfdd
 create mode 100644 support/testing/tests/download/git-remote/repo.git/refs/heads/mybranchandtag
 create mode 100644 support/testing/tests/download/git-remote/repo.git/refs/tags/mybranchandtag

diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-branch-takes-precedence-over-tag/git-branch-takes-precedence-over-tag.hash b/support/testing/tests/download/br2-external/git-refs/package/git-branch-takes-precedence-over-tag/git-branch-takes-precedence-over-tag.hash
new file mode 100644
index 0000000000..5eb1451efe
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-branch-takes-precedence-over-tag/git-branch-takes-precedence-over-tag.hash
@@ -0,0 +1,3 @@
+sha256  fff39726219f51cc4d3f7c090e733fed2514fcf1a759068df0d7503f9827e781  git-branch-takes-precedence-over-tag-mybranchandtag.tar.gz
+# check file contains "branch" as in commit 83e0f402891d9de91e7007f8534884ec4b9c7c2c
+sha256  2bf74fd761df1710dae82a5459f89af15375f36e700c31156c991e22b9fe7edb  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-branch-takes-precedence-over-tag/git-branch-takes-precedence-over-tag.mk b/support/testing/tests/download/br2-external/git-refs/package/git-branch-takes-precedence-over-tag/git-branch-takes-precedence-over-tag.mk
new file mode 100644
index 0000000000..ce034644aa
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-branch-takes-precedence-over-tag/git-branch-takes-precedence-over-tag.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# git-branch-takes-precedence-over-tag
+#
+################################################################################
+
+GIT_BRANCH_TAKES_PRECEDENCE_OVER_TAG_VERSION = mybranchandtag
+GIT_BRANCH_TAKES_PRECEDENCE_OVER_TAG_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+GIT_BRANCH_TAKES_PRECEDENCE_OVER_TAG_LICENSE_FILES = file
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/git-remote/repo.git/objects/42/c7c82cc86a07a73cb4499345eff2eccfe668bc b/support/testing/tests/download/git-remote/repo.git/objects/42/c7c82cc86a07a73cb4499345eff2eccfe668bc
new file mode 100644
index 0000000000000000000000000000000000000000..314ffcd789086900b009fe7d4e9195d7524e8eb8
GIT binary patch
literal 19
acmb<m^geacKgb|a!_((E6N6|lvlReC!3EU-

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/47/3b7c2f803ad64eac57695ff57a5a6a8b34cbdd b/support/testing/tests/download/git-remote/repo.git/objects/47/3b7c2f803ad64eac57695ff57a5a6a8b34cbdd
new file mode 100644
index 0000000000000000000000000000000000000000..b8690704ec849ea1054dc7ce7633fadcc26cce78
GIT binary patch
literal 49
zcmb<m)YkO!4K*-JGB7bPFg6VIIDN)5H6!Eg#9Iq9R@Rq>rN3Rb{kr}YPuWB^2G+&=
F#sIxn67~Q9

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/80/858c1ab821392fd59a897dbaedd7d07e1ac403 b/support/testing/tests/download/git-remote/repo.git/objects/80/858c1ab821392fd59a897dbaedd7d07e1ac403
new file mode 100644
index 0000000000000000000000000000000000000000..c9412113d9b2278589980786be5f726480ad6625
GIT binary patch
literal 22
dcmb<m^geacKgb~6L(A)o_qhj53`&(O`2b?K2q6Ff

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/83/e0f402891d9de91e7007f8534884ec4b9c7c2c b/support/testing/tests/download/git-remote/repo.git/objects/83/e0f402891d9de91e7007f8534884ec4b9c7c2c
new file mode 100644
index 0000000000000000000000000000000000000000..08ea238ac69e06859e7bfb230587f15047af0024
GIT binary patch
literal 183
zcmV;o07(CM0j<t4ZUZ3 at K+)8kf(xt#470FN6y*YG;u8!rU?YbmBBaReW66bkEA1=3
zKKIt@)Zp-Gj-0g*kOI3B4Unup6JuC6ECmB0trQb@P9o}yM&73;2QgVGEYYF(AQ3zj
zU~~?=4II6-vKdkIGtYhKkIFQp>vtNn?%cmGRlkfI9 at -t>PL1m4fqQ$^7ERbN;%fC`
lz!-Ja>-5b3lv8QY&S#~L^|WVMdMQi#eSYLs{Q<+8ZB-QXS4{u_

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/8e/a6edb6df557ee935de556113bab2b5f9ecbabf b/support/testing/tests/download/git-remote/repo.git/objects/8e/a6edb6df557ee935de556113bab2b5f9ecbabf
new file mode 100644
index 0000000000000000000000000000000000000000..78cbc40c0e3df2b143e9832ecf422f3c4098602b
GIT binary patch
literal 49
zcmb<m)YkO!4K*-JGB7bPFg6VIIDN)5wZN**>A8#8 at 1ohd^CrjMudgcp7kNyMf!A1I
FCjg-q5`_Q&

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/a8/f73649910ce50c48626de0329a0174263ebb5b b/support/testing/tests/download/git-remote/repo.git/objects/a8/f73649910ce50c48626de0329a0174263ebb5b
new file mode 100644
index 0000000000000000000000000000000000000000..511cb7a629c3bb89f5e11311dcade00d18c48d85
GIT binary patch
literal 183
zcmV;o07(CM0j<tKZo?oDh2gF_1s8AxjK{`R73Biiv?myt!9@usB4m-<$5I#FSKU2*
zi>E)<QgYYe+*@xV+6zs>Vd8{1i!6XFh?BJtD7b)Wk+`p<Zq#J!njH9GIYsskd7Rn9
zNC_f32cw;%AFbuZu%bu*u1$aDNR6vLQ|oz)^?u3vqy6Ba{NiaXl&^<a%TZf2^MZZ?
ls|N$ds9pEyF8_3=I;~25<#iJtYDz<RzW*guy#P{>Y}~=KTUh`A

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/e0/de76f5d12508fa80efca376f0e2a822fedcfdd b/support/testing/tests/download/git-remote/repo.git/objects/e0/de76f5d12508fa80efca376f0e2a822fedcfdd
new file mode 100644
index 0000000000000000000000000000000000000000..10ae03c5c822cbd526709f853b2ad44f766234d0
GIT binary patch
literal 144
zcmV;B0B`?z0bR^N4#FT1KvCD6VlH4aK!K7N;|1J!gJFslEyW<4-rgD)CNBS5{6-T<
zCwC>>BR8Po>a^{>m&nl|_k&e-jHs0-l&)7+#}G^qZGA at Il5=XJZI8T$N(<j;8Mpk<
y6f0a3QymMOskXFmc|8&w>KD8G!_$;0&E57pf;8y78LYFgM~x`N-}?>I^*O{+OGOy~

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/refs/heads/mybranchandtag b/support/testing/tests/download/git-remote/repo.git/refs/heads/mybranchandtag
new file mode 100644
index 0000000000..030351c2f7
--- /dev/null
+++ b/support/testing/tests/download/git-remote/repo.git/refs/heads/mybranchandtag
@@ -0,0 +1 @@
+83e0f402891d9de91e7007f8534884ec4b9c7c2c
diff --git a/support/testing/tests/download/git-remote/repo.git/refs/tags/mybranchandtag b/support/testing/tests/download/git-remote/repo.git/refs/tags/mybranchandtag
new file mode 100644
index 0000000000..1f3290059a
--- /dev/null
+++ b/support/testing/tests/download/git-remote/repo.git/refs/tags/mybranchandtag
@@ -0,0 +1 @@
+e0de76f5d12508fa80efca376f0e2a822fedcfdd
diff --git a/support/testing/tests/download/test_git.py b/support/testing/tests/download/test_git.py
index a5fff4dd90..878cae87d6 100644
--- a/support/testing/tests/download/test_git.py
+++ b/support/testing/tests/download/test_git.py
@@ -66,6 +66,7 @@ class TestGitRefs(GitTestBase):
         with self.assertRaises(SystemError):
             self.check_download("git-wrong-sha1")
         self.check_download("git-branch")
+        self.check_download("git-branch-takes-precedence-over-tag")
         self.check_download("git-partial-sha1-branch-head")
         self.check_download("git-partial-sha1-reachable-by-branch")
         self.check_download("git-partial-sha1-reachable-by-tag")
-- 
2.14.1
