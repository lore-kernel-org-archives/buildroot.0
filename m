From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Fri, 11 May 2018 23:58:30 -0300
Subject: [Buildroot] [PATCH v5 07/10] testing/tests/download: test git
 submodules
In-Reply-To: <20180512025833.22998-1-ricardo.martincoski@gmail.com>
References: <20180512025833.22998-1-ricardo.martincoski@gmail.com>
Message-ID: <20180512025833.22998-8-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>

Add two submodules as static repos, add a branch to the main static repo
and check on the git refs test case the download of a git package:
 - repo with submodule but without support in the package;
 - repo with recursive submodules with support in the package.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
Layout of static repos with the series applied until this patch:
 $ git -C support/testing/tests/download/git-remote/repo.git \
   log --all --decorate --graph --oneline --decorate
 * 2fa37f6 (submodule) sub0-2
 * a9dbc1e sub0-1
 | * 68c197d (mybranch) branch2
 | * 3174063 branch1
 |/
 * a238b1d (HEAD -> master) initial

 $ git -C support/testing/tests/download/git-remote/refs-sub1.git \
   log --all --decorate --graph --oneline --decorate
 * 1df823c (submodule) sub1-2
 * f8001e5 sub1-1
 * cb545fa (HEAD) initial

 $ git -C support/testing/tests/download/git-remote/refs-sub2.git \
   log --all --decorate --graph --oneline --decorate
 * e83f6f8 (submodule) sub2-2
 * cd4d62f sub2-1
 * 32d61ba (HEAD) initial

 In this layout:
 - sub0-1 adds refs-sub1.git as submodule to refs.git pointing to sub1-1
   commit;
 - sub1-1 adds refs-sub2.git as submodule to refs-sub1.git pointing to
   sub2-1 commit.

Changes v4 -> v5:
  - no changes

Changes v3 -> v4:
  - add hash for submodule enabled tarball;

Changes v2 -> v3:
  - complete rewrite using a static repo;

Changes v1 -> v2:
  - rewrite using new git test infra;
  - this patch is part of series 1/3 of a new version of
    http://patchwork.ozlabs.org/patch/690097/
---
 .../git-submodule-disabled.hash               |   2 ++
 .../git-submodule-disabled.mk                 |  11 +++++++
 .../git-submodule-enabled.hash                |   4 +++
 .../git-submodule-enabled.mk                  |  28 ++++++++++++++++++
 .../git-remote/refs-sub1.git/.gitattributes   |   1 +
 .../download/git-remote/refs-sub1.git/HEAD    |   1 +
 .../download/git-remote/refs-sub1.git/config  |   4 +++
 .../07/cabc655213bdf7087d8dd50fda95124e935570 | Bin 0 -> 22 bytes
 .../1d/f823cb8a6d1866148ae50a8009762a9c4c777f | Bin 0 -> 180 bytes
 .../7d/52f458bdb0f9f5a4beb46fa82824421b8b988e | Bin 0 -> 65 bytes
 .../99/f2e3e1cb15f9b52fa29f66d380dda061d917ab | Bin 0 -> 49 bytes
 .../a1/30af1626bbadd64841b2cbcb6ac4ed0638ba1a | Bin 0 -> 122 bytes
 .../bc/c81ba6e5bd8bf52c95688ae8d3e697e131fa23 | Bin 0 -> 22 bytes
 .../cb/545facf77bbc5f24f95b6d503c338d10b7b717 | Bin 0 -> 151 bytes
 .../dd/130f6f4629514adaf2e03407f3ed9344eb6cd6 | Bin 0 -> 122 bytes
 .../e7/9c5e8f964493290a409888d5413a737e8e5dd5 | Bin 0 -> 23 bytes
 .../f8/001e5780100962a5e30a25cbc4c9609cfc7bf3 | Bin 0 -> 184 bytes
 .../refs-sub1.git/refs/heads/submodule        |   1 +
 .../git-remote/refs-sub2.git/.gitattributes   |   1 +
 .../download/git-remote/refs-sub2.git/HEAD    |   1 +
 .../download/git-remote/refs-sub2.git/config  |   4 +++
 .../0a/846af45c3e455789435f49f80d70e86b65b9d7 | Bin 0 -> 22 bytes
 .../0b/32ebd8fc52cec991f18c94be980e85a8341585 | Bin 0 -> 22 bytes
 .../32/d61bae693af7879da63b89a60d3ae67f851e56 | Bin 0 -> 151 bytes
 .../3e/9b0a5198c64cea9c00f820433411e3b4d50c1c | Bin 0 -> 48 bytes
 .../85/8f666af75b7c0dfba6b8be7eac5f196e7a1221 | Bin 0 -> 49 bytes
 .../99/f2e3e1cb15f9b52fa29f66d380dda061d917ab | Bin 0 -> 49 bytes
 .../cd/4d62ff218ab7b4a04f5bfdf800ace087af3ceb | Bin 0 -> 184 bytes
 .../e7/9c5e8f964493290a409888d5413a737e8e5dd5 | Bin 0 -> 23 bytes
 .../e8/3f6f805bd016b90acafc8702c52d778eb57310 | Bin 0 -> 182 bytes
 .../refs-sub2.git/refs/heads/submodule        |   1 +
 .../0b/d8ceb961c3b2b210f64a67d57f4b5cd669d343 | Bin 0 -> 22 bytes
 .../25/59d83bfe937fc0412d96ed664663c9e8a99055 | Bin 0 -> 22 bytes
 .../2f/a37f6885d7eb746df75eccaddbacf3ac82799d | Bin 0 -> 180 bytes
 .../8b/8a7e885a041da72b1ee9a47c5b9300b172a9e7 | Bin 0 -> 65 bytes
 .../a9/dbc1e23c45e8e1b88c0448763f54d714eb6f8f | Bin 0 -> 183 bytes
 .../d4/e2941d18a63535400476324ddeb7f40164be41 | Bin 0 -> 121 bytes
 .../fe/74231105841041d5f441e70399d37f0e600aa5 | Bin 0 -> 121 bytes
 .../git-remote/repo.git/refs/heads/submodule  |   1 +
 support/testing/tests/download/test_git.py    |   2 ++
 40 files changed, 62 insertions(+)
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.hash
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.mk
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.hash
 create mode 100644 support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.mk
 create mode 100644 support/testing/tests/download/git-remote/refs-sub1.git/.gitattributes
 create mode 100644 support/testing/tests/download/git-remote/refs-sub1.git/HEAD
 create mode 100644 support/testing/tests/download/git-remote/refs-sub1.git/config
 create mode 100644 support/testing/tests/download/git-remote/refs-sub1.git/objects/07/cabc655213bdf7087d8dd50fda95124e935570
 create mode 100644 support/testing/tests/download/git-remote/refs-sub1.git/objects/1d/f823cb8a6d1866148ae50a8009762a9c4c777f
 create mode 100644 support/testing/tests/download/git-remote/refs-sub1.git/objects/7d/52f458bdb0f9f5a4beb46fa82824421b8b988e
 create mode 100644 support/testing/tests/download/git-remote/refs-sub1.git/objects/99/f2e3e1cb15f9b52fa29f66d380dda061d917ab
 create mode 100644 support/testing/tests/download/git-remote/refs-sub1.git/objects/a1/30af1626bbadd64841b2cbcb6ac4ed0638ba1a
 create mode 100644 support/testing/tests/download/git-remote/refs-sub1.git/objects/bc/c81ba6e5bd8bf52c95688ae8d3e697e131fa23
 create mode 100644 support/testing/tests/download/git-remote/refs-sub1.git/objects/cb/545facf77bbc5f24f95b6d503c338d10b7b717
 create mode 100644 support/testing/tests/download/git-remote/refs-sub1.git/objects/dd/130f6f4629514adaf2e03407f3ed9344eb6cd6
 create mode 100644 support/testing/tests/download/git-remote/refs-sub1.git/objects/e7/9c5e8f964493290a409888d5413a737e8e5dd5
 create mode 100644 support/testing/tests/download/git-remote/refs-sub1.git/objects/f8/001e5780100962a5e30a25cbc4c9609cfc7bf3
 create mode 100644 support/testing/tests/download/git-remote/refs-sub1.git/refs/heads/submodule
 create mode 100644 support/testing/tests/download/git-remote/refs-sub2.git/.gitattributes
 create mode 100644 support/testing/tests/download/git-remote/refs-sub2.git/HEAD
 create mode 100644 support/testing/tests/download/git-remote/refs-sub2.git/config
 create mode 100644 support/testing/tests/download/git-remote/refs-sub2.git/objects/0a/846af45c3e455789435f49f80d70e86b65b9d7
 create mode 100644 support/testing/tests/download/git-remote/refs-sub2.git/objects/0b/32ebd8fc52cec991f18c94be980e85a8341585
 create mode 100644 support/testing/tests/download/git-remote/refs-sub2.git/objects/32/d61bae693af7879da63b89a60d3ae67f851e56
 create mode 100644 support/testing/tests/download/git-remote/refs-sub2.git/objects/3e/9b0a5198c64cea9c00f820433411e3b4d50c1c
 create mode 100644 support/testing/tests/download/git-remote/refs-sub2.git/objects/85/8f666af75b7c0dfba6b8be7eac5f196e7a1221
 create mode 100644 support/testing/tests/download/git-remote/refs-sub2.git/objects/99/f2e3e1cb15f9b52fa29f66d380dda061d917ab
 create mode 100644 support/testing/tests/download/git-remote/refs-sub2.git/objects/cd/4d62ff218ab7b4a04f5bfdf800ace087af3ceb
 create mode 100644 support/testing/tests/download/git-remote/refs-sub2.git/objects/e7/9c5e8f964493290a409888d5413a737e8e5dd5
 create mode 100644 support/testing/tests/download/git-remote/refs-sub2.git/objects/e8/3f6f805bd016b90acafc8702c52d778eb57310
 create mode 100644 support/testing/tests/download/git-remote/refs-sub2.git/refs/heads/submodule
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/0b/d8ceb961c3b2b210f64a67d57f4b5cd669d343
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/25/59d83bfe937fc0412d96ed664663c9e8a99055
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/2f/a37f6885d7eb746df75eccaddbacf3ac82799d
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/8b/8a7e885a041da72b1ee9a47c5b9300b172a9e7
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/a9/dbc1e23c45e8e1b88c0448763f54d714eb6f8f
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/d4/e2941d18a63535400476324ddeb7f40164be41
 create mode 100644 support/testing/tests/download/git-remote/repo.git/objects/fe/74231105841041d5f441e70399d37f0e600aa5
 create mode 100644 support/testing/tests/download/git-remote/repo.git/refs/heads/submodule

diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.hash b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.hash
new file mode 100644
index 0000000000..3bd0a44693
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.hash
@@ -0,0 +1,2 @@
+sha256  f9d46ff8a1a344c6c31fa4211220f3085c446abd31626232540703158276f22c  git-submodule-disabled-a9dbc1e23c45e8e1b88c0448763f54d714eb6f8f.tar.gz
+sha256  ba8b6ddc4726bfb6a05045ebfd8c43263c968ad1bc601bd46a25bc055008eddc  file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.mk b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.mk
new file mode 100644
index 0000000000..7a35b3b51a
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-disabled/git-submodule-disabled.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# git-submodule-disabled
+#
+################################################################################
+
+GIT_SUBMODULE_DISABLED_VERSION = a9dbc1e23c45e8e1b88c0448763f54d714eb6f8f
+GIT_SUBMODULE_DISABLED_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+GIT_SUBMODULE_DISABLED_LICENSE_FILES = file
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.hash b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.hash
new file mode 100644
index 0000000000..089eed2365
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.hash
@@ -0,0 +1,4 @@
+sha256  139a34c3c844c844dee74b6746418cfa75fbcc4205794ac8c0b3cd7d55a76792  git-submodule-enabled-a9dbc1e23c45e8e1b88c0448763f54d714eb6f8f.tar.gz
+sha256  ba8b6ddc4726bfb6a05045ebfd8c43263c968ad1bc601bd46a25bc055008eddc  file
+sha256  5219dcb50c7753bcdd72bc68a7b48af33ac2e42c5c61de78a9dd81589c4d50b6  refs-sub1/file
+sha256  b93c1fa9014d25a17fee36771d26ae023f043da656315ffe8947c30ad1ba141f  refs-sub1/refs-sub2/file
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.mk b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.mk
new file mode 100644
index 0000000000..019dd076e3
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.mk
@@ -0,0 +1,28 @@
+################################################################################
+#
+# git-submodule-enabled
+#
+################################################################################
+
+GIT_SUBMODULE_ENABLED_VERSION = a9dbc1e23c45e8e1b88c0448763f54d714eb6f8f
+GIT_SUBMODULE_ENABLED_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+GIT_SUBMODULE_ENABLED_GIT_SUBMODULES = YES
+GIT_SUBMODULE_ENABLED_LICENSE_FILES = \
+	file \
+	refs-sub1/file \
+	refs-sub1/refs-sub2/file
+
+# Some versions of git client fill the .git file for the second level submodule
+# using the absolute path to the main .git directory, which in the case of the
+# buildroot download helper is always different since it uses a temporary
+# directory. This version of git have the issue:
+# - 2.7.4 included in Ubuntu 16.04;
+# The same does not occur using newer versions of git:
+# - 2.11.0 included in Debian 9;
+# - 2.14.2 latest at the time of writing;
+# In order to allow running this test case locally in many systems, do not check
+# for the hash of the tarball, but instead check the hash of each meaningful
+# file included in the tarball.
+BR_NO_CHECK_HASH_FOR += $(GIT_SUBMODULE_ENABLED_SOURCE)
+
+$(eval $(generic-package))
diff --git a/support/testing/tests/download/git-remote/refs-sub1.git/.gitattributes b/support/testing/tests/download/git-remote/refs-sub1.git/.gitattributes
new file mode 100644
index 0000000000..eb50c64a21
--- /dev/null
+++ b/support/testing/tests/download/git-remote/refs-sub1.git/.gitattributes
@@ -0,0 +1 @@
+objects/*/* binary
diff --git a/support/testing/tests/download/git-remote/refs-sub1.git/HEAD b/support/testing/tests/download/git-remote/refs-sub1.git/HEAD
new file mode 100644
index 0000000000..4e92c1f200
--- /dev/null
+++ b/support/testing/tests/download/git-remote/refs-sub1.git/HEAD
@@ -0,0 +1 @@
+cb545facf77bbc5f24f95b6d503c338d10b7b717
diff --git a/support/testing/tests/download/git-remote/refs-sub1.git/config b/support/testing/tests/download/git-remote/refs-sub1.git/config
new file mode 100644
index 0000000000..07d359d07c
--- /dev/null
+++ b/support/testing/tests/download/git-remote/refs-sub1.git/config
@@ -0,0 +1,4 @@
+[core]
+	repositoryformatversion = 0
+	filemode = true
+	bare = true
diff --git a/support/testing/tests/download/git-remote/refs-sub1.git/objects/07/cabc655213bdf7087d8dd50fda95124e935570 b/support/testing/tests/download/git-remote/refs-sub1.git/objects/07/cabc655213bdf7087d8dd50fda95124e935570
new file mode 100644
index 0000000000000000000000000000000000000000..cbf5085af8cdca19c43017c92369ddc8002f1a3d
GIT binary patch
literal 22
dcmb<m^geacKgb|mL(kXfis>UJ21Qop+W=aH2UY+8

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/refs-sub1.git/objects/1d/f823cb8a6d1866148ae50a8009762a9c4c777f b/support/testing/tests/download/git-remote/refs-sub1.git/objects/1d/f823cb8a6d1866148ae50a8009762a9c4c777f
new file mode 100644
index 0000000000000000000000000000000000000000..04055b899ecbdc3bceb2d7936757f360e90544a5
GIT binary patch
literal 180
zcmV;l089UP0j-Wf4#FT106p^xK2WpJg47t}2fXMDb{9~h6hrag?``72yYV{7OomI&
zsmWfORjVOLR6Sr+R$C(U-VSb1q?wp3@(?`O-VrJk53FHoGCBYi%*KHN7_CMVmVh>k
zG4N<%<j5O}y})O?mMTw)vHBv9SX-L7%(o<W^#j-W3lEo!>AvQY_fi>fV64+lcAx>o
iLYL_l{*)8*lT at dLIH$`Ld{<)Z=(YXjRlEVZ`fTHP_gG8-

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/refs-sub1.git/objects/7d/52f458bdb0f9f5a4beb46fa82824421b8b988e b/support/testing/tests/download/git-remote/refs-sub1.git/objects/7d/52f458bdb0f9f5a4beb46fa82824421b8b988e
new file mode 100644
index 0000000000000000000000000000000000000000..2b78a01965068cc6f7c89402eea4e7f9a03ba807
GIT binary patch
literal 65
zcmV-H0KWft0ZYosPf{>5V~8#;P0GzrDa}b$P%27IE7k?_jg(@!I13U>G8AkT;9^{y
XrA0YF0X;o^xR_pgW(gMne83k<GdCCZ

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/refs-sub1.git/objects/99/f2e3e1cb15f9b52fa29f66d380dda061d917ab b/support/testing/tests/download/git-remote/refs-sub1.git/objects/99/f2e3e1cb15f9b52fa29f66d380dda061d917ab
new file mode 100644
index 0000000000000000000000000000000000000000..9db72668cf9374b0b85a25a19f30084fd460072d
GIT binary patch
literal 49
zcmb<m)YkO!4K*-JGB7bPFg6VIIDN)5wZcw)UHz=nDZYB`lCt5lYr9_mN?Omvz#_so
F4FHVv5b^*3

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/refs-sub1.git/objects/a1/30af1626bbadd64841b2cbcb6ac4ed0638ba1a b/support/testing/tests/download/git-remote/refs-sub1.git/objects/a1/30af1626bbadd64841b2cbcb6ac4ed0638ba1a
new file mode 100644
index 0000000000000000000000000000000000000000..f49d53326e0b22b95fd16670f0a25e3cd84718ae
GIT binary patch
literal 122
zcmV-=0EPc}0V^p=O;s>7uwXDWFfcPQQP4}zEXmDJDa}bOW~dGN60vu~&#z1NZOLDu
zq2eUnJ);k*EG;u9m4W@#p41 at Wz27-%d$01}nkwWsIkdpg%m4@!ic-^xb&E at rj2O=P
cCjD3J+P-ChfArrU3~L^=ueW&(03qxzkxyhgmjD0&

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/refs-sub1.git/objects/bc/c81ba6e5bd8bf52c95688ae8d3e697e131fa23 b/support/testing/tests/download/git-remote/refs-sub1.git/objects/bc/c81ba6e5bd8bf52c95688ae8d3e697e131fa23
new file mode 100644
index 0000000000000000000000000000000000000000..7d2a9d55c1a92dfa2122308cc05a4a5b96d70d8f
GIT binary patch
literal 22
dcmb<m^geacKgb|mL(kXfis=(321RD(TL4;&2UP$7

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/refs-sub1.git/objects/cb/545facf77bbc5f24f95b6d503c338d10b7b717 b/support/testing/tests/download/git-remote/refs-sub1.git/objects/cb/545facf77bbc5f24f95b6d503c338d10b7b717
new file mode 100644
index 0000000000000000000000000000000000000000..dc7de29459f4156b999f14fdeb6cb58b58c21a19
GIT binary patch
literal 151
zcmV;I0BHYs0j<ux4Z<)GKw)Z6aSJ3mJF*iagjj$ECOH3v6LBmVQ?NaeDCiOGS3Esm
za^?nVoOZ3o2-YSQhbX<1I$5VxB4v{?VVE!kLL-BfBRN6Ob}JPw?5TzVXR3`?Umkac
zL;YZ%zj&H6@zVQ}k03QpsEsrT9V$ez={C{gpK^j%ZcK|1SDx1xx{^}oUi)8W#T!=;
FU>B}CKEMC~

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/refs-sub1.git/objects/dd/130f6f4629514adaf2e03407f3ed9344eb6cd6 b/support/testing/tests/download/git-remote/refs-sub1.git/objects/dd/130f6f4629514adaf2e03407f3ed9344eb6cd6
new file mode 100644
index 0000000000000000000000000000000000000000..37037d3920820ae2dab7e40d0c1df612af6f7a94
GIT binary patch
literal 122
zcmV-=0EPc}0V^p=O;s>7uwXDWFfcPQQP4}zEXmDJDa}bOW~dGN60vu~&#z1NZOLDu
zq2eUnJ);k*EG;u9m0`~b>19v%c7N5Gn$h**^0Vm=4Sy*cni&9rLQ!g3v2Jl`k`cpM
c-=zPFUE8-T at Q?ocgJI2s_VqTe0l at My>J95W4gdfE

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/refs-sub1.git/objects/e7/9c5e8f964493290a409888d5413a737e8e5dd5 b/support/testing/tests/download/git-remote/refs-sub1.git/objects/e7/9c5e8f964493290a409888d5413a737e8e5dd5
new file mode 100644
index 0000000000000000000000000000000000000000..df2037a2d2d30afb20e31cd558c92c2edabe7cf6
GIT binary patch
literal 23
fcmb<m^geacKWIb3i8H5lPWqgA$i$$b%kl;Qg;xrl

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/refs-sub1.git/objects/f8/001e5780100962a5e30a25cbc4c9609cfc7bf3 b/support/testing/tests/download/git-remote/refs-sub1.git/objects/f8/001e5780100962a5e30a25cbc4c9609cfc7bf3
new file mode 100644
index 0000000000000000000000000000000000000000..d824d3c17c1cc1c13a18eb1d2c0a7e59f66ba08b
GIT binary patch
literal 184
zcmV;p07w6L0j<tGP6IIzKw)a1!WY<R?D5YoLWm2{Bq#8AJi!95k>eEHo=7RuBigTc
zdbzh&r$+0a<|suo8w3gBg5A7viIdm@=pYIf-q5*1A#+gQX_S5HOx}4(Sz;v0UaXVN
zQ(zC65mz=qk)nwzUFSz1`dD)s-1U1Jv+lWHKC6BicRaKQzMWgDUx(b=t2Q21@L>hi
m3s?Yk)7$hc|CCdgE1AV8b*ksR at X|#V`g#7#tNI184{X$IS6W&C

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/refs-sub1.git/refs/heads/submodule b/support/testing/tests/download/git-remote/refs-sub1.git/refs/heads/submodule
new file mode 100644
index 0000000000..bf97dc4185
--- /dev/null
+++ b/support/testing/tests/download/git-remote/refs-sub1.git/refs/heads/submodule
@@ -0,0 +1 @@
+1df823cb8a6d1866148ae50a8009762a9c4c777f
diff --git a/support/testing/tests/download/git-remote/refs-sub2.git/.gitattributes b/support/testing/tests/download/git-remote/refs-sub2.git/.gitattributes
new file mode 100644
index 0000000000..eb50c64a21
--- /dev/null
+++ b/support/testing/tests/download/git-remote/refs-sub2.git/.gitattributes
@@ -0,0 +1 @@
+objects/*/* binary
diff --git a/support/testing/tests/download/git-remote/refs-sub2.git/HEAD b/support/testing/tests/download/git-remote/refs-sub2.git/HEAD
new file mode 100644
index 0000000000..bbf19a4bb4
--- /dev/null
+++ b/support/testing/tests/download/git-remote/refs-sub2.git/HEAD
@@ -0,0 +1 @@
+32d61bae693af7879da63b89a60d3ae67f851e56
diff --git a/support/testing/tests/download/git-remote/refs-sub2.git/config b/support/testing/tests/download/git-remote/refs-sub2.git/config
new file mode 100644
index 0000000000..07d359d07c
--- /dev/null
+++ b/support/testing/tests/download/git-remote/refs-sub2.git/config
@@ -0,0 +1,4 @@
+[core]
+	repositoryformatversion = 0
+	filemode = true
+	bare = true
diff --git a/support/testing/tests/download/git-remote/refs-sub2.git/objects/0a/846af45c3e455789435f49f80d70e86b65b9d7 b/support/testing/tests/download/git-remote/refs-sub2.git/objects/0a/846af45c3e455789435f49f80d70e86b65b9d7
new file mode 100644
index 0000000000000000000000000000000000000000..aaa29dbd8a5a74a24f51a8522b695a7474349f3c
GIT binary patch
literal 22
dcmb<m^geacKgb|mL(kXflIasB21Rz}+W=aJ2Uq|A

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/refs-sub2.git/objects/0b/32ebd8fc52cec991f18c94be980e85a8341585 b/support/testing/tests/download/git-remote/refs-sub2.git/objects/0b/32ebd8fc52cec991f18c94be980e85a8341585
new file mode 100644
index 0000000000000000000000000000000000000000..50caf8b6282d2287878d1b3481c14431c2a557af
GIT binary patch
literal 22
dcmb<m^geacKgb|mL(kXflIbHR21QQhI{;dM2U!3B

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/refs-sub2.git/objects/32/d61bae693af7879da63b89a60d3ae67f851e56 b/support/testing/tests/download/git-remote/refs-sub2.git/objects/32/d61bae693af7879da63b89a60d3ae67f851e56
new file mode 100644
index 0000000000000000000000000000000000000000..a8887b1e611d8f76d7cfe6ab0bb693fdebc2ef19
GIT binary patch
literal 151
zcmV;I0BHYs0j<ux4Z<)GKw)Z6aSJ3mJF*iagjj$ECOH3v6LBmVQ?NaeDCiOGS3Esm
za^?nVoOZ3o2-YSQhbX<1I$5VxB4v{?VVE!kLL-BfBRN6Ob}JPw?5TzVXR3`?Umkac
zL;YZ%zj&H6 at zVQ}k03QpsEr&gbf^%;rrSh|f6577xiKw5TzOt&=t@eRd+mRj6>nh7
FU at NX0KJNek

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/refs-sub2.git/objects/3e/9b0a5198c64cea9c00f820433411e3b4d50c1c b/support/testing/tests/download/git-remote/refs-sub2.git/objects/3e/9b0a5198c64cea9c00f820433411e3b4d50c1c
new file mode 100644
index 0000000000000000000000000000000000000000..b1fb722c53d827847c6d13029e601a5434b84ac4
GIT binary patch
literal 48
zcmV-00MGw;0V^p=O;s>9VlXr?Ff%bxNXyJgW#DSb`VwR38s6y~@A-qb;6--o&g%g8
GZVq_HQWiM?

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/refs-sub2.git/objects/85/8f666af75b7c0dfba6b8be7eac5f196e7a1221 b/support/testing/tests/download/git-remote/refs-sub2.git/objects/85/8f666af75b7c0dfba6b8be7eac5f196e7a1221
new file mode 100644
index 0000000000000000000000000000000000000000..10f24a087ff08320b8fc5922db728472bd276e9a
GIT binary patch
literal 49
zcmb<m)YkO!4K*-JGB7bPFg6VIIDN)5^?_Mc?PLE7J0}a<fAhI%-n_oFwKGGTLGrBt
FHvqLX67T>3

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/refs-sub2.git/objects/99/f2e3e1cb15f9b52fa29f66d380dda061d917ab b/support/testing/tests/download/git-remote/refs-sub2.git/objects/99/f2e3e1cb15f9b52fa29f66d380dda061d917ab
new file mode 100644
index 0000000000000000000000000000000000000000..9db72668cf9374b0b85a25a19f30084fd460072d
GIT binary patch
literal 49
zcmb<m)YkO!4K*-JGB7bPFg6VIIDN)5wZcw)UHz=nDZYB`lCt5lYr9_mN?Omvz#_so
F4FHVv5b^*3

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/refs-sub2.git/objects/cd/4d62ff218ab7b4a04f5bfdf800ace087af3ceb b/support/testing/tests/download/git-remote/refs-sub2.git/objects/cd/4d62ff218ab7b4a04f5bfdf800ace087af3ceb
new file mode 100644
index 0000000000000000000000000000000000000000..35d253f0d15b31ea0bc79ed1a287819deed9987d
GIT binary patch
literal 184
zcmV;p07w6L0j<tGZUZ3@hGEy7f(xuQEI$j8W%&YWk`oNWU?YdcVsVk%XQLG9qqL9o
zeR`?YT87lKJ&evQHHQdjRq*5tF$Mz2eg>npQHpgm$pR at 75A3{t50g_7*#(Vx at k>bP
zbo2ooB)#*Jy;W?Tz~{KNF5e1aPffmJA7!Ps-HSZ+A3WAyyj&}mk0Z5umdb($>r7bW
m1T%oxb&nqWPj_N_#(7dgyqD|BX=*u7@$=;`t>O#gcx)*r3s*J(

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/refs-sub2.git/objects/e7/9c5e8f964493290a409888d5413a737e8e5dd5 b/support/testing/tests/download/git-remote/refs-sub2.git/objects/e7/9c5e8f964493290a409888d5413a737e8e5dd5
new file mode 100644
index 0000000000000000000000000000000000000000..df2037a2d2d30afb20e31cd558c92c2edabe7cf6
GIT binary patch
literal 23
fcmb<m^geacKWIb3i8H5lPWqgA$i$$b%kl;Qg;xrl

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/refs-sub2.git/objects/e8/3f6f805bd016b90acafc8702c52d778eb57310 b/support/testing/tests/download/git-remote/refs-sub2.git/objects/e8/3f6f805bd016b90acafc8702c52d778eb57310
new file mode 100644
index 0000000000000000000000000000000000000000..05c04d2887e9354ec43ad69cef20ed4e7166013d
GIT binary patch
literal 182
zcmV;n07?IN0j<tKPD3FOfMM61f(yK6pl<+;F<!upo?r%MT2gr!N*CVVCN8>fy8RY^
z{@h!u)9yV!%^_kFCJiBwM&y{GC{y6X5`{9VdkzxGdGE{*4cVs6Wi7$0dY6bJuLP?i
zYtaNiSs+EyeHJ!!na4itXU#N9w;wcS-Eu#ls(l^*xNA3jKQyY}yWHEGbqEPCphLTW
k2QXK?PEUDI&YUmo7jMj0J#12zuDbB=%RR5=4+?N at DHiEdA^-pY

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/refs-sub2.git/refs/heads/submodule b/support/testing/tests/download/git-remote/refs-sub2.git/refs/heads/submodule
new file mode 100644
index 0000000000..39dc53f019
--- /dev/null
+++ b/support/testing/tests/download/git-remote/refs-sub2.git/refs/heads/submodule
@@ -0,0 +1 @@
+e83f6f805bd016b90acafc8702c52d778eb57310
diff --git a/support/testing/tests/download/git-remote/repo.git/objects/0b/d8ceb961c3b2b210f64a67d57f4b5cd669d343 b/support/testing/tests/download/git-remote/repo.git/objects/0b/d8ceb961c3b2b210f64a67d57f4b5cd669d343
new file mode 100644
index 0000000000000000000000000000000000000000..ef7fbd4154aea755d8ee2684e420700467e9245c
GIT binary patch
literal 22
dcmb<m^geacKgb|mL(kXfg6R_`28I93HvwH&2ulC}

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/25/59d83bfe937fc0412d96ed664663c9e8a99055 b/support/testing/tests/download/git-remote/repo.git/objects/25/59d83bfe937fc0412d96ed664663c9e8a99055
new file mode 100644
index 0000000000000000000000000000000000000000..cbf60fc7298ec12b3d7cd388fecac606ca31536e
GIT binary patch
literal 22
dcmb<m^geacKgb|mL(kXfg6ShB21Q2ZTL4;A2TcF~

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/2f/a37f6885d7eb746df75eccaddbacf3ac82799d b/support/testing/tests/download/git-remote/repo.git/objects/2f/a37f6885d7eb746df75eccaddbacf3ac82799d
new file mode 100644
index 0000000000000000000000000000000000000000..2dd14580e666d35483727598f006148f3eeb03be
GIT binary patch
literal 180
zcmV;l089UP0j-Wp4#FT509|tmF3{!yj~0zFUcil>fX_pTQVgXFZ*LP9?v2|?W-`9y
zoEleBZ(1ed0ZDFA1Yzu;w9*KG<DevlKyHi(Vn9bI*wa>;8n at fvydbGOYBD68F&+ at j
z>O_rU6i9A}CNjIUTdDk<yse?|ldUaHzRdT;_w at t&{DsGBw&~IPk`G*HFrddZ%R7(&
iY^CdTqd(=?yg2A2W0!QDD0C&p&b@ZOys|fCz-zg3O;?Bj

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/8b/8a7e885a041da72b1ee9a47c5b9300b172a9e7 b/support/testing/tests/download/git-remote/repo.git/objects/8b/8a7e885a041da72b1ee9a47c5b9300b172a9e7
new file mode 100644
index 0000000000000000000000000000000000000000..70cf1795f3210f81951d0995823bb958867ba710
GIT binary patch
literal 65
zcmb<m^geacKghs1xkFFS_taT`&9k1N0a{+Z+Sgb=@lH+JX~8YzZ6uN-`XDK0&Qe!P
V2S!`l+8s0Es?s>c8ET5e-2otN7bXAz

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/a9/dbc1e23c45e8e1b88c0448763f54d714eb6f8f b/support/testing/tests/download/git-remote/repo.git/objects/a9/dbc1e23c45e8e1b88c0448763f54d714eb6f8f
new file mode 100644
index 0000000000000000000000000000000000000000..2cbdce1f95493b284df1f8ca3ca953a5fb813072
GIT binary patch
literal 183
zcmV;o07(CM0j<t4ZUZ3@K+)8kf(xuQ14Ce~D9Q!g#3z_#z(F=kgmK~9XC)Wzt+cQB
z`mxnohPKANjh>Ru$&;~&-~u5KipxZpJlJ^_>ocTx0A{Ctxu<n#Ha09MIZ7~2$V;%q
z*+yrKCG>Htpv)kOZ{w$R{aqq=Y5Kr at lr^^Nx#*Anz+HXf*Qs*3>|(2*8XW|19*ox$
l7yz~DHa*fm<<#}Iz=TR2%V|wAwVbErzJKLa{Q<P{YY&#BUEBZw

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/d4/e2941d18a63535400476324ddeb7f40164be41 b/support/testing/tests/download/git-remote/repo.git/objects/d4/e2941d18a63535400476324ddeb7f40164be41
new file mode 100644
index 0000000000000000000000000000000000000000..4d82169300d0d8a2e31ced481501bff6647ef6b7
GIT binary patch
literal 121
zcmV-<0EYi~0V^p=O;s>7uwXDWFfcPQQP4}zEXmDJDa}bOX6Wv!>xg2JU9K(na!F0}
zWQL7JE1yG^rDf)%GN?x0u>Lo>{(z(Iw6|$)$tPc|oDgbgW&i{VMX71Uy2YhQh73O#
b<iZ;SIFpt>=2AU<<YdB}Kh>WBpF}NR{H!<P

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/objects/fe/74231105841041d5f441e70399d37f0e600aa5 b/support/testing/tests/download/git-remote/repo.git/objects/fe/74231105841041d5f441e70399d37f0e600aa5
new file mode 100644
index 0000000000000000000000000000000000000000..6d0ae484c3333d6b18cf726d5bb468669f9d16c1
GIT binary patch
literal 121
zcmV-<0EYi~0V^p=O;s>7uwXDWFfcPQQP4}zEXmDJDa}bOX6Wv!>xg2JU9K(na!F0}
zWQL7JE1yG^rDf)%GH~BGw=?nZrcDChywb1Md&gYMyzFdfW&i{VMX71Uy2YhQh73O#
b<iZ;SIFpt>=2AU<<YdB}Kh>WBwy!O?8)rGE

literal 0
HcmV?d00001

diff --git a/support/testing/tests/download/git-remote/repo.git/refs/heads/submodule b/support/testing/tests/download/git-remote/repo.git/refs/heads/submodule
new file mode 100644
index 0000000000..e9f4f32c30
--- /dev/null
+++ b/support/testing/tests/download/git-remote/repo.git/refs/heads/submodule
@@ -0,0 +1 @@
+2fa37f6885d7eb746df75eccaddbacf3ac82799d
diff --git a/support/testing/tests/download/test_git.py b/support/testing/tests/download/test_git.py
index 279d0ed8eb..803a50d054 100644
--- a/support/testing/tests/download/test_git.py
+++ b/support/testing/tests/download/test_git.py
@@ -69,3 +69,5 @@ class TestGitRefs(GitTestBase):
         self.check_download("git-partial-sha1-reachable-by-branch")
         self.check_download("git-sha1-branch-head")
         self.check_download("git-sha1-reachable-by-branch")
+        self.check_download("git-submodule-disabled")
+        self.check_download("git-submodule-enabled")
-- 
2.17.0
