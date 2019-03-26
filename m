From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Mar 2019 20:26:28 +0100
Subject: [Buildroot] [PATCH 3/5 v2] toolchain: check the SSP option is
 known
In-Reply-To: <6137_1552392583_5C87A187_6137_470_1_3090e77d-fd75-49ec-8643-3a89ee5ea133@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
References: <cover.1552392456.git.yann.morin@orange.com>
 <6137_1552392583_5C87A187_6137_470_1_3090e77d-fd75-49ec-8643-3a89ee5ea133@OPEXCLILM6F.corporate.adroot.infra.ftgroup>
Message-ID: <20190326202628.02dfe936@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 12 Mar 2019 13:09:34 +0100
<yann.morin@orange.com> wrote:

>  # $1: cross-gcc path
> +# $2: gcc ssp option
>  #
>  check_toolchain_ssp = \
>  	__CROSS_CC=$(strip $1) ; \
> @@ -427,6 +428,13 @@ check_toolchain_ssp = \
>  		echo "SSP support not available in this toolchain, please disable BR2_TOOLCHAIN_EXTERNAL_HAS_SSP" ; \
>  		exit 1 ; \
>  	fi ; \
> +	__SSP_OPTION=$(2); \
> +	if [ -n "$${__SSP_OPTION}" ] ; then \
> +		if ! echo 'void main(){}' | $${__CROSS_CC} -Werror $${__SSP_OPTION} -x c - -o $(BUILD_DIR)/.br-toolchain-test.tmp >/dev/null 2>&1 ; then \
> +			echo "SSP option $${__SSP_OPTION} not available in this toolchain, please select another SSP level" ; \
> +			exit 1 ; \
> +		fi; \
> +	fi; \

Does it really make sense to check for both -fstack-protector (in the
code that already exists) *and* BR2_SSP_OPTION ?

Wouldn't it make more sense to just check for BR2_SSP_OPTION ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
