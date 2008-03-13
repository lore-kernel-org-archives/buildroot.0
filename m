From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 13 Mar 2008 02:10:05 -0700
Subject: [Buildroot] [buildroot 0001512]: Cannot build on Cygwin (as in
	closed issue 0001449)
Message-ID: <3174d577562443a5b5b0730fc9e620c5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1512 
====================================================================== 
Reported By:                mgall
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1512
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-26-2007 16:38 PDT
Last Modified:              03-13-2008 02:10 PDT
====================================================================== 
Summary:                    Cannot build on Cygwin (as in closed issue 0001449)
Description: 
Same problem as reported in ID0001449, "make menuconfig" fails:

$ make menuconfig
make CC="/usr/bin/gcc" -C package/config conf mconf
make[1]: Entering directory `/managed/buildroot/package/config'
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE -g
-O2 -
MM *.c > .depend 2>/dev/null || :
make[1]: Leaving directory `/managed/buildroot/package/config'
make[1]: Entering directory `/managed/buildroot/package/config'
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE -g
-O2
-c conf.c -o conf.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE -g
-O2
-c kxgettext.c -o kxgettext.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE -g
-O2
-c lxdialog/checklist.c -o lxdialog/checklist.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE -g
-O2
-c lxdialog/inputbox.c -o lxdialog/inputbox.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE -g
-O2
-c lxdialog/menubox.c -o lxdialog/menubox.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE -g
-O2
-c lxdialog/textbox.c -o lxdialog/textbox.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE -g
-O2
-c lxdialog/util.c -o lxdialog/util.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE -g
-O2
-c lxdialog/yesno.c -o lxdialog/yesno.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE -g
-O2
-c mconf.c -o mconf.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE -g
-O2 -
I. -c zconf.tab.c -o zconf.tab.o
/usr/bin/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE -g
-O2
-lncurses conf.o  zconf.tab.o -o conf
conf.o: In function `check_stdin':
/managed/buildroot/package/config/conf.c:60: undefined reference to
`_libintl_ge
ttext'
/managed/buildroot/package/config/conf.c:61: undefined reference to
`_libintl_ge
ttext'
/managed/buildroot/package/config/conf.c:62: undefined reference to
`_libintl_ge
ttext'
conf.o: In function `check_conf':
/managed/buildroot/package/config/conf.c:483: undefined reference to
`_libintl_g
ettext'
conf.o: In function `main':
/managed/buildroot/package/config/conf.c:623: undefined reference to
`_libintl_g
ettext'
conf.o:/managed/buildroot/package/config/conf.c:541: more undefined
references t
o `_libintl_gettext' follow
collect2: ld returned 1 exit status
make[1]: *** [conf] Error 1
make[1]: Leaving directory `/managed/buildroot/package/config'
make: *** [package/config/mconf] Error 2

====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 10-02-07 04:08  
---------------------------------------------------------------------- 
try
make HOST_LIBES=-lintl -C packages/config mconf
or something to that effect (look for LIBES, i don't remember the name
offhand). 

---------------------------------------------------------------------- 
 mgall - 10-03-07 09:03  
---------------------------------------------------------------------- 
Here's the result:
$ make HOST_LOADLIBES=-lintl -C package/config mconf
make: Entering directory `/managed/buildroot/package/config'
cat zconf.tab.c_shipped > zconf.tab.c
cat lex.zconf.c_shipped > lex.zconf.c
cat zconf.hash.c_shipped > zconf.hash.c
I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE -DKBUILD_NO_NLS
-I. -c
 zconf.tab.c -o zconf.tab.o
/bin/sh: I/usr/include/ncurses: No such file or directory
make: [zconf.tab.o] Error 127 (ignored)
I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>" -DLOCALE -DKBUILD_NO_NLS 
-lint
l mconf.o zconf.tab.o lxdialog/checklist.o lxdialog/util.o
lxdialog/inputbox.o l
xdialog/textbox.o lxdialog/yesno.o lxdialog/menubox.o -o mconf
/bin/sh: I/usr/include/ncurses: No such file or directory
make: [mconf] Error 127 (ignored)
make: Leaving directory `/managed/buildroot/package/config' 

---------------------------------------------------------------------- 
 johaahn - 03-13-08 02:10  
---------------------------------------------------------------------- 
This patch solve this make menuconfig issue. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-26-07 16:38  mgall          New Issue                                    
09-26-07 16:38  mgall          Status                   new => assigned     
09-26-07 16:38  mgall          Assigned To               => buildroot       
10-02-07 04:08  bernhardf      Note Added: 0002807                          
10-03-07 09:03  mgall          Note Added: 0002810                          
03-13-08 02:10  johaahn        Note Added: 0005684                          
======================================================================
