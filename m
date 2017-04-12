From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed, 12 Apr 2017 08:42:47 -0300
Subject: [Buildroot] [PATCH v7 0/2] e2fsprogs: fix issues regarding merged
	/sbin and /usr/sbin
Message-ID: <1491997369-21394-1-git-send-email-casantos@datacom.ind.br>
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

- Refactor the e2fsprogs recipe to, among other things, prevent it from
  removing/overriding the fsck from util-linux.

- Make systemd select util-linux/fsck to prevent ending up with the fsck
  from busybox, which is not compatible with systemd.

Carlos Santos (2):
  e2fsprogs: refactor to fix conflicts with busybox and util-linux
  systemd: select fsck wrapper from util-linux

 package/e2fsprogs/Config.in      |  87 ++++++++---------------
 package/e2fsprogs/Config.in.host |   1 +
 package/e2fsprogs/e2fsprogs.mk   | 147 ++++++++++++---------------------------
 package/systemd/Config.in        |   6 ++
 4 files changed, 80 insertions(+), 161 deletions(-)

-- 
2.7.4
