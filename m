From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 29 May 2014 23:11:04 +0200
Subject: [Buildroot] buildroot-2014.05-rc3 and spl file
In-Reply-To: <20140529110206.70265c717a9884bea46c2f21@lavabit.com> (rh's
 message of "Thu, 29 May 2014 11:02:06 -0700")
References: <20140529082417.5475b95e34d3321dbc2d2aab@lavabit.com>
 <20140529185752.6a53e895@free-electrons.com>
 <20140529110206.70265c717a9884bea46c2f21@lavabit.com>
Message-ID: <878upk9tp3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "rh" == rh  <richard_hubbe11@lavabit.com> writes:

Hi,

 > The english language (and many others) is fraught with vagueries
 > and ambiguities. It was by design. Lots of room for plausible
 > deniability. Perhaps I should have said:

 > Note, NB, the installer is incorrectly looking for the spl file in
 > uboot-2014.04/

 > I have this data point from my other buildroot work:

 > /buildroot-2013.08-rc3/output/build/uboot-2013.07/spl/u-boot-spl.bin

The question is if u-boot-spl.bin has ever been the right value for
you. Looking at u-boot history, it has always outputted to
spl/u-boot-spl.bin since the generic spl support got added for 2012.10.

The Buildroot uboot/spl option got added early 2012, and the default
setting hasn't changed since then. Probably the spl support got reworked
into spl/ before it got upstream.

I just did a quick test with out beaglebone defconfig, and u-boot
2013.10 / 2014.01 / 2014.04 all behave in the same way:

/home/peko/source/buildroot/output/host/usr/bin/arm-linux-gnueabihf-objcopy
 --gap-fill=0xff -O binary
 /home/peko/source/buildroot/output/build/uboot-2013.10/spl/u-boot-spl
 /home/peko/source/buildroot/output/build/uboot-2013.10/spl/u-boot-spl.bin

/home/peko/source/buildroot/output/build/uboot-2013.10/tools/mkimage -T omapimage
 -a 0x402F0400
 -d /home/peko/source/buildroot/output/build/uboot-2013.10/spl/u-boot-spl.bin
 /home/peko/source/buildroot/output/build/uboot-2013.10/MLO


It probably does make sense to change the default spl location to
spl/u-boot-spl.bin, so I'll go and do that now.

-- 
Bye, Peter Korsgaard
