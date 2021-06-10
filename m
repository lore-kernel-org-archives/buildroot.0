From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Thu, 10 Jun 2021 15:15:33 +0200
Subject: [Buildroot] [PATCH v5 0/5] Introduce bmap-tools as target +
 host package
In-Reply-To: <20210610143130.0ab608d7@windsurf>
References: <20210607204221.124908-1-thomas.petazzoni@bootlin.com>
 <6e9afcd08150926a669d4df1198461e0acc7f063.camel@orolia.com>
 <20210609205222.785b065d@windsurf>
 <08bb8c91-0304-8613-492c-aa133412a1e3@gmail.com>
 <ba7a6ec514891b5494d6232db9513443514ed1fc.camel@orolia.com>
 <20210610143130.0ab608d7@windsurf>
Message-ID: <9e736e28253f719f333e481692847c714eeef970.camel@orolia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok,
So I ran the test and this time, it failed as expected :)

buildroot$ tail -f tests/TestExt3-run.log
> starting qemu with 'qemu-system-arm -serial stdio -display none -m
256 -drive
file=/home/ncarrier/workspace/buildroot/tests/TestExt3/images/rootfs.ex
t3,if=sd -dtb /home/ncarrier/workspace/buildroot/dl/vexpress-v2p-ca9-
5.10.7.dtb -M vexpress-a9 -kernel
/home/ncarrier/workspace/buildroot/dl/kernel-vexpress-5.10.7 -append
root=/dev/mmcblk0 rootfstype=ext3 console=ttyAMA0'
WARNING: Image format was not specified for
'/home/ncarrier/workspace/buildroot/tests/TestExt3/images/rootfs.ext3'
and probing guessed raw.
         Automatically detecting the format is dangerous for raw
images, write operations on block 0 will be restricted.
         Specify the 'raw' format explicitly to remove the
restrictions.
qemu-system-arm: Invalid SD card size: 60 MiB
SD card size has to be a power of 2, e.g. 64 MiB.
You can resize disk images with 'qemu-img resize <imagefile> <new-
size>'
(note that this will lose data if you make the image smaller than it
currently is).


On Thu, 2021-06-10 at 14:31 +0200, Thomas Petazzoni wrote:
> CAUTION: This email originated from outside of the organization.
> Do not click links or open attachments unless you recognize the
> sender and know the content is safe.
> 
> Hello Nicolas,
> 
> On Thu, 10 Jun 2021 09:39:43 +0200
> Nicolas Carrier <nicolas.carrier@orolia.com> wrote:
> 
> > Sure,
> > 
> > My qemu version is:
> > $ qemu-system-arm? --version
> > QEMU emulator version 5.2.0 (Debian 1:5.2+dfsg-10)
> > 
> > The Ext4 test passes:
> > $ ./support/testing/run-tests tests.fs.test_ext.TestExt4 -o tests -
> > d dl
> > 09:03:31 TestExt4???????????????????????????????? Starting
> > 09:03:34 TestExt4???????????????????????????????? Building
> > ah09:08:12 TestExt4???????????????????????????????? Building done
> > Downloading to /home/ncarrier/workspace/buildroot/dl/tmp_43sbo0r
> > Renaming from /home/ncarrier/workspace/buildroot/dl/tmp_43sbo0r to
> > /home/ncarrier/workspace/buildroot/dl/kernel-vexpress-5.10.7
> > Downloading to /home/ncarrier/workspace/buildroot/dl/tmpnj5e2uiw
> > Renaming from /home/ncarrier/workspace/buildroot/dl/tmpnj5e2uiw to
> > /home/ncarrier/workspace/buildroot/dl/vexpress-v2p-ca9-5.10.7.dtb
> > 09:08:20 TestExt4???????????????????????????????? Cleaning up
> > .
> > -------------------------------------------------------------------
> > ---
> > Ran 1 test in 289.374s
> > 
> > OK
> > 
> > But its file system image has a size of 16M which _is_ a power of
> > two:
> 
> Sorry, I picked the wrong test. Could you try the Ext3 tests, i.e
> tests.fs.test_ext.TestExt3 ? This one doesn't specify a size, so it
> should fallback to the default, which is 60MB.
> 
> Best regards,
> 
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
