From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Sep 2020 16:02:05 +0200
Subject: [Buildroot] [RFC PATCH v1 1/1] package/pkg-golang: download
 deps to vendor tree if not present
In-Reply-To: <20200903132852.GZ14354@scaer>
References: <20200831062335.1105977-1-christian@paral.in>
 <20200831070800.GN14354@scaer>
 <CAK714xKp0H5HEv5bp1bjDumZff6+cC41cs=exZk8bKuZTCV2vQ@mail.gmail.com>
 <20200903132852.GZ14354@scaer>
Message-ID: <20200903160205.7e67bbe7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 3 Sep 2020 15:28:52 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> And as I explained on IRC (which I am going to repeat here so that it is
> archived in the list archives, or for all to see as well), I believe
> this dichotomy between main and vendored archives is incorrect.
> 
> What I understand is that, for proprietary applications, you do not want
> to provide the main tarball, but since those package managers make it so
> easy to depend on external, FLOSS components, you want to be able to
> provide those vendored FLOSS stuff to be compliant, without providing
> the code for your proprietary blurb.
> 
> Consider for example that your company develops two proprietary
> packages, foo and bar, which have the following dependencies, which will
> ultimately be vendored in those packages (names totally made up;
> licenses between brakcets; CORP means proprietary package):
> 
>   - foo [CORP] depends on libssl [MIT]
> 
>   - bar [CORP] depends on foo and libhttp [MIT]

In this case, Sam's suggestion is that "foo" should be packaged as a
proper Buildroot package, and the "bar" package should use "foo" from
the "foo" Buildroot package, rather than using the language-specific
vendoring/module system to retrieve it.

In other words, Sam's suggestion is that if you have proprietary /
non-redistributable bits of code used as dependencies in your Go/Rust
application, you should go and create Buildroot packages for these bits.

> So if you have a separate archive for bar's vendoring, it will include
> your foo proprietary package, and in the case of 'bar', the separation
> of archive will not help you properly separate the "TPIP" that you would
> have to distribute to be complaint.

See above. It was also covered in Sam's proposal.

> > I took a look at `go mod`, it seems to share a similar mechanism with
> > cargo which allows us to pass local paths for dependencies. My
> > proposition is to put the responsibility of whomever is adding a
> > proprietary application, which has mixed dependencies, to instead
> > split any proprietary modules into selectable options in buildroot,
> > and use the standard depends mechanism.  
> 
> This is doomed to not work, because it relies on process. And since this
> is not enforce by the tool (more on that below), people will not realise
> that they have proprietary dependencies down to the n-th level.

What alternative do you suggest ?

> > To enforce this, we could
> > investigate using license-coalescing options of the package managers
> > to find any proprietary dependencies and fail if they're found to be
> > pointing to upstream URLs (and would be captured) with an error
> > message clearly describing our intentions.  
> 
> But that could also be a totally valid setup, where one would not care
> about that situation, if one builds a device for their own use, and that
> is never ever distributed; those people would not care about the
> licensing of their dependency hell.

Again, what do you suggest ?

I agree it's not ideal, but it is relatively reasonable, and in the
absence of other clear solution and proposal, we're likely to opt for a
"relatively reasonable" solution, even if not ideal.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
