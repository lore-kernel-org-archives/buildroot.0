From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Nov 2019 15:05:50 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2019-11-24
In-Reply-To: <1712d8e0-b249-d69a-b3c9-673369890b3c@railnova.eu>
References: <5ddb8024.1c69fb81.357d6.9264SMTPIN_ADDED_MISSING@mx.google.com>
 <0d328fb7-d1a9-aef5-2846-82bd2d55bac9@railnova.eu>
 <20191125115630.66ffb5f0@windsurf>
 <1712d8e0-b249-d69a-b3c9-673369890b3c@railnova.eu>
Message-ID: <20191125150550.685d4a7e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Nov 2019 14:58:50 +0100
Titouan Christophe <titouan.christophe@railnova.eu> wrote:

> > When a next branch exists, we use the next branch as the source of
> > information for what is the current version of each package in
> > Buildroot. We do this because typically, next is more "up to date" than
> > master.  
> 
> Side question: what's the policy for committing to master vs. next ?

We have a 3 months development cycle:

 - First two months: only master exists, all changes go to master

 - We cut rc1, and then we have one month stabilization with multiple
   rc's until the final release

   During that period:

   * master takes only bug fixes, security fixes, build fixes
   * next takes major changes, version bumps, etc.

If you have a version bump that only fixes bugs/security problems, it
therefore goes into master. If you have a major version bump adding new
features and all, it goes to next.

> > Perhaps this could be improved by grabbing both master and next, and
> > retaining the highest version between both, for each package. But oh
> > well, that's quite some additional complexity :/  
> 
> If you think that's worth it, I can have a look at that. Hence this 
> shameless question: where does this code actually live ?
> 
> In Buildroot's repo:
> $ git grep 'link to release-monitoring.org' | wc -l
> 0

support/scripts/pkg-stats generates the JSON file that are then used to
send the notifications e-mails.

However, the change is not trivial, because support/scripts/pkg-stats
assumes it is running inside a Buildroot source tree. It doesn't have
by itself the understanding that Buildroot can have multiple branches.
So using the highest version between master and next requires a major
refactoring of how pkg-stats work, and how it is being executed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
