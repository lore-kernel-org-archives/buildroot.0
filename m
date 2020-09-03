From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Sep 2020 18:13:34 +0200
Subject: [Buildroot] [RFC PATCH v1 1/1] package/pkg-golang: download
 deps to vendor tree if not present
In-Reply-To: <20200903151221.GA14354@scaer>
References: <20200831062335.1105977-1-christian@paral.in>
 <20200831070800.GN14354@scaer>
 <CAK714xKp0H5HEv5bp1bjDumZff6+cC41cs=exZk8bKuZTCV2vQ@mail.gmail.com>
 <20200903132852.GZ14354@scaer>
 <20200903160205.7e67bbe7@windsurf.home>
 <20200903151221.GA14354@scaer>
Message-ID: <20200903181334.1a25642b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 3 Sep 2020 17:12:21 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > In this case, Sam's suggestion is that "foo" should be packaged as a
> > proper Buildroot package, and the "bar" package should use "foo" from
> > the "foo" Buildroot package, rather than using the language-specific
> > vendoring/module system to retrieve it.
> > 
> > In other words, Sam's suggestion is that if you have proprietary /
> > non-redistributable bits of code used as dependencies in your Go/Rust
> > application, you should go and create Buildroot packages for these bits.  
> 
> But that only ever works if the bar package is only developped for use
> by Buildroot, and is not shared with other projects in $BIG_CORP.
> 
> The situation is not uncommon that a package is developped in some
> department (that has no idea what Buildroot is or even that it exists)
> and be re-used in anotehr department, which uses Buildroot and will be
> very sad that the package does not folow Buildroot packaging principles.

What you mean is that "bar" (which needs "foo") would have to not use
the standard Go/Cargo vendoring model to describe its dependency on
"foo" so that the Go/Cargo vendoring tools don't fetch "foo". Correct ?

If yes, then indeed that's a fair point.

> > > > I took a look at `go mod`, it seems to share a similar mechanism with
> > > > cargo which allows us to pass local paths for dependencies. My
> > > > proposition is to put the responsibility of whomever is adding a
> > > > proprietary application, which has mixed dependencies, to instead
> > > > split any proprietary modules into selectable options in buildroot,
> > > > and use the standard depends mechanism.    
> > > This is doomed to not work, because it relies on process. And since this
> > > is not enforce by the tool (more on that below), people will not realise
> > > that they have proprietary dependencies down to the n-th level.  
> > What alternative do you suggest ?  
> 
> That we do not create separate archives, at all. Vendored stuf is like
> any other bundled dependencies: they are part of the source archive.

But then what is your proposal to handle this mixture of
licensing/redistributability conditions between the core package source
and its dependencies ?

> If, and I say "if", the need arises and *all* cases are properly covered,
> then we can further the infra to do the split (but I have a lot of doubts
> about the relevance of that).
> 
> However, there are a few things I forgot about in my previous comments
> (but the first two probably the same issue, just at two different
> places):
> 
>   - at extract step, how do you know that you have to also extract the
>     archive with the vendor stuff? Probably easy by looking if said
>     archive exists. But then, if each dependency is stored in its own
>     archive, how do you know which to extract?

You would parse the go.mod file I suppose, but that doesn't give you
indirect dependencies. Perhaps some Go tool can help with that ? But
indeed, that's a good question.

Note that storing each dependency as a separate tarball was an idea I
have thrown on the table, not something that was proposed by Sam.

> And then, if two deps at
>     different levels have a depednency on another package, but at
>     different versions?

I am not following you on this one.

>   - when you generate the legal-info/ directory, how do you know what to
>     put in there for that package? You are back to the problem above,
>     plus you would also want to ignore those vendored deps that are not
>     redistributable, although we have no way in Buildroot to describe
>     that either....

Yes, we would certainly need to extend somehow the LICENSE /
LICENSE_FILES stuff to be able to distinguish which license / license
files applies to what.

>   - why would we impose the policy that vendoring dependencies on other
>     proprietary packages must use Buildroot packages (see the rationale
>     I also gave, above, about code shared across multiple departments of
>     a single company), but dependencies on FLOSS (or even other
>     proprietary but redistributable packages) would be OK?

Well, this I can answer: the reason why we don't create one Buildroot
package per Cargo or Go package is because there are zillions of such
FLOSS packages. So we take the lazy route and use the Cargo/Go
dependency management system. But since we have a problem with how to
/not/ redistribute the few Proprietary apps/libs, an idea was to
package them separately. So the reason is really: probably zillions of
FLOSS dependencies, while just a handful of internal/proprietary
dependencies.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
