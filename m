From: Steve Calfee <stevecalfee@gmail.com>
Date: Wed, 24 Feb 2016 07:59:52 -0800
Subject: [Buildroot] user question about ubi nand
In-Reply-To: <1456307366.1989.30.camel@embedded.rocks>
References: <CAJJ6jxu+5mSnNq6hmnCS1nB5cx8qmyip5qoRONjtw1WHUqox5A@mail.gmail.com>
 <1456307366.1989.30.camel@embedded.rocks>
Message-ID: <CAJJ6jxuC32QtbKKiZM5ze-oGDDoDBDbXZ5-HWUWFCy81K5kHZw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Feb 24, 2016 at 1:49 AM, J?rg Krause
<joerg.krause@embedded.rocks> wrote:
> Hi Steve,
>
> On Di, 2016-02-23 at 19:34 -0800, Steve Calfee wrote:
>> Ubi seems very well supported in buildroot and linux. The problem is
>> figuring out how to use it.
>>

>
> These are a lot of questions :-)
>
> I guess you already read the MTD docs [1]. It has a lot of useful
> information about NAND, UBI, and UBIFS...
>
Yes, in fact I manually have built my fs. What I am trying to do is
figure out the approved, "buildroot way". Sorry about the number of
questions.

> I use Buildroot to build a ro rootfs, a rw overlayfs and a rw data
> partition. I configured to BR to create a UBIFS rootfs
> (BR2_TARGET_ROOTFS_UBIFS). The parameters like LEB size depends on your
> NAND device and partition layout (see [1]).

So I just have to know, there is no tool that probes for that information?

>
> The data UBIFS and UBI image is created in the post-image script.
> Again, the parameter values for the mkfs.ubifs and ubinize tools
> depends on your NAND device and partition layout.
>

Yes and I found in menuconfig the multiple places where programs and
params are set. And the linux-menuconfig must also have some ubi
related things set.

> To append the data parition to your filesystem you'll need to add an
> entry to fstab, eg.
> "ubi1:data      /data   ubifs   defaults        0       0"
>
> You can use fstab to move parts of your system to another partition,
> tool.
>

Thanks, that is a valuable tip. How do people ordinarily alter fstab?
I can put the entire file in the skeleton overlay or I could do a
patch in a post script. Which is better?

http://free-electrons.com/blog/creating-flashing-ubi-ubifs-images/ has
good information, but not really how to integrate the techniques into
buildroot. Specifically how to use their suggested

[rootfs_volume]
mode=ubi
image=rootfs.ubifs
vol_id=1
vol_type=static
vol_name=rootfs
vol_alignment=1

[rwdata_volume]
mode=ubi
image=data.ubifs
vol_id=2
vol_type=dynamic
vol_name=data
vol_alignment=1
vol_flags=autoresize

Which is different from the ubinize.cfg built into buildroot
[ubifs]
mode=ubi
vol_id=0
vol_type=dynamic
vol_name=rootfs
vol_alignment=1
vol_flags=autoresize
image=BR2_ROOTFS_UBIFS_PATH

So from a buildroot BR2_EXTERNAL mechanism perspective what is a
possible/best way to customize the cfg file?

Again too many questions. I know others will google this in the
future, so I and others will appreciate any info you have.

Thanks, Steve
