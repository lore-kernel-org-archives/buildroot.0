From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jan 2018 23:38:42 +0100
Subject: [Buildroot] [PATCH 1/1] open-lldp: new package
In-Reply-To: <CAGm1_ksP2c_gLsSCJjN=Sr7gK0OR0Bdxd-jidXVhjgwOCFyiwQ@mail.gmail.com>
References: <20180112140107.15301-1-laurent_pubs@yahoo.com>
 <CAGm1_kvL9UWVX5jrzE1dhsOHvWT_LukRJKZ5z6eu8Tma0bjXdw@mail.gmail.com>
 <20180112220436.677e3084@windsurf.lan>
 <CAGm1_ksP2c_gLsSCJjN=Sr7gK0OR0Bdxd-jidXVhjgwOCFyiwQ@mail.gmail.com>
Message-ID: <20180112233842.388e29a0@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 Jan 2018 22:29:44 +0100, Yegor Yefremov wrote:

> > So instead, please keep <pkg>_AUTORECONF = YES, and if the missing m4
> > folder is the only problem (but I doubt it because the bootstrap.sh
> > script doesn't create it), then add a post-extract hook that creates
> > the m4 file.  
> 
> bootstrap.sh doesn't create m4 folder, but if you just clone the
> open-lldp repo and invoke "autoreconf -i", it would just complain
> about missing m4 folder, but create it. In BR environment we get an
> error. We had similar situation earlier with some other package
> (libsoc) and I coudn't find the case of the problem, so I just added
> m4 upstream and now it is working.

Interesting, I never realized that. After a bit of experiment, it seems
like passing a -I option makes a difference:

thomas at windsurf:~/projets/open-lldp (master)$ autoreconf -f -i -I "/home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/share/aclocal" -I "/home/thomas/projets/buildroot/output/host/share/aclocal"
aclocal: error: couldn't open directory 'm4': No such file or directory
autoreconf: aclocal failed with exit status: 1
thomas at windsurf:~/projets/open-lldp (master)$ autoreconf -f -i -I "/home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/share/aclocal"
aclocal: error: couldn't open directory 'm4': No such file or directory
autoreconf: aclocal failed with exit status: 1
thomas at windsurf:~/projets/open-lldp (master)$ autoreconf -f -i  -I "/home/thomas/projets/buildroot/output/host/share/aclocal"
aclocal: error: couldn't open directory 'm4': No such file or directory
autoreconf: aclocal failed with exit status: 1
thomas at windsurf:~/projets/open-lldp (master)$ autoreconf -f -i
aclocal: warning: couldn't open directory 'm4': No such file or directory
libtoolize: putting auxiliary files in '.'.
libtoolize: copying file './ltmain.sh'
libtoolize: putting macros in AC_CONFIG_MACRO_DIRS, 'm4'.
libtoolize: copying file 'm4/libtool.m4'
libtoolize: copying file 'm4/ltoptions.m4'
libtoolize: copying file 'm4/ltsugar.m4'
libtoolize: copying file 'm4/ltversion.m4'
libtoolize: copying file 'm4/lt~obsolete.m4'
configure.ac:5: installing './ar-lib'
configure.ac:5: installing './compile'
configure.ac:19: installing './config.guess'
configure.ac:19: installing './config.sub'
configure.ac:2: installing './install-sh'
configure.ac:2: installing './missing'
Makefile.am: installing './depcomp'

Even more funny:

thomas at windsurf:~/projets/open-lldp (master)$ mkdir /tmp/foo
thomas at windsurf:~/projets/open-lldp (master)$ autoreconf -f -i  -I /tmp/foo/
aclocal: error: couldn't open directory 'm4': No such file or directory
autoreconf: aclocal failed with exit status: 1

Not sure what's going on here :)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
