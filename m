From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 28 Sep 2016 00:10:42 +0200
Subject: [Buildroot] [PATCH] pkg-infra: allow dumping reverse
 dependencies of a package
In-Reply-To: <677833f6-0e01-a1f0-be5d-50d3508c54c2@mind.be>
References: <1474808171-5652-1-git-send-email-yann.morin.1998@free.fr>
 <7c4e9a67-c2f1-11fc-eeb9-9be2e391b94a@mind.be>
 <20160927213249.GA8646@free.fr>
 <677833f6-0e01-a1f0-be5d-50d3508c54c2@mind.be>
Message-ID: <20160927221042.GA32628@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-09-28 00:02 +0200, Arnout Vandecappelle spake thusly:
> On 27-09-16 23:32, Yann E. MORIN wrote:
> > On 2016-09-27 22:40 +0200, Arnout Vandecappelle spake thusly:
> >> > 
> >> > 
> >> > On 25-09-16 14:56, Yann E. MORIN wrote:
> >>> > > Finding the packages that select another one in a specific configuration
> >>> > > is not very trivial:
> >>> > > 
> >>> > >   - when optional, the dependency is not expressed in Kconfig
> >>> > > 
> >>> > >   - looking at the .mk files is not very nice.
> >> > 
> >> >  If I understand correctly, the idea is to answer the question "why is package
> >> > foo built?", right?
> > Right. In my use-case, that was "what do I need to disable so I can
> > disable that broken package?".
> > 
> >> >  It would make sense to also add a foo-graph-rdepends, because often you'll want
> >> > the transitive dependencies as well and it's always nice to have it in a graph.
> > Yup, planned. But not trivial...
> 
>  No? Isn't it just calling foo-show-rdepends from graph-depends?

It would seem it would be that easy, but not really.

I don;t recall the details, but one thing is that we can't easily do an
rdepends graph for 'all' in the current state: we'd need to be able to
extract all packages that have no dependencies (i.e. leaf packages) so
that we could construct the 'all' node for rdepends.

Hmm.. Or do we have to? We could construct that list... Lemme think...

Of course, we could limit the feature to just graphing the rdeps of a
single package. That would not be overly complex, as you said.

But I was trying to mimick graph-depends into graph-rdepends, so they
would be symetrical...

Well, anyway, it's not at the top of my TODO list... ;-)

Regards,
Yann E. MORIN.

> >> > But this patch is of course a prerequisite of that feature.
> > And it proved already usefull in its own right. ;-)
> > 
> >>> > > Introduce a way to dump reverse dependencies of packages, i.e. the list
> >>> > > of packages that directly depend on that package. Like for direct
> >>> > > dependencies, we limit the list to the first-order reverse dependencies.
> >>> > > 
> >>> > > Document it in the main help; use the opportunity to also docuemnt
> >> >                                                             document
> > Boaf... One typo more, one typo less... I stopped countign a long time
> > ago! ;-)
> 
>  countign, really? :-P
> 
> 
>  Regards,
>  Arnout
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
