From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jul 2013 13:29:01 +0200
Subject: [Buildroot] [PATCH v2 0/3] Fix for top-level parallel make part
 1
In-Reply-To: <CAHkwnC8SV6L=4a0ain-VysEw3Z8Jg_XLLUJWH1xo6T=FVeYO6A@mail.gmail.com>
References: <1374138746-23279-1-git-send-email-fabio.porcedda@gmail.com>
 <20130718113809.663c6b58@skate>
 <CAHkwnC8imHc+yWdkUeR6VdehBhpuux_xmKProHu7uFmmR50N8g@mail.gmail.com>
 <20130727131828.0442e227@skate>
 <CAHkwnC-yTeGXQnh64-Ra_TJg4ysYqAPNsNaWhA=_sgiUm5R5bw@mail.gmail.com>
 <20130730120157.0d32a58b@skate>
 <CAHkwnC8SV6L=4a0ain-VysEw3Z8Jg_XLLUJWH1xo6T=FVeYO6A@mail.gmail.com>
Message-ID: <20130730132901.0682e15d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Tue, 30 Jul 2013 12:16:44 +0200, Fabio Porcedda wrote:

> > As we discussed in this thread, the problem is that the top-level
> > parallel make feature is broken if you don't have per-package sysroot:
> > builds become non-reproducible.
> 
> Just to understand better, this is true only for packages with
> unexpressed dependencies, right?
> So if a build has only packages with full expressed dependencies the
> builds are reproducible?

Yes, that's correct.

The problem is that it is very hard to be sure that /all/
possible dependencies are expressed in the Buildroot .mk file. When
someone bumps the version of a package, we rarely go through the
details of the changes in the configure.{ac,in} to see if additional
optional dependencies have been added by the upstream developers. We
could very easily overlook such changes, which would lead to
unreproducible results. I wouldn't be annoyed at all if the result was
a big fat build failure that is clearly visible. What annoys me is that
the issue is very hard to notice: from one build to another, you will
get different results. That's very hard to track down for Buildroot
developers and very confusing for users. Imagine the kind of support
requests we will get when users will face such spurious build
differences, and how complex it will be to handle them if we don't have
any guarantees on the reproducibility of the build.

I'd really like to see top-level parallel build in Buildroot, but I
don't think we should do it at the expense of build reproducibility and
increase of users support complexity.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
