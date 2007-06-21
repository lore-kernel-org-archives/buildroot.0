From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 21 Jun 2007 15:07:58 -0700
Subject: [Buildroot] [buildroot 0001400]: Buildroot fails to build a
	toolchain for SH4
Message-ID: <3ebfcd2396afe91e68cb507b29ea094d@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1400 
====================================================================== 
Reported By:                Masta-G
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1400
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-21-2007 15:07 PDT
Last Modified:              06-21-2007 15:07 PDT
====================================================================== 
Summary:                    Buildroot fails to build a toolchain for SH4
Description: 
Buildroot seems to be broken for SH4.
I tried different versions of gcc but they all fail at the same place.
Also it would be nice to set uClibc to default to little endian for sh4.
Anyways this is where it fails: 

if [ -d "/home/mastag/buildroot/build_sh4/staging_dir/usr/lib64" ] ; then
\
                if [ ! -e
"/home/mastag/buildroot/build_sh4/staging_dir/usr/lib" ] ; then \
                        mkdir
"/home/mastag/buildroot/build_sh4/staging_dir/usr/lib" ; \
                fi ; \
                mv
"/home/mastag/buildroot/build_sh4/staging_dir/usr/lib64/"*
"/home/mastag/buildroot/build_sh4/staging_dir/usr/lib/" ; \
                rmdir
"/home/mastag/buildroot/build_sh4/staging_dir/usr/lib64" ; \
        fi
# Strip the host binaries
strip --strip-all -R .note -R .comment
/home/mastag/buildroot/build_sh4/staging_dir/usr/bin/*
strip:
/home/mastag/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-gccbug:
File format not recognized
make:
[/home/mastag/buildroot/toolchain_build_sh4/gcc-3.4.6-final/.installed]
Fout 1 (genegeerd)
# Make sure we have 'cc'.
if [ ! -e
/home/mastag/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-cc ]
; then \
                ln -snf sh4-linux-uclibc-gcc \
                       
/home/mastag/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-cc ;
\
        fi;
if [ ! -e /home/mastag/buildroot/build_sh4/staging_dir/usr/bin/gcc ] ;
then \
                ln -snf gcc
/home/mastag/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-cc ;
\
        fi;
# Set up the symlinks to enable lying about target name.
set -e; \
        (cd /home/mastag/buildroot/build_sh4/staging_dir/usr; \
                ln -snf sh4-linux-uclibc sh4-linux; \
                cd bin; \
                for app in sh4-linux-uclibc-* ; do \
                        ln -snf ${app} \
                        sh4-linux${app##sh4-linux-uclibc}; \
                done; \
        );
#
# Now for the ugly 3.3.x soft float hack...
#
#
# Ok... that's enough of that.
#
touch
/home/mastag/buildroot/toolchain_build_sh4/gcc-3.4.6-final/.installed
# These are in /lib, so...
rm -rf /home/mastag/buildroot/build_sh4/root/usr/lib/libgcc_s*.so*
cp -dpf
/home/mastag/buildroot/build_sh4/staging_dir/usr/sh4-linux-uclibc/lib/libgcc_s*
/home/mastag/buildroot/build_sh4/root/lib/
/home/mastag/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-strip
--remove-section=.comment --remove-section=.note --strip-unneeded
/home/mastag/buildroot/build_sh4/root/lib/libgcc_s*
/home/mastag/buildroot/build_sh4/staging_dir/usr/bin/sh4-linux-uclibc-strip:
/home/mastag/buildroot/build_sh4/root/lib/libgcc_s.so: File format not
recognized
make: ***
[/home/mastag/buildroot/toolchain_build_sh4/gcc-3.4.6-final/.libs_installed]
Fout 1
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-21-07 15:07  Masta-G        New Issue                                    
06-21-07 15:07  Masta-G        Status                   new => assigned     
06-21-07 15:07  Masta-G        Assigned To               => buildroot       
======================================================================
