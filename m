From: Daniel Mack <daniel@caiaq.de>
Date: Sun, 12 Jul 2009 22:32:08 +0200
Subject: [Buildroot] [PATCH] Add bonnie++-1.03e package
In-Reply-To: <871volac0q.fsf@macbook.be.48ers.dk>
References: <1247136529-29913-1-git-send-email-daniel@caiaq.de>
	<20090709105925.GA11694@buzzloop.caiaq.de>
	<871volac0q.fsf@macbook.be.48ers.dk>
Message-ID: <20090712203208.GK18340@buzzloop.caiaq.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Jul 12, 2009 at 10:20:53PM +0200, Peter Korsgaard wrote:
>  Daniel> From: Daniel Mack <daniel@caiaq.de>
>  Daniel> Date: Thu, 9 Jul 2009 12:47:31 +0200
>  Daniel> Subject: [PATCH] Add bonnie++-1.03e package
> 
>  Daniel> Signed-off-by: Daniel Mack <daniel@caiaq.de>
>  Daniel> ---
>  Daniel>  package/Config.in            |    1 +
>  Daniel>  package/bonnie++/Config.in   |   10 +++++++
>  Daniel>  package/bonnie++/bonnie++.mk |   57 ++++++++++++++++++++++++++++++++++++++++++
> 
>  Daniel> +config BR2_PACKAGE_BONNIE
>  Daniel> +	bool "bonnie++"
>  Daniel> +	help
>  Daniel> +	  Bonnie++ is a benchmark suite that is aimed at performing a number
>  Daniel> +	  of simple tests of hard drive and file system performance. Then you
>  Daniel> +	  can decide which test is important and decide how to compare
>  Daniel> +	  different systems after running it.
>  Daniel> +
>  Daniel> +	  http://www.coker.com.au/bonnie++/
> 
> 
> Bonnie++ is written in C++, right? Then you need to depend on
> BR2_INSTALL_LIBSTDCPP, see package/iperf/Config.in for an example.

Ah, right. Added that.

>  Daniel> +BONNIE_VERSION:=1.03e
>  Daniel> +BONNIE_SOURCE:=bonnie++-$(BONNIE_VERSION).tgz
>  Daniel> +BONNIE_SITE:=http://www.coker.com.au/bonnie++/
>  Daniel> +BONNIE_DIR:=$(BUILD_DIR)/bonnie++-$(BONNIE_VERSION)
>  Daniel> +BONNIE_CAT:=$(ZCAT)
>  Daniel> +BONNIE_BINARY:=bonnie++
>  Daniel> +BONNIE_TARGET_BINARY:=usr/bin/bonnie++
> 
> Why not use Makefile.autotools.in? Bonnie seems to use autotools.

That is because 'make install' had some strange trouble because the make
target 'instakk-strip' was unavailable. Hence I moved away from that
aproach.

>  Daniel> +$(BONNIE_DIR)/.configured: $(BONNIE_DIR)/.unpacked
>  Daniel> +	(cd $(BONNIE_DIR); rm -rf config.cache; \
>  Daniel> +		$(TARGET_CONFIGURE_OPTS) \
>  Daniel> +		$(TARGET_CONFIGURE_ARGS) \
>  Daniel> +		./configure \
>  Daniel> +		--prefix=/ \
> 
> Not --prefix=/usr ?

Fixed that, even though it doesn't seem to matter in this case.

Thanks,
Daniel
