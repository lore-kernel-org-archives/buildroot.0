From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 6 Feb 2019 09:56:58 +0100
Subject: [Buildroot] [git commit] testing/tests/download: test git submodules
Message-ID: <20190206085554.136F08444C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9cc7a12bdeecfdf3d0d0c3b8ebc1e41069e3ff25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add two submodules as static repos, add a branch to the main static repo
and check on the git refs test case the download of a git package:
 - repo with submodule but without support in the package;
 - repo with recursive submodules with support in the package.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Cc: Arnout Vandecappelle <arnout@mind.be>
[Arnout: remove handling of inconsistent tarball hashes - that's an
 actual bug that should be fixed]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../git-submodule-disabled/git-submodule-disabled.hash    |   2 ++
 .../git-submodule-disabled/git-submodule-disabled.mk      |  11 +++++++++++
 .../git-submodule-enabled/git-submodule-enabled.hash      |   1 +
 .../git-submodule-enabled/git-submodule-enabled.mk        |  11 +++++++++++
 .../download/git-remote/refs-sub1.git/.gitattributes      |   1 +
 .../testing/tests/download/git-remote/refs-sub1.git/HEAD  |   1 +
 .../tests/download/git-remote/refs-sub1.git/config        |   4 ++++
 .../objects/07/cabc655213bdf7087d8dd50fda95124e935570     | Bin 0 -> 22 bytes
 .../objects/1d/f823cb8a6d1866148ae50a8009762a9c4c777f     | Bin 0 -> 180 bytes
 .../objects/7d/52f458bdb0f9f5a4beb46fa82824421b8b988e     | Bin 0 -> 65 bytes
 .../objects/99/f2e3e1cb15f9b52fa29f66d380dda061d917ab     | Bin 0 -> 49 bytes
 .../objects/a1/30af1626bbadd64841b2cbcb6ac4ed0638ba1a     | Bin 0 -> 122 bytes
 .../objects/bc/c81ba6e5bd8bf52c95688ae8d3e697e131fa23     | Bin 0 -> 22 bytes
 .../objects/cb/545facf77bbc5f24f95b6d503c338d10b7b717     |   1 +
 .../objects/dd/130f6f4629514adaf2e03407f3ed9344eb6cd6     | Bin 0 -> 122 bytes
 .../objects/e7/9c5e8f964493290a409888d5413a737e8e5dd5     | Bin 0 -> 23 bytes
 .../objects/f8/001e5780100962a5e30a25cbc4c9609cfc7bf3     | Bin 0 -> 184 bytes
 .../git-remote/refs-sub1.git/refs/heads/submodule         |   1 +
 .../download/git-remote/refs-sub2.git/.gitattributes      |   1 +
 .../testing/tests/download/git-remote/refs-sub2.git/HEAD  |   1 +
 .../tests/download/git-remote/refs-sub2.git/config        |   4 ++++
 .../objects/0a/846af45c3e455789435f49f80d70e86b65b9d7     | Bin 0 -> 22 bytes
 .../objects/0b/32ebd8fc52cec991f18c94be980e85a8341585     | Bin 0 -> 22 bytes
 .../objects/32/d61bae693af7879da63b89a60d3ae67f851e56     |   1 +
 .../objects/3e/9b0a5198c64cea9c00f820433411e3b4d50c1c     | Bin 0 -> 48 bytes
 .../objects/85/8f666af75b7c0dfba6b8be7eac5f196e7a1221     | Bin 0 -> 49 bytes
 .../objects/99/f2e3e1cb15f9b52fa29f66d380dda061d917ab     | Bin 0 -> 49 bytes
 .../objects/cd/4d62ff218ab7b4a04f5bfdf800ace087af3ceb     |   2 ++
 .../objects/e7/9c5e8f964493290a409888d5413a737e8e5dd5     | Bin 0 -> 23 bytes
 .../objects/e8/3f6f805bd016b90acafc8702c52d778eb57310     | Bin 0 -> 182 bytes
 .../git-remote/refs-sub2.git/refs/heads/submodule         |   1 +
 .../objects/0b/d8ceb961c3b2b210f64a67d57f4b5cd669d343     | Bin 0 -> 22 bytes
 .../objects/25/59d83bfe937fc0412d96ed664663c9e8a99055     | Bin 0 -> 22 bytes
 .../objects/2f/a37f6885d7eb746df75eccaddbacf3ac82799d     | Bin 0 -> 180 bytes
 .../objects/8b/8a7e885a041da72b1ee9a47c5b9300b172a9e7     | Bin 0 -> 65 bytes
 .../objects/a9/dbc1e23c45e8e1b88c0448763f54d714eb6f8f     | Bin 0 -> 183 bytes
 .../objects/d4/e2941d18a63535400476324ddeb7f40164be41     | Bin 0 -> 121 bytes
 .../objects/fe/74231105841041d5f441e70399d37f0e600aa5     | Bin 0 -> 121 bytes
 .../download/git-remote/repo.git/refs/heads/submodule     |   1 +
 support/testing/tests/download/test_git.py                |   2 ++
 40 files changed, 46 insertions(+)

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
index 0000000000..7f92c652d3
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.hash
@@ -0,0 +1 @@
+sha256  139a34c3c844c844dee74b6746418cfa75fbcc4205794ac8c0b3cd7d55a76792  git-submodule-enabled-a9dbc1e23c45e8e1b88c0448763f54d714eb6f8f.tar.gz
diff --git a/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.mk b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.mk
new file mode 100644
index 0000000000..48a42f5e8a
--- /dev/null
+++ b/support/testing/tests/download/br2-external/git-refs/package/git-submodule-enabled/git-submodule-enabled.mk
@@ -0,0 +1,11 @@
+################################################################################
+#
+# git-submodule-enabled
+#
+################################################################################
+
+GIT_SUBMODULE_ENABLED_VERSION = a9dbc1e23c45e8e1b88c0448763f54d714eb6f8f
+GIT_SUBMODULE_ENABLED_SITE = git://localhost:$(GITREMOTE_PORT_NUMBER)/repo.git
+GIT_SUBMODULE_ENABLED_GIT_SUBMODULES = YES
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
index 0000000000..cbf5085af8
Binary files /dev/null and b/support/testing/tests/download/git-remote/refs-sub1.git/objects/07/cabc655213bdf7087d8dd50fda95124e935570 differ
diff --git a/support/testing/tests/download/git-remote/refs-sub1.git/objects/1d/f823cb8a6d1866148ae50a8009762a9c4c777f b/support/testing/tests/download/git-remote/refs-sub1.git/objects/1d/f823cb8a6d1866148ae50a8009762a9c4c777f
new file mode 100644
index 0000000000..04055b899e
Binary files /dev/null and b/support/testing/tests/download/git-remote/refs-sub1.git/objects/1d/f823cb8a6d1866148ae50a8009762a9c4c777f differ
diff --git a/support/testing/tests/download/git-remote/refs-sub1.git/objects/7d/52f458bdb0f9f5a4beb46fa82824421b8b988e b/support/testing/tests/download/git-remote/refs-sub1.git/objects/7d/52f458bdb0f9f5a4beb46fa82824421b8b988e
new file mode 100644
index 0000000000..2b78a01965
Binary files /dev/null and b/support/testing/tests/download/git-remote/refs-sub1.git/objects/7d/52f458bdb0f9f5a4beb46fa82824421b8b988e differ
diff --git a/support/testing/tests/download/git-remote/refs-sub1.git/objects/99/f2e3e1cb15f9b52fa29f66d380dda061d917ab b/support/testing/tests/download/git-remote/refs-sub1.git/objects/99/f2e3e1cb15f9b52fa29f66d380dda061d917ab
new file mode 100644
index 0000000000..9db72668cf
Binary files /dev/null and b/support/testing/tests/download/git-remote/refs-sub1.git/objects/99/f2e3e1cb15f9b52fa29f66d380dda061d917ab differ
diff --git a/support/testing/tests/download/git-remote/refs-sub1.git/objects/a1/30af1626bbadd64841b2cbcb6ac4ed0638ba1a b/support/testing/tests/download/git-remote/refs-sub1.git/objects/a1/30af1626bbadd64841b2cbcb6ac4ed0638ba1a
new file mode 100644
index 0000000000..f49d53326e
Binary files /dev/null and b/support/testing/tests/download/git-remote/refs-sub1.git/objects/a1/30af1626bbadd64841b2cbcb6ac4ed0638ba1a differ
diff --git a/support/testing/tests/download/git-remote/refs-sub1.git/objects/bc/c81ba6e5bd8bf52c95688ae8d3e697e131fa23 b/support/testing/tests/download/git-remote/refs-sub1.git/objects/bc/c81ba6e5bd8bf52c95688ae8d3e697e131fa23
new file mode 100644
index 0000000000..7d2a9d55c1
Binary files /dev/null and b/support/testing/tests/download/git-remote/refs-sub1.git/objects/bc/c81ba6e5bd8bf52c95688ae8d3e697e131fa23 differ
diff --git a/support/testing/tests/download/git-remote/refs-sub1.git/objects/cb/545facf77bbc5f24f95b6d503c338d10b7b717 b/support/testing/tests/download/git-remote/refs-sub1.git/objects/cb/545facf77bbc5f24f95b6d503c338d10b7b717
new file mode 100644
index 0000000000..dc7de29459
--- /dev/null
+++ b/support/testing/tests/download/git-remote/refs-sub1.git/objects/cb/545facf77bbc5f24f95b6d503c338d10b7b717
@@ -0,0 +1 @@
+x????0@ajOq$:;?#?X?&8??q,S?=?(??W<=_r?j?v???&?(??:Y?U"e?1a?0B#??#9A?v+.???g??W_w?C?`??x?3????? 5N??4*D??6???r?WnL?W????R?^?_f?W`
\ No newline at end of file
diff --git a/support/testing/tests/download/git-remote/refs-sub1.git/objects/dd/130f6f4629514adaf2e03407f3ed9344eb6cd6 b/support/testing/tests/download/git-remote/refs-sub1.git/objects/dd/130f6f4629514adaf2e03407f3ed9344eb6cd6
new file mode 100644
index 0000000000..37037d3920
Binary files /dev/null and b/support/testing/tests/download/git-remote/refs-sub1.git/objects/dd/130f6f4629514adaf2e03407f3ed9344eb6cd6 differ
diff --git a/support/testing/tests/download/git-remote/refs-sub1.git/objects/e7/9c5e8f964493290a409888d5413a737e8e5dd5 b/support/testing/tests/download/git-remote/refs-sub1.git/objects/e7/9c5e8f964493290a409888d5413a737e8e5dd5
new file mode 100644
index 0000000000..df2037a2d2
Binary files /dev/null and b/support/testing/tests/download/git-remote/refs-sub1.git/objects/e7/9c5e8f964493290a409888d5413a737e8e5dd5 differ
diff --git a/support/testing/tests/download/git-remote/refs-sub1.git/objects/f8/001e5780100962a5e30a25cbc4c9609cfc7bf3 b/support/testing/tests/download/git-remote/refs-sub1.git/objects/f8/001e5780100962a5e30a25cbc4c9609cfc7bf3
new file mode 100644
index 0000000000..d824d3c17c
Binary files /dev/null and b/support/testing/tests/download/git-remote/refs-sub1.git/objects/f8/001e5780100962a5e30a25cbc4c9609cfc7bf3 differ
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
index 0000000000..aaa29dbd8a
Binary files /dev/null and b/support/testing/tests/download/git-remote/refs-sub2.git/objects/0a/846af45c3e455789435f49f80d70e86b65b9d7 differ
diff --git a/support/testing/tests/download/git-remote/refs-sub2.git/objects/0b/32ebd8fc52cec991f18c94be980e85a8341585 b/support/testing/tests/download/git-remote/refs-sub2.git/objects/0b/32ebd8fc52cec991f18c94be980e85a8341585
new file mode 100644
index 0000000000..50caf8b628
Binary files /dev/null and b/support/testing/tests/download/git-remote/refs-sub2.git/objects/0b/32ebd8fc52cec991f18c94be980e85a8341585 differ
diff --git a/support/testing/tests/download/git-remote/refs-sub2.git/objects/32/d61bae693af7879da63b89a60d3ae67f851e56 b/support/testing/tests/download/git-remote/refs-sub2.git/objects/32/d61bae693af7879da63b89a60d3ae67f851e56
new file mode 100644
index 0000000000..a8887b1e61
--- /dev/null
+++ b/support/testing/tests/download/git-remote/refs-sub2.git/objects/32/d61bae693af7879da63b89a60d3ae67f851e56
@@ -0,0 +1 @@
+x????0@ajOq$:;?#?X?&8??q,S?=?(??W<=_r?j?v???&?(??:Y?U"e?1a?0B#??#9A?v+.???g??W_w?C?`??x?3????? 5N??-t????D??	^?1-B\y^c?JJ?{??o`?`+
\ No newline at end of file
diff --git a/support/testing/tests/download/git-remote/refs-sub2.git/objects/3e/9b0a5198c64cea9c00f820433411e3b4d50c1c b/support/testing/tests/download/git-remote/refs-sub2.git/objects/3e/9b0a5198c64cea9c00f820433411e3b4d50c1c
new file mode 100644
index 0000000000..b1fb722c53
Binary files /dev/null and b/support/testing/tests/download/git-remote/refs-sub2.git/objects/3e/9b0a5198c64cea9c00f820433411e3b4d50c1c differ
diff --git a/support/testing/tests/download/git-remote/refs-sub2.git/objects/85/8f666af75b7c0dfba6b8be7eac5f196e7a1221 b/support/testing/tests/download/git-remote/refs-sub2.git/objects/85/8f666af75b7c0dfba6b8be7eac5f196e7a1221
new file mode 100644
index 0000000000..10f24a087f
Binary files /dev/null and b/support/testing/tests/download/git-remote/refs-sub2.git/objects/85/8f666af75b7c0dfba6b8be7eac5f196e7a1221 differ
diff --git a/support/testing/tests/download/git-remote/refs-sub2.git/objects/99/f2e3e1cb15f9b52fa29f66d380dda061d917ab b/support/testing/tests/download/git-remote/refs-sub2.git/objects/99/f2e3e1cb15f9b52fa29f66d380dda061d917ab
new file mode 100644
index 0000000000..9db72668cf
Binary files /dev/null and b/support/testing/tests/download/git-remote/refs-sub2.git/objects/99/f2e3e1cb15f9b52fa29f66d380dda061d917ab differ
diff --git a/support/testing/tests/download/git-remote/refs-sub2.git/objects/cd/4d62ff218ab7b4a04f5bfdf800ace087af3ceb b/support/testing/tests/download/git-remote/refs-sub2.git/objects/cd/4d62ff218ab7b4a04f5bfdf800ace087af3ceb
new file mode 100644
index 0000000000..35d253f0d1
--- /dev/null
+++ b/support/testing/tests/download/git-remote/refs-sub2.git/objects/cd/4d62ff218ab7b4a04f5bfdf800ace087af3ceb
@@ -0,0 +1,2 @@
+x??=n!?a????5,??e?i??`#??bq??g??????}z??Z???=??,5?hU??1?~??Q?u4?)??~?S??y?KH?t?$????Ul?????.?
+aOM?be????<?<?_?\+??#?z????LX?3??u??Owb{?yRB????ij9O???/???xl)
\ No newline@end of file
diff --git a/support/testing/tests/download/git-remote/refs-sub2.git/objects/e7/9c5e8f964493290a409888d5413a737e8e5dd5 b/support/testing/tests/download/git-remote/refs-sub2.git/objects/e7/9c5e8f964493290a409888d5413a737e8e5dd5
new file mode 100644
index 0000000000..df2037a2d2
Binary files /dev/null and b/support/testing/tests/download/git-remote/refs-sub2.git/objects/e7/9c5e8f964493290a409888d5413a737e8e5dd5 differ
diff --git a/support/testing/tests/download/git-remote/refs-sub2.git/objects/e8/3f6f805bd016b90acafc8702c52d778eb57310 b/support/testing/tests/download/git-remote/refs-sub2.git/objects/e8/3f6f805bd016b90acafc8702c52d778eb57310
new file mode 100644
index 0000000000..05c04d2887
Binary files /dev/null and b/support/testing/tests/download/git-remote/refs-sub2.git/objects/e8/3f6f805bd016b90acafc8702c52d778eb57310 differ
diff --git a/support/testing/tests/download/git-remote/refs-sub2.git/refs/heads/submodule b/support/testing/tests/download/git-remote/refs-sub2.git/refs/heads/submodule
new file mode 100644
index 0000000000..39dc53f019
--- /dev/null
+++ b/support/testing/tests/download/git-remote/refs-sub2.git/refs/heads/submodule
@@ -0,0 +1 @@
+e83f6f805bd016b90acafc8702c52d778eb57310
diff --git a/support/testing/tests/download/git-remote/repo.git/objects/0b/d8ceb961c3b2b210f64a67d57f4b5cd669d343 b/support/testing/tests/download/git-remote/repo.git/objects/0b/d8ceb961c3b2b210f64a67d57f4b5cd669d343
new file mode 100644
index 0000000000..ef7fbd4154
Binary files /dev/null and b/support/testing/tests/download/git-remote/repo.git/objects/0b/d8ceb961c3b2b210f64a67d57f4b5cd669d343 differ
diff --git a/support/testing/tests/download/git-remote/repo.git/objects/25/59d83bfe937fc0412d96ed664663c9e8a99055 b/support/testing/tests/download/git-remote/repo.git/objects/25/59d83bfe937fc0412d96ed664663c9e8a99055
new file mode 100644
index 0000000000..cbf60fc729
Binary files /dev/null and b/support/testing/tests/download/git-remote/repo.git/objects/25/59d83bfe937fc0412d96ed664663c9e8a99055 differ
diff --git a/support/testing/tests/download/git-remote/repo.git/objects/2f/a37f6885d7eb746df75eccaddbacf3ac82799d b/support/testing/tests/download/git-remote/repo.git/objects/2f/a37f6885d7eb746df75eccaddbacf3ac82799d
new file mode 100644
index 0000000000..2dd14580e6
Binary files /dev/null and b/support/testing/tests/download/git-remote/repo.git/objects/2f/a37f6885d7eb746df75eccaddbacf3ac82799d differ
diff --git a/support/testing/tests/download/git-remote/repo.git/objects/8b/8a7e885a041da72b1ee9a47c5b9300b172a9e7 b/support/testing/tests/download/git-remote/repo.git/objects/8b/8a7e885a041da72b1ee9a47c5b9300b172a9e7
new file mode 100644
index 0000000000..70cf1795f3
Binary files /dev/null and b/support/testing/tests/download/git-remote/repo.git/objects/8b/8a7e885a041da72b1ee9a47c5b9300b172a9e7 differ
diff --git a/support/testing/tests/download/git-remote/repo.git/objects/a9/dbc1e23c45e8e1b88c0448763f54d714eb6f8f b/support/testing/tests/download/git-remote/repo.git/objects/a9/dbc1e23c45e8e1b88c0448763f54d714eb6f8f
new file mode 100644
index 0000000000..2cbdce1f95
Binary files /dev/null and b/support/testing/tests/download/git-remote/repo.git/objects/a9/dbc1e23c45e8e1b88c0448763f54d714eb6f8f differ
diff --git a/support/testing/tests/download/git-remote/repo.git/objects/d4/e2941d18a63535400476324ddeb7f40164be41 b/support/testing/tests/download/git-remote/repo.git/objects/d4/e2941d18a63535400476324ddeb7f40164be41
new file mode 100644
index 0000000000..4d82169300
Binary files /dev/null and b/support/testing/tests/download/git-remote/repo.git/objects/d4/e2941d18a63535400476324ddeb7f40164be41 differ
diff --git a/support/testing/tests/download/git-remote/repo.git/objects/fe/74231105841041d5f441e70399d37f0e600aa5 b/support/testing/tests/download/git-remote/repo.git/objects/fe/74231105841041d5f441e70399d37f0e600aa5
new file mode 100644
index 0000000000..6d0ae484c3
Binary files /dev/null and b/support/testing/tests/download/git-remote/repo.git/objects/fe/74231105841041d5f441e70399d37f0e600aa5 differ
diff --git a/support/testing/tests/download/git-remote/repo.git/refs/heads/submodule b/support/testing/tests/download/git-remote/repo.git/refs/heads/submodule
new file mode 100644
index 0000000000..e9f4f32c30
--- /dev/null
+++ b/support/testing/tests/download/git-remote/repo.git/refs/heads/submodule
@@ -0,0 +1 @@
+2fa37f6885d7eb746df75eccaddbacf3ac82799d
diff --git a/support/testing/tests/download/test_git.py b/support/testing/tests/download/test_git.py
index 83fb6fe3cd..121c9191d8 100644
--- a/support/testing/tests/download/test_git.py
+++ b/support/testing/tests/download/test_git.py
@@ -70,3 +70,5 @@ class TestGitRefs(GitTestBase):
         self.check_download("git-partial-sha1-reachable-by-branch")
         self.check_download("git-sha1-branch-head")
         self.check_download("git-sha1-reachable-by-branch")
+        self.check_download("git-submodule-disabled")
+        self.check_download("git-submodule-enabled")
