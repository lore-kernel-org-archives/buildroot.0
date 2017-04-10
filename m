From: Carlos Santos <casantos@datacom.ind.br>
Date: Mon, 10 Apr 2017 00:23:14 -0300
Subject: [Buildroot] [PATCH v5 0/2] e2fsprogs: fix issues when
	BR2_ROOTFS_MERGED_USR=y
Message-ID: <1491794596-8454-1-git-send-email-casantos@datacom.ind.br>
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

The root cause of this problem is the cluncky attempt to coexist with
busybox and util-linux. In order to solve the problem we need to make
two changes:

- Refactor e2fsprogs, making it override any utility coming from busybox
  and favoring the fsck wrapper from util-linux.
- Make systemd select util-linux/fsck to prevent ending up with the fsck
  from busybox, which is not compatible with systemd.

Carlos Santos (2):
  e2fsprogs: refactor to fix conflicts with busybox and util-linux
  systemd: select util-linux/fsck and e2fsprogs/e2fsck

 package/e2fsprogs/Config.in      |  84 +++++++---------------
 package/e2fsprogs/Config.in.host |   1 +
 package/e2fsprogs/e2fsprogs.mk   | 149 +++++++++++----------------------------
 package/systemd/Config.in        |   3 +
 4 files changed, 71 insertions(+), 166 deletions(-)

-- 
2.7.4
