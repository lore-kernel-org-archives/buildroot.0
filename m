From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Aug 2015 12:14:41 +0200
Subject: [Buildroot] [PATCH 3/9] toolchain-external: add support for gcc
 version dependency
In-Reply-To: <20150804194948.GV3647@free.fr>
References: <1438711241-31792-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1438711241-31792-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150804194948.GV3647@free.fr>
Message-ID: <20150805121441.13c3a165@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 4 Aug 2015 21:49:48 +0200, Yann E. MORIN wrote:

> That's not true for the BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64 toolchain:
> 
>     $ ./host/opt/ext-toolchain/bin/aarch64-linux-gnu-gcc --version
>     aarch64-linux-gnu-gcc (crosstool-NG linaro-1.13.1-4.9-2014.09 -
>     Linaro GCC 4.9-2014.09) 4.9.2 20140904 (prerelease)
> 
> Here's a better sed-expr that should match it too, as well as the other
> gcc versions; we'll make the assumption that the version string is right
> after the first closing parenthesis:
> 
>     sed -r -e '1!d; s/^[^)]+\) ([^[:space:]]+).*/\1/; s/\.[[:digit:]]+$//;'
> 
> Explanations;
> 
>   - 1!d
>       - delete if not line 1  (i.e. your 'head -n1')
> 
>   - s/^[^)]+\) ([^[:space:]]+).*/\1/
>       - eat all until the first ')' character followed by a space
>       - match as many non-space chars as possible
>       - eat all the remaining chars on the line
>       - replace by the matched expression
> 
>   - s/\.[[:digit:]]+$//
>       - eat a dot followed by as many digits as possible up to the end
>         of line
>       - replace with nothing

Thanks! I've used your regexp, and also copy/pasted your explanation
into the code. I just had to replace $ by $$ to cope with make escaping.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
