From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 01 May 2015 15:15:05 +0200
Subject: [Buildroot] [PATCH 4/7] boot/barebox: do not check hash for
 custom versions
In-Reply-To: <895f0c166335e5dfb49a30dd8cf0b2986a5f7431.1430260630.git.yann.morin.1998@free.fr>
References: <cover.1430260630.git.yann.morin.1998@free.fr>
 <895f0c166335e5dfb49a30dd8cf0b2986a5f7431.1430260630.git.yann.morin.1998@free.fr>
Message-ID: <55437C59.2080502@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/04/15 00:40, Yann E. MORIN wrote:
> As we recently did for U-Boot, disable chekcing hashes for custom
                                         checking

> versions of barebox.
> 
> Note that we currently have no hash file for barebox, but avoiding the
> check will already be in place when we do add it.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  boot/barebox/barebox.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/boot/barebox/barebox.mk b/boot/barebox/barebox.mk
> index 54f52bb..764791d 100644
> --- a/boot/barebox/barebox.mk
> +++ b/boot/barebox/barebox.mk
> @@ -11,6 +11,7 @@ ifeq ($(BAREBOX_VERSION),custom)
>  BAREBOX_TARBALL = $(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_TARBALL_LOCATION))
>  BAREBOX_SITE = $(patsubst %/,%,$(dir $(BAREBOX_TARBALL)))
>  BAREBOX_SOURCE = $(notdir $(BAREBOX_TARBALL))
> +BR_NO_CHECK_HASH_FOR += $(BAREBOX_SOURCE)
>  else ifeq ($(BR2_TARGET_BAREBOX_CUSTOM_GIT),y)
>  BAREBOX_SITE = $(call qstrip,$(BR2_TARGET_BAREBOX_CUSTOM_GIT_REPO_URL))
>  BAREBOX_SITE_METHOD = git
> @@ -18,6 +19,9 @@ else
>  # Handle stable official Barebox versions
>  BAREBOX_SOURCE = barebox-$(BAREBOX_VERSION).tar.bz2
>  BAREBOX_SITE = http://www.barebox.org/download
> +ifeq ($(BR2_TARGET_BAREBOX_CUSTOM_VERSION),y)
> +BR_NO_CHECK_HASH_FOR += $(BAREBOX_SOURCE)
> +endif
>  endif

 Same comment as for U-Boot.

 Regards,
 Arnout

>  
>  BAREBOX_DEPENDENCIES = host-lzop
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
