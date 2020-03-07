From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 7 Mar 2020 23:32:40 +0100
Subject: [Buildroot] [PATCH v1 1/3] package/liboping: add patch to fix
 gcc-8/gcc-9 snprintf truncation compile failure
In-Reply-To: <20200307230852.51ac63d9@windsurf.home>
References: <20200306201022.22382-1-ps.report@gmx.net>
 <20200307230852.51ac63d9@windsurf.home>
Message-ID: <20200307233240.1cbf0cd4@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sat, 7 Mar 2020 23:08:52 +0100, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Hello Peter,
> 
> On Fri,  6 Mar 2020 21:10:20 +0100
> Peter Seiderer <ps.report@gmx.net> wrote:
> 
> > Add patch from upstream merge request ([1]) to fix fix gcc-8/gcc-9 snprintf
> > truncation related compile failure (-Wall/-Werror), reported on the
> > mailing list ([2]).
> > 
> > Fixes:
> > 
> >   liboping.c: In function ?ping_set_ttl?:
> >   liboping.c:207:9: error: ?%s? directive output may be truncated writing up to 255 bytes into a region of size 242 [-Werror=format-truncation=]
> >     207 |    "%s: %s", function, message);
> >         |         ^~
> > 
> > [1] https://github.com/octo/liboping/pull/50
> > [2] http://lists.busybox.net/pipermail/buildroot/2020-March/275861.html
> > 
> > Reported-by: Maik Brenke <Maik.Brenke@continental-corporation.com>
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>  
> 
> This build issue has happened once in the autobuilders:
> 
>   http://autobuild.buildroot.net/results/b12/b12d86388b495a96194e0bcbb5c19a4e35cbc53d/build-end.log
> 
> But liboping has been built successfully zillions of times:
> 
>   http://autobuild.buildroot.net/index.php?symbols%5BBR2_PACKAGE_LIBOPING%5D=y
> 
> Why is it that we don't see this build failure ?

Don't know...but could reproduce it with the buildroot toolchain for
raspberry pi and gcc-9.2.0 and the original reporter used fs-toolchain-8.3-armv7ahf
(maybe a gcc-8.3 one)?

> 
> Also, this build failure was reported at
> https://github.com/octo/liboping/issues/38, and the upstream developer
> says it has been fixed by
> https://github.com/octo/liboping/commit/18ca43507b351f339ff23062541ee8d58e813a53,
> which is different from your patch.

This patch is part of buildroot since commit [3]...,
and fixes it at location line 1636ff, the new patch fixes a similar failure,
but not the same... at line 203ff...

> 
> Could you clarify this ?
> 

Maybe ;-)

Regards,
Peter

[3] https://git.buildroot.net/buildroot/commit/?id=8361c53eac06a8a96fd029e31ca7119e218e1e3e

> Thomas
