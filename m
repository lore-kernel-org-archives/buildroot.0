From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 25 Jul 2012 01:07:26 +0200
Subject: [Buildroot] [PATCH] pkg-infra: limit -reconfigure and -rebuild
 actions
In-Reply-To: <CAHXCMMK0J9pvVcXTfRApAcSYG+yxxOVffD_5goqF1OaBGEKROg@mail.gmail.com>
References: <1342791572-18657-1-git-send-email-rbraun@sceen.net>
 <20120720222722.5f89af04@skate> <20120720233136.GA25851@mail.sceen.net>
 <20120721145411.6e291ad2@skate> <20120721151730.GA2543@mail.sceen.net>
 <CAHXCMMK0J9pvVcXTfRApAcSYG+yxxOVffD_5goqF1OaBGEKROg@mail.gmail.com>
Message-ID: <500F2AAE.6020107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Funny how much discussion can rise from a two-line patch :-)

On 07/21/12 18:14, Samuel Martin wrote:
> Hi all,
>
> Here, I'll try to sum up what we talked few days ago on the IRC
> channel, plus give my opinion about this.
>
> To be honest, the first time i tried these -reconfigure and -rebuild
> targets, I was surprised they didn't behave as I would expect from
> targets named like that, rebuilding not only the package but the
> images too. So, I keep doing things by hands... though I understand
> why things were implemented like this.

  Me too.  I tend to run command lines like:

make foo-clean-for-rebuild foo && scp target/usr/bin/foo mytarget:/usr/bin

so I would much appreciate an abbreviated 'make foo-rebuild'.


> IMO, for anyone who wants to re-{configure,build} a package, there are
> several use cases (some of these have already been mentioned in this
> thread):
> 1) integrate a (new) package in BR;
> 2) experimenting, on the target, the result of modifications in the
> source code of a package;
> 3) add a new package in an image.
>
> IMO, goals 3) is the combination of the first 2 ones, though it's
> often the first thing coming in mind.

  I think for 1) you'd use foo-reconfigure, for 2) foo-rebuild, and
for 3) you can actually just run make (after a menuconfig) of make foo.


> Because of what BR is, people working with it may follow one or
> another of these goals:
> - people working on targets and what the target will do at the end
> mostly aims goal 2) or 3) (or both!);
> - people working on BR, considering it as a distribution (working on
> the package integration/upgrade, the infrastructure, etc) focus on 1).
>
> So, depending on the end goal, the expected behavior of the make
> targets '-reconfigure' and '-rebuild' may differ:
> - for the goal 1) followers: these targets should only rebuild the
> given package;
> - for the goals 2) and/or 3) followers: these targets should, not only
> rebuild the given package, but also the whole regenerate the whole
> image.

  I disagree for goal 2).  I think most people (me at least) either use
nfsroot or scp during development, and don't go through the process
of flashing a full rootfs for every experiment (at the rate that I
produce bugs, the wear on MFC NAND would be horrible :-).


> I'd like 4 targets in BR:
> - "-rebuild-single": re-building and re-installing only the given package;
> - "-reconfigure-single": re-configuring the given package, then
> running 'make<pkg>-rebuild-single';
> - "-rebuild-all": running: 'make<pkg>-rebuild-single all';
> - "-reconfigure-all": running: 'make<pkg>-reconfigure-single all';
>
> The name of these targets may differ, but the semantic is here.

  You almost indicate yourself that the two latter targets add little
value...  'make foo-rebuild all' is exactly the same amount of typing
as 'make foo-rebuild-all'...  I'd be disappointed to need the extra
typing of a -single.  And I'm also not so happy about adding more
per-package targets, as these will inevitable make tab completion
even slower.

  Bottom line: I'm all in favour of Richard's original patch
(except that foo-reconfigure should also reinstall foo, which
everybody seems to agree with).

  Regards,
  Arnout

>
>
> 2012/7/21 Richard Braun<rbraun@sceen.net>:
>> On Sat, Jul 21, 2012 at 02:54:11PM +0200, Thomas Petazzoni wrote:
>>> However, I don't agree with the change you did on -reconfigure that
>>> would only to the configure step. If -rebuild does build+install, then
>>> -reconfigure should do configure+build+install.
>>
>> Right, after a bit more thinking, I agree.
> Of course, I second.
>
>
> Cheers,
>

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
