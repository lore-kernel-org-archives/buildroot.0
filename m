From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Apr 2020 11:34:38 +0200
Subject: [Buildroot] [PATCH 0/9 v5] package/apparmor: new package
 (branch yem/apparmor)
In-Reply-To: <cover.1585490494.git.yann.morin.1998@free.fr>
References: <cover.1585490494.git.yann.morin.1998@free.fr>
Message-ID: <20200420093438.GG5035@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo, All,

On 2020-03-29 16:01 +0200, Yann E. MORIN spake thusly:
> This series is reworked of the previous work from Angelo:
>     http://lists.busybox.net/pipermail/buildroot/2020-March/278308.html
>     http://lists.busybox.net/pipermail/buildroot/2020-March/278307.html

Series applied to master, after doign a few fixes noticed by Thomas P.
on IRC. Thanks!

Regards,
Yann E. MORIN.

> been spread across two packages.
> 
> The way the apparmor package is laid out is not very amenable at doing a
> single package that builds everything: all the tools and utils depend on
> libapparmor, and that is better installed before the build of the tools
> is attempted.
> 
> So, we split the packaging in two:
> 
>   - libapparmor, which is siolely responsible for installing
>     libapparmor and its python3 bindings,
> 
>   - apparmor per-se, which is responsible for installing all the tools
>     and utilities.
> 
> To be noted: most of the tools' Makefiles hard-code linking to the
> static libapparmor (without explanations), so rather than go against the
> tide, we just enforce building the static library (note also that we do
> not forbid building the shared one).
> 
> The only major part that was dropped from the initial series, is support
> for writign the cache on read-write filesystems. The codition was based
> on BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW, but that does not prevent
> building an actually read-only filesystem at all (e.g. squashfs). So,
> more thoughts will have to be poured into this caching feature in a
> subsequent series.
> 
> Chage v4 -> v5:  (adopted by Yann)
>   - split in two packages, one for the lib, ione for the utils
>   - reword all the commit logs
>   - fix dependencies (threads, mmu...)
>   - re-organise the conditions to install utils (python3 vs others)
>   - drop the cache writing for read-write filesystems
> 
> 
> Regards,
> Yann E. MORIN.
> 
> 
> The following changes since commit d0f5a5551ab86f6272f13deaa16dcdf4b07a524f
> 
>   package/sysstat: bump to version 12.2.1 (2020-03-29 15:50:36 +0200)
> 
> 
> are available in the git repository at:
> 
>   git://git.buildroot.org/~ymorin/git/buildroot.git
> 
> for you to fetch changes up to 8b4415dad37fa81cf2d4adb09b27119b233bcd8a
> 
>   package/apparmor: enable apache integration (2020-03-29 16:01:18 +0200)
> 
> 
> ----------------------------------------------------------------
> Angelo Compagnucci (4):
>       package/libapparmor: new package
>       linux: enable AppArmor-related options if needed
>       package/apparmor: new package
>       package/apparmor: add option to install binutils
> 
> Yann E. MORIN (5):
>       package/apparmor: add options to install utils
>       package/apparmor: add option to install generic profiles
>       package/libapparmor: enable python bindings
>       package/apparmor: enable PAM integration
>       package/apparmor: enable apache integration
> 
>  DEVELOPERS                                         |  1 +
>  linux/linux.mk                                     |  5 ++
>  package/Config.in                                  |  2 +
>  package/apparmor/Config.in                         | 71 ++++++++++++++++
>  package/apparmor/apparmor.hash                     |  4 +
>  package/apparmor/apparmor.mk                       | 81 ++++++++++++++++++
>  ...n_devel-fixing-for-crosscompiling-environ.patch | 96 ++++++++++++++++++++++
>  ...-fixing-setup.py-call-when-crosscompiling.patch | 30 +++++++
>  package/libapparmor/Config.in                      | 16 ++++
>  package/libapparmor/libapparmor.hash               |  4 +
>  package/libapparmor/libapparmor.mk                 | 41 +++++++++
>  11 files changed, 351 insertions(+)
>  create mode 100644 package/apparmor/Config.in
>  create mode 100644 package/apparmor/apparmor.hash
>  create mode 100644 package/apparmor/apparmor.mk
>  create mode 100644 package/libapparmor/0001-m4-ac_python_devel-fixing-for-crosscompiling-environ.patch
>  create mode 100644 package/libapparmor/0002-libapparmor-fixing-setup.py-call-when-crosscompiling.patch
>  create mode 100644 package/libapparmor/Config.in
>  create mode 100644 package/libapparmor/libapparmor.hash
>  create mode 100644 package/libapparmor/libapparmor.mk
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
