From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 5 Oct 2015 22:04:59 -0300
Subject: [Buildroot] [PATCH] python-numpy: uClibc patch to avoid ldexpl
 and frexpl
In-Reply-To: <1444091418-31656-1-git-send-email-arnout@mind.be>
References: <1444091418-31656-1-git-send-email-arnout@mind.be>
Message-ID: <56131E3B.2010902@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/10/15 21:30, Arnout Vandecappelle (Essensium/Mind) wrote:

> It turns out that uClibc only enables the long double math functions
> for some architectures (god know why, so what if long double is the
> same as double, these functions should still be defined). Since
> python-numpy links with those functions, the module will fail to load
> on ARM, MIPS and SH.
>
> However, python-numpy actually checks for each function if it is really
> available. Only, it overrides that check for ldexpl and frexpl when
> long double is the same as double (i.e. in exactly the case the uClibc
> doesn't have these functions).
>
> So add another exception for this.
>
> Upstream-status: not applicable (code has changed too much)
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> I've only build-tested, I haven't tested if the import now works on ARM.

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Using qemu_arm_vexpress_defconfig + wchar + python2 + python-numpy.
Previously it would fail to import numpy unable to resolve ldexpl and 
frexpl symbols, now imports fine.

Regards.
