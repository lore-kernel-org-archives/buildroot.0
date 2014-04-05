From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Apr 2014 18:47:46 +0200
Subject: [Buildroot] [PATCH 02/11] arch: MIPS: Add config option
 BR2_GCC_TARGET_TUNE
In-Reply-To: <53402713.9070801@crapouillou.net>
References: <1396558881-29631-1-git-send-email-paul@crapouillou.net>
 <1396558881-29631-2-git-send-email-paul@crapouillou.net>
 <20140403211925.GC17328@free.fr> <533DD7B6.8080009@crapouillou.net>
 <20140403221215.GA25471@free.fr> <53402713.9070801@crapouillou.net>
Message-ID: <20140405164746.GA15155@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Paul, All,

On 2014-04-05 17:53 +0200, Paul Cercueil spake thusly:
> On 04/04/2014 00:12, Yann E. MORIN wrote:
[--SNIP--]
> >Can you double-check that it is indeed working for you? Because if it
> >does, we have a really big bug in Kconfig (Oh, no, not one more...)
> 
> I confirm it works.

I checked your patch:

    $ cat defconfig
    BR2_mips=y
    BR2_GCC_TARGET_TUNE="mips32r2"

    $ make BR2_DEFCONFIG=$(pwd)/defconfig defconfig
    [...]

    $ grep BR2_GCC_TARGET_TUNE .config
    BR2_GCC_TARGET_TUNE="mips32"

So no, it does not work as you explained you were expecting it to work:

    ---
    This patch would pass the same value to --with-arch and --with-tune, 
    unless you define a different value for BR2_GCC_TARGET_TUNE in your 
    defconfig. We use that for the Ingenic jz4740 processor, which is a 
    mips32 processor but running better the code tuned for mips32r2.
    ---

From what I understand, you have a defconfig file where you manually
wrote:
    BR2_GCC_TARGET_TUNE="mips32r2"

But as shown above, that does not work.

> Why is it a bug?

Because, for a prompt-less value, kconfig is expected to discard any
value and only use the 'default' values. And from the above, it is what
is hapenning: a value from a defconfig is properly over-written by what
kconfig computes for this prompt-less value.

So I stand on my position: I NAK this patch, because it does not fix the
explained reason for it.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
