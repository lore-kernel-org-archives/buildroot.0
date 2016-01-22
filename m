From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 23 Jan 2016 00:19:36 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20160122102957.10f29956@free-electrons.com>
References: <20160122073021.E35B6101A27@stock.ovh.net>
 <20160122102957.10f29956@free-electrons.com>
Message-ID: <56A2B908.2000801@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 22/01/2016 10:29, Thomas Petazzoni a ?crit :
> Hello,
> 
> Gustavo, Carsten, Frank, Vicente, Alan, Romain, Bernd, Thomas, Peter,
> Max, Joao, Maxime, Sonic, Simon, Waldemar, please see below, there are
> some questions for you. Thanks!
> 
> On Fri, 22 Jan 2016 08:30:21 +0100 (CET), Thomas Petazzoni wrote:

>>          arm |                host-efl-1.15.3 | NOK | http://autobuild.buildroot.net/results/e178371c2c3bf42d59c6fc26409e098081239ccb/
> 
> lib/evas/filters/evas_filter_parser.c: In function '_lua_backtrace':
> lib/evas/filters/evas_filter_parser.c:2434:20: error: 'LUA_GLOBALSINDEX' undeclared (first use in this function)
>     lua_getfield(L, LUA_GLOBALSINDEX, "debug");
> 
> Romain ? This is host-efl, maybe we need to disable Lua support or
> something ?

It's a lua 5.1 vs 5.2 and 5.3 issue.

It's a complete mess because there is an uptream patch [1] that try to fixes the
build issue, but not completely.

The build fail with the following error due to compatibility mode in lua
(LUA_COMPAT_ALL and LUA_COMPAT_5_1):

lib/evas/.libs/libevas.so: undefined reference to `luaL_openlib'
collect2: error: ld returned 1 exit status

Also the patch break the build for lua 5.1...
So, I think it's safe to add a dependency on lua 5.1 and report the problem
upstream.

[1]
https://git.enlightenment.org/core/efl.git/commit/?id=6124d0733657e425001ce51f526aea3bb8dc54e7

> 
>> microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/d35f6ee7643a695af7db3739ff480d25b99ee051/
>> microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/09f4a89e463b6ccbca01cce1d38eb849c17ed6e1/
> 
> The documentation issue. Romain, you looked into this a while ago, why
> does it pop up again on Microblaze specifically ?

I think this build failure is here since we SED into the Makefile to remove the
documentation.

But I gave up on the patch for upstream...

> 
> Maybe we can switch to the mainline gdb for Microblaze ?
> 

Why not. The latest gdb version was 7.5.1 when gdb for Microblaze was added to
Buildroot. Now we have at least 7.7.x.

> 
>>        nios2 |           imagemagick-6.9.2-10 | NOK | http://autobuild.buildroot.net/results/0bf3a2a284b7d4712ab1530562d3b8164fc75e88/
> 
> The usual:
> 
>   assertion fail elf32-nios2.c:1038
> 
> This is being fixed at
> https://sourceware.org/bugzilla/show_bug.cgi?id=19405. In the mean
> time, we could disable on NIOS II maybe ?

Yes maybe.

> 
>>        nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/183df75a853c3b0e2617c9219a356c5531aa523d/
> 
> Will be fixed once we bump to binutils 2.26. Romain, maybe we should
> disable libcap-ng in the mean time ?

binutils 2.26 should be released in a few days, hopefully.

> 
>>        nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/aa1492777c5f60ab45921618f64910ca4d048e5f/
>>        nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/a74810f0fce398c41fef11b8e2b8e1a52ffdb46a/
>>        nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/cb70d195cf9b9b5ae09b83a40ef767cc8f699a9c/
> 
> Toolchain issues. Being fixed in upstream gcc, but we should disable
> with external NIOS2 toolchain anyway.
> 
> Romain ?

This patch should be fine:
http://patchwork.ozlabs.org/patch/561414/

Best regards,
Romain

> 
> Thomas
> 
