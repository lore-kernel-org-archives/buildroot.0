From: Srinivasan R <Srinivasanr@lantronix.com>
Date: Tue, 14 Apr 2015 18:25:49 +0000
Subject: [Buildroot] wide-dhcpv6 crash when built in buildroot version
	2014.05 using a cross toolchain arm-buildroot-linux-gnueabihf
	with gcc version 4.8.3
Message-ID: <620A1A0EF5A8FD49AAB6076B610B85DD45C34E42@LTX-EXCH03.int.lantronix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,
I am using the latest version of buildroot (2014.05) for my project, I happen to port the wide-dhcpv6 package which I had in the previous version(buildroot-2010.05) to the current buildroot version(2014.05).

The wide-dhcpv6 in buildroot version(2014.05) is working good with the toolcahain "arm-none-linux-gnueabi" using the gcc version "4.3.3", when I port this package in to the latest version, initially I got the below build error.
Please note the current version used is "buildroot version 2014.05 using a cross toolchain arm-buildroot-linux-gnueabihf with gcc version 4.8.3"

In file included from dhcp6c.c:75:0:
./common.h:158:13: error: conflicting types for ?dprintf?
extern void dprintf __P((int, const char *, const char *, ...));

I browsed the net and added the line "cd $(WIDE_DHCPV6_DIR); perl -pi -e "s/dprintf/debug_printf/g" *.c *.h *.l;" in my "wide-dhcpv6.mk", with this fix I could able to generate the binary (dhcp6c) successfully.

When I run the binary (dhcp6c) in the board Atmel series, it gives me the segmentation fault.The application crashes even much before the main() function hits.

I used the gdb server to debug it the application, and I found that the "dhcp6c" crashes in the file "lex.yy.c" in the function yy_get_previous_state(). below is the stepping in to the function and crash output.
"(gdb) target remote 192.168.1.53:3646
Remote debugging using 192.168.1.53:3646
yy_get_previous_state () at lex.yy.c:1994
warning: Source file is more recent than executable.
1994 yy_current_state = (yy_start);
(gdb) b main
Breakpoint 1 at 0x8a0c: file dhcp6c.c, line 159.
(gdb) n
1990 {
(gdb)
1996 for ( yy_cp = (yytext_ptr) + YY_MORE_ADJ; yy_cp < (yy_c_buf_p); ++yy_cp )
(gdb)
2004 while ( yy_chk[yy_base[yy_current_state] + yy_c] != yy_current_state )
(gdb)
1996 for ( yy_cp = (yytext_ptr) + YY_MORE_ADJ; yy_cp < (yy_c_buf_p); ++yy_cp )
(gdb)
2014 }
(gdb)
yy_get_previous_state () at lex.yy.c:2014
2014 }
Could not insert single-step breakpoint at 0x0
(gdb)
yy_get_previous_state () at lex.yy.c:2014
2014 }
Could not insert single-step breakpoint@0x0
(gdb) c
Continuing.

Program received signal SIGSEGV, Segmentation fault.
0x00000000 in ?? ()
(gdb) bt
#0 0x00000000 in ?? ()
#1 0x00000000 in ?? ()
(gdb) "
Since it crashes in lexical analyzer, I have no clue how to debug this issue, and I strongly have a belief that the problem might be related to toolchain. Also since my project deliveries are nearing I don't have much time to investigate this issue, can anybody help me to resolve this issue. Attached is my make file "wide-dhcpv6.mk" and build output log "wide-dhcpv6-20080615/config.log"

I believe the attached log file and the make file will have all the necessary information about the toolchain used and the configurations/rules used to built the application for your first level diagnostic. if any additional information is required I am could able to provide you very promptly.

Thanks in advance for help.

Regards,
Srini.
 
**********************************************************************
This e-mail is the property of Lantronix. It is intended only for the person or entity to which it is addressed and may contain information that is privileged, confidential, or otherwise protected from disclosure. Distribution or copying of this e-mail, or the information contained herein, to anyone other than the intended recipient is prohibited.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: wide-dhcpv6.mk
Type: text/x-makefile
Size: 2350 bytes
Desc: wide-dhcpv6.mk
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150414/fb329af3/attachment.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config.log
Type: text/x-log
Size: 45385 bytes
Desc: config.log
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150414/fb329af3/attachment-0001.bin>
