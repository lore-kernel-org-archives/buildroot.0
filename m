From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 02 Feb 2015 22:57:27 +0100
Subject: [Buildroot] [RFC 3/4] toolchain-externel: mass-define actual
 source tarball for known patterns
In-Reply-To: <1420199015-16907-4-git-send-email-luca@lucaceresoli.net>
References: <1420199015-16907-1-git-send-email-luca@lucaceresoli.net>
 <1420199015-16907-4-git-send-email-luca@lucaceresoli.net>
Message-ID: <54CFF2C7.50706@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/01/15 12:43, Luca Ceresoli wrote:
> For some externel toolchain vendors the actual source code URL can be simply
> derived from the binary file URL.
> 
> Here we obtain TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL for all Mentor and
> Linaro toolchains with a few $(subst) calls.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> ---
>  toolchain/toolchain-external/toolchain-external.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index b07b16c..91edd4a 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -392,6 +392,14 @@ TOOLCHAIN_EXTERNAL_SITE = $(dir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
>  TOOLCHAIN_EXTERNAL_SOURCE = $(notdir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
>  endif
>  
> +# Some toolchain vendors have a regular file naming pattern.
> +# For them, mass-define _ACTUAL_SOURCE_TARBALL based _SITE.

 I actually think we should refactor the external toolchains to factor out these
common parts of the SITE and SOURCE, but that's for another day :-)


> +ifneq ($(findstring sourcery.mentor.com/public/gnu_toolchain,$(TOOLCHAIN_EXTERNAL_SITE)),)
> +TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL ?= $(subst -i686-pc-linux-gnu.tar.bz2,.src.tar.bz2,$(subst -i686-pc-linux-gnu-i386-linux.tar.bz2,-i686-pc-linux-gnu.src.tar.bz2,$(TOOLCHAIN_EXTERNAL_SOURCE)))

 More importantly: could you split this huge line? Make removes all whitespace
at the beginning of the line after a backslash-newline, so there is no reason
not to split it.


> +else ifneq ($(findstring http://releases.linaro.org,$(TOOLCHAIN_EXTERNAL_SITE)),)
> +TOOLCHAIN_EXTERNAL_ACTUAL_SOURCE_TARBALL ?= $(subst _linux.tar.xz,_src.tar.bz2,$(TOOLCHAIN_EXTERNAL_SOURCE))

 Same here.


 Regards,
 Arnout


> +endif
> +
>  # In fact, we don't need to download the toolchain, since it is already
>  # available on the system, so force the site and source to be empty so
>  # that nothing will be downloaded/extracted.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
