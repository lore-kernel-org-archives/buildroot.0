From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 21 Aug 2013 22:07:19 +0200
Subject: [Buildroot] [PATCH 1/3] kmod: allow to build a host variant
In-Reply-To: <1376996742-4638-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1376996742-4638-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1376996742-4638-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <52151DF7.2050006@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/08/13 13:05, Thomas Petazzoni wrote:
> Since module-init-tools is deprecated, we now want to use kmod instead
> for the installation of modules during the kernel build process. In
> order to do this, we need to be able to build a host variant of kmod,
> which is want this patch allows to do.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>   package/kmod/kmod.mk | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
> index 72a24af..8951a56 100644
> --- a/package/kmod/kmod.mk
> +++ b/package/kmod/kmod.mk
> @@ -53,4 +53,13 @@ else
>   KMOD_CONF_OPT += --disable-tools
>   endif
>
> +define HOST_KMOD_INSTALL_TOOLS
> +	mkdir -p $(HOST_DIR)/sbin/
> +	for i in depmod insmod lsmod modinfo modprobe rmmod; \
> +	do ln -sf ../usr/bin/kmod $(HOST_DIR)/sbin/$$i; done

  Even though this is cut&paste of the above, I would indent it properly 
here (and maybe also above).

  Maybe for the host tools, only include depmod. The others _really_ 
shouldn't be used.

  Regards,
  Arnout

> +endef
> +
> +HOST_KMOD_POST_INSTALL_HOOKS += HOST_KMOD_INSTALL_TOOLS
> +
>   $(eval $(autotools-package))
> +$(eval $(host-autotools-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
