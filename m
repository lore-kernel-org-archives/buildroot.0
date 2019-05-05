From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 5 May 2019 22:36:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/cryptopp: fix build with gcc <
 4.9
In-Reply-To: <20190427174604.14188-1-fontaine.fabrice@gmail.com>
References: <20190427174604.14188-1-fontaine.fabrice@gmail.com>
Message-ID: <33d8cde1-9453-c619-7d02-30676b5de331@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27/04/2019 19:46, Fabrice Fontaine wrote:
> Fixes:
>  - http://autobuild.buildroot.org/results/7e68f32e62c34497848f0f7fc1f12dba67bf44d0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

> ---
>  package/cryptopp/cryptopp.mk | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
> index 59ced7654c..bd209a6e7a 100644
> --- a/package/cryptopp/cryptopp.mk
> +++ b/package/cryptopp/cryptopp.mk
> @@ -15,9 +15,16 @@ define HOST_CRYPTOPP_EXTRACT_CMDS
>  	$(UNZIP) $(HOST_CRYPTOPP_DL_DIR)/$(CRYPTOPP_SOURCE) -d $(@D)
>  endef
>  
> +HOST_CRYPTOPP_CXXFLAGS = $(HOST_CFLAGS) -fPIC
> +
>  HOST_CRYPTOPP_MAKE_OPTS = \
>  	$(HOST_CONFIGURE_OPTS) \
> -	CXXFLAGS="$(HOST_CXXFLAGS) -fPIC"
> +	CXXFLAGS="$(HOST_CRYPTOPP_CXXFLAGS)"
> +
> +#?_mm256_broadcastsi128_si256 has been added only in gcc 4.9
> +ifneq ($(BR2_HOST_GCC_AT_LEAST_4_9),y)
> +HOST_CRYPTOPP_CXXFLAGS += -DCRYPTOPP_DISABLE_AVX2

 I see what you're doing here, but we usually keep the assignments in the
imperative order, i.e. assignment before use. So I moved this up before
HOST_CRYPTOPP_MAKE_OPTS.

 Regards,
 Arnout

> +endif
>  
>  define HOST_CRYPTOPP_BUILD_CMDS
>  	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) $(HOST_CRYPTOPP_MAKE_OPTS) shared
> 
