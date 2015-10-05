From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 5 Oct 2015 19:39:05 +0100
Subject: [Buildroot] [PATCH v2 1/2] axfsutils: add new package
In-Reply-To: <1444064102-13575-2-git-send-email-ariel@vanguardiasur.com.ar>
References: <1444064102-13575-1-git-send-email-ariel@vanguardiasur.com.ar>
 <1444064102-13575-2-git-send-email-ariel@vanguardiasur.com.ar>
Message-ID: <5612C3C9.8000805@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05-10-15 17:55, Ariel D'Alessandro wrote:
> Tools for building AXFS Filesystem.
> 
> The Advanced XIP File System is a Linux kernel filesystem driver that enables
> files to be executed directly from flash or ROM memory rather than being copied
> into RAM.

 Commit messages are normally wrapped at 72 columns.

> 
> Source:
> 	https://github.com/jaredeh/axfs
> 
> Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
> ---
>  package/axfsutils/axfsutils.mk | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 package/axfsutils/axfsutils.mk
> 
> diff --git a/package/axfsutils/axfsutils.mk b/package/axfsutils/axfsutils.mk
> new file mode 100644
> index 0000000..ce5b892
> --- /dev/null
> +++ b/package/axfsutils/axfsutils.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# axfsutils
> +#
> +################################################################################
> +
> +AXFSUTILS_VERSION = f26ae785e33df76f658b71ef2cfbc7f511ff875d
> +AXFSUTILS_SITE = $(call github,jaredeh,axfs,$(AXFSUTILS_VERSION))
> +AXFSUTILS_LICENSE = GPLv2

 I verified that it's indeed v2 only.

> +AXFSUTILS_LICENSE_FILES = COPYING

 It's actually mkfs.axfs-legacy/COPYING.


 Looking at the source, it seems that you have to add host-zlib as a dependency.


 Regards,
 Arnout

> +
> +define HOST_AXFSUTILS_BUILD_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) -C $(@D)/mkfs.axfs-legacy

 It would be add to add an explanation why you use the legacy one: "The 'new'
mkfs.axfs requires GNUstep which is not a buildroot prerequisite, and the
'legacy' one works just as well."

 Note that comments should be put outside of the CMDS block.


 Regards,
 Arnout

> +endef
> +
> +define HOST_AXFSUTILS_INSTALL_CMDS
> +	cp $(@D)/mkfs.axfs-legacy/mkfs.axfs $(HOST_DIR)/usr/bin/
> +endef
> +
> +$(eval $(host-generic-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
