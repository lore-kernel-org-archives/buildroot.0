From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 30 Oct 2015 11:51:21 +0100
Subject: [Buildroot] [PATCH 2/9 v2] toolchain-external/blacfin: always
 force keeping hardlinks from archives
In-Reply-To: <5a706d0a2b7d76256a1883350e3e22ffcc3501ec.1445690712.git.yann.morin.1998@free.fr>
References: <cover.1445690712.git.yann.morin.1998@free.fr>
 <5a706d0a2b7d76256a1883350e3e22ffcc3501ec.1445690712.git.yann.morin.1998@free.fr>
Message-ID: <56334BA9.60508@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24-10-15 14:48, Yann E. MORIN wrote:
> Currently, for the blackfin external toolchains, we tell tar to extract
> files by dereferencing hard-links.
> 
> However, --hard-dereference has no impact when extracting archives in
> which there are hard-links.

 Took me a while to understand what you meant. How about:

However, --hard-dereference is only meaningful when creating an archive,
not when extracting it.

 With that:

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

> 
> Drop this option.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  toolchain/toolchain-external/toolchain-external.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
> index 4e12a1c..704ce2b 100644
> --- a/toolchain/toolchain-external/toolchain-external.mk
> +++ b/toolchain/toolchain-external/toolchain-external.mk
> @@ -453,9 +453,9 @@ ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1)$(BR2_TOOLCHAIN_EXTERNAL_
>  define TOOLCHAIN_EXTERNAL_EXTRACT_CMDS
>  	mkdir -p $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)
>  	$(call suitable-extractor,$(TOOLCHAIN_EXTERNAL_SOURCE)) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_SOURCE) | \
> -		$(TAR) --strip-components=3 --hard-dereference -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(TAR_OPTIONS) -
> +		$(TAR) --strip-components=3 -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(TAR_OPTIONS) -
>  	$(call suitable-extractor,$(TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS)) $(DL_DIR)/$(TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS) | \
> -		$(TAR) --strip-components=3 --hard-dereference -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(TAR_OPTIONS) -
> +		$(TAR) --strip-components=3 -C $(TOOLCHAIN_EXTERNAL_INSTALL_DIR) $(TAR_OPTIONS) -
>  endef
>  else ifneq ($(TOOLCHAIN_EXTERNAL_SOURCE),)
>  # Normal handling of toolchain tarball extraction.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
