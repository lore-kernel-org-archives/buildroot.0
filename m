From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 May 2018 19:04:29 +0200
Subject: [Buildroot] [RFC] [PATCH v2 2/2] support/kconfig: Bump to
 kconfig from Linux 4.17-rc2
In-Reply-To: <67a166b0-1466-8bd9-86be-3a8f3d7a4079@mind.be>
References: <20180509164412.31596-1-petr.vorel@gmail.com>
 <20180509164412.31596-2-petr.vorel@gmail.com>
 <20180519230311.6a3652fd@windsurf> <20180520142311.GA3453@scaer>
 <20180520143139.GA14607@x230> <20180520144141.GB3453@scaer>
 <20180520165009.56b44d9b@windsurf>
 <dcf8150e-1eb1-ba10-09e6-d3eb0bffaf2b@mind.be>
 <20180528203743.GK2965@scaer>
 <67a166b0-1466-8bd9-86be-3a8f3d7a4079@mind.be>
Message-ID: <20180529170429.GM2965@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2018-05-29 12:44 +0200, Arnout Vandecappelle spake thusly:
> On 28-05-18 22:37, Yann E. MORIN wrote:
> > Arnout, Thomas, All,
> > 
> > On 2018-05-22 23:22 +0200, Arnout Vandecappelle spake thusly:
> >> On 20-05-18 16:50, Thomas Petazzoni wrote:
> [snip]
> >>> If we start relying on the system-installed flex and bison, then we
> >>> should remove host-flex and host-bison entirely, not only for the linux
> >>> package. The question is whether bison and flex both behave in a
> >>> reasonably similar way regardless of which version is used.
> >>
> >>  I briefly looked at this in Paris, and it became clear very quickly that even a
> >> minor change in the bison version would give a completely different .c file. If
> >> this is a source file that will be built for the target, it's going to be a
> >> major reproducibility-killer. So I don't think we can remove host-bison and
> >> host-flex.
> > 
> > We're only talking about dropping the need for host-flex and host-bison
> > for the kconfig stuff. In this case, we don;t care that the user
> > generates C code one way or another: it's only a host tool...
> 
>  I was replying to Thomas's "we should remove host-flex and host-bison
> entirely". Yes we can rely on system-installed flex and bison for kconfig, but
> we can't rely on that for target packages, e.g. target dtc.

Mostly agreed. Like, 99.9%.

There are two concerns. Reproducibility and compliance.

IANAL, but the second can be achieved given a specific environment. So,
if one would state "build done on distro Foo version Bleh, with this
C&CS", this is probably enough for compliance. But IANAL.

The first is more interesting. Again, if the build is attmpted a second
time if the same envirnment, then this is reproducible, and probably
good enough for an industrial context (where official builds for
production are hopefully done in a controlled environment, not on a
random machine of a random developper).

In both cases, we would not really care to depend on the distro-provided
flex and bison, as long as said distro is properly identified.

Now, if we talk about reproducibility on any host for verifiability, then
we indeed absolutely want to keep them. Verifiability also helps with
compliance anyway.

And finally, there is a third reason that may be interesting to consider:
bugs in flex or bison, or change of API. I am not aware of such issue,
though...

So, in the end, I agree with you that we want to keep our host variants,
because it at least helps us for verifiable reproducibility.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
