From: Trent Piepho <tpiepho@impinj.com>
Date: Thu, 22 Mar 2018 17:25:47 +0000
Subject: [Buildroot] [PATCH 2/2] core/instrumentation: shave minutes off
 the build time
In-Reply-To: <20180322171159.GZ14461@australia>
References: <cover.1521146096.git.yann.morin.1998@free.fr>
 <6a793a6dba4f052ca8bbc35edd63df601f46478b.1521146096.git.yann.morin.1998@free.fr>
 <87muz5fp2n.fsf@dell.be.48ers.dk> <20180318161530.GA2478@scaer>
 <87efkhfimu.fsf@dell.be.48ers.dk> <20180322164144.GY14461@australia>
 <20180322175035.2410072a@windsurf> <20180322171159.GZ14461@australia>
Message-ID: <1521739547.10662.260.camel@impinj.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2018-03-22 at 18:11 +0100, Thomas De Schampheleire wrote:
> 
> > > The current timestamp-based approach not guaranteeing an accurate list is
> > > problematic for many such uses. And as you already mentioned, since we don't have
> > > full control over the build steps done in any given package, we don't know which
> > > timestamps they will use. There may be very good reasons to install certain
> > > files with their original timestamp and not the one from the build.
> > 
> > These are all valid concerns, but what do you suggest ?
> > 
> > The current approach of hashing all files clearly doesn't scale, as a
> > significant amount of build time is now spent on hashing files.
> > 

The hash approach also fails to handle symlinks well.

I think the answer is to install each package into a clean per-package
install tree, then combine those trees.  It will fix all the these
problems, allow more parallelism, and quite possible be outright more
efficient since it will scale with the number of files, while all
currently presented approaches scale with the number of files
multiplied by the number of packages.

> I can only observe that previously, when we still only listed the target files,
> the impact did not seem to be that bad, and the concerns about impact on build
> time arose with the creation of staging and host lists.

That was the big one, but here's a breakdown:

step_pkg_size-stage      143.50
step_pkg_size-target     267.14
step_pkg_size-host       419.21

Target alone is still over four minutes.  This was for a 12 minutes
building + 14 minutes instrumentation build.
