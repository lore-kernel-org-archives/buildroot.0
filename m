From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Wed, 11 Sep 2019 11:24:51 +0100
Subject: [Buildroot] Chromium v7 test
In-Reply-To: <CAD0+TpAh1V=ztZfNAGzF34DAW=6f-JSzkJ0SvhwNWqu3vw_5HQ@mail.gmail.com>
References: <CAD0+TpAh1V=ztZfNAGzF34DAW=6f-JSzkJ0SvhwNWqu3vw_5HQ@mail.gmail.com>
Message-ID: <ab26bc45-d159-f10b-bfbd-9ad676d7d75d@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fame, Joseph, buildroot,

Sorry to resurrect this old thread! We're in the process of creating a
buildroot package for CEF [0] and the work you've done on this Chromium package
is interesting!

What's the status of this work and is there a more up to date branch? Perhaps
we could collaborate?


On 05/09/2018 09:11, Fame Castle wrote:> Hi Joseph,
> I finally found the time to test your chromium-v7-wip branch. I cloned the
> repo (only the chromium-v7-wip branch) into a new buildroot folder. I then set
> up a Linux 4.18 kernel, GlibC, Mesa and XOrg. The build fails at a step I
> think I have seen before. (DeJa Vu?)
> [snip]
> Package nss was not found in the pkg-config search path.
> Perhaps you should add the directory containing `nss.pc'
> to the PKG_CONFIG_PATH environment variable
> No package 'nss' found
> Could not run pkg-config.
> [snip]

I fixed this by adding `host-nss` to the dependencies. I also had to patch
`crypto/nss_util.cc` to `#include <nss/nss.h>` directly because of a
conflicting nss.h header in the include path (from glibc I think). My WIP
changes are here [1], it starts to build but I'm still fighting components.
This isn't really a priority for us atm, the CEF package is.

@Joseph, I noticed that you removed the `bootstrap.py` stage and referenced
`gn` directly (rather than `out/Release/gn`) in your patch to build Chromium
v75 [2]. Is gn on your path somehow? I'm not sure if this WIP patch is supposed
to work yet :)

We're actively working on this, so happy to chat about it.

Many thanks,
Thomas

[0] https://bitbucket.org/chromiumembedded/cef/src/master/
[1] https://github.com/tompreston/buildroot/commits/tpreston/ct-chromium-v7-wip
[2] https://github.com/tompreston/buildroot/commit/e43ead54965b161459a10172c152f4df7ac0721a#diff-26dd0e5b06da6c4c821993a00b55177fL165
