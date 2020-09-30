From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Sep 2020 22:13:03 +0200
Subject: [Buildroot] [PATCHv2] infra: add the transient download
 mechanism
In-Reply-To: <20200930214530.6b964a45@windsurf.home>
References: <20200930173030.2461586-1-yann.morin.1998@free.fr>
 <20200930214530.6b964a45@windsurf.home>
Message-ID: <20200930201303.GU11621@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-09-30 21:45 +0200, Thomas Petazzoni spake thusly:
> On Wed, 30 Sep 2020 19:30:30 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > +  obvious being the *lack of reproducibility*. Besides, it has its own
> > +  pitfalls that one must be aware of as well:
> > +  ** when two builds are running in parallel on the same machine, there
> > +     is a TOCTOU race for each build to download and extract the archive,
> > +     so each build may not get what it downloaded, but what the other
> > +     build did download;
> 
> This is not a pitfall, it is what we expect from the feature. The
> feature is "grab" whatever is currently available on the Git repository
> for that package. It is pretty clear that it is not guarantee that we
> grab what existed in the Git repository at the moment the user hits
> "Enter" after typing the make command. There is no way we could
> atomically snapshot all Git trees of all packages to ensure that what
> we build is a consistent view of what existed at the moment the build
> was started.
> 
> So I think this pitfall is needlessly worrying, and does not actually
> point to an actual problem. Or more precisely, the problem you're
> pointing is *exactly* what the transient download mechanism aims at
> doing.

I think it is important to stress that, though, because people can be
very confused but the outcome, one way or the other.

For example, let's assume that I push my branch, that triggers a
pipeline in the CI, the pipeline uses my branch as expected. Then I
repush a modified branch, the new pipeline uses the new HEAD of the
branch, and again this is as expected..

But now consider the following scenario:

  - I push my branch, a pipeline is triggered;
  - before the pipeline has a chance to git-fetch, I do a quick change
    and repush, a second pipeline is triggered;
  - the first pipeline uses the code from the second push.

However, my change was intentional, and I was expecting the CI to test
the two changes, and I wanted to have the results of both to decide
which to keep.

This for example, is very interesting because the CI can do tests I
can't always do locally, like reproducibility test for performance, for
example, or test on hardware I don't have at hand (when working from
home for example), and so on.

Thus my case is borked. Yeah, I could do two branches, but the fact is
that if I wait "just enough" between the pushes, it works, while if I
don't wait "just enough" it does not work.

Conversely, if I notice that I forgot to commit part of the changes, and
amend my commit and repush, I don't care what the first pipeline gets;
I only care about the second.

So, this is a pitfall: behaviours that may or may not match your
expectations, depending on what your expectations are, because this
mechanism caters to both antagonist cases where expectations are
opposite one from the other.

[--SNIP--]
> > +  ** as a consequence, legal-info is not reliable when a package is
> > +     transient;
> *That* I believe is the real pitfall.

Not, it is a consequence of the pitfall.

> > +  ** if a branch is pushed to an automated build bot (in a CI for
> > +     example), and then re-pushed to while the build is still in
> > +     progress, the build may get the wrong version of the branch.
> 
> This is also *NOT* a pitfall, it is what we ask the transient download
> mechanism to do.
> 
> Once this is fixed, I'll be happy to apply the patch!

Guess we'll have to refer to higher-level hierarchy to take a decision. ;-)

Thanks for the comments. :-)

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
