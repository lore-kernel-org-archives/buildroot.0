From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Jan 2017 10:13:37 +0100
Subject: [Buildroot] [git commit] xorg-server: not available with musl
	on ARM
In-Reply-To: <20170122172820.0086ea0b@free-electrons.com> (Thomas Petazzoni's
 message of "Sun, 22 Jan 2017 17:28:20 +1100")
References: <20170121125742.776B97FA45@busybox.osuosl.org>
 <20170122172820.0086ea0b@free-electrons.com>
Message-ID: <87tw8r4fum.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Sat, 21 Jan 2017 13:55:07 +0100, Peter Korsgaard wrote:

 >> diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
 >> index 0f1d1fe..1c8f8cf 100644
 >> --- a/package/x11r7/xserver_xorg-server/Config.in
 >> +++ b/package/x11r7/xserver_xorg-server/Config.in
 >> @@ -1,6 +1,11 @@
 >> +comment "xorg-server needs a glibc or uClibc toolchain"
 >> +	depends on BR2_arm && BR2_TOOLCHAIN_USES_MUSL
 >> +
 >> config BR2_PACKAGE_XSERVER_XORG_SERVER
 >> bool "xorg-server"
 >> depends on BR2_USE_MMU # fork()
 >> +	# xserver uses inb/outb on arm, which aren't available with musl
 >> +	depends on !(BR2_arm && BR2_TOOLCHAIN_USES_MUSL)

 > This looks a bit weird to me. X.org is a major piece of software, and
 > there are musl-based distributions that do run X, though perhaps not on
 > ARM. Has the issue been reported to the musl developers?

I agree that it is a big hammer. Like explained above, the issue is that
musl doesn't provide the ioperm/inb/outb interface, and the Xserver
provides some wrapper functions around them, so compilation fails.

Now, I don't know how many drivers use these functions (and how many of
those drivers make sense on ARM), so perhaps they can be patched
out. The fact that musl doesn't provide any define to detect it means
that these have to be done based on autoconf tests, and repeated for the
3 xserver versions we support - And the musl/arm dependencies have to be
moved down to the drivers that use this interface.

I didn't have the interest / energy to do so, but if others have an
interest in Xorg on musl/arm, feel free to work on it.

With that said, the current situation is that it doesn't build - So we
should disallow the combination, like this patch does.

-- 
Bye, Peter Korsgaard
