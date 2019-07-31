From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 31 Jul 2019 14:45:16 +0200
Subject: [Buildroot] btrfs filesystem image creation using TARGET_DIR
 path
In-Reply-To: <CAP8JTaaqcBbCdoJHm5=zi0dc4NtNaq2Y=krx0UbCVz4PdB2sJw@mail.gmail.com>
References: <CAP8JTaaqcBbCdoJHm5=zi0dc4NtNaq2Y=krx0UbCVz4PdB2sJw@mail.gmail.com>
Message-ID: <20190731144516.06e94517@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 30 Jul 2019 18:33:52 +0530
chalil jitesh <chaliljitesh@gmail.com> wrote:

>  Hi,
> 
> I am trying to create a btrfs filesystem image from buildroot (buildroot
> 2019.02 version). During the btrfs image creation step in the file
> buildroot/fs/btrfs/btrfs.mk the target root file system directory path
> passed to -r option seems to be given as $(TARGET_DIR) which is pointing to
> build/buildroot-fs/btrfs/target instead of actual root file system
> directory $(BASE_TARGET_DIR) (as followed for other file system image
> creation like buildroot/fs/squashfs/squashfs.mk).
> Kindly please review if my understanding is correct or if i am mising any
> steps and if the -r option should point to $(BASE_TARGET_DIR).
> Attaching the changes done for review.

Using $(TARGET_DIR) is correct. What is the problem you are seeing ?

The way it works is the following:

 - BASE_TARGET_DIR is output/target. This is where all packages install
   their files that should be present on the target. During the package
   build/installation, TARGET_DIR points to BASE_TARGET_DIR.

 - For each filesystem image format that is enabled, a copy of the
   contents of BASE_TARGET_DIR is made, in a per-filesystem directory,
   output/build/buildroot-fs/<filesystem>/target

 - In the code creating each filesystem image, TARGET_DIR points to
   output/build/buildroot-fs/<filesystem>/target.

So, using $(TARGET_DIR) in btrfs.mk is correct.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
