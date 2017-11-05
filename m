From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 5 Nov 2017 18:04:08 +0100
Subject: [Buildroot] [PATCH 1/2] jimtcl: explicitly set --host / --build
In-Reply-To: <20171103222838.3974-1-peter@korsgaard.com>
References: <20171103222838.3974-1-peter@korsgaard.com>
Message-ID: <618a9fff-a540-1081-cdc1-ee0b228447ef@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-11-17 23:28, Peter Korsgaard wrote:
> Fixes:
> http://autobuild.buildroot.net/results/d13/d137680bf1c0ebfacef635cb2f0fc14524759143/
> 
> Otherwise the (handwritten) configure script uses a config.guess script from
> 2010 to figure out the build host, breaking builds on ppc64le hosts.
> 
> The result of --host / --build is only used to detect if we are building for
> Windows or not, which is why things are working on x86(-64) build hosts
> without specifying --host even though we are cross compiling - But this may
> change in the future, so we better pass the correct values.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/jimtcl/jimtcl.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
> index cdbf8ae477..313970d94a 100644
> --- a/package/jimtcl/jimtcl.mk
> +++ b/package/jimtcl/jimtcl.mk
> @@ -42,6 +42,8 @@ define JIMTCL_CONFIGURE_CMDS
>  	(cd $(@D); \
>  		$(TARGET_CONFIGURE_OPTS) CCACHE=none \
>  		./configure --prefix=/usr \
> +		--host=$(GNU_TARGET_NAME) \
> +		--build=$(GNU_HOST_NAME) \

 For consistency with pkg-autotools, perhaps you should specify --target as well?

 Regards,
 Arnout


>  		$(JIMTCL_SHARED) \
>  	)
>  endef
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
