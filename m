From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 8 Jul 2017 22:58:03 +0200
Subject: [Buildroot] [PATCH 1/2] pcre2: new package, required by Qt 5.9
In-Reply-To: <DM5PR03MB2924501FB63A9FEA79548F57BFAA0@DM5PR03MB2924.namprd03.prod.outlook.com>
References: <DM5PR03MB2924501FB63A9FEA79548F57BFAA0@DM5PR03MB2924.namprd03.prod.outlook.com>
Message-ID: <361f50e8-a49c-2e88-8375-89b2ff56212c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Brent,

 We don't usually put something like "required by Qt 5.9" in the subject line.
It's obvious because it's part of a series.

On 07-07-17 05:45, Brent Sink wrote:
> This patch has been provided by Naoki Matsumoto
> https://patchwork.ozlabs.org/patch/781474/

 No need to reference the original. However, you should keep the original author
(unless it has changed so much that there is not much contribution left by the
original author - definitely not the case here). You can fix that in git by
doing "git commit --amend --author='...'".

> 
> Signed-off-by: Brent Sink <brents_3@hotmail.com>
> Signed-off-by: Naoki Matsumoto <n-matsumoto@melcoinc.co.jp>
[snip]
> diff --git a/package/Config.in b/package/Config.in
> index f69f67f..bf75594 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1488,6 +1488,7 @@ menu "Text and terminal handling"
>   	source "package/ncurses/Config.in"
>   	source "package/pcre/Config.in"
> +	source "package/pcre2/Config.in"

 This hunk is not valid: there is a line of context missing. Did you manually
edit it?

>   	source "package/popt/Config.in"
>   	source "package/readline/Config.in"
>   	source "package/slang/Config.in"
[snip]
> diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
> new file mode 100644
> index 0000000..1232cf9
> --- /dev/null
> +++ b/package/pcre2/pcre2.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated after checking pgp signature

 Also mention where you got that signature:

# Locally calculated after checking
https://ftp.pcre.org/pub/pcre/pcre2-10.23.tar.bz2.sig

> +sha256	dfc79b918771f02d33968bd34a749ad7487fa1014aeb787fad29dd392b78c56e	pcre2-10.23.tar.bz2
> diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
> new file mode 100644
> index 0000000..5b7a163
> --- /dev/null
> +++ b/package/pcre2/pcre2.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# pcre2
> +#
> +################################################################################
> +
> +PCRE2_VERSION = 10.23
> +PCRE2_SITE = https://ftp.pcre.org/pub/pcre
> +PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
> +PCRE2_LICENSE = BSD-3-Clause
> +PCRE2_LICENSE_FILES = LICENCE
> +PCRE2_INSTALL_STAGING = YES
> +PCRE2_CONFIG_SCRIPTS = pcre2-config
> +
> +PCRE2_CONF_OPTS += --enable-pcre2-8
> +PCRE2_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE2_16),--enable-pcre2-16,--disable-pcre2-16)
> +PCRE2_CONF_OPTS += $(if $(BR2_PACKAGE_PCRE2_32),--enable-pcre2-32,--disable-pcre2-32)

 It also has optional dependencies for zlib, bzip2, readline and libedit. So you
could add code like:

ifeq ($(BR2_PACKAGE_ZLIB),y)
PCRE2_DEPENDENCIES += zlib
PCRE2_CONF_OPTS += --enable-pcre2grep-libz
else
PCRE2_CONF_OPTS += --disable-pcre2grep-libz
endif

 However, in this case, it seems to be really optional, i.e. it will never
automatically enable those options just because the library is available. So
it's also OK as it is.

 So everything is OK except for the authorship, the reference to the signature
and the fact that the patch is broken. With those things fixed you can add my:

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> +
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
