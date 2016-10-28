From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Oct 2016 15:15:38 +0200
Subject: [Buildroot] [PATCH] microblaze: fix musl support
In-Reply-To: <20161023192616.GA12827@waldemar-brodkorb.de>
References: <20161023192616.GA12827@waldemar-brodkorb.de>
Message-ID: <20161028151538.5f4ca3e0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 23 Oct 2016 21:26:16 +0200, Waldemar Brodkorb wrote:
> For musl we need patches for bintils 2.25.1 and 2.26.1.
> Binutils 2.27 and gcc 6.2.x does not work for microblaze,
> even not for uClibc-ng or glibc.
> For gcc 5.4.x the existing patch need reworking so that
> musl and uClibc-ng is supported.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

I've applied after making a few changes, and I also have a few
questions, see below.

> diff --git a/package/binutils/2.25.1/800-microblaze-musl.patch b/package/binutils/2.25.1/800-microblaze-musl.patch
> new file mode 100644
> index 0000000..84b91a2
> --- /dev/null
> +++ b/package/binutils/2.25.1/800-microblaze-musl.patch
> @@ -0,0 +1,18 @@
> +From here:
> +https://sourceware.org/bugzilla/show_bug.cgi?id=19516

Please include a real description in patches. I took the one from the
Git commit.

>  	config BR2_BINUTILS_VERSION_2_27_X
>  		bool "binutils 2.27"
> +		# supported but broken on Microblaze
> +		depends on !BR2_microblaze

Once you have reported the issue upstream, please send a patch to add a
link to the upstream issue. I really don't like when we exclude newer
version of tools, as it means that in a few months time, when we'll
want to remove support for binutils 2.26, Microblaze will no longer be
usable at all.


> @@ -73,6 +75,8 @@ choice
>  		bool "gcc 6.x"
>  		# Broken or unsupported architectures
>  		depends on !BR2_arc
> +		depends on !BR2_microblazeel
> +		depends on !BR2_microblazebe

I've changed that to use BR2_microblaze instead

Same comment here: please send a patch adding a link to the upstream
issue.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
