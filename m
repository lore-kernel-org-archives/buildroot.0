From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 10 Nov 2008 08:29:02 -0800
Subject: [Buildroot] [buildroot 0006064]: Making install in curl fails
Message-ID: <5de638fbb5b7e9a6d6a1fc3eb3cb8de2@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=6064 
====================================================================== 
Reported By:                robang74
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   6064
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-10-2008 07:11 PST
Last Modified:              11-10-2008 08:29 PST
====================================================================== 
Summary:                    Making install in curl fails
Description: 
Making install in curl
make[6]: Entering directory
`/home/roberto/gles/buildroot/build_i586/curl-7.17.1/include/curl'
make[7]: Entering directory
`/home/roberto/gles/buildroot/build_i586/curl-7.17.1/include/curl'
make[7]: Nothing to be done for `install-exec-am'.
test -z "/usr/include/curl" || @MKDIR_P@
"/home/roberto/gles/buildroot/build_i586/staging_dir/usr/include/curl"
/bin/bash: @MKDIR_P@: command not found
make[7]: *** [install-pkgincludeHEADERS] Error 127
make[7]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/curl-7.17.1/include/curl'
make[6]: *** [install-am] Error 2
make[6]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/curl-7.17.1/include/curl'
make[5]: *** [install-recursive] Error 1
make[5]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/curl-7.17.1/include'
make[4]: *** [install-data-hook] Error 2
make[4]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/curl-7.17.1'
make[3]: *** [install-data-am] Error 2
make[3]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/curl-7.17.1'
make[2]: *** [install-am] Error 2
make[2]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/curl-7.17.1'
make[1]: *** [install-recursive] Error 1
make[1]: Leaving directory
`/home/roberto/gles/buildroot/build_i586/curl-7.17.1'
make: ***
[/home/roberto/gles/buildroot/build_i586/staging_dir/usr/bin/curl] Error
2

====================================================================== 

---------------------------------------------------------------------- 
 robang74 - 11-10-08 07:16  
---------------------------------------------------------------------- 
roberto at rafbook:~/gles/buildroot/build_i586/curl-7.17.1/include/curl$ diff
-pru Makefile.old Makefile
--- Makefile.old	2008-11-10 16:12:52.000000000 +0100
+++ Makefile	2008-11-10 16:13:27.000000000 +0100
This seems work but I think @MKDIR_P@ should set properly elsewhere

@@ -108,7 +108,7 @@ LTLIBOBJS = 
 MAINT = #
 MAKEINFO = ${SHELL}
"/home/roberto/gles/buildroot/build_i586/curl-7.17.1/missing" --run
makeinfo
 MANOPT = -man
-MKDIR_P = @MKDIR_P@
+MKDIR_P = mkdir -p
 NROFF = /usr/bin/nroff
 OBJEXT = o
 PACKAGE = curl 

---------------------------------------------------------------------- 
 robang74 - 11-10-08 08:29  
---------------------------------------------------------------------- 
Applying curl-7.17.1-mkdirp.patch using plaintext:
patching file Makefile
touch /home/roberto/gles/buildroot/build_i586/curl-7.17.1/.unpacked
(cd /home/roberto/gles/buildroot/build_i586/curl-7.17.1; rm -rf
config.cache; \
                aclocal; \
                libtoolize --force; \
                ./reconf; )
/bin/sh: libtoolize: not found
lib/Makefile.am:42: Libtool library used but `LIBTOOL' is undefined
lib/Makefile.am:42:   The usual way to define `LIBTOOL' is to add
`AC_PROG_LIBTOOL'
lib/Makefile.am:42:   to `configure.ac' and run `aclocal' and `autoconf'
again.
lib/Makefile.am:42:   If `AC_PROG_LIBTOOL' is in `configure.ac', make
sure
lib/Makefile.am:42:   its definition is in aclocal's search path.
The command 'automake' failed
cp -f package/gnuconfig/config.sub package/gnuconfig/config.guess
/home/roberto/gles/buildroot/build_i586/curl-7.17.1

[...]

[What is in description follow] 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-10-08 07:11  robang74       New Issue                                    
11-10-08 07:11  robang74       Status                   new => assigned     
11-10-08 07:11  robang74       Assigned To               => buildroot       
11-10-08 07:11  robang74       Issue Monitored: robang74                    
11-10-08 07:16  robang74       Note Added: 0015334                          
11-10-08 08:29  robang74       Note Added: 0015354                          
======================================================================
