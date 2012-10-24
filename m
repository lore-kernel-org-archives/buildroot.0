From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 24 Oct 2012 23:06:38 +0200
Subject: [Buildroot] [PATCH] keyutils: new package
In-Reply-To: <1351112292-5617-1-git-send-email-jarkko.sakkinen@iki.fi>
References: <1351112292-5617-1-git-send-email-jarkko.sakkinen@iki.fi>
Message-ID: <201210242306.38368.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jarkko, All,

On Wednesday 24 October 2012 Jarkko Sakkinen wrote:
> Linux key management utilities

There are two memleaks known in keyutils.

I'm about to post a patch series that includes keyutils
with patches to fix the memleaks.

[--SNIP--]
> diff --git a/package/keyutils/keyutils.mk b/package/keyutils/keyutils.mk
> new file mode 100644
> index 0000000..82b1f58
> --- /dev/null
> +++ b/package/keyutils/keyutils.mk
> @@ -0,0 +1,28 @@
> +#############################################################
> +#
> +# keyutils
> +#
> +#############################################################
> +
> +KEYUTILS_VERSION = 1.5.5
> +KEYUTILS_SITE = http://people.redhat.com/dhowells/keyutils/
> +KEYUTILS_SOURCE = keyutils-$(KEYUTILS_VERSION).tar.bz2
> +
> +define KEYUTILS_BUILD_CMDS
> +	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" \
> +		CC="$(TARGET_CC)" -C $(@D)
> +endef

I have:
define KEYUTILS_BUILD_CMDS
        $(KEYUTILS_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
endef

Which includes all our CFLAGS, while doing the way you did overrides the
CFLAGS in keytuils' Makefile, and breaks (at least for me on one arch).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
