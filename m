From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 15 Nov 2019 20:31:18 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/ltp-testsuite: proper fix
 for missing __kernel_fsid_t
In-Reply-To: <20191114213050.GF26360@scaer>
References: <20191114200219.1568-1-petr.vorel@gmail.com>
 <20191114213050.GF26360@scaer>
Message-ID: <20191115193118.GA19966@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

> On 2019-11-14 21:02 +0100, Petr Vorel spake thusly:
> > Backported 3 fixes from upstream (2 of them require calling autoreconf.

> > Fixes: http://autobuild.buildroot.net/results/7a29e3b767e3d23dd64c130daa735ca6c062baf8

> Sorry, but that does not seem to be enough to properly fix the build
> above. I got this when testing locally:

> In file included from fanotify13.c:28:
> fanotify13.c: In function ?setup_marks?:
> fanotify.h:147:41: error: ?lapi_fsid_t? {aka ?struct <anonymous>?} has no member named ?__val?; did you mean ?val??
>  # define FSID_VAL_MEMBER(fsid, i) (fsid.__val[i])
>                                          ^~~~~
> fanotify13.c:133:7: note: in expansion of macro ?FSID_VAL_MEMBER?
>       !FSID_VAL_MEMBER(event_set[i].fsid, 0) &&
>        ^~~~~~~~~~~~~~~
> fanotify.h:147:41: error: ?lapi_fsid_t? {aka ?struct <anonymous>?} has no member named ?__val?; did you mean ?val??
>  # define FSID_VAL_MEMBER(fsid, i) (fsid.__val[i])
>                                          ^~~~~
> fanotify13.c:134:7: note: in expansion of macro ?FSID_VAL_MEMBER?
>       !FSID_VAL_MEMBER(event_set[i].fsid, 1)) {
>        ^~~~~~~~~~~~~~~

> If you look carefully, I have the exact inverse problem as reported in
> one of the patches, below: confusion between 'val' and '__val'...

Musl config which works:
* /home/pevik/br-test-pkg/br-x86-64-musl/.config
BR2_DEFCONFIG="$(CONFIG_DIR)/defconfig"
BR2_TOOLCHAIN_USES_MUSL=y
BR2_TOOLCHAIN_EXTERNAL_MUSL=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-x86-64-musl-2019.05.1.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
BR2_PACKAGE_MUSL_COMPAT_HEADERS=y
BR2_PACKAGE_MUSL_FTS=y
# BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS is not set

Broken one (
* pc_x86_64_bios_defconfig, libc changed to musl
BR2_DEFCONFIG="/home/pevik/install/src/buildroot.git/configs/pc_x86_64_bios_defconfig"
BR2_TOOLCHAIN_USES_MUSL=y
BR2_TOOLCHAIN_BUILDROOT_MUSL=y
BR2_TOOLCHAIN_BUILDROOT_LIBC="musl"
BR2_PACKAGE_MUSL=y
BR2_PACKAGE_MUSL_COMPAT_HEADERS=y
BR2_PACKAGE_MUSL_FTS=y
# BR2_TOOLCHAIN_EXTERNAL_MUSL_CROSS is not set

There are more differences in these 2 configs, but I bet this
BR2_TOOLCHAIN_BUILDROOT_MUSL=y vs. BR2_TOOLCHAIN_EXTERNAL_MUSL=y can be
the difference.

Kind regards,
Petr
