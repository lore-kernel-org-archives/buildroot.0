From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 24 May 2016 22:46:00 +0200
Subject: [Buildroot] [PATCH v2] dosfstools: security bump to version 4.0
In-Reply-To: <1464120815-9160-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 24 May 2016 17:13:35 -0300")
References: <1464120815-9160-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87lh2z9oc7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Fixes:
 > CVE-2015-8872 - if the third to last entry was written on a FAT12
 > filesystem with an odd number of clusters, the second to last entry
 > would be corrupted. This corruption may also lead to invalid memory
 > accesses when the corrupted entry becomes out of bounds and is used
 > late.

 > CVE-2016-4804 - the variable used for storing the FAT size (in bytes)
 > was an unsigned int. Since the size in sectors read from the BPB was not
 > sufficiently checked, this could end up being zero after multiplying it
 > with the sector size while some offsets still stayed excessive.
 > Ultimately it would cause segfaults when accessing FAT entries for which
 > no memory was allocated.

 > Converted package to autotools infra to match upstream.

 > The install options are now removals, enabled compatibilty symlinks and
 > exec-prefix set to / to match previous install names/locations.

 > Accounted for optional udev usage.

 > Dropped musl compatibility patch since it's upstream.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 > Change for v2: drop duplicate rm -f as pointed by Yann.

Thanks, but it seems it needs some more love for the host variant. First
of all, genimage uses mkdosfs so we need --enable-compat-symlinks for
the host variant as well. After fixing that, pandaboard_defconfig fails
with:

>>>   Executing post-image script board/pandaboard/post-image.sh
vfat(boot.vfat): adding file 'MLO' as 'MLO' ...
Total number of sectors (16384) not a multiple of sectors per track (63)!
Add mtools_skip_check=1 to your .mtoolsrc file to skip this test
vfat(boot.vfat): failed to generate boot.vfat
Makefile:672: recipe for target 'target-post-image' failed

-- 
Bye, Peter Korsgaard
