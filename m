From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Aug 2016 22:00:10 +0200
Subject: [Buildroot] [PATCH 08/16 v3] core: do not hard-code inclusion
 of br2-external in Kconfig
In-Reply-To: <326c5c4a0a2b9cb4d4cb430791ce5aaf21185e95.1468750623.git.yann.morin.1998@free.fr>
References: <cover.1468750623.git.yann.morin.1998@free.fr>
 <326c5c4a0a2b9cb4d4cb430791ce5aaf21185e95.1468750623.git.yann.morin.1998@free.fr>
Message-ID: <20160827220010.7063cd40@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 17 Jul 2016 12:34:28 +0200, Yann E. MORIN wrote:

>  .PHONY: $(BUILD_DIR)/.br2-external.in
>  $(BUILD_DIR)/.br2-external.in: $(BUILD_DIR)
> -	@touch $@
> +	$(Q)( \
> +		printf "#\n# Automatically generated file; DO NOT EDIT.\n#\n\n"; \
> +		printf 'menu "User-provided options"\n'; \
> +		printf '\tdepends on BR2_EXTERNAL != "support/dummy-external"\n\n'; \
> +		printf 'source "%s/Config.in"\n\n' $$(cd $(BR2_EXTERNAL) >/dev/null 2>&1 && pwd); \
> +		printf 'endmenu # User-provided options\n'; \
> +	) >$@

Shouldn't the logic that generates the .br2-external.in be moved to a
shell script?

I'm generally in favor of having most of the logic in make, but here,
it is really ugly. Did you try having this in a shell script?

Also, what about using readlink or realpath to convert the path to an
absolute path?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
