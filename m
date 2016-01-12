From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Jan 2016 21:39:43 +0100
Subject: [Buildroot] [PATCH] rabbitmq-c: needs a toolchain with
 posix_spawn support
In-Reply-To: <1452516753-1555-1-git-send-email-joris.lijssens@gmail.com>
References: <1452516753-1555-1-git-send-email-joris.lijssens@gmail.com>
Message-ID: <20160112213943.60b8fc12@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Joris,

On Mon, 11 Jan 2016 13:52:33 +0100, Joris Lijssens wrote:
> Fixes:
> http://autobuild.buildroot.net/results/a6c3e79c61c5a535970d03bf37b068349f766a7f/
> Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>

Missing empty line before your SoB line.

> ---
>  package/rabbitmq-c/Config.in | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rabbitmq-c/Config.in b/package/rabbitmq-c/Config.in
> index b330c90..ec72f82 100644
> --- a/package/rabbitmq-c/Config.in
> +++ b/package/rabbitmq-c/Config.in
> @@ -1,11 +1,15 @@
>  config BR2_PACKAGE_RABBITMQ_C
>  	bool "rabbitmq-c"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on (BR2_UCLIBC_VERSION_SNAPSHOT || BR2_UCLIBC_VERSION_NG \
> +		|| BR2_TOOLCHAIN_USES_GLIBC) # spawn.h
>  	help
>  	  This is a C-language AMQP client library for use with v2.0+
>  	  of the RabbitMQ broker.
>  
>  	  https://github.com/alanxz/rabbitmq-c
>  
> -comment "rabbitmq-c needs a toolchain w/ threads"
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +comment "rabbitmq-c needs a uclibc snapshot, uclibc-ng or (e)glibc toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS \
> +		|| !(BR2_UCLIBC_VERSION_SNAPSHOT || BR2_UCLIBC_VERSION_NG \
> +		|| BR2_TOOLCHAIN_USES_GLIBC) 

I know that the vlc package is doing the same for its spawn.h
dependency, but I don't like this: the comment says that you need a
"uclibc snapshot or uclibc-ng toolchain", but in practice, if you use
an external toolchain that uses uClibc-ng, you still won't be able to
enable the rabbitmq-c package because BR2_UCLIBC_VERSION_NG is a symbol
that is specific to the internal toolchain backend.

So I see a few options here:

 1/ We do like the blktrace package is doing (for the same reason),
    which is allowing the package only on glibc and musl
    configurations. This is a bit sad because modern uClibc version are
    perfectly capable of handling this package.

 2/ We assume that all uClibc versions are now sufficiently recent and
    we allow the package with uClibc, with a special exception for the
    Blackfin toolchain (which was the reason of the failure).

(If we chose either (1) or (2), then we should align vlc and blktrace
on the chosen solution)

Peter, Yann, what do you think ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
