From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 18 May 2021 23:00:43 +0200
Subject: [Buildroot] [PATCHv2 1/1] package/rustc: add musl as an
 available Rust libc
In-Reply-To: <SJ0PR18MB3898AC687557A2CD4FA0340995599@SJ0PR18MB3898.namprd18.prod.outlook.com>
References: <SJ0PR18MB3898AC687557A2CD4FA0340995599@SJ0PR18MB3898.namprd18.prod.outlook.com>
Message-ID: <20210518230043.63dc9ac7@windsurf.orange-hotspot>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Nathaniel,

On Wed,  5 May 2021 11:53:46 -0400
Nathaniel Husted <nathaniel.husted@outlook.com> wrote:

> The current rustc package only supports gnu libc and hardcodes this
> requirement. This patch adds musl to the available libc options for
> Rust packages. Musl is now a Tier 2 supported environment for Rust.
> Tier 2 means the platforms are "guaranteed to build" and official
> binary releases are available. The changes in rustc.mk will also
> support adding uclibc when that environment reaches Tier 2 support
> but does not allow for uclibc currently as it is still a Tier 3
> supported environment.
> 
> This patch includes corrections from the prior version submitted
> in March, 2021.
> 
> Signed-off-by: Nathaniel Husted <nathaniel.husted@outlook.com>

Thanks a lot. Unfortunately, after a more careful review, this patch
still has issues:

 (1) You're not updating package/rust-bin/rust-bin.hash for all those
     new target platforms, so the download will fail as hashes are not
     available.

 (2) Changing "depends on glibc" with "depends on glibc || musl"
     doesn't work as some architectures that are supported with glibc
     are not supported with musl.

So I went on and wrote a more complete/complex solution, which I have
submitted at:

  https://patchwork.ozlabs.org/project/buildroot/list/?series=244536

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
