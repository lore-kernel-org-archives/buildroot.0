From: Damien Borie <dbe@terawatt.fr>
Date: Thu, 11 Mar 2010 17:56:51 +0100
Subject: [Buildroot] Some problems compilation on nano, less and tslib
Message-ID: <4B9920D3.50506@terawatt.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi.

I'm always fighting with my distribution.
I use the last release of Buildroot with an external Toolchain (to use 
glibc and no uclibc) made with last version of Crosstool-ng.
During compilation I have some errors.

The first one is during nano compilation, and I found nothing to help me 
for now. The log :

files.c: In function 'get_full_path':
files.c:999: warning: ignoring return value of 'chdir', declared with 
attribute warn_unused_result
In file included from 
/usr/local/toolchain2/i486-twa-linux-gnu//usr/include/fcntl.h:217, from 
files.c:30:
In function 'open', inlined from 'write_file' at files.c:1482:
/usr/local/toolchain2/i486-twa-linux-gnu//usr/include/bits/fcntl2.h:51: 
error: call to '__open_missing_mode' declared with attribute error: open 
with O_CREAT in second argument needs 3 arguments
In function 'open', inlined from 'write_file' at files.c:1600:
/usr/local/toolchain2/i486-twa-linux-gnu//usr/include/bits/fcntl2.h:51: 
error: call to '__open_missing_mode' declared with attribute error: open 
with O_CREAT in second argument needs 3 arguments
make[3]: *** [files.o] Erreur 1
make[3]: quittant le r?pertoire ? 
/home/labo/matrice5/buildroot/output/build/nano-1.3.12/src ?
make[2]: *** [all-recursive] Erreur 1
make[2]: quittant le r?pertoire ? 
/home/labo/matrice5/buildroot/output/build/nano-1.3.12 ?
make[1]: *** [all] Erreur 2
make[1]: quittant le r?pertoire ? 
/home/labo/matrice5/buildroot/output/build/nano-1.3.12 ?
make: *** 
[/home/labo/matrice5/buildroot/output/build/nano-1.3.12/src/nano] Erreur 2

I have the feeling that it is searching for a bad version of a library. 
Or maybe there is a compatibility problem between nano code and library 
inside the toolchain?

As I didn't understand this, I tried to delete nano from configuration 
of buildroot and come back to this later. But now it's less compilation 
which fail.
The log :

/usr/bin/make -j1 
CC=/usr/local/toolchain2/i486-twa-linux-gnu/bin/i486-twa-linux-gnu-gcc 
-C /home/labo/matrice5/buildroot/output/build/less-394
make[1]: entrant dans le r?pertoire ? 
/home/labo/matrice5/buildroot/output/build/less-394 ?
/usr/local/toolchain2/i486-twa-linux-gnu/bin/i486-twa-linux-gnu-gcc -I. 
-c -DBINDIR=\"/usr/bin\" -DSYSDIR=\"/etc\"  -g -O2 screen.c
screen.c:60:21: error: termcap.h: No such file or directory
screen.c: In function 'raw_mode':
screen.c:288: error: 'ospeed' undeclared (first use in this function)
screen.c:288: error: (Each undeclared identifier is reported only once
screen.c:288: error: for each function it appears in.)
screen.c: In function 'get_term':
screen.c:1181: error: 'PC' undeclared (first use in this function)
make[1]: *** [screen.o] Erreur 1
make[1]: quittant le r?pertoire ? 
/home/labo/matrice5/buildroot/output/build/less-394 ?
make: *** [/home/labo/matrice5/buildroot/output/build/less-394/less] 
Erreur 2

So here I found that there is a link with ncurses library. As nano too 
is linked to ncurses, I wonder if there is a problem with it.
Buildroot use ncurses 5.6 and Crosstool use 5.7. Maybe it's the problem, 
but how to repair this?

If I try compilation without less, the exactly same error as the first I 
quote appear again during ts_calibrate compilation (tslib tool).

Someone has an idea for this?

Thanks,
Damien.
