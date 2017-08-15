From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 15 Aug 2017 17:32:14 +0200
Subject: [Buildroot] [PATCH] core/pkg-toolchain-external: quiesce
	spurious stderr
In-Reply-To: <20170815150340.16983-1-yann.morin.1998@free.fr>
References: <20170815150340.16983-1-yann.morin.1998@free.fr>
Message-ID: <a0db62ed-35c1-31d4-225b-27763d0d730c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-08-17 17:03, Yann E. MORIN wrote:
[snip]
> ---
>  toolchain/toolchain-external/pkg-toolchain-external.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> index 23cdf30b9f..b139638100 100644
> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> @@ -74,7 +74,7 @@ endif
>  ifeq ($(TOOLCHAIN_EXTERNAL_INSTALL_DIR),)
>  ifneq ($(TOOLCHAIN_EXTERNAL_PREFIX),)
>  # if no path set, figure it out from path
> -TOOLCHAIN_EXTERNAL_BIN := $(shell dirname $(shell which $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc))
> +TOOLCHAIN_EXTERNAL_BIN := $(shell dirname $(shell which $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc) 2>/dev/null)

 How about

TOOLCHAIN_EXTERNAL_BIN := $(dir $(shell which $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc))

? Or is there some fundamental reason why $(dir ...) doesn't work here?

 For reference: this construct was introduced by Peter in 85dc57f6fd27 when he
added the toolchain wrapper. Before that time, the external-toolchain-from-path
was implicit because it would be used directly in TARGET_CC. The commit contains
no explanation as to why it needs to be 'shell dirname' instead of the make
function 'dir'.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
