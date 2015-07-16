From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 16 Jul 2015 23:51:18 +0200
Subject: [Buildroot] [PATCH] Add xxhash package
In-Reply-To: <1437080375-96542-1-git-send-email-eswierk@skyportsystems.com>
References: <1437080375-96542-1-git-send-email-eswierk@skyportsystems.com>
Message-ID: <20150716215118.GB4472@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ed, All,

On 2015-07-16 13:59 -0700, Ed Swierk spake thusly:
> "xxHash is an extremely fast hash algorithm, running at RAM
> speed limits."
> 
> Signed-off-by: Ed Swierk <eswierk@skyportsystems.com>
[--SNIP--]
> new file mode 100644
> index 0000000..ba680ba
> --- /dev/null
> +++ b/package/xxhash/xxhash.mk
> @@ -0,0 +1,19 @@
> +################################################################################
> +#
> +# xxhash
> +#
> +################################################################################
> +
> +XXHASH_VERSION = r40
> +XXHASH_SITE = $(call github,Cyan4973,xxHash,$(XXHASH_VERSION))
> +XXHASH_LICENSE = Free

'Free' is not a license name (t least not a common one). We have a list
of commonly used licenses in the manual:
    http://buildroot.net/downloads/manual/manual.html#legal-info-list-licenses

However, the licensing terms of that package are in fact a bit weird. In
fact, the LICENSE file is the text of the BSD-2c. But when one looks at
the source files, one (xxhash.c) is BSD-2c, while the other (xxhsum.c)
is clearly GPLv2+.

So you would write:

    XXHASH_LICENSE = BSD-2c, GPLv2+
    XXHASH_LICENSE_FILES = LICENSE xxhsum.c

(yes, we put the source file in there because the GPLv2+ license is only
visible in that file).

Regards,
Yann E. MORIN.

> +define XXHASH_BUILD_CMDS
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) xxhsum
> +endef
> +
> +define XXHASH_INSTALL_TARGET_CMDS
> +	$(INSTALL) -m 0755 -D $(@D)/xxhsum $(TARGET_DIR)/usr/bin/xxhsum
> +endef
> +
> +$(eval $(generic-package))
> -- 
> 1.9.1
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
