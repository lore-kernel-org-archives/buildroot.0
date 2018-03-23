From: Ben Whitten <ben.whitten@gmail.com>
Date: Fri, 23 Mar 2018 18:21:17 +0000
Subject: [Buildroot] [PATCH RESEND 0/2] Verified boot tooling
Message-ID: <1521829279-5156-1-git-send-email-ben.whitten@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
As my previous patches were eaten by the mailman because I hadn't subscribed
to the mailing list, this is a resend so that all can see.
From the comments currently this is probbably not the way to approach what
I am trying to do, but is interesting nevertheless.

My goal is to have a UBI containing a squashfs volume, dm-verity hash table,
and kernel FIT.
Currently the way to do that would be get buildroot to generate the individual
artifacts, rootfs.squashfs, zImage, some.dtb, then assemble the UBI per board.
Using post_image processingi, hash the rootfs.squashfs with veritysetup,
assemble the FIT, then assemble with ubinize directly (or genimage now that I
see there is FIT support ~4 days ago).

As there are already KConfigs around the various ubinize options for ubi+ubifs
I split these apart and added depends so that the UBI step came last. This meant
that my ubinize.cfg could point at the squashfs and verity artifacts.

I'm happy either way, if post processing is the way to go so be it but it seems
there may be a lot of duplicated code of people attempting the same sort of
things, quite a lot just point at or wrap genimage.

Thanks,
Ben Whitten (2):
  fs/ubi: decouple ubi & ubifs
  fs/squashfs: enable squashfs to generate a verity hashtable

 fs/Config.in            |  3 ++-
 fs/squashfs/Config.in   |  6 ++++++
 fs/squashfs/squashfs.mk | 10 ++++++++++
 fs/ubi/Config.in        | 34 +++++++++++++++++++++++++++++++---
 fs/ubi/ubi.mk           | 14 +++++++++++++-
 fs/ubi/ubinize.cfg      |  4 ++--
 fs/ubifs/Config.in      |  2 ++
 7 files changed, 66 insertions(+), 7 deletions(-)

-- 
2.7.4
