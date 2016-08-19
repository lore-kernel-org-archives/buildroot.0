From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 23:13:48 +0200
Subject: [Buildroot] [PATCH] pcre: fix compile error for m68k coldfire
In-Reply-To: <20160818062535.GA28475@waldemar-brodkorb.de>
References: <20160818062535.GA28475@waldemar-brodkorb.de>
Message-ID: <20160819231348.2127118e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 Aug 2016 08:25:35 +0200, Waldemar Brodkorb wrote:

> +# fixes gcc error: value -yyyyy out of range
> +ifeq ($(BR2_m68k_cf),y)
> +PCRE_CFLAGS = $(filter-out -msep-data,$(TARGET_CFLAGS))
> +PCRE_CONF_ENV += CFLAGS="$(PCRE_CFLAGS)"
> +endif

We discussed this on IRC, but since not everyone is on IRC, and Google
is also not archiving the IRC discussions, I believe it's good if I
give a summary of our discussion here.

Basically, I don't like the solution that this patch implements. The
reason why -msep-data is passed is because the user has selected
BR2_BINFMT_FLAT_SEP_DATA as the FLAT format, instead of the default
BR2_BINFMT_FLAT_ONE. BR2_BINFMT_FLAT_SEP_DATA is useful to separate
code from data, which is needed when you want to do XIP (code stays in
flash, but data needs to be loaded in RAM, so they have to be
separated).

By dropping -msep-data, you are basically producing a non-XIP capable
binary, while the user has explicitly requested
BR2_BINFMT_FLAT_SEP_DATA. So silently dropping -msep-data is IMO not
acceptable.

So we have several options here:

 1/ Mark pcre as not available for BR2_BINFMT_FLAT_SEP_DATA. But pcre
    has gazillions of reverse dependencies, and I expect the issue of
    -msep-data to show up on many many packages, as soon as they have a
    fairly large binary size.

 2/ Actually fix up the problem, but I'm not sure it's even doable.

 3/ Decide that we don't support BR2_BINFMT_FLAT_SEP_DATA at all on
    m68k. On master, BR2_BINFMT_FLAT_ONE was not available for m68k due
    to kernel issues, but they have been resolved, and
    BR2_BINFMT_FLAT_ONE is now enabled on m68k in the next branch. So I
    would suggest to also enable BR2_BINFMT_FLAT_ONE on m68k in master,
    disallow the selection of BR2_BINFMT_FLAT_SEP_DATA. If in the
    future someone is interested by -msep-data on m68k, this person can
    always restart the work and see how to fix the issues.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
