From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 5 Sep 2013 21:56:01 +0200
Subject: [Buildroot] Build reproducibility
In-Reply-To: <20130903191306.601a2be0@skate>
References: <1377851505-23498-1-git-send-email-jezz@sysmic.org>
 <CAAXf6LVmyWojaBTfpTpZsNcXr+bCSkFMT__iYQjTAvO9ryEqnw@mail.gmail.com>
 <2d076e17ea7c855166044994876e2add@sysmic.org>
 <20130830145254.1e5a1f53@skate>
 <CAAXf6LVPfKZP+3k1AfXek28Y6bgVwxbJ4iPYRq6nihry=egaig@mail.gmail.com>
 <20130902105337.7dedb880@skate>
 <CAAXf6LUdJgRVK-BJJdJeH9QyutP_daHktchXMkTQ8M=R3U95mw@mail.gmail.com>
 <20130903191306.601a2be0@skate>
Message-ID: <CAAXf6LUjLb498scj-y3vb-DbRe+2as9H+shXAWHGU=CiTPf43g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Sep 3, 2013 at 7:13 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Mon, 2 Sep 2013 15:18:09 +0200, Thomas De Schampheleire wrote:
>> > Of course, if within the Buildroot project we are interested in
>> > fixing such missing dependencies, then we can find a way of adding
>> > randomness into the build order in our autobuilders. But clearly,
>> > we do want to expose this randomness to our users.
>>
>> I think indeed we should try to set the dependencies right some way
>> or another.
>>
>> If we assume that a package does not have any configurable options
>> that would change its dependencies, a simple way to check if all
>> dependencies are properly expressed is through:
>> make clean toolchain foo
>
> This is already done by the autobuilders. Thanks to the randomness of
> the configuration, if a package fails to express a mandatory
> dependency, sooner or later the autobuilders will generate a
> configuration that has the package enabled but not one of its unknown
> dependencies. The autobuilders have triggered such cases very quickly
> in the past when a new package was added, so I'm pretty confident we
> have good coverage on this one.

I'm currently running 'make clean toolchain <pkg>' for each package,
and preliminary results have already found several dependency
problems. I will analyze the results when it's done and submit patches
for them.
The advantage of such a non-random test is that it will find problems
faster than the autobuilders.

>
> However, I think this suggestion misses the point of the current
> discussion: we are talking about *optional* dependencies, i.e
> functionality of a given package that are enabled if OpenSSL is
> available, or disabled if OpenSSL is not available. Those optional
> dependencies cannot be checked/discovered by a build such as "make
> clean toolchain foo".

Correct. When I wrote my mail, I hadn't though about such optional dependencies.

>
>> Also, it's not necessary that each package gets build every night:
>> once the dependencies are correct, they will stay correct until a
>> version bump. This means we can spread out the execution of this type
>> of tests over time, interleaving them with the already existing
>> autobuilds with random configurations.
>
> As stated above, for the mandatory dependencies, the autobuilders are
> already finding them very quickly. Introduce a new package that lacks a
> mandatory dependency expressed in its .mk file, and you'll see it very
> quickly in the autobuilders.
>
>> The make targets of buildroot itself are executed sequentially.
>> Suppose that we keep a list of all targets executed, something like:
>> python-source
>> python-extract
>> python-patch
>> python-configure
>> python-build
>> python-install-target
>> pyfoo-source
>> pyfoo-extract
>> pyfoo-build
>> ...
>>
>> To reproduce a build, we can explicitly pass this list on the make
>> command-line, roughly like:
>> cat <target-list> | xargs make clean toolchain
>
> Could be doable.
>
> I've lost track. Are we talking about all of this to use "include
> package/*/*.mk" in make 3.82 which doesn't guarantee sorting, or to be
> able to do top-level parallel build?

The original mail was about the wildcard-make-3.82-thingy. You were
the one that dragged in the parallel build situation :-)

>
> Seeing how simple it is to get make 3.82 to behave like make 3.81 by
> sorting the "include package/*/*.mk" inclusions, I don't think it's
> worth doing anything but the fix that J?r?me has suggested.

Agreed.

>
> Only the top-level parallel build would be a good enough to worry about
> reproducibility of more complicated builds (and therefore the need to
> list in which order the targets were built).

Although such a list could help in reproducing a parallel build, in
the context of making buildroot work successfully with top-level
parallel build, it is just a side-problem I think. Do you think we
should be doing something about it right now?

Best regards,
Thomas
