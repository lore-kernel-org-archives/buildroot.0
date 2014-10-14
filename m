From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Oct 2014 23:25:27 +0200
Subject: [Buildroot] [PATCH] botan: fix build with
 mips64el-ctng_n32-linux-gnu toolchain
In-Reply-To: <1413305543-32388-1-git-send-email-francois.perrad@gadz.org>
References: <1413305543-32388-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <543D94C7.2070100@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/10/14 18:52, Francois Perrad wrote:
> set --cpu only with "mips"
> 
> see http://autobuild.buildroot.org/results/5dc/5dc907c0334d3a3b7abff41eef4e025c1f29a655/build-end.log
> 

 I don't think you're doing the right thing here. Botan has correctly identified
this as a mips64; however, it doesn't detect that it's using n32...

 Vicente, could you have a look?

 Regards,
 Arnout

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/botan/botan.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/package/botan/botan.mk b/package/botan/botan.mk
> index ae0e02d..226294b 100644
> --- a/package/botan/botan.mk
> +++ b/package/botan/botan.mk
> @@ -13,8 +13,14 @@ BOTAN_LICENSE_FILES = doc/license.txt
>  BOTAN_INSTALL_STAGING = YES
>  BOTAN_INSTALL_TARGET = YES
>  
> +BOTAN_ARCH = $(BR2_ARCH)
> +
> +ifneq ($(findstring mips,$(BOTAN_ARCH)),)
> +	BOTAN_ARCH = mips
> +endif
> +
>  BOTAN_CONF_OPTS = \
> -	--cpu=$(BR2_ARCH) \
> +	--cpu=$(BOTAN_ARCH) \
>  	--os=linux \
>  	--cc=gcc \
>  	--cc-bin="$(TARGET_CXX)"
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
