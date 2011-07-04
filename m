From: Matias Garcia <mgarcia@rossvideo.com>
Date: Mon, 04 Jul 2011 10:14:19 -0400
Subject: [Buildroot] [PATCH 1/2] hostapd: fix build
In-Reply-To: <20110704085628.29549092@skate>
References: <52492b5cb97af2b80f86cf2dee27c8a931d14856.1309759154.git.baruch@tkos.co.il>
 <20110704085628.29549092@skate>
Message-ID: <1309788859.1984.8.camel@matias-lnx-host>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 2011-07-04 at 08:56 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> Le Mon,  4 Jul 2011 09:00:29 +0300,
> Baruch Siach <baruch@tkos.co.il> a ?crit :
> 
> > The --sysroot option is required in CFLAGS and LDFLAGS to avoid
> > compile time and link time failures.
> 
> This should no longer be needed, as Buildroot 2011.05 has added a
> wrapper for external toolchains which avoids the need to pass an
> explicit --sysroot option.
> 
> Can you point to a specific Buildroot configuration that exhibits the
> problem ?

The CodeSourcery PowerPC toolchains require a special flag which selects
the sysroot. in our case, the flag is "-e500v2" which takes the place of
"-mcpu=8540 -mspe -mabi=spe -mhard-float -mfloat-gprs=double" in a
regular BR toolchain. In either case, if these optimizations are not
passed to the compiler(s) AND the linker, the code generated can be
wrong because (as far as I understand it) the e500 has no generic float
instruction support and breaks the generic PowerPC ABI spec.

There is currently no way to pass this to the wrapper at compile time. I
submitted a couple of patches to allow this, though I'm not sure I did
it properly as I simply submitted my diffs.

Matias

> 
> Regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
