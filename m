From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 25 Aug 2020 07:35:29 +0000
Subject: [Buildroot] [Bug 13141] Target-finalize fail with "depmod: ERROR:
 Bad version passed"
In-Reply-To: <bug-13141-163@https.bugs.busybox.net/>
References: <bug-13141-163@https.bugs.busybox.net/>
Message-ID: <bug-13141-163-dDlKxsDfHb@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13141

--- Comment #5 from Yann E. MORIN <yann.morin.1998@free.fr> ---
Laurent, All,

> printf 'probed linux version:"%s"\n' "`/usr/bin/make  HOSTCC="/home/buildroot/output/host/bin/ccache /usr/bin/gcc -O2 -I/home/buildroot/output/host/include -L/home/buildroot/output/host/lib -Wl,-rpath,/home/buildroot/output/host/lib" ARCH=arm INSTALL_MOD_PATH=/home/buildroot/output/target CROSS_COMPILE="/home/buildroot/output/host/bin/arm-buildroot-linux-gnueabihf-" DEPMOD=/home/buildroot/output/host/sbin/depmod INSTALL_MOD_STRIP=1 -C /home/buildroot/output/build/linux-linux4sam_6.2 --no-print-directory -s kernelrelease 2>/dev/null`"
> probed linux version:"make[1]: Entering directory '/home/buildroot'
> 4.19.78-linux4sam-6.2
> make[1]: Leaving directory '/home/buildroot/output/build/linux-linux4sam_6.2'"

OK, so the bug is already visible here : see how the output contains make
messages around
the version value.

However, this is very strange, because:

1. we're telling make to not print those emssages: --no-print-directory -s
2. it is entering and leaving different directoriee: Entering directory
'/home/buildroot'
   but: Leaving directory '/home/buildroot/output/build/linux-linux4sam_6.2'

So I suspect a weird corner-case bug in make... 

Oh, by the way, top-level parallel build is not 100% supported, though, and at
the
very least, requires that you enable BR2_PER_PACKAGE_DIRECTORIES.

Regards,
Yann E. MORIN.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
