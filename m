From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Feb 2014 23:09:47 +0100
Subject: [Buildroot] [PATCH] Makefile.legacy: fix recursive invocation
 with BUILDROOT_DL_DIR and _CONFIG
In-Reply-To: <1392068935-25510-1-git-send-email-arnout@mind.be>
References: <1392068935-25510-1-git-send-email-arnout@mind.be>
Message-ID: <20140210220947.GG5239@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2014-02-10 22:48 +0100, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> The legacy support for the old BUILDROOT_DL_DIR and BUILDROOT_CONFIG
> breaks down when make is invoked recursively - which is done in a few
> cases, e.g. silentoldconfig, external-defs, ... These targets always
> give a legacy error.
> 
> For BUILDROOT_DL_DIR, this is fixed by making sure that the original
> value of BR2_DL_DIR taken from the environment is also exported again.
> 
> For BUILDROOT_CONFIG, this is fixed with an additional comparison of
> the environment variable's value with the fake value that we introduce
> ourselves.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

I gave my Tested-by earlier (and I am *not* withdrawing it) since I
think this is a valid stop-gap fix which should go before -rc1 is cut.

However, I wonder how appropriate this implementation is. I am not really
convinced by this hack (although I can't see a better alternative).

Another solution (which I do not like much, either) would be to enclose
these checks in:

    ifeq ($(ALREADY_IN_BUILDROOT),)
    blabla legacy stuff blabla
    endif

and at the end of the main Makefile, add:

    export ALREADY_IN_BUILDROOT=y

But, this is hacky too, and I'm not fond of it either.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
