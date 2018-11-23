From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Nov 2018 22:29:30 +0100
Subject: [Buildroot] [PATCH v2 1/1] linux: Make dtc install step more
 reliable
In-Reply-To: <20181113155016.24022-1-anaumann@ultratronik.de>
References: <20181113155016.24022-1-anaumann@ultratronik.de>
Message-ID: <20181123222930.41f98733@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 13 Nov 2018 16:50:16 +0100, Andreas Naumann wrote:
> Checking for the existence of the dtc binary built by the
> non-dependent dtc package may cause instable behaviour when giving more
> freedom on the order of how the packages are built (parallelization).
> 
> In addidion, when moving to per-package host/target method, the check
> would always trigger in the isolated host, leading to linux-dtc always
> being installed as dtc.
> This in turn may lead to undesired overwriting of the real host-dtc binary
> when finally assembling the global host dir.
> 
> Thus rework the linux-dtc install condition to be defined by configuration
> rather than compile time order.
> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> ---
> Changes v1 -> v2: 
>   - simplified by direct usage of make conditional almost as suggested by
>     Arnout (test revealed that an additinal comma was needed for correct logic)
> ---
>  linux/linux.mk | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

I hesitated a bit, but in the end decided to apply this to master.
Indeed, with the current code, it's really a matter of luck whether
host-dtc gets built before/after linux that determines if the dtc ->
linux-dtc symlink will be created or not. With this patch, regardless
of whether host-dtc is built before or after linux, we'll have the same
result. To me, this was a sufficient motivation to apply this patch to
master.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
