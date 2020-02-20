From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 20 Feb 2020 07:27:15 +0000
Subject: [Buildroot] [Bug 12416] qt5webengine should not use WEBENGINE_CONFIG
In-Reply-To: <bug-12416-163@https.bugs.busybox.net/>
References: <bug-12416-163@https.bugs.busybox.net/>
Message-ID: <bug-12416-163-8swI6dU7YE@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12416

--- Comment #2 from JeffyCN <jeffy.chen@rock-chips.com> ---
(In reply to Peter Seiderer from comment #1)
Hi Peter,

Thanks for noticing that.

We are using a custom version of buildroot(2018.02-rc3 with qt5 bumpped to
5.12.2):
https://github.com/rockchip-linux/buildroot/tree/rockchip/2018.02-rc3

Configs: rockchip_*_defconfig, running on a few arm/arm64 based
platforms(rockchip evb boards)

We've tested minimal too, did see some issues on arm 32bit platforms:
1/ 5.12.2 would report segfaults, should be fine for the newer versions(e.g.
5.12.5):
https://github.com/rockchip-linux/buildroot/commit/6e4fc810cdea122b1bd86c8649d276c485f794f9

2/ I can't recall the exact phenomenon, could be the same as RaspberryPi's...

It seems like the chromium might be compiled with different fpu setting than
the other packages on arm 32bit platform, which is because it would try to
detect neon support from the qt5base's CFLAGS and currently buildroot would not
specify that there, but embedded in the gcc toolchain instead:

qt5webengine-5.12.2$ vi src/core/config/linux.pri
    # TODO: use neon detection from qtbase
    !lessThan(MARMV, 8) {
        gn_args += arm_use_neon=true
    } else {
        MFPU = $$extractCFlag("-mfpu=.*")
        !isEmpty(MFPU):contains(MFPU, ".*neon.*") {
            gn_args += arm_use_neon=true
        } else {
            gn_args += arm_use_neon=false
            # If the toolchain does not explicitly specify to use NEON
instructions
            # we use arm_neon_optional for ARMv7
            equals(MARMV, 7): gn_args += arm_optionally_use_neon=true
        }
    }

https://github.com/rockchip-linux/buildroot/commit/8e832026edbb6e70df283629dadca981854866ad

-- 
You are receiving this mail because:
You are on the CC list for the bug.
