From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 14 Oct 2016 17:48:20 +0200
Subject: [Buildroot] [PATCH 00/51] TLP/PPS: intro, package cleanup.
In-Reply-To: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <6e24662f-d0fd-461e-0059-6f2e23273480@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Gustavo,

On 14-10-16 00:13, gustavo.zacarias at free-electrons.com wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> This is the first step in picking up Fabio Porcedda's work
> ( http://lists.busybox.net/pipermail/buildroot/2015-June/131051.html )
> regarding TLP (Top-Level Parallel) support and moving it forward for
> mainstream buildroot inclusion.
> 
> PPS (Per-Package Staging) is the central piece in enabling the
> configure/build/install of packages simultaneously. Right now packages
> pick up libraries/includes from a shared (the staging) directory.
> Once TLP is enabled this is problematic because despite the
> developers/contributors best efforts not all dependencies are accounted
> for properly.
> When building and installing in parallel a package 'A' can be
> installing development files (headers/libraries) while package 'B'
> is configuring, and potentially probing for its dependencies.
> If package 'B' can use unaccounted dependencies from package 'A' this
> can be a problem since the feature probe might not be atomic, hence
> it might find erroneous package 'A' features since the install to the
> staging area might not be complete when it's doing this.
> To avoid this the proposal is to limit the staging directory scope
> of packages only to the required and requested dependencies.

 Note that it's not enough to do it for staging, host needs it as well.

> For this to happen packages need a special staging area that fulfills
> its dependencies, hence overriding its sysroot, which must happen via
> environment variable overrides (there are a couple of ways to
> accomplish this, but they all require overrides via env variables).
> 
> To accomplish this some packages need a small cleanup, which is
> passing the $(TARGET_MAKE_ENV) variable which will contain this setup
> for their build and install steps, to be able to override the default
> build rules.

 Actually, I think it's better/safer/easier to just do a global export from the
Makefile:

export BR2_STAGING_DIR = $($(PKG)_STAGING_DIR)

and perhaps also

_STAGING_DIR = $(STAGING_DIR)

to allow it to be used outside package build rules as well.


 That said:

> Even without PPS/TLP this is required for reproducibility since some
> packages will build with distro-provided tools instead of buildroot
> provided ones if the PATH isn't set on make invocation.

 So this series should still be applied.

> 
> The patches are one per package to simplify the review/application
> process and to make it easy to revert with granularity in case of
> problems with one or more of them.

 Great work!

 As you saw, I reviewed them and had some comments on some of them. Actually
there were mainly two categories:

- TARGET_MAKE_ENV should also be applied to configure. In most cases it is
probably not strictly needed because the configure script doesn't compile
anything, but I think it's better for consistency to do it anyway. If you have
arguments to the contrary, feel free to tell them.

- Same patch should be applied to host. That is for two reasons: for TLP, we'll
need to pass a per-package host-dir as well (except if the global export that I
propose is used); and the reproducibility argument also applies to host
packages. And of course, it's better to keep the host and target part
consistent. I commented on the patches you already posted where the host bit is
missing, but probably there are other host packages that are missing it as
well... Anyway, the host part can be done in a separate patch so this is not
blocking acceptance of those patches.


 I give my
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
to the remaining patches. I've created a bundle with those:
http://patchwork.ozlabs.org/bundle/arnout/gustavoz_target_make_env/


 Regards,
 Arnout


> 
> Most of the packages were built-tested using the qemu_arm_versatile
> defconfig with an external toolchain.
> 
> Gustavo Zacarias (51):
>   lsof: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   wf111: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   p910nd: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   lz4: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   zlog: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   ed: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   arptables: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   librtas: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   wireless_tools: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   pifmrds: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   hans: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   irda-utils: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   xvkbd: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   tinyalsa: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   openssl: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   mplayer: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   tcping: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   ncurses: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   smstools3: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   rtmpdump: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   iputils: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   open2300: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   opentyrian: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   poco: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   pppd: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   statserial: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   ti-utils: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   blktrace: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   boost: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   bsdiff: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   feh: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   gadgetfs-test: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   iw: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   jack2: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   libnss: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   lmbench: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   moarvm: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   mongoose: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   libfreeimage: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   live555: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   pptp-linux: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   unrar: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   mtdev2tuio: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   ushare: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   libtommath: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   odhcploc: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   espeak: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   duma: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   aufs-util: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   ocrad: use $(TARGET_MAKE_ENV) when calling $(MAKE)
>   dmidecode: use $(TARGET_MAKE_ENV) when calling $(MAKE)
> 
>  package/arptables/arptables.mk           |  2 +-
>  package/aufs-util/aufs-util.mk           |  4 ++--
>  package/blktrace/blktrace.mk             |  4 ++--
>  package/boost/boost.mk                   |  6 +++---
>  package/botan/botan.mk                   |  6 +++---
>  package/bsdiff/bsdiff.mk                 |  4 ++--
>  package/dmidecode/dmidecode.mk           |  4 ++--
>  package/duma/duma.mk                     |  6 +++---
>  package/ed/ed.mk                         |  4 ++--
>  package/espeak/espeak.mk                 |  4 ++--
>  package/feh/feh.mk                       |  4 ++--
>  package/gadgetfs-test/gadgetfs-test.mk   |  4 ++--
>  package/hans/hans.mk                     |  2 +-
>  package/iputils/iputils.mk               |  2 +-
>  package/irda-utils/irda-utils.mk         |  2 +-
>  package/iw/iw.mk                         |  4 +++-
>  package/jack2/jack2.mk                   | 12 +++++++++---
>  package/libfreeimage/libfreeimage.mk     |  4 ++--
>  package/libnss/libnss.mk                 |  4 ++--
>  package/librtas/librtas.mk               |  4 ++--
>  package/libtommath/libtommath.mk         |  4 ++--
>  package/live555/live555.mk               |  6 +++---
>  package/lmbench/lmbench.mk               |  4 ++--
>  package/lsof/lsof.mk                     |  2 +-
>  package/lz4/lz4.mk                       |  6 +++---
>  package/moarvm/moarvm.mk                 |  6 +++---
>  package/mongoose/mongoose.mk             |  4 ++--
>  package/mplayer/mplayer.mk               |  4 ++--
>  package/mtdev2tuio/mtdev2tuio.mk         |  2 +-
>  package/ncurses/ncurses.mk               |  4 ++--
>  package/ocrad/ocrad.mk                   |  6 +++---
>  package/odhcploc/odhcploc.mk             |  4 ++--
>  package/open2300/open2300.mk             |  2 +-
>  package/openssl/openssl.mk               |  6 +++---
>  package/opentyrian/opentyrian.mk         |  2 +-
>  package/p910nd/p910nd.mk                 |  2 +-
>  package/pifmrds/pifmrds.mk               |  2 +-
>  package/poco/poco.mk                     |  6 +++---
>  package/pppd/pppd.mk                     |  4 ++--
>  package/pptp-linux/pptp-linux.mk         |  2 +-
>  package/rtmpdump/rtmpdump.mk             |  6 +++---
>  package/smstools3/smstools3.mk           |  2 +-
>  package/statserial/statserial.mk         |  2 +-
>  package/tcping/tcping.mk                 |  2 +-
>  package/ti-utils/ti-utils.mk             |  2 +-
>  package/tinyalsa/tinyalsa.mk             |  2 +-
>  package/unrar/unrar.mk                   |  4 ++--
>  package/ushare/ushare.mk                 |  4 ++--
>  package/wf111/wf111.mk                   |  2 +-
>  package/wireless_tools/wireless_tools.mk |  8 ++++----
>  package/xvkbd/xvkbd.mk                   |  4 ++--
>  package/zlog/zlog.mk                     |  6 +++---
>  52 files changed, 108 insertions(+), 100 deletions(-)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
