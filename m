From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 16 Apr 2018 22:56:14 +0200
Subject: [Buildroot] [RFC PATCH 2/3] download/git: recover dirty cache
In-Reply-To: <20180416160124.GC2290@scaer>
References: <20180415120230.GA21958@scaer>
 <5ad41059af3a7_5cd73ffcbd32b2bc9895d@ultri4.mail>
 <20180416160124.GC2290@scaer>
Message-ID: <20180416205614.GE2290@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

To all autobuilder runners: could you create a tarball of the failed
dtv-scan-tables git tree on yuour autobuilders, from each of your
instances, please?

I got mine, butonly one is really broken (missing HEAD). I'd like to
get a few other breakage to investigate furhter the git backend fixes
and be sure they work as expected.

Thanks!

Otherwise, Ricardo, more comments below...

On 2018-04-16 18:01 +0200, Yann E. MORIN spake thusly:
> On 2018-04-15 23:54 -0300, Ricardo Martincoski spake thusly:
> > On Sun, Apr 15, 2018 at 09:02 AM, Yann E. MORIN wrote:
> [--SNIP--]
> > > Of course, that would require using appropriate options to fsck to bail
> > > out.
> > 
> > Yes. Some interesting ones I listed below:
> > --no-dangling: AFAIK they cause no harm;
> > --no-reflogs: not sure;
> > --full: this is for the case someone is abusing the git cache with alternates,
> >         should we care?
> 
> So I played with git-fsck in quite a few setups, and it irremediably
> exits with a non-zero status when something is wrong.

And now I've had a case where git-fsck would barf, because of missing
objects. The git tree was not salvageable with git-fsck.

But then, git-fetch retrieved the missing blobs, and everything was back
to being fine.

So, we'd have situations where we'd detect a borked repository, so we'd
re-clone it from scratch, when a simple fetch would have retrieve the
missing parts...

Hoowever, I'd prefer that we play safe, and download more than
necessary, but be sure we end up with a sane situation.

And I still think that running git-status is enough to detect a borked
repository, rather than the expensive git-fsck.

Thoughts?

Regards,
Yann E. MORIN.

> However, on my machine, it takes about 8min to fsck the Linux git tree,
> which is a huge amount of time (much more than it takes to do the build
> of said kernel).
> 
> So, I am a bit reluctant at using git-fsck.
> 
> I'm trying to see if we can find a faster way to detect if the git tree
> is sane or not. After all, we only need a sanity check, not repairing.
> If it is not sane, we ditch it and reclone.
> 
> So, maybe just running "git status" or any other fast action should
> probably be enough.
> 
> Thoughts?
> 
> > I find out that different git versions also use different sets of errors to
> > return non-zero code. Not so different, don't worry.
> > Old versions return 0 for few errors (but the error: message is printed) 
> > git 1.8.3: return code 0 for a missing sha1 object pointed by a tag, printing:
> >  error: refs/tags/tag_b does not point to a valid object!
> > git 2.14.1: return code 2 in the same case
> >  error: refs/tags/tag_b: invalid sha1 pointer 1f95d47cc18a9ed4e1eab9b71fe2009c9555448d
> > BUT, as we always do a fetch before checkout, the fetch fixes it!
> > So again, we are good. I don't think it needs extra code.
> 
> Hmm... As long as the repo is not _broken_ and we can recover with the
> fetch / clean/ checkout actions, I'm OK.
> 
> > > But what to do if any if the following actions fails? Should we simply
> > > exit, or should we clean up and clone again?
> > > 
> > > I can see shere that could go wrong: the ref does not exist, so the
> > > first checkout fails, so we ditch the repository, clone again, and
> > > checkout again fails...
> > > 
> > > My opinion, for what it's worth, is to clan only on the fsck. Any other
> > > failure should be left to the user to handle. Maybe with just a little
> > > message saying something like:
> > > 
> > >     If you are not sure how to solve this, remove ${cache_dir}.
> > > 
> > > Thoughts?
> > 
> > I agree, to clean only on the fsck is better.
> > 
> > The user-friendly message is not *needed* IMO.
> > But if you find an easy way to do that, it would be nice to have.
> > Maybe in _git() but not in the fsck case.
> > Maybe a trap? Not sure.
> 
> Well, a trap is pretty simple, yes.
> 
> But let's leave that out for now, we already have enough complexity to
> handle...
> 
> Regards,
> Yann E. MORIN.
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
