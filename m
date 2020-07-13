From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 13 Jul 2020 08:51:42 +0200
Subject: [Buildroot] [PATCH v2] package/meson: fix shared build issue
 due to --static flag always passed to pkg-config
In-Reply-To: <20200614125002.3476208-1-romain.naour@gmail.com> (Romain Naour's
 message of "Sun, 14 Jun 2020 14:50:02 +0200")
References: <20200614125002.3476208-1-romain.naour@gmail.com>
Message-ID: <87a703lxfl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Since cf75d7da98596580eee5a9b5e1a3e156ad832099 we have a build failures when
 > building libgbm.so when valgrind package is selected because --static is always
 > passed to pkg-config even for shared build.

 > Even if -Dvalgrind=false on meson command line to build mesa, the valgrind
 > libraries come from pkg-config libdrm...

 > output/host/bin/pkg-config libdrm --libs --static
 > -L[...]/sysroot/usr/lib -ldrm -lm -L[...]/sysroot/usr/lib/valgrind
 > -lcoregrind-arm64-linux -lvex-arm64-linux -lgcc

 > ... and break the build.

 > See initial discussions:
 > http://lists.busybox.net/pipermail/buildroot/2020-June/284543.html

 > This is due to a wrong condition test added by the patch
 > 0004-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch.

 > Use None instead of False when pkg_config_static is not set, indeed
 > pkg_config_static is a string not a boolean. But pkg_config_static is
 > alsways set to 'true' or 'flase' in our meson package infra.

NIT: get returns None by default, so we don't need to explicitly pass
it.

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
