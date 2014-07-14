From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 14 Jul 2014 18:34:09 +0200
Subject: [Buildroot] [PATCH 0 of 6] uclibc: fix handling of
	configuration file
In-Reply-To: <patchbomb.1405338624@localhost>
References: <patchbomb.1405338624@localhost>
Message-ID: <53C40681.6040907@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/07/14 13:50, Thomas De Schampheleire wrote:
> 
> This patch series (part of it poster earlier as RFC) has as main goal to
> fix the uclibc kconfig handling with following requirements in mind:
> 
> - neither foo-menuconfig nor foo-update-config should have a dependency
>   on the toolchain (which means we cannot depend on foo-configure)
> 
> - 'clean foo-menuconfig' should start from the specified (custom) config
>   file
> 
> - 'foo-menuconfig foo-update-config' should preserve the changes made in
>   the menuconfig step (this problem is reported for uclibc with bug #7154
>   (https://bugs.busybox.net/show_bug.cgi?id=7154).
> 
> - 'make foo-menuconfig; make foo-menuconfig' should preserve the changes
>   made in the menuconfig step.
> 
> - 'make clean foo-update-config' should copy the initial file, do any
>   fixups, and then save the config
> 
> 
> In the process, some smaller changes are done too.
> 
> Once this series is accepted, the plan is:
> - to extract the kconfig-related bits to a kconfig-package infrastructure.
> - to convert busybox, linux and barebox to this kconfig-package infra too.

 For the record: I agree with this plan.

 I also agree with the plan to land this in 2014.08.


 Regards,
 Arnout

> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> ---
> Thomas De Schampheleire (6):
>     pkg-utils: kconfig helpers: add basic usage documentation
>     pkg-utils: kconfig helpers: use single iso double quoting
>     uclibc: replace custom kconfig helpers with those provided by pkg-utils
>     uclibc: rename SETUP_DOT_CONFIG to FIXUP_DOT_CONFIG
>     uclibc: menuconfig: take into account initial settings from config file
>     uclibc: update-config: preserve freshly configured settings
> 
> 
>  linux/linux.mk           |    2 +-
>  package/pkg-utils.mk     |   12 +-
>  package/uclibc/uclibc.mk |  230 ++++++++++++++++++--------------------
>  3 files changed, 119 insertions(+), 125 deletions(-)
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
