From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Feb 2014 07:25:33 +0100
Subject: [Buildroot] [PATCH v4 2/7] Makefile: introduce BR_PATH
In-Reply-To: <1392559113-5215-3-git-send-email-s.martin49@gmail.com>
References: <1392559113-5215-1-git-send-email-s.martin49@gmail.com>
 <1392559113-5215-3-git-send-email-s.martin49@gmail.com>
Message-ID: <5302FCDD.5090500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/02/14 14:58, Samuel Martin wrote:
> Since the HOST_PATH and TARGET_PATH variables almost contain the same
> things, let's factorize this in a single BR_PATH.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v3 -> v4:
> - rebase
> - rename BR2_PATH -> BR_PATH
> 
> changes v2 -> v3:
> - rebase
> 
> changes v1 -> v2:
> - rebase
> ---
>  Makefile            | 3 +++
>  package/Makefile.in | 4 ++--
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 20aabd6..138e0ef 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -325,6 +325,9 @@ TAR_OPTIONS=$(call qstrip,$(BR2_TAR_OPTIONS)) -xf
>  # packages compiled for the host go here
>  HOST_DIR:=$(call qstrip,$(BR2_HOST_DIR))
>  
> +# Set BR_PATH (including host bindirs)

 This comment is redundant.

> +BR_PATH:="$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin:$(PATH)"

 Use = instead of := and put spaces around it.

 Also, the quoting is really redundant. The original comment said "Quotes
are needed for spaces et al in path components", but since that was only
done for TARGET_PATH and not for HOST_PATH it didn't work in the first
place. In addition, we also don't add quotes around the other uses of
HOST_DIR etc., so it's just $(PATH) itself that we're protecting. If you
do keep the quotes, at least copy the comment.


> +
>  # locales to generate
>  GENERATE_LOCALE=$(call qstrip,$(BR2_GENERATE_LOCALE))
>  
> diff --git a/package/Makefile.in b/package/Makefile.in
> index eea7043..15b7e3c 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -145,7 +145,7 @@ TARGET_CROSS=$(HOST_DIR)/usr/bin/$(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_PREFIX))
>  endif
>  
>  # Quotes are needed for spaces et al in path components.

 This comment is no longer in the right place.


 Regards,
 Arnout

> -TARGET_PATH="$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(HOST_DIR)/usr/sbin/:$(PATH)"
> +TARGET_PATH = $(BR_PATH)
>  
>  # Define TARGET_xx variables for all common binutils/gcc
>  TARGET_AR       = $(TARGET_CROSS)ar
> @@ -200,7 +200,7 @@ HOST_CFLAGS   ?= -O2
>  HOST_CFLAGS   += $(HOST_CPPFLAGS)
>  HOST_CXXFLAGS += $(HOST_CFLAGS)
>  HOST_LDFLAGS  += -L$(HOST_DIR)/lib -L$(HOST_DIR)/usr/lib -Wl,-rpath,$(HOST_DIR)/usr/lib
> -HOST_PATH=$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(PATH)
> +HOST_PATH = $(BR_PATH)
>  
>  # hostcc version as an integer - E.G. 4.3.2 => 432
>  HOSTCC_VERSION:=$(shell $(HOSTCC_NOCCACHE) --version | \
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
