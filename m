From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Thu, 14 Jul 2011 12:28:54 +0200
Subject: [Buildroot] [PATCH] Config: unbreak check-source caused by
	empty defconfigs
In-Reply-To: <20110714101457.6521ebbd@skate>
References: <1310593649-26237-1-git-send-email-yann.morin.1998@anciens.enib.fr>
 <20110714101457.6521ebbd@skate>
Message-ID: <201107141228.54544.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Thursday 14 July 2011 10:14:57 Thomas Petazzoni wrote:
> Le Wed, 13 Jul 2011 23:47:29 +0200,
> "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr> a ?crit :
> 
> > Running check-source uses an allyesconfig-like configuration.
> > But in this case, the defconfig files for BareBox, U-Boot and
> > the Linux kernel are not set, thus braking the check.
> > 
> > This patch fixes it by setting a dummy value '(none)' as the
> > default value for the three affected defconfig entries.
> 
> No. The check at the end of the Linux, Barebox and U-Boot are here on
> purpose. This commit makes those checks useless.
> 
> There is already a check :
> 
> ifeq ($(filter source,$(MAKECMDGOALS)),)
> 
> which disable the board name check when "make source" or "make
> source-check" is used.
> 
> Or maybe I misunderstood the problem ?

No, you did not. Fact is, that check does not work for 'source-check'.

If I replace the $(error ...) message with this (eg. in barebox):
  MKGOALS=$(filter source,$(MAKECMDGOALS))
  $(error MAKECMDGOALS="$(MAKECMDGOALS)" MKGOALS="$(MKGOALS)")

then it gives me this:
  $ make source-check
  [--SNIP--]
  boot/barebox/barebox.mk:61: *** MAKECMDGOALS="_source-check" MKGOALS="".  Stop.

That's because, 'source-check' spawns a second make to run '_source-check'
which in turn runs a third make for 'source' with DL_MODE=SOURCE_CHECK

Now, I wonder how to properly fix this.

Either we check for 'source' and '_source-check', or we change the way
'_source-check' behaves. I'll push a patch for the second case, so you can
see what I have in my head about this... ;-)

Thanks for the review, I totally missed the check... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
