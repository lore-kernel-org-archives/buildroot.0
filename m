From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Jul 2014 22:45:30 +0200
Subject: [Buildroot] [PATCH 1/1] icu: add an option to add a custom data
 library file
In-Reply-To: <1399997418-27131-1-git-send-email-johan.derycke@barco.com>
References: <1399997418-27131-1-git-send-email-johan.derycke@barco.com>
Message-ID: <20140728224530.3a54d6b9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Johan Derycke,

I've applied your patch, after making some changes, see below.

On Tue, 13 May 2014 18:10:18 +0200, Johan Derycke wrote:

> +if BR2_PACKAGE_ICU
> +
> +config BR2_PACKAGE_ICU_CUSTOM_DATA
> +	bool "Custom data library"
> +	  help
> +	    Use a custom data library generated with:
> +	    http://apps.icu-project.org/datacustom/ICUData51.html
> +
> +if BR2_PACKAGE_ICU_CUSTOM_DATA
> +
> +config BR2_PACKAGE_ICU_CUSTOM_DATA_PATH
> +	string "Data library file to use?"
> +	default "/path/to/data/library"
> +	help
> +	  This option allows to set the path of such a data library file
> +
> +endif
> +
> +endif

Doing it this way causes problems in the autobuilders: with a random
generated configuration, BR2_PACKAGE_ICU_CUSTOM_DATA might be enabled,
but BR2_PACKAGE_ICU_CUSTOM_DATA_PATH will have an invalid value. This
would cause build failures in our autobuilders. Therefore, I changed
that to simply a single string option, empty by default. When empty,
nothing is done. When non-empty, the custom data library file is copied.


> +
>  comment "icu needs a toolchain w/ C++, wchar, threads"
>  	depends on !BR2_arc
>  	depends on !BR2_BINFMT_FLAT
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
>  		!BR2_TOOLCHAIN_HAS_THREADS
> +

No need to add a new empty line here.

> +define ICU_COPY_CUSTOM_DATA
> +	cp $(BR2_PACKAGE_ICU_CUSTOM_DATA_PATH) $(@D)/source/data/in/
> +endef
> +
> +ifeq ($(BR2_PACKAGE_ICU_CUSTOM_DATA),y)
> +ICU_POST_EXTRACT_HOOKS += ICU_COPY_CUSTOM_DATA
> +endif

I've changed the condition to match the change described above. Also,
I've moved the definition of the ICU_COPY_CUSTOM_DATA macro inside the
condition.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
