From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Aug 2018 12:37:03 +0200
Subject: [Buildroot] [PATCH] mesa3d-headers: fix logic to generate the
 dri.pc file
In-Reply-To: <20180810214632.21735-1-thomas.petazzoni@bootlin.com>
References: <20180810214632.21735-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180811123703.0b0a4f7f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Aug 2018 23:46:32 +0200, Thomas Petazzoni wrote:
> As noted by Arnout in [1], the logic in mesa3d-headers.mk generates a
> bogus dri.pc file, which looks like this:
> 
> prefix=/usr
> exec_prefix=/usr
> libdir=/lib
> includedir=/include
> dridriverdir=/dri
> 
> Indeed, the ${...} are expanded as shell variables when the sed
> command is executed, while the intention is that those ${...} should
> go in the .pc file. By escaping those using $${...}, we get the
> expected .pc file:
> 
> prefix=/usr
> exec_prefix=/usr
> libdir=${exec_prefix}/lib
> includedir=${prefix}/include
> dridriverdir=${libdir}/dri
> 
> This was detected by the not yet committed check-package improvement
> from Ricardo that detects bogus ${...} usage to reference make
> variables.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2018-July/225402.html
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/mesa3d-headers/mesa3d-headers.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
