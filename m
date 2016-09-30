From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Fri, 30 Sep 2016 12:09:52 +0200
Subject: [Buildroot] [PATCH 0/2] Symlinks in compilation path confuse
	check-host-rpath
Message-ID: <1475230194-18524-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If user do:

      $ ln -s /opt/buildroot /opt/buildroot-symblink
      $ cd /opt/buildroot-symlink
      $ make O=out
      $ make -C out package-rebuild

the last command produce an error since already installed host binaries
contains /opt/buildroot/out/host/usr/lib as rpath while check-host-rpath expect
/opt/buildroot-symlink/out/host/usr/lib

These two patch solve this issue. First patch only fix check-host-rpath. However,
other tools may be impacted by this issue, so I wrote a second patch to use
canonicalized path everywhere.

J?r?me Pouiller (2):
  check-host-rpath: support symlinks in rpath
  Canonicalize $(BASE_DIR)

 Makefile                         | 2 +-
 support/scripts/check-host-rpath | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
1.9.1
