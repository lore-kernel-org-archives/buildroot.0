From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 21 Jul 2009 09:59:16 +0000 (UTC)
Subject: [Buildroot] [Bug 473] memstat_0.5.tar.gz has install with -D and
 that fails "make" (last buildroot git)
In-Reply-To: <bug-473-163@https.bugs.busybox.net/>
References: <bug-473-163@https.bugs.busybox.net/>
Message-ID: <20090721095916.CD2B77780D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=473





--- Comment #5 from Etienne Lorrain <etienne_lorrain@yahoo.fr>  2009-07-21 09:59:15 UTC ---
 I do not know why, but it is entirely reproduceable, "install" needs the
target filename and not only the directory where to put the source
filename. This is on a quite old centos machine, I do not have the root
password.
 I can add the full log if you want, but this screen dump should describe
the problem:


gzip -d -c /home/elorrain/buildroot/dl/memstat_0.5.tar.gz | tar -C
/home/elorrain/buildroot/build_powerpc   -xf -
toolchain/patch-kernel.sh /home/elorrain/buildroot/build_powerpc/memstat-0.5
package/memstat/ memstat-0.5\*.patch
touch /home/elorrain/buildroot/build_powerpc/memstat-0.5/.unpacked
touch /home/elorrain/buildroot/build_powerpc/memstat-0.5/.configured
/home/elorrain/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-gcc
-Os -pipe -Os  -I/home/elorrain/buildroot/build_powerpc/staging_dir/usr/include
-I/home/elorrain/buildroot/build_powerpc/staging_dir/include
--sysroot=/home/elorrain/buildroot/build_powerpc/staging_dir/ -isysroot
/home/elorrain/buildroot/build_powerpc/staging_dir -mtune=440fp
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-L/home/elorrain/buildroot/build_powerpc/staging_dir/lib
-L/home/elorrain/buildroot/build_powerpc/staging_dir/usr/lib
--sysroot=/home/elorrain/buildroot/build_powerpc/staging_dir/
/home/elorrain/buildroot/build_powerpc/memstat-0.5/memstat.c -o
/home/elorrain/buildroot/build_powerpc/memstat-0.5/memstat
[ -e
/home/elorrain/buildroot/project_build_powerpc/Eqam4G/root/etc/memstat.conf ]
|| \
        /usr/bin/install -m 0644 -D
/home/elorrain/buildroot/build_powerpc/memstat-0.5/memstat.conf
/home/elorrain/buildroot/project_build_powerpc/Eqam4G/root/etc
/usr/bin/install: cannot overwrite directory
`/home/elorrain/buildroot/project_build_powerpc/Eqam4G/root/etc' with
non-directory
make: ***
[/home/elorrain/buildroot/project_build_powerpc/Eqam4G/root/usr/bin/memstat]
Error 1
[elorrain at cobra buildroot]$ ls -ld
/home/elorrain/buildroot/project_build_powerpc/Eqam4G/root/etc
drwxrwxr-x  5 elorrain elorrain 4096 Jul 21 10:21
/home/elorrain/buildroot/project_build_powerpc/Eqam4G/root/etc
[elorrain at cobra buildroot]$ ls
/home/elorrain/buildroot/project_build_powerpc/Eqam4G/root/etc
br-version  group     hosts   inittab  issue         mtab     passwd  
protocols    resolv.conf  services  TZ
fstab       hostname  init.d  inputrc  ld.so.conf.d  network  profile 
random-seed  securetty    shadow
[elorrain at cobra buildroot]$ /usr/bin/install -m 0644 -D
/home/elorrain/buildroot/build_powerpc/memstat-0.5/memstat.conf
/home/elorrain/buildroot/project_build_powerpc/Eqam4G/root/etc
/usr/bin/install: cannot overwrite directory
`/home/elorrain/buildroot/project_build_powerpc/Eqam4G/root/etc' with
non-directory
[elorrain at cobra buildroot]$ /usr/bin/install -m 0644 -D
/home/elorrain/buildroot/build_powerpc/memstat-0.5/memstat.conf
/home/elorrain/buildroot/project_build_powerpc/Eqam4G/root/etc/
/usr/bin/install: cannot overwrite directory
`/home/elorrain/buildroot/project_build_powerpc/Eqam4G/root/etc/' with
non-directory
[elorrain at cobra buildroot]$ /usr/bin/install -m 0644 -D
/home/elorrain/buildroot/build_powerpc/memstat-0.5/memstat.conf
/home/elorrain/buildroot/project_build_powerpc/Eqam4G/root/etc/memstat.conf
[elorrain at cobra buildroot]$ install --version
install (coreutils) 5.2.1
Written by David MacKenzie.

Copyright (C) 2004 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
[elorrain at cobra buildroot]$ cat /etc/redhat-release
Red Hat Enterprise Linux ES release 4
[elorrain at cobra buildroot]$ cat /proc/version
Linux version 2.6.9-67.0.15.plus.c4smp (mockbuild at builder10.centos.org) (gcc
version 3.4.6 20060404 (Red Hat 3.4.6-9)) #1 SMP Fri May 9 10:17:50 EDT 2008
[elorrain at cobra buildroot]$

I do not know if it has to be fixed, this centos is too old. But it seems
the only place where "install" is used with a target directory in building
the whole buildroot.

 Thanks for your help,
 Etienne.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
