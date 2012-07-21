From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 21 Jul 2012 18:14:52 +0200
Subject: [Buildroot] [PATCH] pkg-infra: limit -reconfigure and -rebuild
	actions
In-Reply-To: <20120721151730.GA2543@mail.sceen.net>
References: <1342791572-18657-1-git-send-email-rbraun@sceen.net>
 <20120720222722.5f89af04@skate> <20120720233136.GA25851@mail.sceen.net>
 <20120721145411.6e291ad2@skate> <20120721151730.GA2543@mail.sceen.net>
Message-ID: <CAHXCMMK0J9pvVcXTfRApAcSYG+yxxOVffD_5goqF1OaBGEKROg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Here, I'll try to sum up what we talked few days ago on the IRC
channel, plus give my opinion about this.

To be honest, the first time i tried these -reconfigure and -rebuild
targets, I was surprised they didn't behave as I would expect from
targets named like that, rebuilding not only the package but the
images too. So, I keep doing things by hands... though I understand
why things were implemented like this.

IMO, for anyone who wants to re-{configure,build} a package, there are
several use cases (some of these have already been mentioned in this
thread):
1) integrate a (new) package in BR;
2) experimenting, on the target, the result of modifications in the
source code of a package;
3) add a new package in an image.

IMO, goals 3) is the combination of the first 2 ones, though it's
often the first thing coming in mind.

Because of what BR is, people working with it may follow one or
another of these goals:
- people working on targets and what the target will do at the end
mostly aims goal 2) or 3) (or both!);
- people working on BR, considering it as a distribution (working on
the package integration/upgrade, the infrastructure, etc) focus on 1).

So, depending on the end goal, the expected behavior of the make
targets '-reconfigure' and '-rebuild' may differ:
- for the goal 1) followers: these targets should only rebuild the
given package;
- for the goals 2) and/or 3) followers: these targets should, not only
rebuild the given package, but also the whole regenerate the whole
image.

I'd like 4 targets in BR:
- "-rebuild-single": re-building and re-installing only the given package;
- "-reconfigure-single": re-configuring the given package, then
running 'make <pkg>-rebuild-single';
- "-rebuild-all": running: 'make <pkg>-rebuild-single all';
- "-reconfigure-all": running: 'make <pkg>-reconfigure-single all';

The name of these targets may differ, but the semantic is here.


2012/7/21 Richard Braun <rbraun@sceen.net>:
> On Sat, Jul 21, 2012 at 02:54:11PM +0200, Thomas Petazzoni wrote:
>> However, I don't agree with the change you did on -reconfigure that
>> would only to the configure step. If -rebuild does build+install, then
>> -reconfigure should do configure+build+install.
>
> Right, after a bit more thinking, I agree.
Of course, I second.


Cheers,

-- 
Sam
