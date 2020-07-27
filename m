From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 22:06:34 +0200
Subject: [Buildroot] [PATCH 4/6] wireless-regdb: add option to rebuild
In-Reply-To: <20200702103618.5147-5-dev.kurt@vandijck-laurijssen.be>
References: <20200702103618.5147-1-dev.kurt@vandijck-laurijssen.be>
 <20200702103618.5147-5-dev.kurt@vandijck-laurijssen.be>
Message-ID: <20200727220634.04995ae4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Kurt,

Thanks for this new iteration. See some comments below.

On Thu,  2 Jul 2020 12:36:16 +0200
Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be> wrote:

> diff --git a/package/wireless-regdb/Config.in b/package/wireless-regdb/Config.in
> index 17350a41d8..55347b5e8c 100644
> --- a/package/wireless-regdb/Config.in
> +++ b/package/wireless-regdb/Config.in
> @@ -12,3 +12,18 @@ config BR2_PACKAGE_WIRELESS_REGDB
>  	  application is needed.
>  
>  	  https://wireless.wiki.kernel.org/en/developers/regulatory/wireless-regdb
> +
> +if BR2_PACKAGE_WIRELESS_REGDB
> +
> +config BR2_WIRELESS_REGDB_REBUILD
> +	bool "rebuild wireless-regdb"
> +	help
> +	  Say no to use the pre-built wireless regdb.
> +
> +	  Say yes if you need to deploy a modified wireless-regdb.
> +	  Deviations to the precompiled upstream wireless-regdb may be required
> +	  e.g. if you plan to deploy your product outdoor in countries where
> +	  outdoor and indoor regulations differ.
> +	  Make sure to deploy your wireless-regdb public key if you use crda
> +	  or compile them into the kernel.

Some of those lines are too long. Run "make check-package", it will
report some issues.

> +ifeq ($(BR2_WIRELESS_REGDB_REBUILD),y)
> +
> +define WIRELESS_REGDB_PATCH_PYTHON3
> +	sed -i -e '1 s/python$$/python3/' $(@D)/*.py

Use $(SED) instead of sed -i -e.

> +WIRELESS_REGDB_DEPENDENCIES += host-python3-m2crypto
> +define WIRELESS_REGDB_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
> +		REGDB_AUTHOR=buildroot
> +endef
> +endif
> +
>  ifeq ($(BR2_PACKAGE_CRDA),y)
>  define  WIRELESS_REGDB_INSTALL_CRDA_TARGET_CMDS
>  	$(INSTALL) -m 644 -D -T $(@D)/regulatory.bin \
>  		$(TARGET_DIR)/usr/lib/crda/regulatory.bin
>  	$(INSTALL) -m 644 -D -T $(@D)/sforshee.key.pub.pem \
>  		$(TARGET_DIR)/etc/wireless-regdb/pubkeys/sforshee.key.pub.pem
> +	$(INSTALL) -m 644 -D -T ~/.wireless-regdb-buildroot.key.pub.pem \
> +		$(TARGET_DIR)/etc/wireless-regdb/pubkeys/buildroot.key.pub.pem

This line fails:

/usr/bin/install: cannot stat '/home/thomas/.wireless-regdb-buildroot.key.pub.pem': No such file or directory

Indeed, when I read the wireless-regdb Makefile, I don't see how a file
named like this can be produced. In fact, I believe it is not great for
the wireless-regdb Makefile to generate files into the user's $HOME
directory. Is this public/private key pair typically re-generated at
each Buildroot build ? If that is the case, then it should be stored in
$(HOST_DIR)/ somewhere.

If this public/private key pair should remain the same for a given
system, across Buildroot rebuilds of the same configuration, then the
public/private key pair should be generated separately by the user, and
passed as argument.

I think your PATCH 5/6 should be squashed into PATCH 4/6, because
generating those keys into $HOME really isn't good.

I have a couple of other questions/concerns. These don't need to be
solved, it's more out of curiosity.

 - You've changed python-m2crypto to use python3, and the
   wireless-regdb scripts to also use python3. But crda, which is kind
   of the companion package to wireless-regdb is using
   python-pycryptodomex, which is by default installed for
   host-python2. So it means that one has to build both host-python2
   and host-python3 :-/

 - I'm not really clear on the interaction between wireless-regdb and
   crda. It's quite weird that crda selects wireless-regdb, but
   wireless-regdb has some conditional on whether crda is enabled.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
