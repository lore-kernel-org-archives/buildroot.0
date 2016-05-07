From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 7 May 2016 22:52:37 +0200
Subject: [Buildroot] [PATCH 05/34] reproducibility/linux: override build
 timestamp
In-Reply-To: <1462002570-14706-5-git-send-email-gilles.chanteperdrix@xenomai.org>
References: <20160430074358.GE1781@hermes.click-hack.org>
 <1462002570-14706-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <1462002570-14706-5-git-send-email-gilles.chanteperdrix@xenomai.org>
Message-ID: <a897f700-cdcd-96b2-c080-c68814e5b93a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/30/16 09:49, Gilles Chanteperdrix wrote:
> with SOURCE_DATE_EPOCH
> ---
>  linux/linux.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 9507837..d882702 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -74,6 +74,14 @@ LINUX_MAKE_ENV = \
>  	$(TARGET_MAKE_ENV) \
>  	BR_BINARIES_DIR=$(BINARIES_DIR)
>
> +ifeq ($(BR2_REPRODUCIBLE),y)
> +LINUX_MAKE_ENV += \
> +	KBUILD_BUILD_VERSION=1 \
> +	KBUILD_BUILD_USER=buildroot \
> +	KBUILD_BUILD_HOST=buildroot \

  This is for example something that really should be inside BR2_REPRODUCIBLE, 
because the build user and version gives me useful information while developing.

> +	KBUILD_BUILD_TIMESTAMP="$(shell TZ=UTC LANG=C LC_ALL=C date -d @$(SOURCE_DATE_EPOCH))"

  I think the TZ LANG LC_ALL things are redundant, because we already exported 
those.

  This timestamp is used in several places, so I think it's useful to save it in 
a global SOURCE_DATE variable.

  Regards,
  Arnout

> +endif
> +
>  # Get the real Linux version, which tells us where kernel modules are
>  # going to be installed in the target filesystem.
>  LINUX_VERSION_PROBED = `$(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) --no-print-directory -s kernelrelease 2>/dev/null`
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
