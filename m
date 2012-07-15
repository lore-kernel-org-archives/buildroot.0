From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 15 Jul 2012 13:24:24 +0200
Subject: [Buildroot] [PATCH 1 of 6 resend] pkg-download.mk: allow using
 localfiles outside of package infrastructure
In-Reply-To: <1dcdff3e9437fc63cd4b.1340343754@beantl019720>
References: <patchbomb.1340343753@beantl019720>
 <1dcdff3e9437fc63cd4b.1340343754@beantl019720>
Message-ID: <5002A868.70107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/22/12 07:42, Thomas De Schampheleire wrote:
> The localfiles download method uses $($(PKG)_SITE))) and
> $($(PKG)_SOURCE) instead of $(1) and $(2). This means that it can only
> be used for package downloads (through gentargets, autotargets, ...)
> and not for other downloads like external toolchains.
>
> This patch changes localfiles to allow this, just as the wget and scp
> download methods already did.
> For the version control download methods, nothing changes.

  Is there any reason not to do it for the VCS download methods?

>
> Signed-off-by: Thomas De Schampheleire<thomas.de.schampheleire@gmail.com>
>
> ---
>   package/pkg-download.mk |  8 ++++----
>   1 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -174,16 +174,16 @@ define SHOW_EXTERNAL_DEPS_WGET
>   endef
>
>   define DOWNLOAD_LOCALFILES
> -	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
> -		$(LOCALFILES) $(call qstrip,$(subst file://,,$($(PKG)_SITE)))/$($(PKG)_SOURCE) $(DL_DIR)
> +	test -e $(DL_DIR)/$(2) || \
> +		$(LOCALFILES) $(call qstrip,$(subst file://,,$(1))) $(DL_DIR)

  Shouldn't this be
		$(LOCALFILES) $(call qstrip,$(subst file://,,$(1))) $(DL_DIR)/$(2)

>   endef
>
>   define SOURCE_CHECK_LOCALFILES
> -  test -e $(call qstrip,$(subst file://,,$($(PKG)_SITE)))/$($(PKG)_SOURCE)
> +  test -e $(call qstrip,$(subst file://,,$(1)))
>   endef
>
>   define SHOW_EXTERNAL_DEPS_LOCALFILES
> -  echo $($(PKG)_SITE)/$($(PKG)_SOURCE)
> +  echo $(2)

  Funny, the original was actually wrong...

  Regards,
  Arnout

>   endef
>
>   ################################################################################
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
