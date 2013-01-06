From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Jan 2013 12:29:18 +0100
Subject: [Buildroot] [PATCH] Fix installation of crosstool-ng libraries
	to target
In-Reply-To: <87hamuh8by.fsf@dell.be.48ers.dk>
References: <1357449105-14780-1-git-send-email-bos@je-eigen-domein.nl>
 <201301061206.37057.yann.morin.1998@free.fr>
 <87hamuh8by.fsf@dell.be.48ers.dk>
Message-ID: <201301061229.18437.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On Sunday 06 January 2013 Peter Korsgaard wrote:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  >> -	$(Q)CTNG_TUPLE="$$( $(call ctng,show-tuple) )";                     \
>  >> +	$(Q)CTNG_TUPLE="$$( $(call ctng,show-tuple 2>&1) )";                \
> 
>  Yann> Indeed, that's going to stderr. That's a but in crostool-NG, it
>  Yann> should go to stdout. Will fix in ct-ng.
> 
>  Yann> In the meantime:
>  Yann> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Thanks. Does this mean the internal ctng backend has never worked at runtime?

Nope, it's only since the last update.

Long story made short:
  - ct-ng uses some fd redirection for its log
  - previously, fd #7 was not used for this
  - showtuple redirected fd #7 to stdout, and it worked
  - last ct-ng version introduced the 'debug-shell' feature
  - the debug-shell redirects fd #7 to stderr
  - and it breaks now.

I did not catch this, as I did not do the update to ct-ng in Buildroot,
so did not run any test. Also, I'm currently using pre-built toolchains
for my current experiments, so it slipped through...

I've already fixed it in ct-ng right now, and I'm testing integration
in Buildroot (first test just finished OK).

I will push an updated patch later today.

It also means that people seldom use the ct-ng backend, and people either
use the internal backend, or external toolchains. So, a couple of questions:
  - should we finally switch over to using the ct-ng backend by default?
  - is it worth maintaing the ct-ng backend at all?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
