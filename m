From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 14 Sep 2015 23:03:32 +0200
Subject: [Buildroot] [RFC 0/6] mdev-only /dev management (without
	devtmpfs)
In-Reply-To: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net> (Luca
 Ceresoli's message of "Tue, 8 Sep 2015 23:28:48 +0200")
References: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <877fns3e8r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 > Hi,
 > this patchset adds a new /dev management mechanism, using mdev for
 > dynamic device creation but without relying on devtmpfs.

 > The main motivation is the need of dynamic /dev management and/or firmware
 > loading assisted by mdev on targets that are bound to kernels < 2.6.32,
 > and thus cannot use devtmpfs.

Is combining such old (<2009) kernel with modern userspace really a good
idea?

git grep -l _AT_LEAST package/ | wc -l
48

But that is most likely not all of them, as none of the autobuilders use
such ancient kernel headers.

How old is < 2.6.32? If you look@the commit adding devtmpfs to the
kernel, it seems quite self contained and easy to backport:

git show --stat --oneline 2b2af54a5bb6f7e8
2b2af54 Driver Core: devtmpfs - kernel-maintained tmpfs-based /dev
 drivers/base/Kconfig     |  25 ++++
 drivers/base/Makefile    |   1 +
 drivers/base/base.h      |   6 +
 drivers/base/core.c      |   3 +
 drivers/base/devtmpfs.c  | 367 +++++++++++++++++++++++++++++++++++++++++++++++
 drivers/base/init.c      |   1 +
 include/linux/device.h   |  10 ++
 include/linux/shmem_fs.h |   3 +
 init/do_mounts.c         |   2 +-
 init/main.c              |   2 +
 mm/shmem.c               |   9 +-
 11 files changed, 422 insertions(+), 7 deletions(-)

Have you considered doing that instead?

-- 
Bye, Peter Korsgaard
