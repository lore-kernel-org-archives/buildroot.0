From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Apr 2018 22:10:26 +0200
Subject: [Buildroot] [PATCH] autobuild-run: remove only tarballs from
 download dir
In-Reply-To: <20180415220222.6413547a@windsurf.numericable.fr>
References: <20180413133431.19449-1-ricardo.martincoski@gmail.com>
 <20180415214257.1e90704a@windsurf.numericable.fr>
 <20180415194915.GE21958@scaer>
 <20180415220222.6413547a@windsurf.numericable.fr>
Message-ID: <20180415201026.GA13321@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-04-15 22:02 +0200, Thomas Petazzoni spake thusly:
> On Sun, 15 Apr 2018 21:49:15 +0200, Yann E. MORIN wrote:
> > > Just to check how this is supposed to work. We have this:
> > > 
> > >  dl/<package>/git/.git
> > > 
> > > Correct ?
> > > 
> > > So you're idea is that when we are inside dl/<package>/git/, one of the
> > > sub-directories is .git, and therefore we shouldn't remove anything in
> > > dl/<package>/git/ ?
> > > 
> > > My concern is that I'm not sure if what you've done prevents from
> > > removing files inside dl/<package>/git or only inside
> > > dl/<package>/git/.git. I would find it more to do something like:
> > > 
> > > 	if "git" in d:
> > > 		d.remove("git")
> > > 
> > > but perhaps you haven't done this for some good reason ?
> > > 
> > > Another concern is how to fix those autobuilders that have already
> > > removed some random files from their cached Git repositories? Should we
> > > ask the people who run those autobuilders to entirely wipe the download
> > > folders of their autobuilder instances ? Or do we have a smart (but
> > > simple) thing to do to avoid this ?  
> > 
> > For this last part, we've already discused this with Ricardo in another
> > thread: we run git-fsck, and if there is an error, we ditch the git tree
> > and clone from scratch.
> 
> OK, so in practice removing random files inside the git/ folders should
> not cause any problem ?

Well, if you remove files from the working copy, no. The next git-checkout
would fix it to a certain extent, which can be covered by a mix of
git-clean + git-checkout, again to a certain extent...

However, if you remove files from below .git, you can cause heavy
breakage. Even removing a single object will cause the tree to get
uterly broken, not telling what happens when one removes a ref or
HEAD.

So, runniong git-fsck would catch the cases where something is missing
in .git, in which case we're toast and the git cache is as good as if
it were not present.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
