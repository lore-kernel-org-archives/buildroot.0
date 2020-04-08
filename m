From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 8 Apr 2020 22:03:12 +0200
Subject: [Buildroot] [PATCH] infra: add the transient download mechanism
In-Reply-To: <20200408192753.GC29898@scaer>
References: <20200115203753.12110-1-yann.morin.1998@free.fr>
 <20200408083903.547003f2@windsurf.home>
 <20200408192753.GC29898@scaer>
Message-ID: <20200408220312.65f3e722@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 8 Apr 2020 21:27:53 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> > >     build-1             build-2
> > > 
> > >     download
> > >     |                   download
> > >     |                   |
> > >     save to dl-dir      |
> > >     [...]               save to dl-dir
> > >     extract  
> > 
> > That is not a drawback, that is exactly what you expect with this
> > feature.  
> 
> Sorry, the two builds are supposed to be running in parallel... For
> build 1, it would get the download from build 2, which is not what build
> 1 expects.
> 
> But drawback is not the correct word. This is a pitfall.

Again, I think that what you're describing is exactly what we expect: if
you want to a branch, then you are guaranteed that you will do a build
with a state of the branch that is at least the one that was present at
the time you started the build. But it can be a later state of that
branch, if it gets updated in the mean time.

> > So, in build (1), your image uses the "previous" version of package A,
> > while your legal-info contains the "new" version of package A.
> > 
> > To solve this, one solution would be to use a per-build download
> > directory for the transient packages, rather than the global DL_DIR.  
> 
> Meh... Or rather, make legal-info impossible for a package that is
> transient, like when it is 'local'. This is the best solution.

Sounds good to me indeed.

> > But I think this could be a separate improvement. Indeed, the transient
> > download mechanism is clearly oriented towards development/CI workflow,
> > where consistency of legal-info may not be a primary concern. For a
> > final release build, you would not use TRANSIENT_DOWNLOAD = YES.
> > 
> > For example, custom packages that make use of TRANSIENT_DOWNLOAD could
> > be implemented like this:
> > 
> > ifeq ($(BR2_DEVELOPER_MODE),y)
> > <pkg>_TRANSIENT_DOWNLOAD = YES
> > <pkg>_VERSION = some-branch
> > else
> > <pkg>_VERSION = some-tag
> > endif  
> 
> The more I think about it, the less proud I am to have come up with this
> transient idea. Using unstable references is complete madness to begin
> with and is so flawed by design... We should not even provide such a
> feature. But we can't stop people from being... people... :-[

I think it's something that a number of people want, and that makes
sense for a number of use-cases.

It's all about moving away from the idea that Buildroot is only the
"final" integration tool. It is also used during application
development, it is also used to do CI, etc. And that requires to relax
a bit the very strict reproducibility requirements that we enforce for
the "final integration" use case.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
