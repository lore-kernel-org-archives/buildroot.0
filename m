From: Nathaniel Husted <nathaniel.husted@outlook.com>
Date: Wed, 19 May 2021 12:35:16 +0000
Subject: [Buildroot] [PATCHv2 1/1] package/rustc: add musl as an
 available Rust libc
In-Reply-To: <20210518230043.63dc9ac7@windsurf.orange-hotspot>
References: <SJ0PR18MB3898AC687557A2CD4FA0340995599@SJ0PR18MB3898.namprd18.prod.outlook.com>,
 <20210518230043.63dc9ac7@windsurf.orange-hotspot>
Message-ID: <SJ0PR18MB3898F64AF1A5908759597DBE952B9@SJ0PR18MB3898.namprd18.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Apologies for missing the robust engineering solution there. As a follow-up question, how does the buildroot community generally handle .hash file updates? Should these always be done in a package patch set via multiple parts? Do you test the gpg keys and sha256sums "by hand" or is there a utility used when version update commits occur?

I was looking through the contributor documentation to determine expectations with respect to patches and looked through the utilities folder to see if there were supporting tools but could not find a discussion.

Cheers,
Nathaniel
________________________________________
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Sent: Tuesday, May 18, 2021 5:00 PM
To: Nathaniel Husted
Cc: buildroot at buildroot.org; Eric Le Bihan
Subject: Re: [Buildroot] [PATCHv2 1/1] package/rustc: add musl as an available Rust libc

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
