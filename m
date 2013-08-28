From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Aug 2013 15:21:18 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <CAAXf6LU9F_44bBCcr3pPJO6T3eVAdom-3p1H+sVwW_ga4LAsPA@mail.gmail.com>
References: <20130828063005.74A7952C1BE@lolut.humanoidz.org>
 <20130828090812.43a7f849@skate>
 <CAAXf6LXqi=BWZ6dovZS3HEfCZbr5DbECvQLJCwOH94Ax=P_z9Q@mail.gmail.com>
 <20130828135546.511e1ec5@skate>
 <CAAXf6LU9F_44bBCcr3pPJO6T3eVAdom-3p1H+sVwW_ga4LAsPA@mail.gmail.com>
Message-ID: <20130828152118.7c343343@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Wed, 28 Aug 2013 15:13:40 +0200, Thomas De Schampheleire wrote:

> >> Good idea! Ideally we can get them to 0, so that from that point
> >> onwards any autobuild failure becomes a clear focus point.
> >
> > Agreed. Though we have to keep in mind that the release is in 3 days,
> > and after that 'next' will be merged in master, and we'll have plenty
> > of new autobuilder failures to look at.
> 
> I don't think we will be able to fix everything before the release. So
> after next is merged in, we should try fixing the new problems as soon
> as possible, in addition to the current ones.

Right, but isn't this what we are all continuously doing? :-)

> Have you heard of the 'stop&fix' principle? The idea is that no new
> patches are accepted when there are existing failures, and all
> developers are expected to help in fixing the problem before doing
> anything else.

I had never heard of it as a formal principle with the 'stop&fix' name,
but it obviously looks like a natural solution to try to get some
attention from the developers. I'm not sure we want to get this far,
especially since some of the issues are quite complex, need some
discussion, etc.

I'm also using the autobuilders to progressively 'push' for more
coverage of some specific use-cases. For example, in the past, there
were never BR2_PREFER_STATIC_LIB builds, and I introduced that a few
months ago. I knew it would generate a lot of new autobuilder failures,
but that was the only way to make sure this feature is properly
supported. And I think it actually worked: people have contributed a
lot of patches to progressively fix static build problems, and the
situation has improved a lot.

One of the next thing I'll probably add is random usage of ccache, to
catch problems such as the "$(CC)" problem you fixed this morning.

So if our goal is really 0 failures, it can certainly be achieved
easily by removing the most exotic configurations from the
autobuilders, but I'm not sure if it's really a desirable goal. On the
other side, having too many failures in the autobuilders is very
discouraging and nobody wants to fix failures when they are hundreds of
them.

> >> >>    powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/7bcab9b94a81b89789dc1cabe9f6940ed4f5ea51/
> >> >
> >> > Too old kernel headers in toolchain. Options:
> >> >
> >> >  1/ Add an exception in the autobuilder script.
> >> >
> >> >  2/ Modify media-ctl to integrate the necessary kernel headers and use
> >> >     them when not available from the toolchain.
> >> >
> >> > I'm inclined to favor 1/.
> >>
> >> I once took a look at this. The media-ctl package already has some
> >> copies of kernel headers to deal with older kernels. There was a check
> >> in configure to detect this, IIRC. The stupid thing was that the
> >> headers in the media-ctl sources would be applied unconditionally.
> >> My intent was to patch media-ctl to provide also this missing header,
> >> and cleanup the stupidity described. Unfortunately I didn't continue
> >> this yet.
> >>
> >> What exactly do you mean with approach 1/? Forcing a recent kernel
> >> when building media-ctl?
> >> That doesn't solve the problem for other users that try to enable
> >> media-ctl on older kernels, right?
> >
> > By 1/ I meant to not fix the problem, and only avoid it in the
> > autobuilders by making sure that when a non-suitable toolchain (too old
> > kernel headers) is used to build media-ctl, then we exclude media-ctl
> > from the build. I already have quite a few of such exclusions. What I
> > find not very nice is that the set of exclusions is not documented
> > anywhere, while they should be documented as "Known issues", or
> > something like that.
> 
> I think this can be a good solution. Some problems are either too
> complex to fix in buildroot and are really problems of upstream
> packages, or some problems are exhibited in such exotic configurations
> that no-one really cares about, or problems are caused by old
> toolchains/kernels that could be upgraded by the user.
> 
> In these cases, a 'Known issues' + autobuild check may be better than
> leaving the autobuild fail continuously. Users that bump into such an
> issue, and do want to have a solution, can bring up the issue on the
> mailing list and help look for a real solution.
> 
> Of course it's not the solution to add each build failure to the known
> issue, because then buildroot becomes useless. But I'm sure we can
> have good judgement here by the community members.

I fully agree.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
