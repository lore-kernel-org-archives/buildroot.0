From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jan 2016 09:32:09 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <56A2B908.2000801@gmail.com>
References: <20160122073021.E35B6101A27@stock.ovh.net>
 <20160122102957.10f29956@free-electrons.com>
 <56A2B908.2000801@gmail.com>
Message-ID: <20160123093209.5f0085c5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 23 Jan 2016 00:19:36 +0100, Romain Naour wrote:

> > Romain ? This is host-efl, maybe we need to disable Lua support or
> > something ?
> 
> It's a lua 5.1 vs 5.2 and 5.3 issue.
> 
> It's a complete mess because there is an uptream patch [1] that try to fixes the
> build issue, but not completely.
> 
> The build fail with the following error due to compatibility mode in lua
> (LUA_COMPAT_ALL and LUA_COMPAT_5_1):
> 
> lib/evas/.libs/libevas.so: undefined reference to `luaL_openlib'
> collect2: error: ld returned 1 exit status
> 
> Also the patch break the build for lua 5.1...
> So, I think it's safe to add a dependency on lua 5.1 and report the problem
> upstream.

So you would make the *target* EFL package depend on lua 5.1, so that
the *host* EFL package also gets built against the host Lua 5.1 ?

I guess there is no way of disabling Lua support ? :-)

So, yes, in the mean time, please add the dependency, and report the
problem upstream. BTW, did you test the  --enable-lua-old option that
is mentioned in
https://git.enlightenment.org/core/efl.git/commit/?id=6124d0733657e425001ce51f526aea3bb8dc54e7,
which you pointed ?

> >> microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/d35f6ee7643a695af7db3739ff480d25b99ee051/
> >> microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/09f4a89e463b6ccbca01cce1d38eb849c17ed6e1/
> > 
> > The documentation issue. Romain, you looked into this a while ago, why
> > does it pop up again on Microblaze specifically ?
> 
> I think this build failure is here since we SED into the Makefile to remove the
> documentation.

I don't understand. Isn't the SED precisely here to prevent the
documentation from being built ?

> But I gave up on the patch for upstream...

What was the feedback ?

> > Maybe we can switch to the mainline gdb for Microblaze ?
> 
> Why not. The latest gdb version was 7.5.1 when gdb for Microblaze was added to
> Buildroot. Now we have at least 7.7.x.

I think we should try to use the mainline gdb. We have a Microblaze
Qemu configuration, so we can at least do some basic testing here.

> > 
> >>        nios2 |           imagemagick-6.9.2-10 | NOK | http://autobuild.buildroot.net/results/0bf3a2a284b7d4712ab1530562d3b8164fc75e88/
> > 
> > The usual:
> > 
> >   assertion fail elf32-nios2.c:1038
> > 
> > This is being fixed at
> > https://sourceware.org/bugzilla/show_bug.cgi?id=19405. In the mean
> > time, we could disable on NIOS II maybe ?
> 
> Yes maybe.

Can you submit a patch ?

> >>        nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/183df75a853c3b0e2617c9219a356c5531aa523d/
> > 
> > Will be fixed once we bump to binutils 2.26. Romain, maybe we should
> > disable libcap-ng in the mean time ?
> 
> binutils 2.26 should be released in a few days, hopefully.

Ok, good.

> >>        nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/aa1492777c5f60ab45921618f64910ca4d048e5f/
> >>        nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/a74810f0fce398c41fef11b8e2b8e1a52ffdb46a/
> >>        nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/cb70d195cf9b9b5ae09b83a40ef767cc8f699a9c/
> > 
> > Toolchain issues. Being fixed in upstream gcc, but we should disable
> > with external NIOS2 toolchain anyway.
> > 
> > Romain ?
> 
> This patch should be fine:
> http://patchwork.ozlabs.org/patch/561414/

Thanks. The only thing that bothers me a bit is that we will likely
forget to remove all those "depends on BR2_nios2". But I guess we don't
really have the choice.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
