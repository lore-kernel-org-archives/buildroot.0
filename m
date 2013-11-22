From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 22 Nov 2013 06:47:01 +0000 (UTC)
Subject: [Buildroot] [Bug 6428] util-linux libmount segfaults with patch
	from buildroot
In-Reply-To: <bug-6428-163@https.bugs.busybox.net/>
References: <bug-6428-163@https.bugs.busybox.net/>
Message-ID: <20131122064701.D06D19BD8E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=6428

Daniel Mentz <daniel@exxm.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|FIXED                       |

--- Comment #2 from Daniel Mentz <daniel@exxm.de> 2013-11-22 06:47:01 UTC ---
There's still a bug in util-linux-001-sscanf-no-ms-as.patch. He got the last
"#ifdef" wrong. It should be "#ifdef HAVE_SCANF_MS_MODIFIER" instead of
"#ifndef HAVE_SCANF_MS_MODIFIER".

It crashes in mnt_parse_swaps_line() in tab_parse.c because it passes a pointer
to src instead of src itself.

Activate a swap device with swapon and then run lsblk. It crashed for me like
this:

Starting program: /bin/lsblk 

Program received signal SIGSEGV, Segmentation fault.
0xb6f47494 in strlen () from /lib/libc.so.0
(gdb) bt
#0  0xb6f47494 in strlen () from /lib/libc.so.0
#1  0xb6fa7b18 in unmangle_string (s=0x7665642f <Address 0x7665642f out of
bounds>) at ./include/mangle.h:17
#2  0xb6fa879c in mnt_parse_swaps_line (s=0xbeffe4d0 "/dev/mmcblk0p3", ' '
<repeats 26 times>, "partition\t499996\t0\t-1", fs=0x21c80)
    at libmount/src/tab_parse.c:352
#3  mnt_table_parse_next (tb=tb at entry=0x21c00, f=f at entry=0x1c744 <ncolumns>,
fs=fs at entry=0x21c80, 
    filename=0x646f6d2c <Address 0x646f6d2c out of bounds>,
filename at entry=0xb6fbb2ab "/proc/swaps", nlines=0xbefff520, 
    nlines at entry=0xbefff518) at libmount/src/tab_parse.c:459
#4  0xb6fa8db4 in mnt_table_parse_stream (tb=tb at entry=0x21c00, f=0x1c744
<ncolumns>, f at entry=0x21c28, 
    filename=filename at entry=0xb6fbb2ab "/proc/swaps") at
libmount/src/tab_parse.c:581
#5  0xb6fa922c in mnt_table_parse_file (tb=0x21c00, filename=0xb6fbb2ab
"/proc/swaps") at libmount/src/tab_parse.c:636
#6  0x0000b5cc in is_active_swap (filename=0x1f410 "/dev/mmcblk0p1") at
misc-utils/lsblk.c:350
#7  get_device_mountpoint (cxt=0xbefff6e0) at misc-utils/lsblk.c:382
#8  set_tt_data (ln=0x20508, id=<optimized out>, col=6, cxt=0xbefff6e0) at
misc-utils/lsblk.c:739
#9  print_device (cxt=cxt at entry=0xbefff6e0, tt_parent=<optimized out>) at
misc-utils/lsblk.c:963
#10 0x0000c420 in process_blkdev (cxt=0xbefff6e0, parent=0xbefff7f8,
do_partitions=<optimized out>, part_name=0x0)
    at misc-utils/lsblk.c:1190
#11 0x0000c3e4 in list_partitions (part_name=0x0, parent_cxt=0x0,
wholedisk_cxt=0xbefff7f8) at misc-utils/lsblk.c:1103
#12 process_blkdev (cxt=cxt at entry=0xbefff7f8, parent=0x0,
do_partitions=do_partitions at entry=1, part_name=0x0) at misc-utils/lsblk.c:1188
#13 0x0000c74c in iterate_block_devices () at misc-utils/lsblk.c:1215
#14 0x0000a924 in main (argc=1, argv=0x0) at misc-utils/lsblk.c:1599
(gdb)

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
