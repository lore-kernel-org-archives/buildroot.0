From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 11 Apr 2020 20:12:52 +0200
Subject: [Buildroot] [PATCH 7/8] core/show-info: report the ordered list
 of build steps
In-Reply-To: <20200411161903.7b007feb@windsurf.home>
References: <cover.1586592741.git.yann.morin.1998@free.fr>
 <93a3545d1fe7b47cdfb32edc7db3fd54600fecd9.1586592741.git.yann.morin.1998@free.fr>
 <20200411103950.4a21b23e@windsurf.home>
 <CAB4xu_1Bv4gsebOQrUfKM_ChD6q7-e15YTGPqwj4PBx3hzkrOA@mail.gmail.com>
 <20200411161903.7b007feb@windsurf.home>
Message-ID: <20200411181252.GP29898@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-04-11 16:19 +0200, Thomas Petazzoni spake thusly:
> On Sat, 11 Apr 2020 09:41:47 -0400
> Philippe Proulx <eeppeliteloop@gmail.com> wrote:
> > Replying for patch 6/8 and this one.
> > Is the `show-info` target considered a public API?
> Somewhat yes: the goal of show-info is that people can craft their own
> tooling on top of it. Breaking the show-info output would break such
> tools.

Which in some cases wil not be avoidable, see my previous reply.

> > If so, without a
> > version, it means it can never break. So let me suggest another layout
> > which breaks `show-info` (name it `show-info-2` if you will).
> > 
> > Output example (using YAML only for clarity here):
> This could certainly work, and reduces a bit the duplication of
> information.

The show-info is not for human consumption, I don't see a problem with
its content growing.

Also, as I explained in my previous reply to Philippe, having the
information where it is needed (i.e at the package level) allows to
process show-info in a stream, without having to memorise anything.

OTOH, having metadata description means the whole of show-info as to be
loaded in memory before any rocessing can outcur, since the content of
json is not guaranteeed to be ordered.

Yes, we could try and get our bare show-info output would be ordered,
but as soon as it gets processed (e.g. with json_pp or whatever), the
ordering would get lost.

> However, I still don't understand why your tool is not capable of
> having this knowledge about the stamp files. This is something that
> rarely changes. I think we haven't changed the stamp files since... 5
> years? More? If your tool is in the Buildroot tree itself, it can
> simply be updated if there is ever a change in the sequencing of steps.

That's true. But if you want to consider show-info to be a public API
and thus be stable,m then you would have to consider the stampfiles to
also be public API and thus stable, which is definitely what we want.

But that's also true that it changes so rarely that it would be
acceptable to break the tools.

And if we have such tools in-tree, we can fix them as we change the
internal details.

Regards,
Yann E. MORIN.

> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
