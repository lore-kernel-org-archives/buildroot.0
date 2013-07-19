From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 19 Jul 2013 17:41:42 +0200
Subject: [Buildroot] [PATCH v2 0/3] Fix for top-level parallel make part
	1
In-Reply-To: <20130718113809.663c6b58@skate>
References: <1374138746-23279-1-git-send-email-fabio.porcedda@gmail.com>
 <20130718113809.663c6b58@skate>
Message-ID: <CAHkwnC8imHc+yWdkUeR6VdehBhpuux_xmKProHu7uFmmR50N8g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 18, 2013 at 11:38 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Fabio Porcedda,
>
> Thanks for your patches!

Hi Thomas,

Thanks for reviewing the patches.

> On Thu, 18 Jul 2013 11:12:23 +0200, Fabio Porcedda wrote:
>
>> this is the first patch set for fixing top-level parallel make in buildroot,
>> the common problem scattered in buildroot's top-level makefile is that in the
>> rules it relies on the order of evaluation of the prerequisites,
>> to be able to use top-level parallel make instead of reling on the left to
>> right ordering of evaluation of the prerequisites we must add an explicit
>> rule to describe the dependency.
>
> I don't remember if we had this discussion in the past, but before
> going down the road of supporting top-level parallel make in Buildroot,
> I'd like to understand what is your plan to solve the most important
> problem that top-level parallel make creates: the need to create
> per-package sysroot, instead of the global single sysroot we have
> today. Have you thought about this problem already? What solution do
> you have for it?

I hadn't thought about that, thanks for pointing it out.

> In case the problem is not clear, here is a quick summary. The global
> sysroot we have today, in which all libraries and headers are
> installed, works fine because we have a guarantee on the build order
> that is consistent across rebuilds, because builds are non-parallel.
>
> Now, let's introduce parallelization between builds of different
> packages, and suppose package A has an optional dependency on package
> B, but this dependency is not expressed in Buildroot Makefiles because
> we haven't seen that package A could optionally use package B.
>
> If you build things in parallel, then one build may lead to package A
> having been built with support for package B, because package B was
> built and installed in the sysroot prior to package A configure step.
> The next build you do, package A may be built without support for
> package B, because package A configure step is executed before package
> B is installed into the sysroot.
>
> So without doing *any* change in Buildroot or the configuration, two
> consecutive builds would have different results, which is clearly not
> nice.
>
> The only solution to avoid this is to have a per-package sysroot, into
> which only the dependencies explicitly listed in the package .mk files
> are installed. It is probably not impossible to do with Buildroot, but
> isn't completely simple either.
>
> What are your plans in that respect?

So before to add top-level parallel make support we must add
per-package sysroot...
That's a bad news for me, i was already wokring on the second part :-(

I can try to work to add per-package sysroot, but i've some doubts about that:
 - Is per-package sysroot a desiderable feature regardless the
top-level parallel makefile support?
 - Is per-package an appropriate or overkill feature for buildroot?

Do you know if the other build system use per-package sysroot solution
to solve the same issue? like bitbake/os, debian, fedora, ...?

Thanks and best regards
--
Fabio Porcedda
