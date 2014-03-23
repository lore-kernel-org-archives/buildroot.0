From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Mar 2014 22:07:09 +0100
Subject: [Buildroot] Segmentation fault while trying to remote debug
 with GDB and GDBServer
In-Reply-To: <5316C73C.3090804@mind.be>
References: <51ef4c3ec6f84eab802c23a14ecb48ae@DBXPR07MB142.eurprd07.prod.outlook.com>
 <20140302070650.GE3874@tarshish>
 <24eee2c96f804b55ae7767734d5a4f6e@DBXPR07MB142.eurprd07.prod.outlook.com>
 <20140302091205.GF3874@tarshish>
 <29f88dd2071c483bb7102687088ac6b3@DBXPR07MB142.eurprd07.prod.outlook.com>
 <20140302122406.GJ3874@tarshish>
 <99f27349e290444ba06497af087cb0d8@DBXPR07MB142.eurprd07.prod.outlook.com>
 <20140302171008.2014a1e0@skate> <20140302172058.5d9a49e1@skate>
 <5316C73C.3090804@mind.be>
Message-ID: <20140323220709.2e1c4d6f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 05 Mar 2014 07:42:04 +0100, Arnout Vandecappelle wrote:

> > On Sun, 2 Mar 2014 17:10:08 +0100, Thomas Petazzoni wrote:
> > 
> >> The Eclipse plugin does set the solib-path (see
> >> https://github.com/mbats/eclipse-buildroot-toolchain-plugin/blob/master/org.buildroot.cdt.toolchain/src/org/buildroot/cdt/toolchain/BuildrootLaunchConfigurationTabGroup.java#L70),
> >> but that is apparently insufficient for gdb to find the correct dynamic
> >> linker, especially when the host and target architectures are identical.
> >>
> >> Since there is apparently no way in Eclipse to set a gdb sysroot, I
> >> believe the only solution is for the Eclipse plugin to generate a
> >> simple gdbinit file:
> >>
> >> set sysroot /path/to/staging/directory
> >>
> >> and then instruct Eclipse to use it.
> > 
> > Or now that I think of it, maybe Buildroot should itself generate this
> > gdbinit file. It may be useful even for users not using Eclipse.
> 
>  Even better: buildroot should generate a wrapper (yet another one!) that
> passes -ex 'set sysroot ...' when calling cross-gdb.

Except that as of today, we don't generate any wrapper for the case of
the internal toolchain, while this particular "set sysroot ..." thing
is useful for both internal and external toolchains.

Do we want to switch to use wrappers for the internal toolchain as
well? This would mean that it can no longer be simply installed into
$(HOST_DIR)/usr. To be honest, I'm not sure we want to do make this
change.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
