From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 2 Aug 2018 19:10:43 +0200
Subject: [Buildroot] [RFC] [PATCH v2 2/2] support/kconfig: Bump to
 kconfig from Linux 4.17-rc2
In-Reply-To: <cceb7fac-fc60-7d8e-1aba-0af55ad73e7c@mind.be>
References: <20180520165009.56b44d9b@windsurf>
 <dcf8150e-1eb1-ba10-09e6-d3eb0bffaf2b@mind.be>
 <20180528203743.GK2965@scaer>
 <67a166b0-1466-8bd9-86be-3a8f3d7a4079@mind.be>
 <20180730150433.704e57ef@windsurf>
 <9ec69586-1154-f4e3-2fff-4f831263eef0@mind.be>
 <20180731100646.3221056f@windsurf>
 <785d0b36-933c-34a6-031d-c8201971c2ea@mind.be>
 <20180801194230.GC2294@scaer>
 <cceb7fac-fc60-7d8e-1aba-0af55ad73e7c@mind.be>
Message-ID: <20180802171043.GA2598@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2018-08-02 13:02 +0200, Arnout Vandecappelle spake thusly:
> On 01-08-18 21:42, Yann E. MORIN wrote:
[--SNIP a lot of threaded discussion--]
> > Now that we have the 'sdk' feature, people are going to distribute that,
> > and they will have to come in compliance for this sdk. So they will want
> > the build of the host tools to also be as reproducible as possible.
>  I don't see the reasoning behind this statement. For GPL compliance,
> reproducibility is definitely not an issue, otherwise every GPL binary
> distributed in the last 30 years would be in violation...

I never said it was mandatory to be reproducible to be compliant. But
let me expand a bit, on this slightly tangential topic.

When distributing (especially code under copyleft lincenses such as the
GPL), you may have to prove your are indeed compliant. Every bit of
diffference has to be researched and explained; reproducibility helps
prove compliance.

On the other hand, as a recipient (especially code under copyleft
licenses such as the GPL), you may want to check that the compliance
delivery you got is indeed compliant. Again, every bit of diffference
has to be researched and explained; reproducibility helps prove
compliance.

But you are right: reproducibility is not mandated by the GPL.

> > Amd since we now will have to have the toolchain before we can parse the
> > linux kconfig stuff, building host-flex and host-bison is the least of
> > our speed problems...
> 
>  It is a big speed problem if you're using an external toolchain and you could
> use the system flex and bison. This thread (long ago, in a galaxy far away) was
> about requiring flex and bison to be installed on the system, because
> Buildroot's own kconfig would also no longer ship the generated files. The
> general agreement was that that would be OK, and we could remove host-flex and
> host-bison entirely (speeding up the build for a bunch of other packages).
> 
>  My statement was (and still is): drop host-flex and host-bison for building
> host tools, but keep them for building target binaries (in casu, dtc).

I agree that we do have a chicken-n-egg problem for our own kconfig.
Which we can easily solve by bundling the generated kconfig lexer and
parser sources [*], as we do today, even if the kernel does not.

[*] as long as we identify the versions of flex+bison that were used
to generate said code.

>  Thomas (if I understand correctly) is questioning the need for keeping
> host-flex and host-bison even for building the target binaries. And I have to
> agree that the need for host-flex and host-bison for target binaries is not that
> strong.

See my reply, below...

> > So, I'd say we should keep the dependency on host-flex and host-bison
> > for the linux kernel...
> 
>  I would really prefer to not double the build time of a simple kernel...

But that ship has long sailed...

And I do prefer reproducibility and correctness over speed or convenience.

But since we do have an option for reproducibility, those dependencies
an be conditional for those speed- or reproducibility-afficionados.

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> > 
> > Regards,
> > Yann E. MORIN.
> > 
> >>> Or do you assume that because kconfig is so widely used, it is tested
> >>> against lots of bison/flex version, so we don't need to build
> >>> bison/flex for kconfig, but we should still build it for other packages
> >>> that need bison/flex, as those ones may be less tested against random
> >>> versions of flex/bison ? Or because the generated flex/bison code goes
> >>> into the target, and we ideally want binary-identical results for a
> >>> given Buildroot configuration ?
> >>
> >>  It's not just for fully binary identical (i.e. BR2_REPRODUCIBLE).
> >>
> >>  It's basically for the same reason that we have versioned docker images, to
> >> make sure that we really know what we're building for the target.
> >>
> >>
> >>  I realize now that this rule is not something we've written down anywhere. I
> >> just always assumed that Buildroot tries to make sure that for a given config,
> >> whatever your build machine, you generate binaries that will behave the same and
> >> will expose the same bugs. If you use a different flex, a bug in the parsing
> >> code will manifest differently.
> >>
> >>  The more I think about it, the more I come to the conclusion that maybe this
> >> rule (which I thought was something that I learned from the Buildroot community,
> >> not something I invented myself) is not so useful. Because in practice, the kind
> >> of bugs where this is relevant are so sensitive to even tiny changes that
> >> changing the generated code is not going to make all that much of a difference.
> >>
> >>  Regards,
> >>  Arnout
> >>
> >>>
> >>> Best regards,
> >>>
> >>> Thomas
> >>>
> >>
> >> -- 
> >> Arnout Vandecappelle                          arnout at mind be
> >> Senior Embedded Software Architect            +32-16-286500
> >> Essensium/Mind                                http://www.mind.be
> >> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> >> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> >> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> > 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
