From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 2 May 2018 11:31:14 +0200
Subject: [Buildroot] [PATCH 1/2] package/clang: delete unnecessary files
 from target
In-Reply-To: <20180502090535.29498-1-valentin.korenblit@smile.fr>
References: <20180502090535.29498-1-valentin.korenblit@smile.fr>
Message-ID: <20180502113114.6f828e2e@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  2 May 2018 11:05:34 +0200, Valentin Korenblit wrote:

> diff --git a/package/clang/clang.mk b/package/clang/clang.mk
> index 88bce9af0b..a599dc0ae6 100644
> --- a/package/clang/clang.mk
> +++ b/package/clang/clang.mk
> @@ -56,9 +56,14 @@ CLANG_CONF_OPTS += -DLLVM_CONFIG:FILEPATH=$(STAGING_DIR)/usr/bin/llvm-config \
>  
>  # Clang can't be used as compiler on the target since there are no
>  # development files (headers) and other build tools. So remove clang
> -# binaries from target.
> +# binaries and some other unnecessary files from target.
>  define CLANG_DELETE_BINARIES_FROM_TARGET

You're no longer removing just binaries :)

> -	rm -f $(TARGET_DIR)/usr/bin/clang*
> +	cd $(TARGET_DIR)/usr/bin && rm -f clang* c-index-test git-clang-format \
> +		scan-build scan-view
> +	cd $(TARGET_DIR)/usr/libexec && rm -f c++-analyzer ccc-analyzer
> +	cd $(TARGET_DIR)/usr/share && rm -rf clang opt-viewer scan-build scan-view \
> +		man/man1/scan-build.1

I think a slightly more Buildroot-ish way to do this is:

	rm -f $(addprefix $(TARGET_DIR)/usr/bin/, \
	        clang* c-index-test git-clang-format scan-build scan-view)

and ditto for the others. Or perhaps, even more readable:

CLANG_FILES_TO_REMOVE = \
	/usr/bin/clang* \
	/usr/bin/c-index-test \
	/usr/bin/git-clang-format \
	/usr/bin/scan-build \
	/usr/bin/scan-view \
	...

and:

define CLANG_CLEANUP_TARGET
	rm -f $(addprefix $(TARGET_DIR),$(CLANG_FILES_TO_REMOVE))
endef

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
