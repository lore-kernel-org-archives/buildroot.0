From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Apr 2016 14:23:48 +0200
Subject: [Buildroot] [genimage] Create a folder with a file using
	genimage
In-Reply-To: <CALtfCQbB6e2mipiVj=jKKbFGwjq3r_od1EFppQg_8jV99Y7e=A@mail.gmail.com>
 (Oscar Gomez Fuente's message of "Fri, 29 Apr 2016 08:26:57 +0200")
References: <CALtfCQYZn9FVyFPfjsL6YmGsPpkGwfsDeGWg_bdNezkKjm5=qg@mail.gmail.com>
 <87bn4tv2d2.fsf@dell.be.48ers.dk>
 <CALtfCQbB6e2mipiVj=jKKbFGwjq3r_od1EFppQg_8jV99Y7e=A@mail.gmail.com>
Message-ID: <87r3dotxgr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Oscar" == Oscar Gomez Fuente <oscargomezf@gmail.com> writes:

 > Thank you very much Peter,
 > I've got two more questions related to genimage.

 > 1?.- Is there any way to give the partition boot the label "BOOT" and the
 > partition rootfs the label "rootfs"? It will be very useful because when I
 > insert the sd card in a computer I'm going to know the folder name where is
 > going to be mounted the sd card.

I think you are referring to fat/ext2 filesystem labels as PC-style
partitions don't have labels.

We currently don't have an option to set the ext2 label of the
filesystem Buildroot creates, but I'll add that now.

For the fat filesystem genimage creates it seems like you can set an
"extraargs" parameter in the genimage.cfg. These arguments will be
passed to mkdosfs, so you can do something like:


image boot.vfat {
  vfat {
    extraargs = "-n mylabel"
    ..

 > 2?.- When the sdcard.img is generated and when you make a dd command to the
 > sd card, it's wasted most of the size of the sd card. I usually use a
 > 16GBytes sd card, and my sdcard.img is only  around 110 MB so the remaining
 > space is wasted. Is there any way to give the rootfs partition an extra
 > size (for example 1 Gbyte o something like that)? I was trying to use this,
 > but it doesn't work:

There's two parts to this:

 - The size of the partition (what you specify with size = )
 - The size of the filesystem

Buildroot will per default only make the filesystem as big as needed to
contain the files you have built. You can either specify extra space
with BR2_TARGET_ROOTFS_EXT2_EXTRA_BLOCKS or simply resize the filesystem
to match the partition after writing it to a sdcard using resize2fs
<device>.

-- 
Venlig hilsen,
Peter Korsgaard 
