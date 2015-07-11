From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 12 Jul 2015 00:30:21 +0200
Subject: [Buildroot] [PATCH 3/7] intel-microcode: use
 <PKG>_STRIP_COMPONENTS
In-Reply-To: <1436624110-20428-3-git-send-email-luca@lucaceresoli.net>
References: <1436624110-20428-1-git-send-email-luca@lucaceresoli.net>
 <1436624110-20428-3-git-send-email-luca@lucaceresoli.net>
Message-ID: <55A198FD.5030508@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/11/15 16:15, Luca Ceresoli wrote:
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/intel-microcode/intel-microcode.mk | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/intel-microcode/intel-microcode.mk b/package/intel-microcode/intel-microcode.mk
> index 4e8ea906c624..23c4b3ebfb47 100644
> --- a/package/intel-microcode/intel-microcode.mk
> +++ b/package/intel-microcode/intel-microcode.mk
> @@ -7,17 +7,17 @@
>  INTEL_MICROCODE_VERSION = 20150107
>  INTEL_MICROCODE_SOURCE = microcode-$(INTEL_MICROCODE_VERSION).tgz
>  INTEL_MICROCODE_SITE = http://downloadmirror.intel.com/24616/eng
> +INTEL_MICROCODE_STRIP_COMPONENTS = 0
>  INTEL_MICROCODE_LICENSE = PROPRIETARY
>  INTEL_MICROCODE_LICENSE_FILES = license.txt
>  INTEL_MICROCODE_REDISTRIBUTE = NO
>  
> -# N.B. Don't strip any path components during extraction.
> -define INTEL_MICROCODE_EXTRACT_CMDS
> -	gzip -d -c $(DL_DIR)/$(INTEL_MICROCODE_SOURCE) | \
> -	tar --strip-components=0 -C $(@D) -xf -
> +define INTEL_MICROCODE_EXTRACT_LICENSE
>  	head -n 33 $(@D)/microcode.dat > $(@D)/license.txt
>  endef
>  
> +INTEL_MICROCODE_POST_EXTRACT_HOOKS += INTEL_MICROCODE_EXTRACT_LICENSE
> +
>  define INTEL_MICROCODE_INSTALL_TARGET_CMDS
>  	$(INSTALL) -D -m 0644 $(@D)/microcode.dat \
>  		$(TARGET_DIR)/usr/share/misc/intel-microcode.dat
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
