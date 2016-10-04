From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 04 Oct 2016 22:17:04 +0000
Subject: [Buildroot] [Bug 9326] Odroid-C2 build results in non-bootable image
In-Reply-To: <bug-9326-163@https.bugs.busybox.net/>
References: <bug-9326-163@https.bugs.busybox.net/>
Message-ID: <bug-9326-163-0Uy9Vqp11j@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9326

--- Comment #1 from Erico Nunes <nunes.erico@gmail.com> ---
I have tested odroidc2_defconfig with today's master (426a84c2fe) on my
odroid-c2 and I can confirm that it isn't working out of the box with make
odroidc2_defconfig && make.

By monitoring the serial I see that it loads u-boot fine but hangs when it
boots the kernel, after the messages:
"Starting kernel ...

uboot time: 4167629 us"


I have debugged it a bit further though and found that:

- It works if you change the toolchain to a gcc 4.9.x version. Therefore, it's
likely that this has stopped worked recently when we changed the default gcc
version to 5.x for buildroot toolchains in commit e6ee58de3e.

- Bumping the odroid-c2 kernel to the HEAD of the hardkernel odroidc2-3.14.y
branch and u-boot to a newer commit in the hardkernel odroidc2-v2015.01 branch
(the HEAD doesn't build for me with gcc 5.x) doesn't seem to have the problem
fixed.

So, it looks like the hardkernel branches have trouble with gcc 5.x and one way
of "fixing" it would be to make odroidc2_defconfig default to gcc 4.9.x, what
do you think?
As this is a vendor downstream kernel and u-boot, it's probably not worth to
spend more time debugging it, we could do that and open an issue with them or
just wait until upstream supports this board, which should happen eventually.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
