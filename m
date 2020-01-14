From: Vincent Fazio <vfazio@xes-inc.com>
Date: Tue, 14 Jan 2020 15:10:40 -0600
Subject: [Buildroot] Allowing to build from Git branches
In-Reply-To: <20200114220401.61700031@windsurf>
References: <20200114220401.61700031@windsurf>
Message-ID: <7cb813ef-4b64-60c4-a810-50b80bac76a8@xes-inc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I can see the argument for this. I used to use a hacked up BR branch 
that added support for checking if the reference to the git branch has 
changed since the last download but this was only while images? were in 
development. I always switched to fixed hashes after the iterations were 
completed.

On 1/14/20 3:04 PM, Thomas Petazzoni wrote:
> Hello,
>
> I know some people are going to yell at me for bringing up this topic,
> but let's do it anyway.
>
> Currently, Buildroot says that using a Git branch as the VERSION for a
> package is not supported. There are some patches that have been
> proposed to explicitly prevent using branches, but in the current
> Buildroot it "works" except that a cached tarball is preserved in
> DL_DIR, which means that the branch is never fetched again unless the
> tarball is manually deleted from DL_DIR. We have generally resisted
> supporting Git branches with the (very valid) argument that it breaks
> reproducibility.
>
> However, over time, I have seen a number of users/companies complaining
> about this, both on the mailing list and privately with customers or
> while discussing with users at conferences.
>
> The typical use case that they describe is the following: a company has
> a large number of packages in Buildroot to build in-house software
> components. Both for their CI runs, and for the developers actively
> working on the system, they would like for those packages to point to a
> branch, and always fetch the latest version. Yes, it is not
> reproducible, but reproducibility is not what is desired at this point
> of the project: what is wanted is precisely to fetch the latest and
> greatest for those packages that point to a branch, to make sure the
> most recent code gets tested and used by developers internally.
>
> The only solution we offer for this today is <pkg>_OVERRIDE_SRCDIR or
> <pkg>_SITE_METHOD = local, but neither of those are very practical: you
> need to have fetched each of your software components outside of
> Buildroot, and point Buildroot at them. It's a bit silly when Buildroot
> is already perfectly capable of doing this.
>
> Overall, I think it makes sense to realize that Buildroot is used in
> different use-cases:
>
>   - During active development, where we want to offer a lot of
>     flexibility, possibly at the expense of reproducibility.
>
>   - During release/generation of the final firmware that will be used on
>     actual devices, where we want an absolute reproducibility, to the
>     point where we're working on binary-identical results.
>
> Buildroot has its roots in solving the second use-case. However, we
> have already added some features, like OVERRIDE_SRCDIR and SITE_METHOD
> = local, to provide the additional flexibility needed for the first use
> case. In some sense, those features already kill reproducibility: what
> you're building is some random source code from some random local
> folder. Completely non-reproducible. Possibility worse that a Git
> branch, where you can potentially at least trace back which commit was
> built, and re-do that same build.
>
> So I'd like to start the debate on whether it might makes sense to
> relax our requirements on this, and be more pragmatic, and support
> fetching from Git branches. Of course, this very likely needs to be
> guarded by a Config.in option, so that we clearly set the boundary
> between "you're in the safe zone where your build is reproducible" and
> "you're in the zone where your build is non-reproducible".
>
> And now, let's the flames start! :-)
>
> Thomas

-- 
Vincent Fazio
Embedded Software Engineer - Linux
Extreme Engineering Solutions, Inc
http://www.xes-inc.com
