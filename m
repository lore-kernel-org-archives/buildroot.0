From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
Date: Thu, 12 Jan 2012 18:46:32 +0100
Subject: [Buildroot] gettext do not work with external toolchain 2009q1
Message-ID: <4F0F1C78.6040304@sensortherm.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

the following program works on the developing host, but not on the 
target. The target is an arm ti dm365 processor (leopardboard). I use 
buildroot 2011.11 with external toolchain (Sourcery CodeBench ARM 2009q1).

Buildroot:
No option for wchar, gettext, libintl

Busybox:

[*] Enable locale support (system needs locale for this to work)
[*] Support Unicode
  [ ]   Use libc routines for Unicode (else uses internal ones)
  [*]   Check $LANG environment variable


Thanks.

Regards,

Klaus

////////////////////////////////////////////////////////////////////////
#include <libintl.h>
#include <locale.h>
#include <stdio.h>
#include <stdlib.h>

#define DE 	"de"
int main(void)
{

	bindtextdomain( "videostream", "/usr/lib/locale" );
	textdomain( "videostream" );

	setlocale( LC_ALL, "" );
	setenv("LANG", DE, 1);
	setenv("LANGUAGE", DE, 1);
	setenv("LC_MESSAGES", DE, 1);

	setlocale(LC_ALL, DE);
	setlocale(LC_MESSAGES, DE);

	printf( gettext( "German" ) );
	exit(0);
}




////////////////////////////////////////////////////////////////////////



# strace /i18
execve("/i18", ["/i18"], [/* 17 vars */]) = 0
brk(0)                                  = 0x11000
uname({sys="Linux", node="buildroot", ...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 
0) = 0x4001d000
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or 
directory)
open("/etc/ld.so.cache", O_RDONLY)      = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=2133, ...}) = 0
mmap2(NULL, 2133, PROT_READ, MAP_PRIVATE, 3, 0) = 0x4001e000
close(3)                                = 0
open("/lib/libgcc_s.so.1", O_RDONLY)    = 3
read(3, 
"\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0x'\0\0004\0\0\0"..., 512) 
= 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=48472, ...}) = 0
mmap2(NULL, 79984, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) 
= 0x40026000
mprotect(0x40032000, 28672, PROT_NONE)  = 0
mmap2(0x40039000, 4096, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xb) = 0x40039000
close(3)                                = 0
open("/lib/libc.so.6", O_RDONLY)        = 3
read(3, 
"\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0\240Q\1\0004\0\0\0"..., 
512) = 512
fstat64(3, {st_mode=S_IFREG|0755, st_size=1181092, ...}) = 0
mmap2(NULL, 1217096, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3, 
0) = 0x4003a000
mprotect(0x40157000, 28672, PROT_NONE)  = 0
mmap2(0x4015e000, 12288, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x11c) = 0x4015e000
mmap2(0x40161000, 8776, PROT_READ|PROT_WRITE, 
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x40161000
close(3)                                = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 
0) = 0x4001f000
set_tls(0x4001f4a0, 0x4001fb70, 0x4002567c, 0x4001fb78, 0x40025050) = 0
mprotect(0x4015e000, 8192, PROT_READ)   = 0
mprotect(0x40024000, 4096, PROT_READ)   = 0
munmap(0x4001e000, 2133)                = 0
brk(0)                                  = 0x11000
brk(0x32000)                            = 0x32000
open("/usr/lib/locale/locale-archive", O_RDONLY|O_LARGEFILE) = -1 ENOENT 
(No such file or directory)
open("/usr/share/locale/locale.alias", O_RDONLY) = -1 ENOENT (No such 
file or directory)
open("/usr/lib/locale/de/LC_IDENTIFICATION", O_RDONLY) = -1 ENOENT (No 
such file or directory)
open("/usr/lib/locale/de/LC_MESSAGES", O_RDONLY) = 3
fstat64(3, {st_mode=S_IFDIR|0777, st_size=4096, ...}) = 0
close(3)                                = 0
open("/usr/lib/locale/de/LC_MESSAGES/SYS_LC_MESSAGES", O_RDONLY) = -1 
ENOENT (No such file or directory)
fstat64(1, {st_mode=S_IFCHR|0600, st_rdev=makedev(4, 64), ...}) = 0
ioctl(1, SNDCTL_TMR_TIMEBASE or TCGETS, {B115200 opost isig icanon echo 
...}) = 0
mmap2(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 
0) = 0x4001e000
write(1, "German", 6German)                   = 6
exit_group(0)                           = ?
