From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 20 Oct 2019 00:49:48 +0200
Subject: [Buildroot] [RFC PATCH 3/4] toolchain-wrapper: add linker
 override option
In-Reply-To: <20190724173538.22913-4-joseph.kogut@gmail.com>
References: <20190724173538.22913-1-joseph.kogut@gmail.com>
 <20190724173538.22913-4-joseph.kogut@gmail.com>
Message-ID: <c495406d-9206-0a91-a477-7ffbbfc06f48@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24/07/2019 19:35, Joseph Kogut wrote:
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---
>  toolchain/toolchain-wrapper.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
> index c73a0cc079..131a239f7f 100644
> --- a/toolchain/toolchain-wrapper.c
> +++ b/toolchain/toolchain-wrapper.c
> @@ -360,6 +360,17 @@ int main(int argc, char **argv)
>  	}
>  #endif /* ARCH || CPU */
>  
> +#if defined(BR_LINKER)
> +	/* Specify our linker if it's not already set */
> +	for (i = 1; i < argc; i++) {
> +		if (!strncmp(argv[i], "-fuse-ld=", strlen("-fuse-ld=")))
> +			break;
> +	}
> +	if (i == argc && !getenv("BR2_NO_LINKER_OVERRIDE")) {

 A while ago we decided that "internal" environment variables should use BR_
prefix, while "user" variables should use BR2_. I'm not sure if we consistently
do that, but I do think that here we should.


 Regards,
 Arnout

> +		*cur++ = "-fuse-ld=" BR_LINKER;
> +	}
> +#endif /* BR_LINKER */
> +
>  	if (parse_source_date_epoch_from_env()) {
>  		*cur++ = _time_;
>  		*cur++ = _date_;
> 
