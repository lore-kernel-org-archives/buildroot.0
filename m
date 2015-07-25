From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Jul 2015 14:15:31 +0200
Subject: [Buildroot] [PATCH v5 1/1] mosh: new package
In-Reply-To: <1437776690-23542-1-git-send-email-christian@paral.in>
References: <1437776690-23542-1-git-send-email-christian@paral.in>
Message-ID: <20150725121531.GC3662@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Christian, All,

On 2015-07-24 15:24 -0700, Christian Stewart spake thusly:
> Adding mosh, the mobile shell.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
[--SNIP--]
> diff --git a/package/mosh/0001-remove-system-locale-calls.patch b/package/mosh/0001-remove-system-locale-calls.patch
> new file mode 100644
> index 0000000..f44e166
> --- /dev/null
> +++ b/package/mosh/0001-remove-system-locale-calls.patch
> @@ -0,0 +1,49 @@
> +From b6075c578d2104b58d55e088dccb74370019dde9 Mon Sep 17 00:00:00 2001
> +From: Christian Stewart <christian@paral.in>
> +Date: Thu, 23 Jul 2015 13:52:35 -0700
> +Subject: [PATCH 1/1] Remove system("locale") calls.
> +
> +The locale command is not available on many systems. As this variable
> +is unused and appears to have been written with the intent of
> +displaying the locale settings to the user, it's not really necessary.
> +As this breaks Mosh on a lot of systems, it's best to remove the calls.
> +
> +Signed-off-by: Christian Stewart <christian@paral.in>

Maybe add that upstream does nt want this patch, like so:

    Upstream status: refused, see:
    https://github.com/keithw/mosh/issues/650

[--SNIP--]
> diff --git a/package/mosh/Config.in b/package/mosh/Config.in
> new file mode 100644
> index 0000000..4013f80
> --- /dev/null
> +++ b/package/mosh/Config.in
> @@ -0,0 +1,22 @@
> +comment "mosh needs a toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +
> +comment "mosh needs a host architecture of x64 or x86"
> +	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64
> +	depends on !(BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86")
> +
> +config BR2_PACKAGE_MOSH
> +	bool "mosh"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_arm || BR2_i386 || BR2_mipsel || BR2_x86_64
> +	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"

In the previous iteration, Thomas asked why the host architecture had to
be x86 or x86_64, which you still does not explain here.

But looking at the dependencies of mosh, I see that it depends on
protobuf, which has those dependencies, so here's how we usually note
those inherited dependencies;

    depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"  # protobuf

so that reviewers understand why those dependencies exist. It is also
usefull later on when maintaining the package; if protobuf were to ditch
those dependencies, we can easily grep the tree for protobuf users and
propagate the new dependencies.

So, unless mosh itself needs a dependency, please add those comments at
the end of the deps lines to explain where they are inherited from, like
so:

    depends on BR2_TOOLCHAIN_HAS_THREADS # protobuf

> +	select BR2_PACKAGE_PROTOBUF
> +	select BR2_PACKAGE_NCURSES
> +	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_OPENSSH

OpenSSH depends on MMU, which you forgot to propagate.

However, we have another package, dropbear, that can provide an ssh
client, so only want to conditionally select OpenSSH, like so;

    select BR2_PACKAGE_OPENSSH if !BR2_PACKAGE_DROPBEAR_CLIENT

[--SNIP--]
> diff --git a/package/mosh/mosh.mk b/package/mosh/mosh.mk
> new file mode 100644
> index 0000000..dcb12fc
> --- /dev/null
> +++ b/package/mosh/mosh.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# mosh
> +#
> +################################################################################
> +
> +MOSH_VERSION = 1.2.5
> +MOSH_SITE = https://mosh.mit.edu/mosh-$(MOSH_VERSION).tar.gz
> +MOSH_DEPENDENCIES = zlib ncurses protobuf openssl

Here, you build-depend on zlib, but you did not select it in Config.in.

If mosh does need zlib, then you must also select it in the Config.in;
otherwise do not add it here.

> +MOSH_LICENSE = GPLv3+
> +MOSH_LICENSE_FILES = COPYING COPYING.iOS

The COPYING.iOS is adding an exception to the GPLv3, so I owuld change
the licensing info to:

    MOSH_LICENSE = GPLv3+ with exception
    MOSH_LICENSE_FILES = COPYING COPYING.iOS

Regards,
Yann E. MORIN.

> +$(eval $(autotools-package))
> -- 
> 2.1.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
