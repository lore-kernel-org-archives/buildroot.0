From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Sep 2016 08:31:50 +0200
Subject: [Buildroot] [PATCH v2] mksh: add new package MirOS Korn Shell
In-Reply-To: <20160922181253.GA13373@waldemar-brodkorb.de>
References: <20160922181253.GA13373@waldemar-brodkorb.de>
Message-ID: <20160923083150.7e801611@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Sep 2016 20:12:54 +0200, Waldemar Brodkorb wrote:
> The MirOS Korn Shell is a quite complete posix shell implementation,
> is rather small and supports vi mode properly.
> 
> Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

I was about to apply this, but there's an issue with the licensing. So
while I'm at it, I'm also giving other comments.

The title should be just:

	mksh: new package


> --- /dev/null
> +++ b/package/mksh/Config.in
> @@ -0,0 +1,22 @@
> +config BR2_PACKAGE_MKSH
> +	bool "mksh"
> +	depends on BR2_USE_MMU # fork()
> +	help
> +	  The MirBSD Korn Shell,
> +
> +	  mksh is a successor of pdksh but not affiliated with the pdksh
> +	  developers or contributors. mksh is not affiliated with the
> +	  AT&T Korn Shell, its past or present owners, other than that
> +	  both attempt to implement the Korn Shell programming language.
> +
> +	  mksh targets users who desire a compact, fast, reliable,
> +	  secure shell not cut off modern extensions; a shell with
> +	  Unicode support; an actively developed, current, and portable
> +	  product; one with developers that listen to their users? requests
> +	  and implement them if they actually make sense.
> +
> +	  mksh aims to replace pdksh in all but very rare use cases
> +	  (such as support for checking the Unix mbox) and in all operating
> +	  environments (thus including patches from pdksh on e.g. Debian).

Those lines are too long. Please wrap the help text to a length of 72
characters per line.

> +MKSH_VERSION = R53a
> +MKSH_SOURCE = mksh-$(MKSH_VERSION).tgz
> +MKSH_SITE = https://www.mirbsd.org/MirOS/dist/mir/mksh
> +MKSH_LICENSE = MirOS, BSD-3c, ISC
> +MKSH_LICENSE_FILES = COPYING

There is no COPYING file in the source code, so this will cause build
failure.

Where is the information about the licensing coming from? What is this
"MirOS" license?

The man page references https://www.mirbsd.org/TaC-mksh.txt as
containing the legalese. Maybe this needs to also be downloaded, and
used as a license file. At least they clarify what this "MirOS" license
is.
> +define MKSH_CONFIGURE_CMDS
> +	cd $(@D) && $(TARGET_MAKE_ENV) \
> +		CPPFLAGS="-DMKSH_S_NOVI=0 $(TARGET_CPPFLAGS)" \
> +		CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
> +		LD="$(TARGET_LD)" LDFLAGS="$(TARGET_LDFLAGS)" LDLIBS="$(TARGET_LDLIBS)" \

TARGET_LDLIBS does not exist. Have you considered using $(TARGET_CONFIGURE_OPTS) here?

	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
		CPPFLAGS="-DMKSH_S_NOVI=0 $(TARGET_CPPFLAGS)" \
		TARGET_OS=Linux \
		sh ./Build.sh -M

> diff --git a/system/Config.in b/system/Config.in
> index 77c665b..d3b2889 100644

The changes in this file could possibly go to a separate patch.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
