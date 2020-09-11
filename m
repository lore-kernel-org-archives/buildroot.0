From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 11 Sep 2020 11:07:53 +0200
Subject: [Buildroot] how to reproduce autobuild failure?
In-Reply-To: <trinity-19ccadb5-7d6f-44a4-9552-791e69ceae52-1599803589362@3c-app-mailcom-bs06>
References: <trinity-19ccadb5-7d6f-44a4-9552-791e69ceae52-1599803589362@3c-app-mailcom-bs06>
Message-ID: <20200911110753.05741d25@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 11 Sep 2020 07:53:09 +0200
daggs <daggs@gmx.com> wrote:

> I've received a mail stating a pkg I maintained failed autobuild.
> so I've syned my builroot folder to latest, entered the link, downloaded the defconfig to .config, ran make clean oldconfig,
> pressed enter for all options, made sure the .config included my pkg and ran make.
> after a while, I got a complete image, e.g. the failure didn't reproduced.
> assuming that the issue wasn't resolved, I'm doing something wrong.
> 
> what is the proper process I need to follow?

The steps you follow are good, even though there is a helper script to
automate that:

  https://git.buildroot.net/buildroot-test/plain/utils/br-reproduce-build

However, in the specific case of the host-meson-tools package: it's a
host package, so it's also affected by the host environment.

In practice the build errors look like this:

amlbootenc-gxl.c: In function 'boot_enc':
amlbootenc-gxl.c:133:2: error: 'for' loop initial declarations are only allowed in C99 mode
  for (int i = 0; i < sizeof(hdr.key); i++) {

So this doesn't happen on your machine because you have a more recent
gcc version installed, which defaults to C99, while the particular
autobuilder machines are using an older gcc version.

You could reproduce by using a Docker container or VM running an older
Linux distribution that uses an older gcc version.

Practically speaking, either you do a patch that drops the use of C99
features from the meson-tools code base, or you add -std=c99 to the
CFLAGS.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
