From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Nov 2017 10:12:32 +0100
Subject: [Buildroot] [git commit] luajit: only available on x86(-64)
 hosts
In-Reply-To: <20171105155244.192977FB27@busybox.osuosl.org>
References: <20171105155244.192977FB27@busybox.osuosl.org>
Message-ID: <20171106101232.5ad247cb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 5 Nov 2017 16:51:59 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:

> diff --git a/package/luajit/Config.in b/package/luajit/Config.in
> index 1a27c43..6b9c6e6 100644
> --- a/package/luajit/Config.in
> +++ b/package/luajit/Config.in
> @@ -1,5 +1,8 @@
>  config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
>  	bool
> +	# -m32 flag is used for 32bit builds and host-luajit has
> +	# limited architecture support
> +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
>  	default y if BR2_i386 || \
>  		(BR2_x86_64 && BR2_HOSTARCH='x86_64') || \
>  		BR2_powerpc || BR2_arm || BR2_armeb || \

I said it during the review, and apparently my comment was not taken
into account: I'm not entirely happy with this change, because it's
really host-luajit that has an architecture dependency, and not luajit.
So all packages that use host-luajit (without needing luajit) should
also have this dependency. I know the only package in this situation
today was moarvm, and it was fixed, but only because I pointed out this
problem, which will pop up again in the future if we keep this
implementation.

Perhaps we should have package/luajit/Config.in.host with just a blind
BR2_PACKAGE_HOST_LUAJIT_ARCH_SUPPORTS, and make
BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS depend on it. Yes, I'm being pedantic
here, but the fact that moarvm was initially overlooked is a good
indication that a clearer dependency would be useful.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
