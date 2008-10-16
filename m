From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Thu, 16 Oct 2008 23:55:34 +0200
Subject: [Buildroot] [PATCH 5/9] Refactor invocation of make for kernel
	compiles
In-Reply-To: <20081016203240.15826.97856.stgit@localhost.localdomain>
References: <20081016203220.15826.26173.stgit@localhost.localdomain>
	<20081016203240.15826.97856.stgit@localhost.localdomain>
Message-ID: <200810162355.34911.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Grant Likely, 16.10.2008:
> 
> -	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) modules
> -	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) \
> +	$(LINUX26_MAKE) modules
> +	$(LINUX26_MAKE) \
>  		DEPMOD=$(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26 \
>  		INSTALL_MOD_PATH=$(TARGET_DIR) modules_install

DEPMOD could be defined in LINUX26_MAKE_FLAGS, INSTALL_MOD_PATH is already
there. Then it would be a small line here.

> @@ -240,6 +242,9 @@ linux26-force:
>  # This has been renamed so we do _NOT_ by default run this on 'make clean'
>  linux26clean:
>  	rm -f $(LINUX26_KERNEL) $(LINUX26_DIR)/.configured
> +	# Note; this invocation of make is different from the rest.  Why
> +	# does 'PATH' need to be assigned here?  Can this be replaced with
> +	# $(LINUX26_MAKE) like all the others?
>  	-$(MAKE) PATH=$(TARGET_PATH) -C $(LINUX26_DIR) clean

I think so, maybe a leftover, but I don't know. Git-grepping for TARGET_PATH
through the repository shows some uses of this in 4 devices but not restricted
to the clean target.

> -	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) modules
> -	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) \
> +	$(LINUX26_MAKE) modules
> +	$(LINUX26_MAKE) \
>  		DEPMOD=$(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26 \
>  		INSTALL_MOD_PATH=$(TARGET_DIR) modules_install

Same as above.

> @@ -461,6 +463,9 @@ linux26-force:
>  # This has been renamed so we do _NOT_ by default run this on 'make clean'
>  linux26clean:
>  	rm -f $(LINUX26_KERNEL) $(LINUX26_DIR)/.configured
> +	# Note; this invocation of make is different from the rest.  Why
> +	# does 'PATH' need to be assigned here?  Can this be replaced with
> +	# $(LINUX26_MAKE) like all the others?
>  	-$(MAKE) PATH=$(TARGET_PATH) -C $(LINUX26_DIR) clean

Same as above.


Markus
