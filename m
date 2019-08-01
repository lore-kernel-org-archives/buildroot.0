From: chalil jitesh <chaliljitesh@gmail.com>
Date: Thu, 1 Aug 2019 12:19:49 +0530
Subject: [Buildroot] btrfs filesystem image creation using TARGET_DIR
 path
In-Reply-To: <20190731144516.06e94517@windsurf>
References: <CAP8JTaaqcBbCdoJHm5=zi0dc4NtNaq2Y=krx0UbCVz4PdB2sJw@mail.gmail.com>
 <20190731144516.06e94517@windsurf>
Message-ID: <CAP8JTaY_9cS7vTMK_hxJsn2USEuKVZnNjj-s1bXP8fkXbipLMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thanks for reviewing and providing the information.

The following is the issue i am facing when using the TARGET_DIR.
Suppose we set any capabilities to the files in the BASE_TARGET_DIR
(./target in the below example) during the buildroot compilation. Example
if we set some capabilities to the tool ping in BASE_TARGET_DIR as in
example below.
example : setcap cap_net_raw=ei ./target/bin/ping
If we use BASE_TARGET_DIR with the -r option in buildroot/fs/btrfs/btrfs.mk
(buildroot/fs/btrfs/btrfs.mk : -r '$(BASE_TARGET_DIR)')
After the rootfs.btrfs image is generated from buildroot, if we mount the
btrfs file sytem and check the capability of the file ping, the capability
is getting retained in the btrfs file system generated as in example below
(if BASE_TARGET_DIR  is used btrfs.mk).
[root at localhost images]# mkdir test
[root at localhost images]# mount -t btrfs ./rootfs.btrfs test
[root at localhost images]# getcap ./test/bin/ping
./test/bin/ping = cap_net_raw+ei
[root at localhost images]#

Instead of BASE_TARGET_DIR If we use TARGET_DIR with the -r option in
buildroot/fs/btrfs/btrfs.mk (buildroot/fs/btrfs/btrfs.mk : -r
'$(TARGET_DIR)')
After the rootfs.btrfs image is generated from buildroot, if we mount the
btrfs file sytem and check the capability of the file ping, the capability
is not getting retained and is lost in the btrfs file system generated as
in example below (if TARGET_DIR  is used btrfs.mk)..
[root at localhost images]# mount -t btrfs ./rootfs.btrfs test
[root at localhost images]# getcap ./test/bin/ping
[root at localhost images]#

During image creation process if we check the capability of the file
ping in TARGET_DIR (example build/buildroot-fs/btrfs/target/bin/ping) , in
this path also the capability is not retained and is missed as in example
below.
[root at localhost ~]# getcap ./build/buildroot-fs/btrfs/target/bin/ping
[root at localhost ~]#

Kindly please suggest why the capabilities are not getting retained and
getting lost in TARGET_DIR.

With Thanks and Regards
Jitesh


On Wed, Jul 31, 2019 at 6:15 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> On Tue, 30 Jul 2019 18:33:52 +0530
> chalil jitesh <chaliljitesh@gmail.com> wrote:
>
> >  Hi,
> >
> > I am trying to create a btrfs filesystem image from buildroot (buildroot
> > 2019.02 version). During the btrfs image creation step in the file
> > buildroot/fs/btrfs/btrfs.mk the target root file system directory path
> > passed to -r option seems to be given as $(TARGET_DIR) which is pointing
> to
> > build/buildroot-fs/btrfs/target instead of actual root file system
> > directory $(BASE_TARGET_DIR) (as followed for other file system image
> > creation like buildroot/fs/squashfs/squashfs.mk).
> > Kindly please review if my understanding is correct or if i am mising any
> > steps and if the -r option should point to $(BASE_TARGET_DIR).
> > Attaching the changes done for review.
>
> Using $(TARGET_DIR) is correct. What is the problem you are seeing ?
>
> The way it works is the following:
>
>  - BASE_TARGET_DIR is output/target. This is where all packages install
>    their files that should be present on the target. During the package
>    build/installation, TARGET_DIR points to BASE_TARGET_DIR.
>
>  - For each filesystem image format that is enabled, a copy of the
>    contents of BASE_TARGET_DIR is made, in a per-filesystem directory,
>    output/build/buildroot-fs/<filesystem>/target
>
>  - In the code creating each filesystem image, TARGET_DIR points to
>    output/build/buildroot-fs/<filesystem>/target.
>
> So, using $(TARGET_DIR) in btrfs.mk is correct.
>
> Best regards,
>
> Thomas Petazzoni
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190801/89986097/attachment.html>
