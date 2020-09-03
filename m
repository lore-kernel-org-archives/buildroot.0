From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Sep 2020 21:18:41 +0200
Subject: [Buildroot] [RFC PATCH v1 1/1] package/pkg-golang: download
 deps to vendor tree if not present
In-Reply-To: <20200903181334.1a25642b@windsurf.home>
References: <20200831062335.1105977-1-christian@paral.in>
 <20200831070800.GN14354@scaer>
 <CAK714xKp0H5HEv5bp1bjDumZff6+cC41cs=exZk8bKuZTCV2vQ@mail.gmail.com>
 <20200903132852.GZ14354@scaer>
 <20200903160205.7e67bbe7@windsurf.home>
 <20200903151221.GA14354@scaer>
 <20200903181334.1a25642b@windsurf.home>
Message-ID: <20200903191841.GC14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-09-03 18:13 +0200, Thomas Petazzoni spake thusly:
> On Thu, 3 Sep 2020 17:12:21 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > The situation is not uncommon that a package is developped in some
> > department (that has no idea what Buildroot is or even that it exists)
> > and be re-used in anotehr department, which uses Buildroot and will be
> > very sad that the package does not folow Buildroot packaging principles.
> 
> What you mean is that "bar" (which needs "foo") would have to not use
> the standard Go/Cargo vendoring model to describe its dependency on
> "foo" so that the Go/Cargo vendoring tools don't fetch "foo". Correct ?

Something the go/cargo/npm/composer/... folkds would have to answer. And
if at all, I;d like that we get a consistent behaviour across all those
package managers that have vendoring of dependencies. Indeed, it would
be very disapointing to have one support it and nto the others. I.e. if
we can't do separate tarball for one of them, we should not do for the
others...

[--SNIP--]
> > That we do not create separate archives, at all. Vendored stuf is like
> > any other bundled dependencies: they are part of the source archive.
> But then what is your proposal to handle this mixture of
> licensing/redistributability conditions between the core package source
> and its dependencies ?

How do we handle it in other proprietary packages? We don't.

For example, let's say that Joe Developer Jr. in BIG CORP copies some
LGPL-licensed code into their proprietary project, as a bundled library.

This is totally legit: the proprietary parts are not tainted (I hate
that word, but have not better for now) by the LGPL stuff. Yet, they
have to redistribute the LGPL stuff.

Buildroot currently offers noway for them to do that.

Vendoring is the same as bundling, except it happens at download time on
our side, not on the upstream developper's machine.

> > If, and I say "if", the need arises and *all* cases are properly covered,
> > then we can further the infra to do the split (but I have a lot of doubts
> > about the relevance of that).
> > 
> > However, there are a few things I forgot about in my previous comments
> > (but the first two probably the same issue, just at two different
> > places):
> > 
> >   - at extract step, how do you know that you have to also extract the
> >     archive with the vendor stuff? Probably easy by looking if said
> >     archive exists. But then, if each dependency is stored in its own
> >     archive, how do you know which to extract?
> 
> You would parse the go.mod file I suppose, but that doesn't give you
> indirect dependencies. Perhaps some Go tool can help with that ? But
> indeed, that's a good question.

And what about cargo? npm? php composer? Others? (what, there are
others? ;-] )

> Note that storing each dependency as a separate tarball was an idea I
> have thrown on the table, not something that was proposed by Sam.

Yes, but one or many, it does not change much...

> > And then, if two deps at
> >     different levels have a depednency on another package, but at
> >     different versions?
> I am not following you on this one.

  - foo vendors libssl version 42.27
  - foo vendors libhttp version 1.2.3
    - libhttp 1.2.3 vendors libssl 666.777

What version of libssl do we extract where?

I do not want to have to repeat the vendoring logic in Buildroot.

Also, I do not want that we have various level of vendoring support for
the various package managers.

> >   - when you generate the legal-info/ directory, how do you know what to
> >     put in there for that package? You are back to the problem above,
> >     plus you would also want to ignore those vendored deps that are not
> >     redistributable, although we have no way in Buildroot to describe
> >     that either....
> 
> Yes, we would certainly need to extend somehow the LICENSE /
> LICENSE_FILES stuff to be able to distinguish which license / license
> files applies to what.

As I understand it, in fact, the problem is just about legal-info.

People do not want to redistribute their proprietary packages and the
proprietary bits it vendors, but they want to redistribute the FLOSS
bits they vendor.

So, if we jut concentrate on how we can help people do exactly that:
filter out the bits they do not want to redistribute?

One solution would be to have packages provide some legal-inf hooks,
something like (e.g.: only keep files which names match the regexp):

    FOO_LEGAL_INFO_FILTER_REGEXP = ^vendor/FLOSS/

Or whatever, that would be applied at the time the legal-info is
generated.

Thoughts?

Note: I find that awfull, but less so than the split archives. Also, it
is generic, so it can also be used by other packages like the hypotetical
Joe Developer Jr. case explained above.

> >   - why would we impose the policy that vendoring dependencies on other
> >     proprietary packages must use Buildroot packages (see the rationale
> >     I also gave, above, about code shared across multiple departments of
> >     a single company), but dependencies on FLOSS (or even other
> >     proprietary but redistributable packages) would be OK?
> 
> Well, this I can answer: the reason why we don't create one Buildroot
> package per Cargo or Go package is because there are zillions of such
> FLOSS packages. So we take the lazy route and use the Cargo/Go
> dependency management system. But since we have a problem with how to
> /not/ redistribute the few Proprietary apps/libs, an idea was to
> package them separately. So the reason is really: probably zillions of
> FLOSS dependencies, while just a handful of internal/proprietary
> dependencies.

Paint me unconvinced.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
