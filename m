From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 25 May 2010 08:53:15 +0200
Subject: [Buildroot] USB Ethernet register too late
In-Reply-To: <AANLkTill0JXHnWN3zh5dhnxRb-hZqJpjPGOmdqSTzmTQ@mail.gmail.com>
	(=?utf-8?Q?=22P=C3=A9ter_St=C3=B3sz=22's?= message of "Tue, 25 May 2010
	00:01:06 +0200")
References: <AANLkTill0JXHnWN3zh5dhnxRb-hZqJpjPGOmdqSTzmTQ@mail.gmail.com>
Message-ID: <874ohwmq04.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "P?ter" == P?ter St?sz <peter.stosz@mentat.hu> writes:

 P?ter> Hi!
 P?ter> I have a custom SAM9261 board and USB Ethernet (Davicom? DM9601) adapter.
 P?ter> (Kernels 2.6.30 and 2.6.33.2)
 P?ter> What can I do, to DM9601 register well and state goes up, before the Ethernet(/
 P?ter> IP) configuration started?

This has nothing to do with buildroot, questions like this belong on
netdev at vger.kernel.org. With that said, there's two things you can do:

- Either do dhcp/nfs mounting yourself in an initramfs
- Or tweak CONF_PRE_OPEN in net/ipv4/ipconfig.c to add a longer delay
  before it tries to open the device. You might need to change the
  msleep to a sslep like CONF_POST_OPEN if you make it too long.

This isn't anything specific to my dm9601 driver, but common for all
devices on async probed busses like USB.

-- 
Bye, Peter Korsgaard
