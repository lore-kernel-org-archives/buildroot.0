From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 27 Jul 2014 21:58:30 +0200
Subject: [Buildroot] [PATCH 0/9 v3] Cleanups in download helpers (branch
 yem/check-downloads)
In-Reply-To: <20140727161309.5ed9ad32@free-electrons.com>
References: <cover.1405895896.git.yann.morin.1998@free.fr>
 <20140727161309.5ed9ad32@free-electrons.com>
Message-ID: <20140727195830.GF3895@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-27 16:13 +0200, Thomas Petazzoni spake thusly:
> On Mon, 21 Jul 2014 00:42:22 +0200, Yann E. MORIN wrote:
> > This series is a follow-up to the previous download series. Following
> > the advice from Arnout, I introduced a wrapper script that is responsible
> > for the saving atomically in BR2_DL_DIR. If also manages all the temporary
> > files, and properly cleans up.
> > 
> > Consequently, the helpers are now nuch more simple, and no longer need to
> > duplicate the complex handling of atomicity in BR2_DL_DIR, nor do they
> > need to manage temporary files.
> 
> In principle, it certainly looks good. I'm just wondering if we really
> need the separate scripts for each of the download methods, since they
> do just one command basically. What about a single
> support/scripts/download-helper script, which does the common stuff +
> contains a switch to call the appropriate sub-functions for each
> download method?

I thought about this, too. But I can see at least two reasons against:

  - bloat: the download script would get pretty large. That can be OK in
    itself, although I do not like it too much. Having the download
    helpers properly split into separate files makes it easier to manage
    and maintain, I think.

  - simplicity: since the wrapper calls to the helpers, it has a single
    command for which to catch failure. The error path is very simple.
    If the download script was to call functions, then those function
    should not be able to cause the script to exit() or we would not be
    able to clean up behind ourselves (and 'set -e' has no effect in an
    'if' statement). Granted, we could use traps, but Arnout and I do
    not like them very much: it's easy to mis-use them, and miss
    updating them later on; having a linear code-flow is easier to
    handle.

So I still prefer to use separate scripts for the helpers, rather than
move them to functions in the download script itself.

Of course, should that really be a blocker, I can rethink that. But be
real quick, since -rc1 is approaching, and I'd like to fix it before -rc1
(since it impacts the mirror set up by Peter on mirror.buildroot.org.)

> What do others think? Could some others test the patch series and give
> their feedback?

Yes, please! ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
