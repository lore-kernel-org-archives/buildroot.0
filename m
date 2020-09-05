From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Sep 2020 23:04:31 +0200
Subject: [Buildroot] More maintainers
In-Reply-To: <CA+TH9VkgkuMUUy65L6njfjSuDeJ7wzXueJmX74XF9YQucd8RnA@mail.gmail.com>
References: <CAFSsvmpLGd-2pequ_skL+8d_txyhxt5q5tgo0SDAfifVLJY6cg@mail.gmail.com>
 <638a9bc4-197f-931e-0795-2605ff734291@mind.be>
 <CAFSsvmqGG-KvDnquq5dmGDJkhwqdKaJe8ndpYpLK=dPfuSREYA@mail.gmail.com>
 <CA+h8R2qe_DvM2c2EvUraAWgP_84LaXN98TPi_cJjG6+wOHytQQ@mail.gmail.com>
 <CAJX3zAuYgzv6_d2Fb8wUrHwPnyg0FEmNSfkiJkQ=zyqEqXKcrA@mail.gmail.com>
 <20200903182409.6b337059@windsurf.home>
 <CA+TH9V=Czc80jT1jExNC+XUrqHz5mz+oFNvORcfjotCVXrO0KQ@mail.gmail.com>
 <87o8mlmoga.fsf@dell.be.48ers.dk>
 <CA+TH9VkA2ETrCvQF+mhb=PeKm8P=o2Jnesmooh4KCKSbzUcANQ@mail.gmail.com>
 <87blilmeo2.fsf@dell.be.48ers.dk>
 <CA+h8R2qYVjSwFZR0DcOpAdSY8nZKURLwW+a8tanxpEvDh__fSg@mail.gmail.com>
 <877dt8n2o7.fsf@dell.be.48ers.dk>
 <CAFSsvmqdBURoCVmbFRBUoYwd3VErpOp1GcG=xzxJETpbpAVrTg@mail.gmail.com>
 <20200905211650.0a229191@windsurf.home>
 <CA+TH9Vn8cdHTKmoT1LLY7F=ywtuH_bSLFxZX1aQZgH6yFT26TA@mail.gmail.com>
 <20200905223835.1e68d658@windsurf.home>
 <CA+TH9VkgkuMUUy65L6njfjSuDeJ7wzXueJmX74XF9YQucd8RnA@mail.gmail.com>
Message-ID: <20200905230431.34bcd9ea@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 5 Sep 2020 22:55:11 +0200
Angelo Compagnucci <angelo.compagnucci@gmail.com> wrote:

> > I'm not sure what you mean here. You would require all commits to come
> > with a snippet of configuration that allows the commit to be build
> > tested ?  
> 
> Yes, exactly.

This actually raises the barrier to entry even more than an e-mail
based workflow! Newcomers have to understand this practice, what a
configuration snippet is, etc. It's not super complex, but it's not
trivial either.

Also, it's easy to get this snippet wrong, and have the automated
testing not actually test anything.

Also, the amount of CPU time that will be needed remains quite
significant. Another thing we could do is require contributors to
attach the output of a test-pkg run.

But overall, the buildability of something is not really the primary
reason for the review taking time. Indeed, I typically never build test
version bumps, or even simple Python packages, I let the autobuilders
do this job. For new packages, I tend to have a different approach
depending on who the submitter is: experienced contributors are more
likely to know how to properly test their submissions, while newcomers
are more likely to make mistakes (which is normal!), so I tend to test
a bit more contributions from newcomers.

> > If you have a magic solution for this, I'm interested!  
> 
> Well, I'm completely sure of that.
> Anyway, in the context of doing buildable and testable review
> requests, the developer should attach to the commit a minimal
> defconfig and minimal testing.
> That minimal defconfig and that testing are chosen by the developer to
> enhance confidence that the request is working.

Well, it is generally the case that the developer has tested... but
that doesn't mean that this testing was good.

Take the example of libblockdev, recently submitted by Adam. Adam
probably built it with a glibc toolchain, and it worked all fine for
him. And when I tested his libblockdev package, I used what is the
default C library in Buildroot, i.e uClibc, and it failed to build;

As you can see, a minimal defconfig + testing chosen by the developer
is no silver bullet.

> > In the context of Buildroot, saying "a commit is good" requires
> > building thousands of different configurations: number of CPU
> > architectures * number of GCC versions * number of binutils versions *
> > number of C libraries * number of optional dependencies of the package
> > * number of optional dependencies of all dependencies of the package.  
> 
> I'm not confusing, really, and from what I learned on Computer
> Science, that type of testing you're saying here is not even possile.

Glad we agree that it is not possible to do such testing :-)

> What I'm saying here is that we should and must enforce a minimal "it
> compiles" verification and "it runs" verification.

But this is already done by the autobuilders, and works very well: we
as maintainers rely on the autobuilders a lot to tell us if something
is wrong.

Let's take an example: I just pushed the commit adding the
"makedumpfile" package. It has been submitted by a newcomer, so I did
some local build testing, but with only one architecture, one
toolchain, one configuration. It built in this configuration locally,
so I pushed. All the rest of the testing will be done by the
autobuilders.

I just pushed the python-crayons package. I have done zero build
testing. The only thing I've checked is verifying the legal information
in the package, and this cannot be automated.

> Recent history says that we had packages with a service never started
> because the init script was wrong, we should avoid that.

We already have the infrastructure for that: runtime tests. They exist,
they are run by Gitlab CI.

Please submit more runtime tests :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
