From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 9 Mar 2012 10:04:46 +0100
Subject: [Buildroot] [PATCH 13/13] package: move autotools specific
 stuff to pkg-autotargets.mk
In-Reply-To: <20120309085538.36678360@skate>
References: <cover.1331148806.git.thomas.petazzoni@free-electrons.com>
 <91711f9a8cd03a56455ba4516aaf235d90601d53.1331148806.git.thomas.petazzoni@free-electrons.com>
 <CAAXf6LU8ecs39yEpH7ZoRbtxTS2-Cj+uuow-yexJSYvP1hzOwA@mail.gmail.com>
 <20120309085538.36678360@skate>
Message-ID: <CAAXf6LVOAwR+LZf89HqrhFBZBWh3HFnj2FXxL+GBgB_ydgC-2Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 9, 2012 at 8:55 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> Le Fri, 9 Mar 2012 08:01:54 +0100,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
>
>> Ok for the BR2_AC_BV_... move.
>>
>> The last defines like DISABLE_NLS, DISABLE_LARGEFILES, ... are
>> sometimes used outside of autotargets, e.g. in
>> ./toolchain/gcc/gcc-uclibc-4.x.mk, toolchain/gdb/gdb.mk,
>> ./package/newt/newt.mk.
>>
>> I'm not sure if it's a good idea to move them, based on that
>> observation.
>
> Yes, I agree that this patch can definitely be discussed. I am not
> totally sure myself that it is a good idea.
>
> In the same way, the TARGET_CONFIGURE_OPTS, HOST_CONFIGURE_OPTS,
> TARGET_MAKE_ENV and HOST_MAKE_ENV are somewhat specific to autotools,
> but in fact used in many other locations as well.
>
> In general, my goal is to cut down on the size, complexity and messiness
> of /Makefile and /package/Makefile.in. Suggestions are welcome.

We could create one file for target options/defines/... and one for
host options/defines, or one file for both.
These could contain the following variables from both Makefile as
package/Makefile.in:

TARGET_CONFIGURE_OPTS, HOST_CONFIGURE_OPTS, TARGET_MAKE_ENV, HOST_MAKE_ENV
DISABLE_x, ENABLE_x
HOST_xFLAGS
HOST<tool>
TARGET_xFLAGS
TARGET_<tool>

Then, the 'strategy' is that:
- Makefile handles the top-level targets, the help, and config stuff
- Makefile.in will be almost empty. Currently it still contains the
strip stuff, the tool locations for install/sed/flex/bison and the
definition of MAKE/HOSTMAKE. We may keep this file or rename it.
- pkg-xtargets.mk contains the rules for the specific build infrastructure
- pkg-download.mk, pkg-utility.mk, and the new file with target/host
defines cover each a specific part of the build process.

Best regards,
Thomas
