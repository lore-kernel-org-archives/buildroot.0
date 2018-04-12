From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 23:27:59 +0200
Subject: [Buildroot] [PATCH 1/1] libglib2: fix build with or1k
In-Reply-To: <20180410171732.10233-1-fontaine.fabrice@gmail.com>
References: <20180410171732.10233-1-fontaine.fabrice@gmail.com>
Message-ID: <20180412232759.0d6fa6f8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 Apr 2018 19:17:32 +0200, Fabrice Fontaine wrote:
> Fixes:
>  - http://autobuild.buildroot.net/results/398490e07343a931b25ca6ab5c90a75d7a073e9f
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...-fix-compilation-without-F_-S-G-ETPIPE_SZ.patch | 43 ++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 package/libglib2/0003-gio-fix-compilation-without-F_-S-G-ETPIPE_SZ.patch
> 
> diff --git a/package/libglib2/0003-gio-fix-compilation-without-F_-S-G-ETPIPE_SZ.patch b/package/libglib2/0003-gio-fix-compilation-without-F_-S-G-ETPIPE_SZ.patch
> new file mode 100644
> index 0000000000..b5966c4f93
> --- /dev/null
> +++ b/package/libglib2/0003-gio-fix-compilation-without-F_-S-G-ETPIPE_SZ.patch
> @@ -0,0 +1,43 @@
> +From badc194631867f07e4dfcb8f01c4a3f8046ee6c6 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Tue, 10 Apr 2018 18:55:11 +0200
> +Subject: [PATCH] gio: fix compilation without F_{S,G}ETPIPE_SZ
> +
> +Commit a5778ef7c51044147fe470ea1707dd297f44f880 broke compilation on
> +architectures without F_SETPIPE_SZ and F_GETPIPE_SZ such as or1k.
> +If those variables are undefined, put back previous behavior, buffer
> +size set to 1024 * 64
> +
> +Fixes:
> + - http://autobuild.buildroot.net/results/398490e07343a931b25ca6ab5c90a75d7a073e9f
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I'm not sure this is the right fix. The lack of F_{SETPIPE,GETPIPE}_SZ
is really a bug in uClibc-ng. So I've instead sent a patch to uClibc-ng
to fix this:

  https://patchwork.ozlabs.org/patch/897804/

If Waldemar applies it, we can have it temporarily in package/uclibc/,
until a new uClibc-ng release is done.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
