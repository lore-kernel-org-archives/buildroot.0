From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 2 Apr 2021 22:01:16 +0200
Subject: [Buildroot] [PATCH v2] package/haveged: bump version to 1.9.14
In-Reply-To: <20210331235221.4c1d1c4f@gmx.net>
References: <20210331185001.24790-1-ps.report@gmx.net>
 <20210331200710.GH24043@scaer> <20210331235221.4c1d1c4f@gmx.net>
Message-ID: <20210402200116.GI24043@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2021-03-31 23:52 +0200, Peter Seiderer spake thusly:
> On Wed, 31 Mar 2021 22:07:10 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > On 2021-03-31 20:50 +0200, Peter Seiderer spake thusly:
> > > - add patch to fix uclibc compile (disable dependency on sys/auxv.h
> > >   introduced with upstream commit [1])
[--SNIP--]
> > Upstream has merged your patch, hwever I think it is flawed, see
> > below...
> >
> > > +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > [--SNIP--]
> > > +diff --git a/src/haveged.c b/src/haveged.c
> > > +index b9cb77b..dad3072 100644
> > > +--- a/src/haveged.c
> > > ++++ b/src/haveged.c
> > > +@@ -135,8 +137,10 @@ int main(int argc, char **argv)
> > > + {
> > > +    volatile char *path = strdup(argv[0]);
> > > +    volatile char *arg0 = argv[0];
> > > ++#if defined(HAVE_SYS_AUXV_H)
> > > +    if (path[0] != '/')
> > > +       path = (char*)getauxval(AT_EXECFN);
> > > ++#endif
> 
> This is the fallback in case haveged is started without an absolute path,
> note the buildroot start scripts use an absolute path...

Yes, this is the case for Buildroot. But will this *always* be the case
in *all* potential setups?

What of people debugging their systems and running the program manually?

> > Are you sure this is correct? Later on in that file, 'path' is
> > assigned as thus:
> >
> >     200       path[0] = '/';
> 
> With the full context:
> 
>  197    first_byte = arg0[0];
>  198    if (access("/etc/initrd-release", F_OK) >= 0) {
>  199       arg0[0] = '@';
>  200       path[0] = '/';
>  201       }
> 
> This is only used in case /etc/initrd-release exists...

Again, even if that does not exist in Buildroot, the check is here and
may sometime be hit.

> > And then, 'path' is used to start the daemon:
> >
> >     527    else run_daemon(handle, path, argv);
> >
> > So, if the original argv[0] does not start with a '/' (e.g. because it
> > is called from the PATH), then 'path' will contain a mangled program
> > name:
> >
> >     argv[0] = "haveged"
> >     path = strdup(argv[0]) = "haveged"
> >
> > and thus with line 200:
> >     path = "/aveged"
> >
> > Did I miss something?
> 
> If not started with absolute path and /etc/initrd-release exists (both not
> valid for buildroot or easy to avoid)...

Having both is probably not very often, but still. Again, in the more
general case, i.e. not limited to Buildroot, this now-upstream change
does introduce a latent bug.

Starting without a full path is trivial: log on to the device, and run
the daemon in foreground to debug it.

/etc/initrd-release is defined by systemd, so this is not a random file
either: https://systemd.io/INITRD_INTERFACE/

So, people debugging haveged in a systemd-based initrd system will be
hit. Or people actually being dumped into a recovery systemd-based
initrd and trying to run haveged to have some good entropy to regenerate
ssh keys for theis ssh server or whatelse, will be hit.

> And as good/usable as before upstream commit [1]..., only possible improvement
> would be to error out (with an early and meaningful error message) in case not
> started with absolute path and in case getauxval() is not available (instead of
> error out later with with some unusual path/executable name in the error message)
> and remove the redundant forcibly set of path[0]?

I have no idea what would be the best course of actions that upstream
would see fit.

But, if the program is started without an absolute path, then most
probably re-running argv[0] will also resolve it to the same program:

  - if the program was run as 'haveged', it was (most probably) found in
    $PATH, and so re-running argv[0] would yield the same;

  - if the priogram was run as './haveged' (e.g. during development on
    the developers machine), then again, re-running argv[0] should again
    yeld the same.

So I am not sure what this is supposed to attempt. I may have missed
something, though, so upstream should really find a proper fix... Seeing
that upstream is getting for a new relase, we should at the very least
inform them about this issue. Will you do that, or do you want me to do
it?

In the mean time, I am totally OK with making haveged unavailable on
uClibc...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
