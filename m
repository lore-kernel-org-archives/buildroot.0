From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 26 Aug 2019 20:48:58 +0000
Subject: [Buildroot] [Bug 12131] qt5webengine builderror in the latest
 stable Buildroot 2019.05.01 version
In-Reply-To: <bug-12131-163@https.bugs.busybox.net/>
References: <bug-12131-163@https.bugs.busybox.net/>
Message-ID: <bug-12131-163-jiu2S5I5Je@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12131

--- Comment #4 from Giulio Benetti <giulio.benetti@micronovasrl.com> ---
Hello Patrick,

this bug has already been fixed here with this commit:
https://git.busybox.net/buildroot/commit/?id=3a0ed5d25e26cb2ec99a1da077c9dcfea67b0ecc

What makes it show again is that you specify '-device imx6' in
BR2_PACKAGE_QT5BASE_CUSTOM_CONF_OPTS.

When buildroot builds qt5 expects to use device 'buildroot' that is based on
qmake.conf.in in 'package/qt5/qt5base/'

So basically you're telling to qt5 to ignore buildroot qt5 configuration.

You should only remove '-device imx6' from your
BR2_PACKAGE_QT5BASE_CUSTOM_CONF_OPTS.

What is passed to qt5 build system when '-device imx6' is specified should be
implicit when you choose the correct compiler. I mean these:
IMX6_CFLAGS             = -march=armv7-a -mfpu=neon -DLINUX=1 -DEGL_API_FB=1

So if you compile for armv7-a with neon enable you should be ok.

Anyway I've tried this using master branch and I get a GCC ICE :/ and need to
dig deeper.

But please, give a try with 2019.05.1 and let me know.

Thank you!

Giulio

-- 
You are receiving this mail because:
You are on the CC list for the bug.
