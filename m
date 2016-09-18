From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Sep 2016 16:15:25 +0200
Subject: [Buildroot] [PATCH 2/2 v3] toolchain/wrapper: extend paranoid
 check to -isystem
In-Reply-To: <110620526667c2676631a91f4d223e093896bda9.1472485693.git.yann.morin.1998@free.fr>
References: <cover.1472485693.git.yann.morin.1998@free.fr>
 <110620526667c2676631a91f4d223e093896bda9.1472485693.git.yann.morin.1998@free.fr>
Message-ID: <20160918161525.1bd1d7ce@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 29 Aug 2016 17:53:59 +0200, Yann E. MORIN wrote:

> +struct unsafe_opt_s {
> +	const char *arg;
> +	size_t     len;
> +};
> +
> +/* Unsafe options are options that specify a potentialy unsafe path,
> + * that will be checked by check_unsafe_path(), below.
> + *
> + * sizeof() on a string literal includes the terminating \0.
> + */
> +#define UNSAFE_OPT(o) { #o, sizeof(#o)-1 }

I was wondering if this was really necessary. You could also have done
just:

static const char *unsafe_opts[] = {
	"-I", "-L", "-isystem", ...
}

and then use strlen() in the loop. But your solution has the advantage
that the string length is calculated once for all, so OK.

> +static const struct unsafe_opt_s unsafe_opts[] = {
> +	UNSAFE_OPT(-I),
> +	UNSAFE_OPT(-idirafter).

This definitely couldn't built: it should have a comma at the end of
the line, not a dot. I've fixed this up and applied (after testing a
bit that the behavior looks sane).

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
