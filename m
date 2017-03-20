From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 22:32:52 +0100
Subject: [Buildroot] [PATCH v3] boot/uboot: fix build for sunxi targets
In-Reply-To: <20170309115247.16981-1-joerg.krause@embedded.rocks>
References: <20170309115247.16981-1-joerg.krause@embedded.rocks>
Message-ID: <20170320223252.791ca511@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  9 Mar 2017 12:52:47 +0100, J?rg Krause wrote:

> +# The binman tool was introduced in version 2017.01. The tool is a set
> +# python scripts and requires a python2 interpreter. Force the shebang
> +# python2 to ensure the correct interpreter is used on host systems
> +# where python defaults to the python3 interpreter. 
> +define UBOOT_TRY_SED_SHEBANG_BINMAN
> +	if test -f $(@D)/tools/binman/binman; then \
> +		sed -i '1s_^\(#!/usr/bin/env \).*_\1python2_' \
> +			$(@D)/tools/binman/binman; \
> +	fi
> +endef
> +UBOOT_POST_PATCH_HOOKS += UBOOT_TRY_SED_SHEBANG_BINMAN

Thanks for this. However, now that the issue has been fixed upstream,
I'm not sure I'm willing to make our uboot.mk more complicated to fix a
problem that:

 1. Only occurs with sunxi targets and a few x86 platforms

 2. Only occurs with 2017.01 exactly. binman didn't exist before, and
    2017.03 was fixed in time.

So I'm tempted to put the burden on people using 2017.01 on those few
platforms to carry the small patch (or upgrade to 2017.03).

What do you think?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
