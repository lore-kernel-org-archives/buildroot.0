From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 27 Oct 2015 17:13:10 +0100
Subject: [Buildroot] [PATCH v4] rfkill: new package
In-Reply-To: <1445959974-10577-1-git-send-email-sv99@inbox.ru>
References: <1445959974-10577-1-git-send-email-sv99@inbox.ru>
Message-ID: <20151027161310.GC3555@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Viacheslav, All,

I said in my previous review that you should wait a bit before
resending, in case other may have mor ecomments.

When I said wait a bit, I really meant: wait until tomorrow (at the very
least).

Since the previous review, we discussed on IRC, and we discovered
more issues with your patch, see below...

Be sure to read up until the end of the reply, there ar emore than one
comment to it...

On 2015-10-27 18:32 +0300, Viacheslav Volkov spake thusly:
> Add rfkill package.
> 
> Signed-off-by: Viacheslav Volkov <sv99@inbox.ru>
[--SNIP--]
> diff --git a/package/rfkill/rfkill.hash b/package/rfkill/rfkill.hash
> new file mode 100644
> index 0000000..21be0a2
> --- /dev/null
> +++ b/package/rfkill/rfkill.hash
> @@ -0,0 +1,2 @@
> +# From: https://www.kernel.org/pub/software/network/rfkill/sha256sums.asc
> +sha256	e0ae3004215e39a6c5c36e0726558740728d16f67ebdb8bea621250f6091d86a  rfkill-0.5.tar.xz
> diff --git a/package/rfkill/rfkill.mk b/package/rfkill/rfkill.mk
> new file mode 100644
> index 0000000..b377c03
> --- /dev/null
> +++ b/package/rfkill/rfkill.mk
> @@ -0,0 +1,20 @@
> +################################################################################
> +#
> +# rfkill
> +#
> +################################################################################
> +
> +RFKILL_VERSION = 0.5
> +RFKILL_SOURCE = rfkill-$(RFKILL_VERSION).tar.xz
> +RFKILL_SITE = https://www.kernel.org/pub/software/network/rfkill
> +
> +define RFKILL_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
> +		VERSION_SUFFIX="-br"

Why do you specify the VERSION_SUFFIX?

Don't do it, we do not need to "specialise" the generated binaries just
because they were built with Buldroot.

> +endef
> +
> +define RFKILL_INSTALL_TARGET_CMDS
> +	$(INSTALL) -D -m 755 $(@D)/rfkill $(TARGET_DIR)/usr/bin/rfkill

As I said in my previous review, you should use the install directive
provided by the package's Makefile, like so;

    $(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C "$(@D) \
        DESTDIR=$(TARGET_DIR) install

Again, wait a little bit before you resend (like, wait until tomorow).

Thanks! :-)

Regards,
Yann E. MORIN.

> +endef
> +
> +$(eval $(generic-package))
> -- 
> 2.6.1
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
