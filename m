From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Feb 2019 10:35:06 +0100
Subject: [Buildroot] [PATCH v2 00/10] Adding mender-artifact
In-Reply-To: <1549382436-15177-1-git-send-email-angelo@amarulasolutions.com>
References: <1549382436-15177-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <20190206103506.5d5b6623@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Angelo,

On Tue,  5 Feb 2019 17:00:26 +0100
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> This patch tries to resurrect an effort of Mizra from August to porting
> the mender-artifact tool to buildroot
> (https://patchwork.ozlabs.org/cover/962487/).
>  
> Mender artifact is a tool to generate artifacts for the mender software,
> it is therefore an host tool and it's the last piece to have mender
> available on buildroot.
> To have it compiled as an host tool, we need to enable support for host
> packages in go.
> So the intent of this patch is:
> * Enabling host golang packages
> * Refactoring dependencies to distinguish between host packages and
>   target packages
> * Adding mender-artifact
> 
> The initial patch for mender-artifact was from Mizra but I completely
> rewrote it, so I removed the signoff.
> 
> Angelo Compagnucci (9):
>   package/go: refactor host/target dependencies
>   package/docker-cli: using BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>   package/docker-containerd: using
>     BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>   package/docker-engine: using BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>   package/docker-proxy: using BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>   package/flannel: using BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>   package/mender: using BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>   package/runc: using BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>   package/mender-artifact: new package
> 
> Mirza Krak (1):
>   package/pkg-golang: add support for building host packages


As we discussed live during the meeting, I'd like to see the following
changes in this series:

 - The patch renaming BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS to
   BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS should go first in the
   series, and should contain all the changes to the packages as well
   (to not break bisectability). Of course, it should also contain the
   BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS change.

 - The patch adding support for host go packages should add a
   BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS option, and the manual should
   be updated to explain how this option should be used.

 - There should be a comment above both options in the Config.in.host
   file to explain which option should be used for what.

 - BR2_PACKAGE_HOST_GO_TARGET_SUPPORTS should be removed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
