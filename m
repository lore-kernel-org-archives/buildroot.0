From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Date: Tue, 05 Aug 2008 11:15:58 +0200
Subject: [Buildroot] C double type problem - at91sam9263
In-Reply-To: <48980FD8.1060406@cetrtapot.si>
References: <223E6519BDCAC74695BEE9D163F8E6592306E8@oakleaf10.oakleafconsultancy.com>	<48970F48.9020104@cetrtapot.si>	<408540dd0808041427x493ba179j78d111b5dcaa30e1@mail.gmail.com>
	<48980FD8.1060406@cetrtapot.si>
Message-ID: <48981A4E.5010909@cetrtapot.si>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hinko Kocevar wrote:

> 
> But what about i386 toolchain with uClibc and locale enabled? It seem to work in my case.. I'll redo the test with clean buildroot just to be sure.
> 

As stated above - i386 + uClibc 0.9.29 locale works fine when dealing with floats and date output is fine too.
Tested inside the chrooted busybox environment with:

$ /tmp/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-gcc -static -O0 -ggdb3 test.c -o float.i386
$ cat test.c 
#include <stdio.h>
#include <string.h>

int main (int argc, char *argv[])
{
	double test;
	test = 1.0;
	fprintf(stderr, "Test double = %f.\n", test);
	
	test /= 100;
	fprintf(stderr, "Test double = %f.\n", test);

	test = 10;
	fprintf(stderr, "Test double = %f.\n", test);

	while (test)
	{
		fprintf(stderr, "Test double = %f.\n", test);
		test -= 2;
	}

	return 0;
}
$ sudo chroot ./root /bin/sh
/ $ ./float.i386 
Test double = 1.000000.
Test double = 0.010000.
Test double = 10.000000.
Test double = 10.000000.
Test double = 8.000000.
Test double = 6.000000.
Test double = 4.000000.
Test double = 2.000000.

/ $ set
HISTFILE='/home/hinkok/.ash_history'
HOME='/home/hinkok'
IFS=' 	
'
LOGNAME='root'
PATH='/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:/opt/bin'
PPID='25055'
PS1='\w \$ '
PS2='> '
PS4='+ '
PWD='/'
SHELL='/bin/bash'
SUDO_COMMAND='/bin/chroot ./root /bin/sh'
SUDO_GID='1000'
SUDO_UID='1000'
SUDO_USER='hinkok'
TERM='xterm'
USER='root'
_='./float.i386'




Maybe is the pregenerated locale data that is causing problems?? I'll test with own homebuilt locale data instead ..

Regards,
Hinko

-- 
?ETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar at cetrtapot.si
Http: www.cetrtapot.si

-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: br2.config
Url: http://busybox.net/lists/buildroot/attachments/20080805/7f0d2514/attachment-0002.txt 
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: uClibc.config
Url: http://busybox.net/lists/buildroot/attachments/20080805/7f0d2514/attachment-0003.txt 
