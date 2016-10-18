From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Oct 2016 22:06:16 +0200
Subject: [Buildroot] [PATCH 18/93] cryptopp: use $(HOST_CONFIGURE_OPTS)
 when calling $(MAKE)
In-Reply-To: <1476720440-22239-19-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476720440-22239-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <1476720440-22239-19-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <42237853-2c32-5558-8c6e-f36c38513a17@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-10-16 18:06, gustavo.zacarias at free-electrons.com wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> ---
>  package/cryptopp/cryptopp.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
> index df07cf6..dc53e07 100644
> --- a/package/cryptopp/cryptopp.mk
> +++ b/package/cryptopp/cryptopp.mk
> @@ -22,11 +22,11 @@ HOST_CRYPTOPP_MAKE_OPTS = \
>  	CXXFLAGS="$(HOST_CXXFLAGS) -fPIC"
>  
>  define HOST_CRYPTOPP_BUILD_CMDS
> -	$(MAKE) -C $(@D) $(HOST_CRYPTOPP_MAKE_OPTS) shared
> +	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(HOST_CRYPTOPP_MAKE_OPTS) shared

 HOST_CRYPTOPP_MAKE_OPTS already contains HOST_CONFIGURE_OPTS. Why didn't you
use HOST_MAKE_ENV here?

>  endef
>  
>  define HOST_CRYPTOPP_INSTALL_CMDS
> -	$(MAKE) -C $(@D) PREFIX=$(HOST_DIR)/usr install
> +	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=$(HOST_DIR)/usr install

 Here it would make sense to add HOST_CONFIGURE_OPTS as the argument of make,
but you still need HOST_MAKE_ENV.

 Regards,
 Arnout

>  endef
>  
>  $(eval $(host-generic-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
