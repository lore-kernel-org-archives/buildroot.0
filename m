From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon,  3 Apr 2017 12:06:34 -0300
Subject: [Buildroot] [PATCH v4 0/2] Fix fsck issues regarding merged /sbin
	and /usr/sbin
Message-ID: <1491231996-2461-1-git-send-email-casantos@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since e2fsprogs depends on util-linux, it's build after it. It means
that if you want the fsck wrapper from util-linux (which is better
maintained and you are sure that it's compatible with systemd) and you
want e2fsck, it won't work. Because of the merge of /usr/bin and /bin,
we end up deleting the fsck from util-linux.

In order to solve the problem we need to make two changes:

- Fix e2fsprogs to prevent removing/overriding the fsck from util-linux.
- Make systemd select util-linux/fsck to prevent ending up with the fsck
  from busybox, which is not compatible with systemd.

Carlos Santos (2):
  e2fsprogs: favor util-linux's fsck wrapper over e2fsprogs one
  systemd: select fsck wrapper from util-linux

 package/e2fsprogs/Config.in    |  4 ++++
 package/e2fsprogs/e2fsprogs.mk | 17 ++++++++++++-----
 package/systemd/Config.in      |  6 ++++++
 3 files changed, 22 insertions(+), 5 deletions(-)

-- 
2.7.4
