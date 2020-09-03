From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Sep 2020 15:28:52 +0200
Subject: [Buildroot] [RFC PATCH v1 1/1] package/pkg-golang: download
 deps to vendor tree if not present
In-Reply-To: <CAK714xKp0H5HEv5bp1bjDumZff6+cC41cs=exZk8bKuZTCV2vQ@mail.gmail.com>
References: <20200831062335.1105977-1-christian@paral.in>
 <20200831070800.GN14354@scaer>
 <CAK714xKp0H5HEv5bp1bjDumZff6+cC41cs=exZk8bKuZTCV2vQ@mail.gmail.com>
Message-ID: <20200903132852.GZ14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sam, All,

On 2020-09-03 05:52 -0500, Sam Voss spake thusly:
> On Mon, Aug 31, 2020 at 2:08 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > My proposal was that we introduce per-package managers download
> > backends, which would typically do something like the following
> > (pseudo-code):
[--SNIP--]
> As we spoke about plenty on the IRC, I'm sure you know my opinion on
> this but I figure I mention it anyway: I believe we should split these
> recursive-requirements from the base tar. This should allow
> Proprietary applications and TPIP requirements to be captured while
> maintaining separation between them.
>
> Now, to your point about "well, what if the repository has proprietary
> dependencies?". I think this is still a valid point, especially when
> looking at the case you mentioned of "proprietary app with commingled
> TPIP+proprietary requirements", but I believe we should be able to
> handle this at a buildroot level fairly reasonably.

And as I explained on IRC (which I am going to repeat here so that it is
archived in the list archives, or for all to see as well), I believe
this dichotomy between main and vendored archives is incorrect.

What I understand is that, for proprietary applications, you do not want
to provide the main tarball, but since those package managers make it so
easy to depend on external, FLOSS components, you want to be able to
provide those vendored FLOSS stuff to be compliant, without providing
the code for your proprietary blurb.

Consider for example that your company develops two proprietary
packages, foo and bar, which have the following dependencies, which will
ultimately be vendored in those packages (names totally made up;
licenses between brakcets; CORP means proprietary package):

  - foo [CORP] depends on libssl [MIT]

  - bar [CORP] depends on foo and libhttp [MIT]

So if you have a separate archive for bar's vendoring, it will include
your foo proprietary package, and in the case of 'bar', the separation
of archive will not help you properly separate the "TPIP" that you would
have to distribute to be complaint.

And I don't think we could have a single, simple mechanism for that,
except by splitting each and every vendored dependencies at all levels
into their own archives.

And I doubt this would be something we would want to do.

> I took a look at `go mod`, it seems to share a similar mechanism with
> cargo which allows us to pass local paths for dependencies. My
> proposition is to put the responsibility of whomever is adding a
> proprietary application, which has mixed dependencies, to instead
> split any proprietary modules into selectable options in buildroot,
> and use the standard depends mechanism.

This is doomed to not work, because it relies on process. And since this
is not enforce by the tool (more on that below), people will not realise
that they have proprietary dependencies down to the n-th level.

> To enforce this, we could
> investigate using license-coalescing options of the package managers
> to find any proprietary dependencies and fail if they're found to be
> pointing to upstream URLs (and would be captured) with an error
> message clearly describing our intentions.

But that could also be a totally valid setup, where one would not care
about that situation, if one builds a device for their own use, and that
is never ever distributed; those people would not care about the
licensing of their dependency hell.

> 
> In my (so far unshared) patchset, my solution to do this agrees with
> your suggestion above, by adding download-backend support for these
> package managers. I leveraged the implementation suggested previously
> by patrick[1] to use the cargo-dl step to then create two tarballs:
> 
> <package>-<ver>.tar.gz   <- we're all familiar with
> <package>-<ver>-vendor.tar.gz <- the TPIP portion
> 
> The reasons for splitting are shared above. I believe that patchset is
> a good initial direction, and I think those interested in this
> patchset who are unfamiliar with that one should give it a review.

Well, whether we go for one or two archives, I think posting that
patchset would anyway be a good first step: indeed, switching to the
other solution would be relatively trivial.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
