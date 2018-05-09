From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 10 May 2018 00:41:28 +0200
Subject: [Buildroot] [RFC PATCH 1/7] pkg-meson: new infrastructure
In-Reply-To: <c0524a93-eaad-3e61-f8bc-f9b17271d468@mind.be>
References: <20180507105741.31747-1-eric.le.bihan.dev@free.fr>
 <20180507105741.31747-2-eric.le.bihan.dev@free.fr>
 <20180507170256.2ef06b2f@windsurf> <20180507193850.GA15375@ned>
 <20180507214356.3a087000@windsurf> <20180507221244.GC15375@ned>
 <c0524a93-eaad-3e61-f8bc-f9b17271d468@mind.be>
Message-ID: <20180509224128.GA11938@ned>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!
On 18-05-08 23:00:23, Arnout Vandecappelle wrote:

[snip]

> >> OK. Did you test the host variant of the meson-package infrastructure ?
> >
> > Good advice! Testing the host variant of a custom library+executable
> > project brought out that Meson does not automically sets RPATH [1],
> > which makes support/scripts/check-host-rpath unhappy, and that it
>
>  If that is the case, it means you don't properly pass HOST_LDFLAGS, which is A
> Bad Thing (tm).
>
>  Indeed, looking at your patch, I see none of the host options are passed. You
> certainly need to pass HOST_MAKE_ENV in the environment to make pkg-config is
> used correctly. And then you should also make sure that HOSTCC etc. are passed
> correctly - remember that it's possible to use a different host compiler by
> passing HOSTCC in the environment (and I'm actually using that feature!).

I added $$(HOST_CONFIGURE_OPTS), CFLAGS="$$(HOST_CFLAGS)" and
LDFLAGS="$$(HOST_LDFLAGS)" before invoking Meson (as done in
pkg-autotools.mk) and now it politely informs me that it will take these
flags into account:

```
Appending CFLAGS from environment: '-O2 -I/home/eric/build/test-meson-package/qemu/arm/vexpress/host/include'
Appending LDFLAGS from environment: '-L/home/eric/build/test-meson-package/qemu/arm/vexpress/host/lib -Wl,-rpath,/home/eric/build/test-meson-package/qemu/arm/vexpress/host/lib'
Appending CPPFLAGS from environment: '-I/home/eric/build/test-meson-package/qemu/arm/vexpress/host/include'
```

But as stated in issue 1411 [1], Meson *does strip* RPATH [2] when
installing the executable of a library+executable project [3] in
$(HOST_DIR)/bin:

```
$ readelf -a /home/eric/build/test-meson-package/qemu/arm/vexpress/build/host-hello-meson-custom/build/tools/hello-meson-tool | grep -e PATH
 0x000000000000000f (RPATH)              Library rpath: [/home/eric/build/test-meson-package/qemu/arm/vexpress/host/lib:$ORIGIN/../hello-meson]
$ readelf -a /home/eric/build/test-meson-package/qemu/arm/vexpress/host/bin/hello-meson-tool | grep -e PATH
```

The recommended workaround is to define install_rpath [4] in for the
executable target, but this requires patching the sources of the
Meson-based package when building its host variant, which does not sound
very sensible.

So it looks like the workaround used in NixOS [5], i.e. patching the
host variant of Meson itself to remove the RPATH strip step, is
preferable until upstream Meson settles on this topic. I'll send another
patch for the meson package where this step is done in a post-extract
hook of the host variant.

[1] https://github.com/mesonbuild/meson/issues/1411
[2] https://github.com/mesonbuild/meson/blob/dc91aad42009f739f9e6d73221efc071626c28a3/mesonbuild/scripts/meson_install.py#L396
[3] https://github.com/mesonbuild/meson/issues/314#issuecomment-157658562
[4] https://github.com/mesonbuild/meson/issues/314#issuecomment-326909424
[5] https://github.com/NixOS/nixpkgs/pull/28444#issuecomment-324033323

Regards,

--
ELB
