From: Joe Lin <xlcwu.taiwan@gmail.com>
Date: Wed,  8 May 2019 03:38:11 +0000
Subject: [Buildroot] [PATCH] package/systemd: show correct version info
Message-ID: <20190508033811.7090-1-xlcwu.taiwan@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When systemd running show wrong version in dmesg log:
systemd[1]: systemd 2019.02-1086-gf5f17c4 running in system mode.
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Shoule be:
systemd[1]: systemd 241 running in system mode. (-PAM -AUDIT -SEL
            ^^^^^^^^^^^
Fix:
  Get version info using git, ensure to get right git tree.
    meson.build call vcs-tagger
    - meson.build:vcs_tagger =
       [meson.source_root() + '/tools/meson-vcs-tag.sh',
    - script "meson-vcs-tag.sh" execute `git describe` directly
  So
    add "--git-dir ./.git" into the script "tools/meson-vcs-tag.sh"
    to ensure systemd in br2 tree can get correct version info.

Signed-off-by: Joe Lin <xlcwu.taiwan@gmail.com>

---
 ...-correct-version-info-when-build-in-br2-git-tree.patch | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 package/systemd/0005-show-correct-version-info-when-build-in-br2-git-tree.patch

diff --git a/package/systemd/0005-show-correct-version-info-when-build-in-br2-git-tree.patch b/package/systemd/0005-show-correct-version-info-when-build-in-br2-git-tree.patch
new file mode 100644
index 0000000000..41e83dffb6
--- /dev/null
+++ b/package/systemd/0005-show-correct-version-info-when-build-in-br2-git-tree.patch
@@ -0,0 +1,8 @@
+--- a/tools/meson-vcs-tag.sh	2019-05-07 08:53:51.527553144 +0000
++++ b/tools/meson-vcs-tag.sh	2019-05-07 08:35:49.152813721 +0000
+@@ -15,4 +15,4 @@
+ # Apparently git describe has a bug where it always considers the work-tree
+ # dirty when invoked with --git-dir (even though 'git status' is happy). Work
+ # around this issue by cd-ing to the source directory.
+-cd "$dir" && git describe --abbrev=7 --dirty=+ 2>/dev/null | sed 's/^v//' || echo "$fallback"
++cd "$dir" && git --git-dir ./.git describe --abbrev=7 --dirty=+ 2>/dev/null | sed 's/^v//' || echo "$fallback"
-- 
2.17.1
