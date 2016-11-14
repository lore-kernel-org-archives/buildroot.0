From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Mon, 14 Nov 2016 14:22:32 +0100
Subject: [Buildroot] [PATCH 0/6] Warn user on missing optional dependencies
Message-ID: <20161114132238.6569-1-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following series aim to help developers (maybe with help of autobuilders) to
find missing optional dependencies. The principle is to list shared libraries
needed for each ELF found in $TARGET_DIR and check if it does not missing in
dependency list.

 - Patches 1 and 2 implement this feature
 - Patch 3 is a proposal to make packages-file-list.txt compatible with top
   level parallelize
 - Last 3 patches are fixes for errors I found for my configuration

Notice, I also work on reproducible builds. I am going to send my work soon.
Using it and fixing errors found by current series, I am able to do
reproducible builds with TLP enabled (and without per package staging
directory).

J?r?me Pouiller (6):
  check-shlibs-deps: new script to check shared library dependencies
  pkg-generic: add check_shlibs_deps hooks
  infra: fix 'packages-file-list.txt' with TLP
  ntp: fix missing optional dependencies
  xterm: depend on libXinerama if appropriate
  xserver_xorg-server: fix dependency with dbus

 package/ntp/ntp.mk                                 |  14 ++
 package/pkg-generic.mk                             |  24 +++
 .../xserver_xorg-server/xserver_xorg-server.mk     |   4 +-
 package/xterm/xterm.mk                             |   7 +
 support/scripts/check-shlibs-deps                  | 172 +++++++++++++++++++++
 5 files changed, 219 insertions(+), 2 deletions(-)
 create mode 100755 support/scripts/check-shlibs-deps

-- 
2.9.3
