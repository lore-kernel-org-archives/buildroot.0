From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Jul 2009 22:20:53 +0200
Subject: [Buildroot] [PATCH] Add bonnie++-1.03e package
In-Reply-To: <20090709105925.GA11694@buzzloop.caiaq.de> (Daniel Mack's message
	of "Thu\, 9 Jul 2009 12\:59\:25 +0200")
References: <1247136529-29913-1-git-send-email-daniel@caiaq.de>
	<20090709105925.GA11694@buzzloop.caiaq.de>
Message-ID: <871volac0q.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mack <daniel@caiaq.de> writes:

 Daniel> On Thu, Jul 09, 2009 at 12:48:49PM +0200, Daniel Mack wrote:
 >> Signed-off-by: Daniel Mack <daniel@caiaq.de>

 Daniel> Sorry, I was too quick sending this. Take the amended version below
 Daniel> instead, please.

 Daniel> Daniel


 >> From 1bb7e420fc3bbd31e5b45589b2cd07356f0a7382 Mon Sep 17 00:00:00 2001
 Daniel> From: Daniel Mack <daniel@caiaq.de>
 Daniel> Date: Thu, 9 Jul 2009 12:47:31 +0200
 Daniel> Subject: [PATCH] Add bonnie++-1.03e package

 Daniel> Signed-off-by: Daniel Mack <daniel@caiaq.de>
 Daniel> ---
 Daniel>  package/Config.in            |    1 +
 Daniel>  package/bonnie++/Config.in   |   10 +++++++
 Daniel>  package/bonnie++/bonnie++.mk |   57 ++++++++++++++++++++++++++++++++++++++++++

 Daniel> +config BR2_PACKAGE_BONNIE
 Daniel> +	bool "bonnie++"
 Daniel> +	help
 Daniel> +	  Bonnie++ is a benchmark suite that is aimed at performing a number
 Daniel> +	  of simple tests of hard drive and file system performance. Then you
 Daniel> +	  can decide which test is important and decide how to compare
 Daniel> +	  different systems after running it.
 Daniel> +
 Daniel> +	  http://www.coker.com.au/bonnie++/


Bonnie++ is written in C++, right? Then you need to depend on
BR2_INSTALL_LIBSTDCPP, see package/iperf/Config.in for an example.

 Daniel> +
 Daniel> diff --git a/package/bonnie++/bonnie++.mk b/package/bonnie++/bonnie++.mk
 Daniel> new file mode 100644
 Daniel> index 0000000..756532f
 Daniel> --- /dev/null
 Daniel> +++ b/package/bonnie++/bonnie++.mk
 Daniel> @@ -0,0 +1,57 @@
 Daniel> +#############################################################
 Daniel> +#
 Daniel> +# bonnie
 Daniel> +#
 Daniel> +#############################################################
 Daniel> +BONNIE_VERSION:=1.03e
 Daniel> +BONNIE_SOURCE:=bonnie++-$(BONNIE_VERSION).tgz
 Daniel> +BONNIE_SITE:=http://www.coker.com.au/bonnie++/
 Daniel> +BONNIE_DIR:=$(BUILD_DIR)/bonnie++-$(BONNIE_VERSION)
 Daniel> +BONNIE_CAT:=$(ZCAT)
 Daniel> +BONNIE_BINARY:=bonnie++
 Daniel> +BONNIE_TARGET_BINARY:=usr/bin/bonnie++

Why not use Makefile.autotools.in? Bonnie seems to use autotools.

 Daniel> +
 Daniel> +$(DL_DIR)/$(BONNIE_SOURCE):
 Daniel> +	$(call DOWNLOAD,$(BONNIE_SITE),$(BONNIE_SOURCE))
 Daniel> +
 Daniel> +bonnie-source: $(DL_DIR)/$(BONNIE_SOURCE)
 Daniel> +
 Daniel> +$(BONNIE_DIR)/.unpacked: $(DL_DIR)/$(BONNIE_SOURCE)
 Daniel> +	$(BONNIE_CAT) $(DL_DIR)/$(BONNIE_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 Daniel> +	$(CONFIG_UPDATE) $(BONNIE_DIR)
 Daniel> +	touch $@
 Daniel> +
 Daniel> +$(BONNIE_DIR)/.configured: $(BONNIE_DIR)/.unpacked
 Daniel> +	(cd $(BONNIE_DIR); rm -rf config.cache; \
 Daniel> +		$(TARGET_CONFIGURE_OPTS) \
 Daniel> +		$(TARGET_CONFIGURE_ARGS) \
 Daniel> +		./configure \
 Daniel> +		--prefix=/ \

Not --prefix=/usr ?

-- 
Bye, Peter Korsgaard
