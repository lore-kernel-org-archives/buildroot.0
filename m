From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Nov 2017 09:46:30 +0100
Subject: [Buildroot] BR2_REPRODUCIBLE issues
In-Reply-To: <5c52008b-1ffa-7260-8681-5abeecd09665@mind.be>
References: <1509720041684-0.post@n4.nabble.com>
 <87y3nn3yq6.fsf@dell.be.48ers.dk>
 <5c52008b-1ffa-7260-8681-5abeecd09665@mind.be>
Message-ID: <20171105084630.GF2996@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2017-11-04 20:53 +0100, Arnout Vandecappelle spake thusly:
> On 03-11-17 21:15, Peter Korsgaard wrote:
> >>>>>> "Einar" == Einar J?n Gunnarsson <tolvupostur@gmail.com> writes:
> > 
> >  > Hello all.
> >  > I've been using BR2_REPRODUCIBLE, and it mostly works.
> > 
> >  > But when it is using a git repo, I have the following issues with creating
> >  > SOURCE_DATE_EPOCH:
> >  > 1) It uses $(GIT), but the GIT variable is only defined in line 487:
> >  > "include package/Makefile.in".
> >  > Note that this is done around line 250 in $(TOPDIR)/Makefile, so sometimes
> >  > $(GIT) is unset then getting BR2_VERSION_GIT_EPOCH
> > 
> > What make version (and buildroot version) are you using? It works here:
> > 
> > strace -s 100 -f -e execve make BR2_REPRODUCIBLE=y printvars VARS=SOURCE_DATE_EPOCH 2>&1 | grep log
> > [pid  9504] execve("/bin/bash", ["/bin/bash", "-c", "GIT_DIR=/home/peko/source/buildroot/.git git log -1 --format=%at"], [/* 46 vars */]) = 0
> > [pid  9504] execve("/usr/bin/git", ["git", "log", "-1", "--format=%at"], [/* 47 vars */]) = 0
> > [pid  9505] execve("/bin/bash", ["/bin/bash", "-c", "GIT_DIR=/home/peko/source/buildroot/.git git log -1 --format=%at"], [/* 46 vars */]) = 0
> > [pid  9505] execve("/usr/bin/git", ["git", "log", "-1", "--format=%at"], [/* 47 vars */]) = 0
> > 
> > It uses the BR2_GIT setting, E.G.:
> > 
> > strace -s 100 -f -e execve make BR2_REPRODUCIBLE=y printvars VARS=SOURCE_DATE_EPOCH BR2_GIT=foot 2>&1 | grep log
> > [pid  9880] execve("/bin/bash", ["/bin/bash", "-c", "GIT_DIR=/home/peko/source/buildroot/.git foot log -1 --format=%at"], [/* 46 vars */]) = 0
> > [pid  9881] execve("/bin/bash", ["/bin/bash", "-c", "GIT_DIR=/home/peko/source/buildroot/.git foot log -1 --format=%at"], [/* 46 vars */]) = 0
> > 
> > This is with current master and make 4.1.
> 
>  But not when there is no .config file:
> 
> $ make O=/tmp/brtest BR2_REPRODUCIBLE=y printvars VARS=SOURCE_DATE_EPOCH
> /bin/sh: log: command not found
> SOURCE_DATE_EPOCH=
> /bin/sh: log: command not found

Uh? Why you want to do that?

> $ make O=/tmp/brtest BR2_REPRODUCIBLE=y printvars VARS=SOURCE_DATE_EPOCH GIT=git
> SOURCE_DATE_EPOCH=1509720578

If anything, SOURCE_DATE_EPOCH should come from the environment, as
specified in the spec (see below).

>  Solution: move the GIT definition to top-level Makefile.

That would not solve anything, because it is still defined from BR2_GIT
that comes... from .config .

> >> 2) It always uses the last git commit to calculate the date. So any commit
> >  > changes the timestamp, while the non-git timestamp stays the same.
> >  > This makes the whole thing almost useless.
> >  > If the git log command could take a parameter, you could make reproducible
> >  > builds based on e.g. tag 2017.08, which would be much more useful.
> > 
> > Well, SOURCE_DATE_EPOCH is meant to refer to the date of the last source
> > code change rather than the build time (E.G. so repeated builds of the
> > same sources would give the same results, but builds of changed sources
> > would return a newer timestamp).
> >
> > So I don't really agree that it useless. What we could perhaps do is to
> > only export our value for SOURCE_DATE_EPOCH if not already set in the
> > enviroment, so you can set it outside Buildroot if you want a different
> > behaviour.
> 
>  Well, the proposed solution of using a config variable sounds OK. Only, I think
> it would make more sense to have a config variable with a date, rather than a
> commit ID.

Or let the user define SOURCE_DATE_EPOCH in the environment, as this is
what would be used and is how SOURCE_DATE_EPOCH is specified;
    https://reproducible-builds.org/specs/source-date-epoch/

    Build systems MUST NOT overwrite this variable for child processes
    to consume if it is already present.

I still fail to see what is wrong with the current situation...

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
> 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
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
