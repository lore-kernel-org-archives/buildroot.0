From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 6 Oct 2020 22:44:38 +0200
Subject: [Buildroot] [PATCH] support/scripts/apply-patches.sh: do not
 blindly remove *.orig files
In-Reply-To: <87v9fn3xgl.fsf@dell.be.48ers.dk>
References: <20201006185604.11311-1-peter@korsgaard.com>
 <20201006201422.GP11621@scaer> <87v9fn3xgl.fsf@dell.be.48ers.dk>
Message-ID: <20201006204438.GT11621@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-10-06 22:34 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  > Peter, All,
>  > On 2020-10-06 20:56 +0200, Peter Korsgaard spake thusly:
>  >> apply-patches currently blindly removes *.orig / .*.orig files as GNU patch
>  >> by default writes these as backup files when patches only apply with fuzz.
>  >> 
>  >> This is unfortunate as package sources may contain files ending in .orig as
>  >> well, breaking the build.  Luckily GNU patch can be told to not write these
>  >> backup files using the --no-backup-if-mismatch option, so used that instead
>  >> of the .orig removal step.
>  >> 
>  >> --no-backup-if-mismatch is supported since GNU patch 2.3.8 (1997-06-17) and
>  >> busybox patch if built with CONFIG_DESKTOP, but E.G.  isn't supported by the
>  >> BSD patch, so add logic to detect support for the flag and only use it if
>  >> supported.
>  >> 
>  >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>  >> ---
>  >> Do we care about BSD patch / busybox patch w/ DESKTOP?  Should we just
>  >> unconditionally use the flag?
>  > As discussed on IRC: I think we should require that patch suppot
>  > --no-backup-if-mismatch, and bail out if not:
>  >   - check for that in support/dependencies/check-host-patch.{mk.sh}
> You mean we should build our own host-patch? Sorry, I really find that
> overkill. People are very unlikely to use anything else than GNU patch,
> and the option is supported for more than 20 years.

No, sorry, I was thinking about dependencies.sh

> But Ok, we can add a check for it in dependencies.sh, just like we do
> for the availability of patch.

Yes.

>  >   - always use --no-backup-if-mismatch in apply-patch.sh
> Ok.
> I'll send a v2 doing that.

Thanks.

\Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
