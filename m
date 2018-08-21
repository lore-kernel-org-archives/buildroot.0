From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Aug 2018 23:59:50 +0200
Subject: [Buildroot] [PATCH next 0/4] btrfs-progs related improvements
Message-ID: <20180821215954.11971-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Following the addition of host-btrfs-progs recently by Robert
J. Heywood, I wondered why e2fsprogs was needed as a
dependency. Indeed, why would btrfs need the library of a completely
different filesystem?

Turns out it's because btrfs-progs can optionally build a tool called
btrfs-convert, to convert an ext2 or reiserfs filesystem to a btrfs
one, and this tool needs e2fsprogs as a dependency to support ext2
filesystem conversion. But this is completely optional.

For the host variant, I don't think it makes sense to support that at
all, so we forcibly disable building btrfs-convert.

For the target variant, e2fsprogs is turned into an automatic optional
dependency: when available, btrfs-convert is compiled with ext2
support, otherwise btrfs-convert is not built at all. We don't take
into account reiserfs support because we don't have the corresponding
libraries packaged in Buildroot.

While doing this work on the host variant, I noticed the e2fsprogs and
lzo host libraries were only available as static libraries. So I went
ahead and fixed that as well.

Best regards,

Thomas

Thomas Petazzoni (4):
  lzo: build shared library for the host
  e2fsprogs: build shared library for the host
  btrfs-progs: drop dependency on e2fsprogs by not building
    btrfs-convert
  btrfs-progs: make e2fsprogs an optional dependency

 package/btrfs-progs/Config.in      |  1 -
 package/btrfs-progs/btrfs-progs.mk | 20 +++++++++++++++++---
 package/e2fsprogs/e2fsprogs.mk     |  3 ++-
 package/lzo/lzo.mk                 |  2 ++
 4 files changed, 21 insertions(+), 5 deletions(-)

-- 
2.14.4
