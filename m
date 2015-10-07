From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 7 Oct 2015 11:08:42 +0100
Subject: [Buildroot] [PATCH v3 1/1] yad: new package
In-Reply-To: <1444076921-6004-1-git-send-email-james.knight@rockwellcollins.com>
References: <1444076921-6004-1-git-send-email-james.knight@rockwellcollins.com>
Message-ID: <5614EF2A.9090809@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear James Knight,

thanks for taking into account my review. I have added more comments
below, so please, keep reading.

On 10/05/2015 09:28 PM, James Knight wrote:
[snip]
> diff --git a/package/yad/Config.in b/package/yad/Config.in
> new file mode 100644
> index 0000000..1e6776b
> --- /dev/null
> +++ b/package/yad/Config.in
> @@ -0,0 +1,13 @@
> +config BR2_PACKAGE_YAD
> +	bool "yad"
> +	depends on BR2_PACKAGE_XORG7
> +	depends on BR2_PACKAGE_LIBGTK2 || BR2_PACKAGE_LIBGTK3

In the next line you are going to select BR2_PACKAGE_LIBGLIB2, so you
need to propagate its dependencies to this package as well. That means
you need to add right here the following lines:

depends on BR2_USE_WCHAR # libglib2
depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
depends on BR2_USE_MMU # libglib2

> +	select BR2_PACKAGE_LIBGLIB2
> +	help
> +	  YAD (yet another dialog) is a tool for create graphical dialogs
> +	  from shell scripts.

The word "from" still fits in the first line as it will not exceed the
72 characters limit.

> +
> +	  http://sourceforge.net/projects/yad-dialog/
> +
> +comment "yad needs libgtk2 or libgtk3"
> +	depends on !BR2_PACKAGE_LIBGTK2 && !BR2_PACKAGE_LIBGTK3

And you also need to update this comment since now you have the libglib2
dependencies as well. Something like this would be ok:

comment "yad needs libgtk2 or libgtk3 and a toolchain w/ wchar, threads"
  depends on BR2_USE_MMU
  depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
    (!BR2_PACKAGE_LIBGTK2 && !BR2_PACKAGE_LIBGTK3)

Be careful if you copy-paste the above text. You have to use tabs for
indentation instead of spaces :-)

Regards,

Vincent.
