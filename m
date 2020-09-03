From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Sep 2020 17:12:21 +0200
Subject: [Buildroot] [RFC PATCH v1 1/1] package/pkg-golang: download
 deps to vendor tree if not present
In-Reply-To: <20200903160205.7e67bbe7@windsurf.home>
References: <20200831062335.1105977-1-christian@paral.in>
 <20200831070800.GN14354@scaer>
 <CAK714xKp0H5HEv5bp1bjDumZff6+cC41cs=exZk8bKuZTCV2vQ@mail.gmail.com>
 <20200903132852.GZ14354@scaer>
 <20200903160205.7e67bbe7@windsurf.home>
Message-ID: <20200903151221.GA14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-09-03 16:02 +0200, Thomas Petazzoni spake thusly:
> On Thu, 3 Sep 2020 15:28:52 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > And as I explained on IRC (which I am going to repeat here so that it is
> > archived in the list archives, or for all to see as well), I believe
> > this dichotomy between main and vendored archives is incorrect.
> > 
> > What I understand is that, for proprietary applications, you do not want
> > to provide the main tarball, but since those package managers make it so
> > easy to depend on external, FLOSS components, you want to be able to
> > provide those vendored FLOSS stuff to be compliant, without providing
> > the code for your proprietary blurb.
> > 
> > Consider for example that your company develops two proprietary
> > packages, foo and bar, which have the following dependencies, which will
> > ultimately be vendored in those packages (names totally made up;
> > licenses between brakcets; CORP means proprietary package):
> > 
> >   - foo [CORP] depends on libssl [MIT]
> > 
> >   - bar [CORP] depends on foo and libhttp [MIT]
> 
> In this case, Sam's suggestion is that "foo" should be packaged as a
> proper Buildroot package, and the "bar" package should use "foo" from
> the "foo" Buildroot package, rather than using the language-specific
> vendoring/module system to retrieve it.
> 
> In other words, Sam's suggestion is that if you have proprietary /
> non-redistributable bits of code used as dependencies in your Go/Rust
> application, you should go and create Buildroot packages for these bits.

But that only ever works if the bar package is only developped for use
by Buildroot, and is not shared with other projects in $BIG_CORP.

The situation is not uncommon that a package is developped in some
department (that has no idea what Buildroot is or even that it exists)
and be re-used in anotehr department, which uses Buildroot and will be
very sad that the package does not folow Buildroot packaging principles.

> > > I took a look at `go mod`, it seems to share a similar mechanism with
> > > cargo which allows us to pass local paths for dependencies. My
> > > proposition is to put the responsibility of whomever is adding a
> > > proprietary application, which has mixed dependencies, to instead
> > > split any proprietary modules into selectable options in buildroot,
> > > and use the standard depends mechanism.  
> > This is doomed to not work, because it relies on process. And since this
> > is not enforce by the tool (more on that below), people will not realise
> > that they have proprietary dependencies down to the n-th level.
> What alternative do you suggest ?

That we do not create separate archives, at all. Vendored stuf is like
any other bundled dependencies: they are part of the source archive.

> > > To enforce this, we could
> > > investigate using license-coalescing options of the package managers
> > > to find any proprietary dependencies and fail if they're found to be
> > > pointing to upstream URLs (and would be captured) with an error
> > > message clearly describing our intentions.  
> > 
> > But that could also be a totally valid setup, where one would not care
> > about that situation, if one builds a device for their own use, and that
> > is never ever distributed; those people would not care about the
> > licensing of their dependency hell.
> 
> Again, what do you suggest ?
> 
> I agree it's not ideal, but it is relatively reasonable, and in the
> absence of other clear solution and proposal, we're likely to opt for a
> "relatively reasonable" solution, even if not ideal.

The best and simplest solution is to not create separate archives. That
is a reasonable solution.

At least as a first step.

If, and I say "if", the need arises and *all* cases are properly covered,
then we can further the infra to do the split (but I have a lot of doubts
about the relevance of that).

However, there are a few things I forgot about in my previous comments
(but the first two probably the same issue, just at two different
places):

  - at extract step, how do you know that you have to also extract the
    archive with the vendor stuff? Probably easy by looking if said
    archive exists. But then, if each dependency is stored in its own
    archive, how do you know which to extract? And then, if two deps at
    different levels have a depednency on another package, but at
    different versions?

  - when you generate the legal-info/ directory, how do you know what to
    put in there for that package? You are back to the problem above,
    plus you would also want to ignore those vendored deps that are not
    redistributable, although we have no way in Buildroot to describe
    that either....

  - why would we impose the policy that vendoring dependencies on other
    proprietary packages must use Buildroot packages (see the rationale
    I also gave, above, about code shared across multiple departments of
    a single company), but dependencies on FLOSS (or even other
    proprietary but redistributable packages) would be OK?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
