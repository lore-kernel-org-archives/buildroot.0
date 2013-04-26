From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 26 Apr 2013 23:08:02 +0200
Subject: [Buildroot] [PATCH 1/1] mongrel2: new package
In-Reply-To: <1364396948-17329-1-git-send-email-lionel.orry@gmail.com> (Lionel
 Orry's message of "Wed, 27 Mar 2013 16:09:08 +0100")
References: <1364396948-17329-1-git-send-email-lionel.orry@gmail.com>
Message-ID: <87ip396lvx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lionel" == Lionel Orry <lionel.orry@gmail.com> writes:

 Lionel> Signed-off-by: Lionel Orry <lionel.orry@gmail.com>
 Lionel> ---
 Lionel>  package/Config.in                                  |  1 +
 Lionel>  package/mongrel2/Config.in                         | 19 ++++++
 Lionel>  ...l2-0001-use-CC-variable-to-compile-procer.patch | 28 ++++++++
 Lionel>  .../mongrel2/mongrel2-0002-Do-not-run-tests.patch  | 43 +++++++++++++
 Lionel>  ...-0003-Fix-Makefiles-for-cross-compilation.patch | 75 ++++++++++++++++++++++
 Lionel>  package/mongrel2/mongrel2.mk                       | 31 +++++++++
 Lionel>  6 files changed, 197 insertions(+)
 Lionel>  create mode 100644 package/mongrel2/Config.in
 Lionel>  create mode 100644 package/mongrel2/mongrel2-0001-use-CC-variable-to-compile-procer.patch
 Lionel>  create mode 100644 package/mongrel2/mongrel2-0002-Do-not-run-tests.patch
 Lionel>  create mode 100644 package/mongrel2/mongrel2-0003-Fix-Makefiles-for-cross-compilation.patch
 Lionel>  create mode 100644 package/mongrel2/mongrel2.mk

 Lionel> diff --git a/package/Config.in b/package/Config.in
 Lionel> index 5d8f4f6..f27dae6 100644
 Lionel> --- a/package/Config.in
 Lionel> +++ b/package/Config.in
 Lionel> @@ -680,6 +680,7 @@ source "package/linphone/Config.in"
 Lionel>  source "package/lrzsz/Config.in"
 Lionel>  source "package/macchanger/Config.in"
 Lionel>  source "package/mii-diag/Config.in"
 Lionel> +source "package/mongrel2/Config.in"
 Lionel>  source "package/mrouted/Config.in"
 Lionel>  source "package/msmtp/Config.in"
 Lionel>  source "package/mutt/Config.in"
 Lionel> diff --git a/package/mongrel2/Config.in b/package/mongrel2/Config.in
 Lionel> new file mode 100644
 Lionel> index 0000000..13dd787
 Lionel> --- /dev/null
 Lionel> +++ b/package/mongrel2/Config.in
 Lionel> @@ -0,0 +1,19 @@
 Lionel> +config BR2_PACKAGE_MONGREL2
 Lionel> +	bool "mongrel2"
 Lionel> +	select BR2_PACKAGE_SQLITE
 Lionel> +	select BR2_PACKAGE_ZEROMQ
 Lionel> +	depends on BR2_INSTALL_LIBSTDCPP # zeromq
 Lionel> +	depends on BR2_INET_IPV6 # zeromq
 Lionel> +	depends on BR2_LARGEFILE # zeromq -> util-linux
 Lionel> +	depends on BR2_USE_WCHAR # zeromq -> util-linux
 Lionel> +	help
 Lionel> +	  Mongrel2 is an application, language, and network architecture agnostic
 Lionel> +	  web server that focuses on web applications using modern browser
 Lionel> +	  technologies.
 Lionel> +
 Lionel> +	  Mongrel2 supports 17 languages and platforms, HTTP, Flash sockets,
 Lionel> +	  WebSockets, Long Polling, and many ways to deploy and hack on it.
 Lionel> +
 Lionel> +	  Mongrel2 depends on sqlite3 and zeromq.

These lines are too long. Please wrap at ~70 chars.

 Lionel> new file mode 100644
 Lionel> index 0000000..6382d59
 Lionel> --- /dev/null
 Lionel> +++ b/package/mongrel2/mongrel2.mk
 Lionel> @@ -0,0 +1,31 @@
 Lionel> +#############################################################
 Lionel> +#
 Lionel> +# Mongrel2
 Lionel> +#
 Lionel> +#############################################################
 Lionel> +
 Lionel> +MONGREL2_VERSION = 1.8.0
 Lionel> +MONGREL2_SOURCE = mongrel2_$(MONGREL2_VERSION).tar.gz
 Lionel> +MONGREL2_SITE = https://github.com/zedshaw/mongrel2/tarball/v1.8.0

This should use _VERSION instead of hardcoding 1.8.0.

Committed with these fixes, thanks.

-- 
Bye, Peter Korsgaard
