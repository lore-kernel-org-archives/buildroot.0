From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 25 Jun 2014 08:06:45 +0200
Subject: [Buildroot] [PATCH 0 of 5 RFC] uclibc/busybox: fix handling of
 configuration file
In-Reply-To: <patchbomb.1403444739@localhost>
References: <patchbomb.1403444739@localhost>
Message-ID: <53AA66F5.3090706@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Thomas,

On 22/06/14 15:45, Thomas De Schampheleire wrote:
> 
> This patch series reworks the uclibc/busybox config file handling, based on
> following requirements:
> 
> - neither foo-menuconfig nor foo-update-config should have a dependency on
>   the toolchain (which means we cannot depend on foo-configure)
> - 'clean foo-menuconfig' should start from the specified (custom) config
>   file
> - 'foo-menuconfig foo-update-config' should preserve the changes made in the
>   menuconfig step (this problem is reported for uclibc with bug #7154
>   (https://bugs.busybox.net/show_bug.cgi?id=7154).

 I agree with these requirements. With of course the additional requirement
mentioned by ThomasP:

- 'make foo-menuconfig; make foo-menuconfig' should preserve the changes made in
the menuconfig step.

 However, I think it would be better to add infrastructure for kconfig packages,
instead of repeating the work for uclibc, busybox, linux and barebox. I was
thinking along the lines of:

$(eval $(generic-package))

LINUX_KCONFIG_TARGETS = menuconfig xconfig gconfig nconfig
LINUX_HAS_DEFCONFIG = YES

$(eval $(kconfig-package))



 Regards,
 Arnout

> 
> The series currently covers uclibc and busybox only, while the problem seems
> to be present for linux too. It is submitted as an RFC for this reason, as
> I'm unsure if there are comments on the approach.
> 
> Thanks for your feedback...
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> ---
>  package/busybox/busybox.mk |  28 +++++++++++++++++++---------
>  package/uclibc/uclibc.mk   |  16 +++++++++++++---
>  2 files changed, 32 insertions(+), 12 deletions(-)
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
