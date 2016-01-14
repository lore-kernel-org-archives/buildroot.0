From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Jan 2016 10:15:28 +0100
Subject: [Buildroot] [PATCH v2] rabbitmq-c: needs a toolchain with
 posix_spawn support
In-Reply-To: <1452761277-28917-1-git-send-email-joris.lijssens@gmail.com>
References: <1452761277-28917-1-git-send-email-joris.lijssens@gmail.com>
Message-ID: <20160114101528.70488889@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Joris,

On Thu, 14 Jan 2016 09:47:57 +0100, Joris Lijssens wrote:
> Fixes:
> http://autobuild.buildroot.net/results/a6c3e79c61c5a535970d03bf37b068349f766a7f/
> Signed-off-by: Joris Lijssens <joris.lijssens@gmail.com>

The empty line separating the commit log from the SoB line is still
missing.

> ---
>  package/rabbitmq-c/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/rabbitmq-c/Config.in b/package/rabbitmq-c/Config.in
> index b330c90..73e3909 100644
> --- a/package/rabbitmq-c/Config.in
> +++ b/package/rabbitmq-c/Config.in
> @@ -1,6 +1,10 @@
>  config BR2_PACKAGE_RABBITMQ_C
>  	bool "rabbitmq-c"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	# disable rabbitmq-c on blackfin, because it doesn't support
> +	# posix_spawn :
> +	# http://autobuild.buildroot.net/results/a6c3e79c61c5a535970d03bf37b068349f766a7f/
> +	depends on !BR2_bfin

I think this should rather be:

	# too old uClibc, not providing posix_spawn functions
	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX

because theoretically, a different Blackfin toolchain using a newer
uClibc version would have spawn.h.

Also, the rabbitmq-c package has a comment that you need to update:

comment "rabbitmq-c needs a toolchain w/ threads"
        depends on !BR2_TOOLCHAIN_HAS_THREADS

should be changed to:

comment "rabbitmq-c needs a toolchain w/ threads"
	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
        depends on !BR2_TOOLCHAIN_HAS_THREADS

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
