From: Andreas Naumann <dev@andin.de>
Date: Thu, 15 Nov 2018 17:41:27 +0100
Subject: [Buildroot] [PATCH next v4 0/6] Per-package host/target
 directory support
In-Reply-To: <20181114105557.12599-1-thomas.petazzoni@bootlin.com>
References: <20181114105557.12599-1-thomas.petazzoni@bootlin.com>
Message-ID: <a062a8a1-7a56-d8ec-6d9d-06f444a72d6b@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,


Am 14.11.18 um 11:55 schrieb Thomas Petazzoni:
> Hello,
> 
> Here is a fourth iteration of the per-package SDK and target directory
> implementation.
> 
> If you're interested in testing it, you can find the patch series at:
> 
>    http://git.bootlin.com/users/thomas-petazzoni/buildroot/log/?h=ppsh-v4
> 


thank you for the updated version. I tried to run it with my configs. 
For that I needed
a) a generic patch for all kconfig packages, see my answer on the final 
patch
b) linux-specific patch posted two days ago: [PATCH v2 1/1] linux: Make 
dtc install step more reliable

On my local machine things seemed to work, however final rootfs creation 
failed in our CI environment due to broken host- binaries, e.g. 
mkfs.ubifs not finding some required lib (liblzo2.so.2 in that 
particular case).
It seems some things with rpath manipulation/checking do not yet work 
properly. Looking into the binary with ldd I see libs used from the 
host-machine that probably should come from buildroots host/usr/lib...
	linux-vdso.so.1 =>  (0x00007ffc06fcc000)
	libz.so.1 => /lib/x86_64-linux-gnu/libz.so.1 (0x00007f760428f000)
	liblzo2.so.2 => not found
	libuuid.so.1 => /lib/x86_64-linux-gnu/libuuid.so.1 (0x00007f760408a000)
	libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007f7603d81000)
	libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f76039b7000)
	/lib64/ld-linux-x86-64.so.2 (0x00007f76044a9000)

I couldnt find out in reasonable time where things go wrong so I'd be 
thankful for a pointer on how to debug this.

regards,
Andreas
