From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 Apr 2021 14:43:44 +0200
Subject: [Buildroot] [PATCH v2] package/haveged: bump version to 1.9.14
In-Reply-To: <20210402200116.GI24043@scaer>
References: <20210331185001.24790-1-ps.report@gmx.net>
 <20210331200710.GH24043@scaer> <20210331235221.4c1d1c4f@gmx.net>
 <20210402200116.GI24043@scaer>
Message-ID: <20210404124344.GI2252@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-04-02 22:01 +0200, Yann E. MORIN spake thusly:
> On 2021-03-31 23:52 +0200, Peter Seiderer spake thusly:
> > On Wed, 31 Mar 2021 22:07:10 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > > On 2021-03-31 20:50 +0200, Peter Seiderer spake thusly:
> > > > - add patch to fix uclibc compile (disable dependency on sys/auxv.h
> > > >   introduced with upstream commit [1])
[--SNIP--]
> > If not started with absolute path and /etc/initrd-release exists (both not
> > valid for buildroot or easy to avoid)...
> 
> Having both is probably not very often, but still. Again, in the more
> general case, i.e. not limited to Buildroot, this now-upstream change
> does introduce a latent bug.
> 
> Starting without a full path is trivial: log on to the device, and run
> the daemon in foreground to debug it.
> 
> /etc/initrd-release is defined by systemd, so this is not a random file
> either: https://systemd.io/INITRD_INTERFACE/
> 
> So, people debugging haveged in a systemd-based initrd system will be
> hit. Or people actually being dumped into a recovery systemd-based
> initrd and trying to run haveged to have some good entropy to regenerate
> ssh keys for theis ssh server or whatelse, will be hit.
> 
> > And as good/usable as before upstream commit [1]..., only possible improvement
> > would be to error out (with an early and meaningful error message) in case not
> > started with absolute path and in case getauxval() is not available (instead of
> > error out later with with some unusual path/executable name in the error message)
> > and remove the redundant forcibly set of path[0]?
> 
> I have no idea what would be the best course of actions that upstream
> would see fit.
> 
> But, if the program is started without an absolute path, then most
> probably re-running argv[0] will also resolve it to the same program:
> 
>   - if the program was run as 'haveged', it was (most probably) found in
>     $PATH, and so re-running argv[0] would yield the same;
> 
>   - if the priogram was run as './haveged' (e.g. during development on
>     the developers machine), then again, re-running argv[0] should again
>     yeld the same.
> 
> So I am not sure what this is supposed to attempt. I may have missed
> something, though, so upstream should really find a proper fix... Seeing
> that upstream is getting for a new relase, we should at the very least
> inform them about this issue. Will you do that, or do you want me to do
> it?

So, I've added a comment on the upstream MR:
    https://patchwork.ozlabs.org/project/buildroot/patch/20210331185001.24790-1-ps.report at gmx.net/

Let's see what upstream has to say about that. If they don't care, then
we can apply that patch. If they get a better fix, we can backport it.

> In the mean time, I am totally OK with making haveged unavailable on
> uClibc...

Thats still my position...

Regards,
Yann E. MORIN.


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
