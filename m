From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Jul 2020 21:54:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/dhcpcd: fix build without fork
In-Reply-To: <20200713090140.154594-1-fontaine.fabrice@gmail.com>
References: <20200713090140.154594-1-fontaine.fabrice@gmail.com>
Message-ID: <20200713215402.29a5770b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Mon, 13 Jul 2020 11:01:40 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Add a patch to fix build without fork in src/dhcpcd.
> - Disable privsep as it unconditionally uses fork (privsep has been
>   enabled by default since version 9.0.0 and
>   https://github.com/rsmarples/dhcpcd/commit/3a4c2e5604d72151b06ed365aa71493740a3ad75)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/9fcc88abedcb8a02946f37837dcf4fff02f66c23
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I have applied, but your explanations are still too short, and they
require additional effort from the maintainers to do research and have
a proper commit log.

Indeed, where there is a build failure like this, just "fixing" it is
not enough. We need to understand since when it is happening, and why,
so that we can understand if the fix should be backported to a LTS or
stable release.

So, I've done that research here, and extended the commit log as
follows:

    package/dhcpcd: fix build without fork
    
    - Add a patch to fix build without fork in src/dhcpcd.c. This
      regression was introduced in upstream commit
      3063ebb6c8ac7c96196fa923cdd5f7c0384de23b, which was merged in dhcpcd
      9.0.0. Therefore, Buildroot is affected since we bumped from 8.0.3
      to 9.1.4 in commit 809f548e79c6c099f1fa3e3728d90842be7059a7, which
      was applied after 2020.05
    
    - Disable privsep as it unconditionally uses fork (privsep has been
      enabled by default since version 9.0.0 and
      https://github.com/rsmarples/dhcpcd/commit/3a4c2e5604d72151b06ed365aa71493740a3ad75)
    
    Fixes:
    
     - http://autobuild.buildroot.org/results/9fcc88abedcb8a02946f37837dcf4fff02f66c23
    
Could you try to do that research in the future, and extend the commit
log as appropriate ? This would really help reducing the effort on the
maintainer shoulders.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
