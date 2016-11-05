From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Nov 2016 12:21:49 +0100
Subject: [Buildroot] [PATCH] makedevs: unlink device nodes before they
 are created
In-Reply-To: <886ac3e1-9e04-9cf8-6eba-9a5eac2f1cc0@mind.be>
References: <20161105001452.7252-1-arnout@mind.be>
 <20161105093051.GB31560@free.fr>
 <886ac3e1-9e04-9cf8-6eba-9a5eac2f1cc0@mind.be>
Message-ID: <20161105112149.GC31560@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2016-11-05 12:05 +0100, Arnout Vandecappelle spake thusly:
> On 05-11-16 10:30, Yann E. MORIN wrote:
> > On 2016-11-05 01:14 +0100, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> >> We use makedevs to create device nodes in the target rootfs. However,
> >> this can be called several times, e.g. when building several filesystem
> >> images or when rebuilding. When the script is called the second time,
> >> the device node already exists so mknod() errors out.
> >>
> >> This wasn't noticed before because fakeroot's mknod() wrapper
> >> (incorrectly) does _not_ error out when the file exists already. Now
> >> we switched from fakeroot to pseudo, the problem becomes apparent.
> >>
> >> The simplest solution is to change makedevs to first remove the target
> >> file before creating it. This is simpler than two alternative
> >> approaches:
> >>
> >> - Removing the target files before makedevs is called is difficult,
> >>   because we would have to parse the device table file to find out
> >>   which files have to be deleted.
> >>
> >> - Silently skipping device creation if it exists already is also easy,
> >>   but then we really should also check if the device numbers and mode
> >>   are correct, and that is more complicated.
> >>
> >> The other types don't have to be changed. The 'd' (directory) type is
> >> already OK because it already only creates directories if they don't
> >> exist yet. The 'f' (file mode) and 'r' (recursive) types only operate
> >> on files and directories that exist already.
> >>
> >> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> >> Reported-by: Fabio Estevam <festevam@gmail.com>
> > 
> > NAK: we really do not want that files exist in the target in case they
> > are configured as device nodes in a dev-table. This should not happen.
> 
>  So what you are saying is: we should instead go for the second alternative I
> mentioned in the commit log, i.e. check if the existing node is the right type?

Yes, that would be acceptable, and correct.

> > That it works now is just an ill side-effect of fakeroot being lenient.
> > That it breaks with pseudo is good.
> 
>  So you do agree that something needs to be fixed? I.e., if we would run it
> under sudo instead of fakeroot/pseudo, we would see the same issue, right?

Yup:

    # mkdir foo c 5 1
    # mkdir foo c 5 1
    mknod: foo: File exists
    # echo $?
    1

> > The fix is far from trivial, though, but we should handle the situation
> > via pseudo, and understand why it does not reload its DB.
> 
>  pseudo reloading its DB has nothing to do with it AFAICS. BTW can you describe
> what the problem is with pseudo reloading its DB?

Forget it, I re-ran a few tests now, and it does work.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
