From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 12 Apr 2018 19:11:32 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-04-11
In-Reply-To: <20180412120200.1578d99f@windsurf>
References: <20180412060058.042A020894@mail.bootlin.com>
 <5acf2b9594d1f_203c2b0f110c8d48766ad@ultri4.mail>
 <20180412120200.1578d99f@windsurf>
Message-ID: <20180412171132.GB4221@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2018-04-12 12:02 +0200, Thomas Petazzoni spake thusly:
> On Thu, 12 Apr 2018 06:49:09 -0300, Ricardo Martincoski wrote:
> > On Thu, Apr 12, 2018 at 03:00 AM, Thomas Petazzoni wrote:
> > > Results for branch 'master'
> > > dtv-scan-tables-07b18ecef17... | 10
> > > gst1-interpipe-10dba89eecc2... | 3 
> > > x264-7d0ff22e8c96de126be9d3... | 2   
> > 
> > I believe these are related to corner cases in the download of packages with
> > site method git.
> > I sent a short series that hopefully fixes some of these.
> > http://patchwork.ozlabs.org/project/buildroot/list/?series=38584

I'll be having a loog at those right now (well, after I finish this
email, that is! ;-) ).

> Ah, interesting. I talked (privately) with Yann about the
> dtv-scan-tables issue early today. We didn't spend much time analyzing
> the issue, but there is one side thing that I thought could be causing
> issues in the autobuilders:
>   https://git.buildroot.org/buildroot-test/commit/scripts/autobuild-run?id=c47d9bf2080e33fa3a87223afd93f46363e36447

Indeed, I don;t see that ending up nicely in the end.

Even if we can run some 'git fsck' or the like, at one point we may end
up removing a file that *is* critical and without which we could not
even do an fsck...

> This change from Peter Korsgaard adapts the logic in autobuild-run that
> removes 5 random tarballs between every build. This exists to force
> autobuilder instances to regularly re-download stuff, which allows to
> test our download infrastructure.
> 
> Originally, DL_DIR was flat, so we were just picking up 5 random files
> from that folder. Now that DL_DIR has sub-directories, Peter changed
> the logic to be recursive, and pick 5 random files recursively....
> except that DL_DIR/<package>/git/ contains a Git repo, and I'm not sure
> deleting random files from a Git repo is really recommended.
> 
> So I have no idea if the download problems are related to this
> autobuild-run issue, or if there are actual issues in the git download
> helper, but we should probably fix autobuild-run anyway.

Yes, we do need to fix the autobuilder script.

But now, I don't think we should try to repare a broken git repository.
If it is broken, we can just remove it and re-clone from scratch (from
the current remote).

I'll reply further to Ricardo's series.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
