From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 7 Nov 2017 22:23:24 +0100
Subject: [Buildroot] [RFCv1 3/4] toolchain: post-pone evaluation of
 TOOLCHAIN_EXTERNAL_BIN
In-Reply-To: <20171103160627.6468-4-thomas.petazzoni@free-electrons.com>
References: <20171103160627.6468-1-thomas.petazzoni@free-electrons.com>
 <20171103160627.6468-4-thomas.petazzoni@free-electrons.com>
Message-ID: <42689797-2392-a70c-16d4-eb96c6bcc8c0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-11-17 17:06, Thomas Petazzoni wrote:
> The upcoming per-package SDK functionality is heavily based on the
> fact that HOST_DIR, STAGING_DIR and TARGET_DIR are evaluated during
> the configure/build/install steps of the packages. Therefore, any
> evaluation-during-assignment using := is going to cause problems, and
> need to be turned into evaluation-during-use using =.
> 
> This patch fix up one such instance in the external toolchain code.
             fixes

> 
> This change is independent from the per-package SDK functionality, and
> could be applied separately.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  toolchain/toolchain-external/pkg-toolchain-external.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
> index dc0588c536..b9ad1720a1 100644
> --- a/toolchain/toolchain-external/pkg-toolchain-external.mk
> +++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
> @@ -77,7 +77,7 @@ ifneq ($(TOOLCHAIN_EXTERNAL_PREFIX),)
>  TOOLCHAIN_EXTERNAL_BIN := $(dir $(shell which $(TOOLCHAIN_EXTERNAL_PREFIX)-gcc))
>  endif
>  else
> -TOOLCHAIN_EXTERNAL_BIN := $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/bin
> +TOOLCHAIN_EXTERNAL_BIN = $(TOOLCHAIN_EXTERNAL_INSTALL_DIR)/bin

 It gives me the shivers to see the same variable sometimes defined recursive
and sometimes defined immediate... But I can't find an elegant solution (other
than introducing an artificial extra variable, which is also ugly), so

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout


>  endif
>  
>  # If this is a buildroot toolchain, it already has a wrapper which we want to
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
