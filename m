From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Mar 2018 17:15:30 +0100
Subject: [Buildroot] [PATCH 2/2] core/instrumentation: shave minutes off
 the build time
In-Reply-To: <87muz5fp2n.fsf@dell.be.48ers.dk>
References: <cover.1521146096.git.yann.morin.1998@free.fr>
 <6a793a6dba4f052ca8bbc35edd63df601f46478b.1521146096.git.yann.morin.1998@free.fr>
 <87muz5fp2n.fsf@dell.be.48ers.dk>
Message-ID: <20180318161530.GA2478@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2018-03-18 15:14 +0100, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  > As part of the build, we run some instrumentation hooks to gather
>  > statistics about the usage of the target/, staging/ and host/
>  > directories, so that we can generate reports for the user, that
>  > shows:
>  >   - for each file, what package installed it,
>  >   - for each package,the size that it installed.
[--SNIP--]
>  > So, we switch to using mtime, because in the end that's still good-enough
>  > for our use-case: generating some graphs. It is not mission-critical, and
>  > if a graph is slightly off, that's not biggy. It can anyway be attributed
>  > to a broken package's buildsystem, which should get fixed.
>  >   - /foo/bar/ exists
>  >   - a package installs /foo/bar/buz
>  >   - mtime of /foo/bar/ is changed to account for the nex file in it.
> 
> Playing around with this, I noticed two other issues:
> 
> - It doesn't work for packages using rsync to install,
>   E.G. skeleton-init-common as rsync also sets the mtime to match the
>   source files

We could maybe tell rsycn not to do that, then?

> - It breaks for <pkg>-reinstall

Well, we can't guarantee anything except with a clean build from scratch
anyway.

> I don't think either of those are really big issues compared to the huge
> slowdown, but it is worth noticing.

Well, the -reinstall was already not working correctly, because the list
pf files before/after would be alsmost the same, and the md5-diff would
miss all the laready-installed files for the package.

The rsync issue is new, but we can "fix" it in a later patch, then, for
those packages like the skeletons, by using the --no-times option for
example.

However, if a third-party package internally uses rsync as its install
method, we're screwed. But who would be insane enough to do that? ;-]

Alternatively, we could use ctime instead of mtime, maybe? Or check
both?

>  > +define step_pkg_size_inner
>  > +	cd $(2); \
>  > +	find . \( -type f -o -type L \) \
>  > +		-newer $($(PKG)_DIR)/.stamp_built \
>  > +		-exec printf '$(1),%s\n' {} + \
>  > +		>> $(BUILD_DIR)/packages-file-list$(3).txt
> 
> What find version are you using? My fileutils find (and the busybox
> applet) use 'l' for symlinks, so I've changed it to that.

Doh, the s/L/l/ is still uncomitted here. Dang...

> Committed with that fixed (and a few tweaks to the commit message),
> thanks.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
