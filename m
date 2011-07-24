From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Jul 2011 23:44:21 +0200
Subject: [Buildroot] [PATCH 1/2] orc: new package
In-Reply-To: <1310628760-4172-2-git-send-email-s.neumann@raumfeld.com> (Sven
 Neumann's message of "Thu, 14 Jul 2011 09:32:39 +0200")
References: <1310628760-4172-1-git-send-email-s.neumann@raumfeld.com>
 <1310628760-4172-2-git-send-email-s.neumann@raumfeld.com>
Message-ID: <87k4b7uzey.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> Orc - the Oil Runtime Compiler - is the successor of liboil.
 Sven> There's a runtime library that is installed in staging and target
 Sven> and there's a host version that can be built if orcc, the ORC
 Sven> compiler is needed at build time.

So presumably we should remove liboil? The only thing using it is
swfdec, which afaik is long dead upstream.

 Sven> Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
 Sven> ---
 Sven>  package/Config.in     |    1 +
 Sven>  package/orc/Config.in |    7 +++++++
 Sven>  package/orc/orc.mk    |   13 +++++++++++++
 Sven>  3 files changed, 21 insertions(+), 0 deletions(-)
 Sven>  create mode 100644 package/orc/Config.in
 Sven>  create mode 100644 package/orc/orc.mk

 Sven> diff --git a/package/Config.in b/package/Config.in
 Sven> index fb5a570..1219a04 100644
 Sven> --- a/package/Config.in
 Sven> +++ b/package/Config.in
 Sven> @@ -345,6 +345,7 @@ source "package/libglib2/Config.in"
 Sven>  source "package/libnspr/Config.in"
 Sven>  source "package/liboil/Config.in"
 Sven>  source "package/libsigc/Config.in"
 Sven> +source "package/orc/Config.in"
 Sven>  source "package/startup-notification/Config.in"
 Sven>  endmenu
 
 Sven> diff --git a/package/orc/Config.in b/package/orc/Config.in
 Sven> new file mode 100644
 Sven> index 0000000..3b3e059
 Sven> --- /dev/null
 Sven> +++ b/package/orc/Config.in
 Sven> @@ -0,0 +1,7 @@
 Sven> +config BR2_PACKAGE_ORC
 Sven> +	bool "orc"
 Sven> +	help
 Sven> +	  Orc is a library and set of tools for compiling and executing
 Sven> +          very simple programs that operate on arrays of data.
 Sven> +
 Sven> +          http://code.entropywave.com/projects/orc/

Help text indentation is <tab><space><space>

 Sven> diff --git a/package/orc/orc.mk b/package/orc/orc.mk
 Sven> new file mode 100644
 Sven> index 0000000..6844bc9
 Sven> --- /dev/null
 Sven> +++ b/package/orc/orc.mk
 Sven> @@ -0,0 +1,13 @@
 Sven> +#############################################################
 Sven> +#
 Sven> +# orc
 Sven> +#
 Sven> +#############################################################
 Sven> +ORC_VERSION = 0.4.14
 Sven> +ORC_SOURCE = orc-$(ORC_VERSION).tar.gz

You could drop this line as that's default.

 Sven> +ORC_SITE = http://code.entropywave.com/download/orc/
 Sven> +ORC_AUTORECONF = YES

Why? You don't patch any files.

 Sven> +ORC_INSTALL_STAGING = YES
 Sven> +
 Sven> +$(eval $(call AUTOTARGETS,package,orc))
 Sven> +$(eval $(call AUTOTARGETS,package,orc,host))

I prefer to only add host support when needed.

Should usr/bin/orcc get removed if !BR2_HAVE_DEVFILES or is it needed
for anything?

I've committed with those changes (except for orcc, please advice) -
Thanks.

-- 
Bye, Peter Korsgaard
