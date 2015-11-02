From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 2 Nov 2015 18:33:57 +0100
Subject: [Buildroot] [PATCH 0/4 RFC] xorg: fix installation paths
 (branch yem/xorg)
In-Reply-To: <20151102181902.33e379e9@gmx.net>
References: <cover.1446416019.git.yann.morin.1998@free.fr>
 <20151102003607.1fa9f695@gmx.net>
 <56373D19.6080303@zacarias.com.ar>
 <20151102181902.33e379e9@gmx.net>
Message-ID: <20151102173357.GA3935@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter?, Gustavo, Thomas, All,

Peter K. and Thomas: we urgently need input from you on the topic...

On 2015-11-02 18:19 +0100, Peter Seiderer spake thusly:
> On Mon, 2 Nov 2015 07:38:17 -0300, Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:
> > On 01/11/15 20:36, Peter Seiderer wrote:
> > >> The new pkconf bumped in d7f6d320 introduced a change in behaviour: all
> > >> path variables returned by pkgconf are now prefixed with the sysroot
> > >> directory.
> > >>
> > >
> > > ...this commit breaks some other packages too, see [1] for libv4l example.
> > >
> > > This commit removed a patch named '0002-fix-double-sysroot.patch', I think
> > > this patch should somehow be forward ported to the new pkconf packet...
> > >
> > > Regards,
> > > Peter
> > 
> > Hi Peter.
> > That's wrong, double-sysroot is natively removed by the newer versions 
> > of pkgconf, if you have this:
> > 
> > ./usr/lib/pkgconfig/libxslt.pc:Libs: -L${libdir} -lxslt  -lxml2 
> > -L/home/gustavoz/b/midx11/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib 
> > -lz -lm -ldl -lm
> > 
> > And do this:
> > 
> > $ ./pkg-config --libs libxslt
> > -L/home/gustavoz/b/midx11/output/host/usr/x86_64-buildroot-linux-gnu/sysroot/usr/lib 
> > -lxslt  -lz -ldl -lm -lxml2
> > 
> > The output is as expected.
> > 
> 
> But not correct for Qt, eg. for 'moc' while building lib4l, see eg. [1]:
> 
> Build statistics for 2015-11-01
> ===============================
> [...]
>     mips64el |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/4ecf6d074a608a58d56e3567727028c0ca8dbe2b/
>      powerpc |                   libv4l-1.8.1 | NOK | http://autobuild.buildroot.net/results/d5198d50c2df194138aaf72a1b90bd8d2e272ea1/
> [...]
> 
> Both fail with a wrong path for moc (not double sysroot but one time sysroot is one to much):
> 
> /bin/bash: /home/buildroot/buildroot-test/scripts/instance-1/output/host/usr/mips64el-buildroot-linux-gnu/sysroot/home/buildroot/buildroot-test/scripts/instance-1/output/host/usr/bin/moc: No such file or directory
> /bin/sh: /home/buildroot/build/instance-0/output/host/usr/powerpc-buildroot-linux-uclibc/sysroot/home/buildroot/build/instance-0/output/host/usr/bin/moc: No such file or directory
> Makefile:1154: recipe for target 'moc_qv4l2.cpp' failed

Indeed, the build is utterly broken *today* for the whole Xorg stack, as
well as any package using Qt.

We must find a solution ASAP, since we'r enearing -rc1 (already two days
late., BTW).

The simplest solution in my opinion is to:
  - revert d7f6d320
  - add a post-staging-install action to remove comments from .pc files
    (to at least fix the nettle problem.

Yet, we'd still have the sdkdir and mapdir issue for the Xorg and
fontutil stuff, but my series addresses the issue.

Peter K., Thoms, we need your input on this.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
