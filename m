From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 27 Apr 2012 15:02:15 +0000 (UTC)
Subject: [Buildroot] [Bug 5150] New: iproute2 does not include the LDFLAGS
	in the mk
Message-ID: <bug-5150-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5150

           Summary: iproute2 does not include the LDFLAGS in the mk
           Product: buildroot
           Version: 2012.02
          Platform: All
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: korkakak at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


The error is the following:

/bin/sed -i -e 's/$(CCOPTS)//'
/home/user/buildroot/output/build/iproute2-2.6.39/netem/Makefile
/usr/bin/make -j8 CC="/home/user/buildroot/output/host/usr/bin/ccache
/home/user/buildroot/output/host/usr/bin/mips-linux-gnu-gcc" CCOPTS="-pipe -EL
-march=m14kc -mmcu -I/home/user/RHEA_II//linux-2.6.x -O3  -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE" -C
/home/user/buildroot/output/build/iproute2-2.6.39
make[1]: Entering directory `/home/user/buildroot/output/build/iproute2-2.6.39'
make[2]: Entering directory
`/home/user/buildroot/output/build/iproute2-2.6.39/lib'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory
`/home/user/buildroot/output/build/iproute2-2.6.39/lib'
make[2]: Entering directory
`/home/user/buildroot/output/build/iproute2-2.6.39/ip'
/home/user/buildroot/output/host/usr/bin/ccache
/home/user/buildroot/output/host/usr/bin/mips-linux-gnu-gcc -Wl,-export-dynamic
 ip.o ipaddress.o ipaddrlabel.o iproute.o iprule.o rtm_map.o iptunnel.o
ip6tunnel.o tunnel.o ipneigh.o ipntable.o iplink.o ipmaddr.o ipmonitor.o
ipmroute.o ipprefix.o iptuntap.o ipxfrm.o xfrm_state.o xfrm_policy.o
xfrm_monitor.o iplink_vlan.o link_veth.o link_gre.o iplink_can.o
iplink_macvlan.o iplink_macvtap.o ../lib/libnetlink.a ../lib/libutil.a 
-lresolv ../lib/libnetlink.a ../lib/libutil.a -ldl -o ip
/home/user/buildroot/output/host/usr/bin/ccache
/home/user/buildroot/output/host/usr/bin/mips-linux-gnu-gcc -Wl,-export-dynamic
 rtmon.o ../lib/libnetlink.a ../lib/libutil.a  -lresolv ../lib/libnetlink.a
../lib/libutil.a -ldl -o rtmon
/home/user/buildroot/output/host/usr/mipsel-unknown-linux-gnu/sysroot/soft-float/usr/lib/libresolv.so:
could not read symbols: File in wrong format
collect2: ld returned 1 exit status
make[2]: *** [rtmon] Error 1
make[2]: *** Waiting for unfinished jobs....
/home/user/buildroot/output/host/usr/mipsel-unknown-linux-gnu/sysroot/soft-float/usr/lib/libresolv.so:
could not read symbols: File in wrong format
collect2: ld returned 1 exit status
make[2]: *** [ip] Error 1

FIX:

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index dd2506c..790b891 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -35,7 +35,7 @@ endef

 define IPROUTE2_BUILD_CMDS
        $(SED) 's/$$(CCOPTS)//' $(@D)/netem/Makefile
-       $(MAKE) CC="$(TARGET_CC)" CCOPTS="$(TARGET_CFLAGS) -D_GNU_SOURCE" -C
$(@D)
+       $(MAKE) CC="$(TARGET_CC)" CCOPTS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D)
 endef

 define IPROUTE2_INSTALL_TARGET_CMDS

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
