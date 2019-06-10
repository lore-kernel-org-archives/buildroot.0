From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Jun 2019 16:49:30 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/openjdk: set PATH before calling make
In-Reply-To: <20190610131453.12186-1-fontaine.fabrice@gmail.com>
References: <20190610131453.12186-1-fontaine.fabrice@gmail.com>
Message-ID: <be292664-b1d1-3c59-a8b5-7caf742a1d1d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/06/2019 15:14, Fabrice Fontaine wrote:
> PATH must be set to $(BR_PATH) thanks to $(TARGET_MAKE_ENV) before
> calling make otherwise build fails on:
> /bin/bash: gawk: command not found
> 
> When build fails, config.log contains the following line:
> 
> configure:13709: checking for gawk
> configure:13725: found /home/buildroot/autobuild/run/instance-3/output/host/bin/gawk
> configure:13736: result: gawk
> [...]
> ac_cv_prog_AWK=gawk
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/43c5d08f599e8f44b59a576d243ae1c7b27de7a3
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
> Changes v1 -> v2 (after review of Arnout Vandecappelle):
>  - Set PATH thanks to $(TARGET_MAKE_ENV) instead of setting AWK
> 
>  package/openjdk/openjdk.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
> index 318e4bade3..91a00870c5 100644
> --- a/package/openjdk/openjdk.mk
> +++ b/package/openjdk/openjdk.mk
> @@ -109,7 +109,7 @@ endef
>  # Make -jn is unsupported. Instead, set the "--with-jobs=" configure option,
>  # and use $(MAKE1).
>  define OPENJDK_BUILD_CMDS
> -	$(MAKE1) -C $(@D) legacy-jre-image
> +	$(TARGET_MAKE_ENV) $(MAKE1) -C $(@D) legacy-jre-image
>  endef
>  
>  # Calling make install always builds and installs the JDK instead of the JRE,
> 
