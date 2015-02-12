From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Feb 2015 22:28:17 +0100
Subject: [Buildroot] [git commit] python3: fix invalid ncursesw header path
Message-ID: <20150212213154.217AF81791@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=414d7e97a7359be87ef3b622c409e4200a8991ff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a patch to python3 that makes sure it does not use an
invalid header path (pointing to host headers) when including ncursesw
support.

Fixes:

  http://autobuild.buildroot.org/results/9bd/9bdaa392e8dd00c6ebee156b758e3c0cac480237/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Tested-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../018-ncursesw-remove-wrong-includedir.patch     |   21 ++++++++++++++++++++
 1 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/package/python3/018-ncursesw-remove-wrong-includedir.patch b/package/python3/018-ncursesw-remove-wrong-includedir.patch
new file mode 100644
index 0000000..ae87bbf
--- /dev/null
+++ b/package/python3/018-ncursesw-remove-wrong-includedir.patch
@@ -0,0 +1,21 @@
+Do not harcode invalid path to ncursesw headers
+
+Adding /usr/include/ncursesw is obviously invalid when
+cross-compiling. Since the ncursesw headers are no longer installed in
+usr/include/ncursesw/, but directly in usr/include, there is anyway no
+need for a special header path.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+
+Index: b/setup.py
+===================================================================
+--- a/setup.py
++++ b/setup.py
+@@ -1287,7 +1287,6 @@
+         panel_library = 'panel'
+         if curses_library == 'ncursesw':
+             curses_defines.append(('HAVE_NCURSESW', '1'))
+-            curses_includes.append('/usr/include/ncursesw')
+             # Bug 1464056: If _curses.so links with ncursesw,
+             # _curses_panel.so must link with panelw.
+             panel_library = 'panelw'
