From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Mar 2014 17:10:08 +0100
Subject: [Buildroot] Segmentation fault while trying to remote debug
 with GDB and GDBServer
In-Reply-To: <99f27349e290444ba06497af087cb0d8@DBXPR07MB142.eurprd07.prod.outlook.com>
References: <51ef4c3ec6f84eab802c23a14ecb48ae@DBXPR07MB142.eurprd07.prod.outlook.com>
 <20140302070650.GE3874@tarshish>
 <24eee2c96f804b55ae7767734d5a4f6e@DBXPR07MB142.eurprd07.prod.outlook.com>
 <20140302091205.GF3874@tarshish>
 <29f88dd2071c483bb7102687088ac6b3@DBXPR07MB142.eurprd07.prod.outlook.com>
 <20140302122406.GJ3874@tarshish>
 <99f27349e290444ba06497af087cb0d8@DBXPR07MB142.eurprd07.prod.outlook.com>
Message-ID: <20140302171008.2014a1e0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Oded Hanson,

(Adding M?lanie Bats in Cc, since she is responsible for the Eclipse
plugin development)

On Sun, 2 Mar 2014 12:44:23 +0000, Oded Hanson wrote:

> For the completeness of the answer, I will add, that in eclipse plugin you can set the GDB command file. Pointing to a file with the set sysroot command in it, solves the issue also in eclipse and I can debug now from eclipse.
> 
> I guess this should be fixed in the eclipse plugin setup.

The Eclipse plugin does set the solib-path (see
https://github.com/mbats/eclipse-buildroot-toolchain-plugin/blob/master/org.buildroot.cdt.toolchain/src/org/buildroot/cdt/toolchain/BuildrootLaunchConfigurationTabGroup.java#L70),
but that is apparently insufficient for gdb to find the correct dynamic
linker, especially when the host and target architectures are identical.

Since there is apparently no way in Eclipse to set a gdb sysroot, I
believe the only solution is for the Eclipse plugin to generate a
simple gdbinit file:

set sysroot /path/to/staging/directory

and then instruct Eclipse to use it.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
