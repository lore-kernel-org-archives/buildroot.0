From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Feb 2018 11:19:52 +0100
Subject: [Buildroot] Further partition creation with genimage fails
In-Reply-To: <1517473948652-0.post@n4.nabble.com> (AAlex's message of "Thu, 1
 Feb 2018 01:32:28 -0700 (MST)")
References: <1517473948652-0.post@n4.nabble.com>
Message-ID: <87inbh3tbr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "AAlex" == AAlex  <earthquake.de@freenet.de> writes:

 > Hi,
 > trying to define a further (third) partition within the disk.img fails. With
 > error messge:
 > /genext2fs: couldn't allocate a block (no free space)
 > ext4(data.ext4): failed to generate data.ext4/

 > Added to the disk.img block in genimage config file a partition named
 > data.ext4
 > (complete config script  genimage config on pastebin
 > <https://pastebin.com/yN1Zfb5r>   )

 > Creating manually the partition file via dd within the output/image folder
 > works. 
 > But the goal is creating the partition file when building the system.

 > Thanks for help or proposal

Looking at the genimage code (image-ext2.c) I see it runs genext2fs:

        ret = systemp(image, "%s -d %s --size-in-blocks=%lld -i 16384 %s %s",
                        get_opt("genext2fs"),
                        mountpath(image), image->size / 1024, imageoutfile(image),
                        extraargs);

You could run genimage with '--loglevel 2' to see exactly what arguments it was
executed with.

I did a quick test here, and it seems to work for me. You do have enough
disk space on your build machine, right?

Do notice that we have moved away from using genext2fs for creating the
ext2/3/4 rootfs in Buildroot. Once issue with genext2fs is that it
doesn't know about the new features in ext3/4, so depending on your use
case you may be better up running mkfs.ext4 in your post-image script
manually.

-- 
Bye, Peter Korsgaard
