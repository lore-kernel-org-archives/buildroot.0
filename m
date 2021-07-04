From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Jul 2021 13:32:08 +0200
Subject: [Buildroot] [PATCHv4 02/16] core: enable 'NDEBUG' unless
 BR2_ENABLE_RUNTIME_DEBUG is set
In-Reply-To: <87k0m61gxf.fsf@dell.be.48ers.dk>
References: <20210601143422.25064-1-patrickdepinguin@gmail.com>
 <20210601143422.25064-3-patrickdepinguin@gmail.com>
 <20210704111539.3ce01855@windsurf>
 <87k0m61gxf.fsf@dell.be.48ers.dk>
Message-ID: <20210704113208.GC2521@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Thomas?, All,

On 2021-07-04 13:01 +0200, Peter Korsgaard spake thusly:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
>  > Hello,
>  > On Tue,  1 Jun 2021 16:34:07 +0200
>  > Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:
>  >> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>  >> 
>  >> The 'assert' statement in glibc honors the 'NDEBUG' preprocessor macro: if
>  >> it is set, then the assert statement is compiled away.
>  >> 
>  >> Define this 'NDEBUG' macro when BR2_ENABLE_RUNTIME_DEBUG is disabled (the
>  >> default case).
>  >> 
>  >> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>  > So, I would like to challenge whether this change is really a good
>  > idea. Since this has been merged, we had to add a significant number of
>  > patches to undefine NDEBUG.
> Indeed.

Compiling without assert() should never have had an impact on the
behaviour of the program. Semantically, assert() should only be used to
test pre- and post-conditions (e.g. a value we were passed is in an
acceptable range), i.e. to ensure the contract of the API.

The problem is that developpers have started using assert() as a mean to
test expected error conditions (e.g. the socket was closed by the remote
end), instead of handling them gracefully.

As such, the semantic of assert() has shifted enough that the original
intent is mush less prominent than what it is currently used for.

So yes, this does more harm than it brings benefits.

>  > I believe this change is too dangerous, has caused a number of build
>  > breakage + can cause run-time breakage that is difficult to predict.
>  > What do you think ?
> I agree, I don't think it ends up being a net positive regarding
> cost/benefit. I would prefer to revert it.

In the end, for packages that do use assert() can add NDEBUG to their
CFLAGS if so they wish.

I will revert all those changes, since I was the one who applied the
original changes.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
