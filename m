From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 19 Mar 2017 22:12:34 +0100
Subject: [Buildroot] [PATCH v3 1/1] dc3dd: new package
In-Reply-To: <1489069259-4866-1-git-send-email-benoit.allard@greenbone.net>
References: <1488876138-19003-1-git-send-email-benoit.allard@greenbone.net>
 <1489069259-4866-1-git-send-email-benoit.allard@greenbone.net>
Message-ID: <20170319221234.07848a4c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  9 Mar 2017 15:20:59 +0100, Beno?t Allard wrote:
> We actually prefer the version 7.2.641 (over 7.2.646) as the
> content of the release is identical and the 641 has the advantage
> of providing a proper .tar.xz file.
> 
> Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>

In addition to the comment from Jerzy, here is another comment (see
below).

> diff --git a/package/dc3dd/0001-no_man.patch b/package/dc3dd/0001-no_man.patch
> new file mode 100644
> index 0000000..07bf713
> --- /dev/null
> +++ b/package/dc3dd/0001-no_man.patch
> @@ -0,0 +1,12 @@
> +--- a/Makefile.in	2017-03-06 16:42:29.728814841 +0100
> ++++ b/Makefile.in	2017-03-06 16:42:54.191899036 +0100

This patch should have a description + Signed-off-by.

Also it should explain why you are patching Makefile.in and not
Makefile.am. We normally prefer patching Makefile.am and use
<pkg>_AUTORECONF = YES.

Of course, if the upstream project is active, you can submit a patch
adding a --disable-manpages option.

> diff --git a/package/dc3dd/Config.in b/package/dc3dd/Config.in
> new file mode 100644
> index 0000000..63066f9
> --- /dev/null
> +++ b/package/dc3dd/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_DC3DD
> +	bool "dc3dd"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on !BR2_TOOLCHAIN_USES_MUSL
> +	help
> +	  dc3dd is a patch to the GNU dd program, this version has
> +	  several features intended for forensic acquisition of data.
> +	  Highlights include hashing on-the-fly, split output files,
> +	  pattern writing, a progress meter, and file verification.
> +
> +	  https://sourceforge.net/projects/dc3dd/

You're missing a Config.in comment here about the threads dependency:

comment "dc3dd needs a glibc or uClibc toolchain w/ threads"
	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
		BR2_TOOLCHAIN_USES_MUSL

Could you fix those issues, and the ones reported by Jerzy, and submit
an updated version?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
