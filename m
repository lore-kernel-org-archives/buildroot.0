From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Fri, 10 Dec 2010 21:29:47 +0100
Subject: [Buildroot] Problem with libcgi : build links to glib2 instead
 of uclibc ?
In-Reply-To: <737777249D884273A2236C0B56BDE478@apexjs>
References: <737777249D884273A2236C0B56BDE478@apexjs>
Message-ID: <1292012987.24014.175.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sagaert,

Le vendredi 10 d?cembre 2010 ? 20:48 +0100, Sagaert Johan a ?crit :
> Hi
>  
> I am building for i686 target.
>  
> When building libcgi i could not link my program with libcgi,
> It sems libcgi  is linked with glib instead of uclibc :

glibc not glib

>  
> snippet from running nm libcgi.so in the output/staging/usr/lib :
>  
> ................
>          U sprintf@@GLIBC_2.0
>          U srand@@GLIBC_2.0
> 000061e0 t stat
>          U stdin@@GLIBC_2.0
> 00003b1f T str_base64_decode
> 000039cc T str_base64_encode
> 0000526a T str_nreplace
> 000053e1 T str_replace
>          U strcasecmp@@GLIBC_2.0
> 000057c5 T strcat_ex
>          U strchr@@GLIBC_2.0
>          U strcmp@@GLIBC_2.0
>          U strcpy@@GLIBC_2.0
> 000054f7 T strdel
> 00004d73 T stripnslashes
> 00004e1a T stripslashes
>          U strlen@@GLIBC_2.0
>          U strncat@@GLIBC_2.0
>          U strncpy@@GLIBC_2.0
> 00005461 T strnpos
> 000054be T strpos
> 00004f6b T substr
> 000073c0 d table.2974
> 00004f3d T trim
>          U unlink@@GLIBC_2.0
>          U vprintf@@GLIBC_2.0
>          U vsprintf@@GLIBC_2.0
> .......
> 
> After removing the related stamps (.built ,.installed, ....) and doing a make clean in the libcgi build dir
> I added a line $(CC) = i686-linux-gcc in the Makefile.

It sounds like the same issue than the one discussed very recently :

http://lists.busybox.net/pipermail/buildroot/2010-December/039375.html

> 
> After re-building, the cgilib is correctly linked to the uclibc.
> 
> What could be wrong in the libcgi configure scripts ?
> 
> Buildroot build output : i noticed cc ....this was giving me the clue why glib2 was used...
> 
> make[1]: Entering directory `/mnt/hd2/buildrootx86/output/build/libcgi-1.0'
> cc -Wall -D_REENTRANT -fPIC -c src/error.c -o src/error.sh.o
> cc -Wall -D_REENTRANT -fPIC -c src/cgi.c -o src/cgi.sh.o
> src/cgi.c: In function ???cgi_escape_special_chars???:
> src/cgi.c:462: warning: pointer targets in return differ in signedness
> cc -Wall -D_REENTRANT -fPIC -c src/session.c -o src/session.sh.o
> cc -Wall -D_REENTRANT -fPIC -c src/base64.c -o src/base64.sh.o
> cc -Wall -D_REENTRANT -fPIC -c src/md5.c -o src/md5.sh.o
> src/md5.c: In function ???md5???:
> ....
> 
> 
> 
> This produced the right libcgi after adding the CC line in the makefile.
> make[1]: Entering directory `/mnt/hd2/buildrootx86/output/build/libcgi-1.0'
> i686-linux-gcc -Wall -D_REENTRANT -fPIC -c src/error.c -o src/error.sh.o
> i686-linux-gcc -Wall -D_REENTRANT -fPIC -c src/cgi.c -o src/cgi.sh.o
> src/cgi.c: In function 'cgi_escape_special_chars':
> src/cgi.c:462: warning: pointer targets in return differ in signedness
> i686-linux-gcc -Wall -D_REENTRANT -fPIC -c src/session.c -o src/session.sh.o
> i686-linux-gcc -Wall -D_REENTRANT -fPIC -c src/base64.c -o src/base64.sh.o
> i686-linux-gcc -Wall -D_REENTRANT -fPIC -c src/md5.c -o src/md5.sh.o
> 

All this crap is due to the fact that libcgi isn't a fully autotooled
package. It uses autoconf but not automake. Thus you have to set CC and
AR variables manually in the package/libcgi/libcgi.mk file and
triggering build.

I suggest that you define LIBCGI_MAKE_ENV in package/libcgi/libcgi.mk
just like this :

LIBCGI_MAKE_ENV = CC="$(TARGET_CC)" AR="$(TARGET_AR)"

And it should work right away.

Thanks for reporting that, and feel free to submit a patch.

Regards,

--
Lionel Landwerlin
