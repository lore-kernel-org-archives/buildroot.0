From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 10:54:53 +0100
Subject: [Buildroot] [PATCH 8/8] gitlab-ci: run check-package
In-Reply-To: <20171130153458.GA3519@scaer>
References: <cover.1511996903.git.yann.morin.1998@free.fr>
 <b9a9596c19817cf5a70c17acaa23657ed3597f01.1511996903.git.yann.morin.1998@free.fr>
 <20171130085950.0dc9a144@windsurf.home>
 <20171130153458.GA3519@scaer>
Message-ID: <20171201105453.2d415b5a@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 30 Nov 2017 16:34:58 +0100, Yann E. MORIN wrote:

> On 2017-11-30 08:59 +0100, Thomas Petazzoni spake thusly:
> > On Thu, 30 Nov 2017 00:08:45 +0100, Yann E. MORIN wrote:  
> > > +check-package:
> > > +    script:
> > > +        - find . -type f -name '*.mk' -exec ./utils/check-package {} +  
> > 
> > Does it run without warning on all .mk files?  
> 
> As I explained in thecover letter, no. There is a false-positive in
> asterisk.
> 
> That's why I suggested in the cover-letter not to applu it for now,
> until check-pacakge learns about that case.

Ricardo already proposed a fix for check-package to avoid the asterisk
case :-)

> > In fact, I think we shouldn't limit it to .mk files, because
> > check-package can also verify Config.in files and .hash files.  
> 
> This can be refined later on, probably?

True.

> > Perhaps:
> >   find package/ boot/ linux/ -type f -exec ./utils/check-package {}  
> 
> But then it would also catch the patches, the init scripts, and any
> other data file that is present in packages directories.
> 
> For now, this catches 305+539+264 = 1108 warnings...

Doh.

> So I would at least limit it to Config.in, .mk, .hash, .patch files.
> 
> And even that generates 305+566+230 = 1101 warnings.

That's indeed a lot. In addition, I want the thing to "fail" if there
are some warnings, otherwise Gitlab CI will not report the job as
failed.

So, let's do this:

 1. Fix check-package to avoid the false warning on asterisk

 2. Add the Gitlab CI job testing only .mk files, but making sure that
    if there is a single warning, it returns with a non-zero error code
    so that the job is considered as failed if we have a warning

 3. Over time, fix warnings in Config.in and .hash files, until the
    point where we can enable checking them in Gitlab CI as well.

Thoughts?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
