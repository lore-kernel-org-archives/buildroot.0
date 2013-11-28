From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 Nov 2013 19:25:19 +0100
Subject: [Buildroot] [PATCH] e2tools: new package
In-Reply-To: <1385661764-14355-1-git-send-email-daniel.nystrom@timeterminal.se>
References: <1385661764-14355-1-git-send-email-daniel.nystrom@timeterminal.se>
Message-ID: <20131128182519.GA3337@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Daniel, All,

On 2013-11-28 19:02 +0100, Daniel Nystr?m spake thusly:
> E2tools is a simple set of GPL'ed utilities to read, write, and
> manipulate files in an ext2/ext3 filesystem.  These utilities access a
> filesystem directly using the ext2fs library.
> 
> Signed-off-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
> ---
>  package/Config.in          |  1 +
>  package/e2tools/Config.in  | 10 ++++++++++
>  package/e2tools/e2tools.mk | 16 ++++++++++++++++
>  3 files changed, 27 insertions(+)
>  create mode 100644 package/e2tools/Config.in
>  create mode 100644 package/e2tools/e2tools.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index f9e72ad..96e729a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -227,6 +227,7 @@ source "package/cramfs/Config.in"
>  source "package/curlftpfs/Config.in"
>  source "package/dosfstools/Config.in"
>  source "package/e2fsprogs/Config.in"
> +source "package/e2tools/Config.in"
>  source "package/ecryptfs-utils/Config.in"
>  source "package/exfat/Config.in"
>  source "package/exfat-utils/Config.in"
> diff --git a/package/e2tools/Config.in b/package/e2tools/Config.in
> new file mode 100644
> index 0000000..14f25ab
> --- /dev/null
> +++ b/package/e2tools/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_E2TOOLS
> +	bool "e2tools"

Since it needs threads, you should add:
    depends on BR2_TOOLCHAIN_HAS_THREADS

> +	select BR2_PACKAGE_E2FSPROGS
> +	help
> +	  E2tools is a simple set of GPL'ed utilities to read, write,
> +	  and manipulate files in an ext2/ext3 filesystem.  These
> +	  utilities access a filesystem directly using the ext2fs
> +	  library.
> +
> +	  https://github.com/ndim/e2tools

[...] and here add a comment:
    comment "e2tools needs a toolchain w/ threads"
        depends on !BR2_TOOLCHAIN_HAS_THREADS

> diff --git a/package/e2tools/e2tools.mk b/package/e2tools/e2tools.mk
> new file mode 100644
> index 0000000..56797bb
> --- /dev/null
> +++ b/package/e2tools/e2tools.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# e2tools
> +#
> +################################################################################
> +
> +E2TOOLS_VERSION = 3158ef18

Please use the full commit hash, not just the shortened hash.

> +E2TOOLS_SITE = http://github.com/ndim/e2tools/tarball/$(E2TOOLS_VERSION)
> +E2TOOLS_AUTORECONF = YES

Explain why it needs to be autoreconfed (eg. ./configure is not provided).

> +E2TOOLS_LICENSE = GPLv2
> +E2TOOLS_LICENSE_FILES = COPYING
> +E2TOOLS_DEPENDENCIES = e2fsprogs
> +E2TOOLS_CONF_ENV = LIBS="-lpthread"
> +E2TOOLS_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-exec
> +
> +$(eval $(autotools-package))

As discussed on IRC, please also make it a host package:
    $(eval $(host-autotools-package))

And add it to package/Config.in.host  (look at package/dosfstools for
how it is done there).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
