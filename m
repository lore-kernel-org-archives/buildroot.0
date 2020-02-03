From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Feb 2020 19:46:38 +0100
Subject: [Buildroot] [PATCH 1/5] package/refpolicy: remove dependency on
 policycoreutils
In-Reply-To: <20200203132951.1331252-1-aduskett@gmail.com>
References: <20200203132951.1331252-1-aduskett@gmail.com>
Message-ID: <20200203194638.4581b6d9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  3 Feb 2020 05:29:47 -0800
Adam Duskett <aduskett@gmail.com> wrote:

> Only host-policycoreutils is needed to build refpolicy. Remove the uneeded
> target package.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

So, this commit had the side effect of causing a build issue:

  http://autobuild.buildroot.net/results/5d8/5d8fda7c488a03c14942d87467d501acd633d24a/build-end.log

this is due to policycoreutils selecting BR2_PACKAGE_BUSYBOX_SELINUX
when BR2_PACKAGE_BUSYBOX, which in turns causes busybox to select
BR2_PACKAGE_LIBSELINUX and depend on it from a makefile point of view.
But since we dropped the "depends on" of policycoreutils, we now
violate the "depends on" of libselinux.

However, it probably isn't the best idea of have refpolicy take care of
forcing Busybox's SELinux support, so I've committed a change to
Busybox that makes it enable by default its SELinux support when
libselinux is enabled:

  https://git.buildroot.org/buildroot/commit/?id=bc2e241bce5c1f70e93d22aceee180ee26db0e77

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
