From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  4 May 2009 09:39:09 +0000 (UTC)
Subject: [Buildroot] [Bug 313] New: mconf segmentation fault when selecting
 X Window System Server and !BR2_USE_WCHAR
Message-ID: <bug-313-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=313

           Summary: mconf segmentation fault when selecting X Window System
                    Server and !BR2_USE_WCHAR
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: spambox at nurd.se
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Buildroot version: v2009.02
Distributor ID: Ubuntu
Description:    Ubuntu 8.10
Release:        8.10
Codename:       intrepid
Running on x86 32bit Intel P4

Steps to reproduce:

$ tar xjf ../buildroot-2009.02.tar.bz2
$ cd buildroot-2009.02/
$ make menuconfig

Do the following selections:
Package Selection for the target  --->
Graphic libraries and applications (graphic/text)  --->
X Window System server (none)  --->

Select xorg or tinyx
This results in a segmentation fault

---------------------------- SNIP ----------------------------
/bin/sh: line 4: 20924 Segmentation fault     
KCONFIG_AUTOCONFIG=package/config/buildroot-config/auto.conf
KCONFIG_AUTOHEADER=package/config/buildroot-config/autoconf.h
package/config/mconf Config.in


Program received signal SIGSEGV, Segmentation fault
sym_set_tristate_value (sym=0x0, val=yes) at lkc.h:116
116             return sym->curr.tri;

(gdb) bt
#0  sym_set_tristate_value (sym=0x0, val=yes) at lkc.h:116
#1  0x0804b170 in conf (menu=0x9d6d338) at mconf.c:790
#2  0x0804af7e in conf (menu=0x9d33540) at mconf.c:718
#3  0x0804af7e in conf (menu=0x8066520) at mconf.c:718
#4  0x0804b3d5 in main (ac=Cannot access memory at address 0x0
) at mconf.c:932

114     static inline tristate sym_get_tristate_value(struct symbol *sym)
115     {
116             return sym->curr.tri;
117     }

---------------------------- SNIP ----------------------------


I have not checked if this problem exists upstream


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
