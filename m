From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 8 Jan 2019 20:48:22 +0000 (UTC)
Subject: [Buildroot] popt build failing during autoreconf
Message-ID: <q132am$sni$1@blaine.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The popt package has recently started failing to build during the
autoreconf step.  I've been using buildroot-2016.11.2, but I tried
updating the popt package files to those from git-master, and it still
fails the same way.  This appears to be an incompatibility between
automake and perl 5.26:

  $ ./output/host/usr/bin/automake --version
  Unescaped left brace in regex is illegal here in regex; marked by <-- HERE in m/\${ <-- HERE ([^ \t=:+{}]+)}/@./output/host/usr/bin/automake line 3936.

It appears that buildroot-2016.11.2 is using automake 1.15, and the
current git buildroot master branch is using version 1.15.1.  Should I
be able to update the automake package without causing problems?



========================================== make output shown below ======================================

umask 0022 && make -C /home/nextgen/buildroot/buildroot-2016.11.2 O=/home/nextgen/buildroot/output/. 
>>> popt 1.16 Configuring
>>> popt 1.16 Gettextizing
[...]
>>> popt 1.16 Autoreconfiguring
Use of uninitialized value $args[0] in split at /home/nextgen/buildroot/output/host/usr/bin/autoreconf line 493, <GEN3> line 7.
autoreconf: configure.ac: AM_GNU_GETTEXT is used, but not AM_GNU_GETTEXT_VERSION
libtoolize: putting auxiliary files in '.'.
libtoolize: copying file './ltmain.sh'
libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'm4'.
libtoolize: copying file 'm4/libtool.m4'
libtoolize: copying file 'm4/ltoptions.m4'
libtoolize: copying file 'm4/ltsugar.m4'
libtoolize: copying file 'm4/ltversion.m4'
libtoolize: copying file 'm4/lt~obsolete.m4'
Unescaped left brace in regex is illegal here in regex; marked by <-- HERE in m/\${ <-- HERE ([^ \t=:+{}]+)}/ at /home/nextgen/buildroot/output/host/usr/bin/automake line 3936.
autoreconf: /home/nextgen/buildroot/output/host/usr/bin/automake failed with exit status: 255
make[1]: *** [package/pkg-generic.mk:208: /home/nextgen/buildroot/output/build/popt-1.16/.stamp_configured] Error 1
make: *** [Makefile:16: _all] Error 2


-- 
Grant Edwards               grant.b.edwards        Yow! Hmmm ... an arrogant
                                 @              bouquet with a subtle
                              gmail.com            suggestion of POLYVINYL
                                                   CHLORIDE ...
