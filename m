From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 20 Aug 2017 01:05:05 -0300
Subject: [Buildroot] [PATCH/next 1/1] package/lzo: bump version to 2.10
References: <20170805093042.481-1-bernd.kuhls@t-online.de>
Message-ID: <59990a7155c81_50eefe8043078d@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This bump seems to cause build failures for some configurations. See
https://gitlab.com/buildroot.org/buildroot/-/jobs/29048112
You can download the build log (that also contains the defconfig) using the
button on the right of the screen.

I can reproduce it locally using the current NEXT branch.

$ git checkout cdad2823a3e853daf43ccb1da03c96e75ba2dab7 # next
$ support/testing/run-tests -d d -o o tests.fs.test_jffs2.TestJffs2
build fails

$ git checkout cdad2823a3e853daf43ccb1da03c96e75ba2dab7 # next
$ git revert 3ad2d40c65af7a346d79d38ec2999633795c051f # bump lzo
$ support/testing/run-tests -d d -o o tests.fs.test_jffs2.TestJffs2
build succeeds

See below the end of build log:
>>> host-lzo 2.10 Autoreconfiguring
libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, 'autoconf'.
libtoolize: copying file 'autoconf/ltmain.sh'
libtoolize: Consider adding 'AC_CONFIG_MACRO_DIRS([m4])' to configure.ac,
libtoolize: and rerunning libtoolize and aclocal.
libtoolize: Consider adding '-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
configure.ac:61: installing 'autoconf/compile'
configure.ac:71: installing 'autoconf/missing'
Makefile.am: installing 'autoconf/depcomp'
Makefile.am:17: error: 'pkgconfig_DATA' is used but 'pkgconfigdir' is undefined
autoreconf: /builds/buildroot.org/buildroot/test-output/TestJffs2/host/bin/automake failed with exit status: 1
package/pkg-generic.mk:224: recipe for target '/builds/buildroot.org/buildroot/test-output/TestJffs2/build/host-lzo-2.10/.stamp_configured' failed
make[1]: *** [/builds/buildroot.org/buildroot/test-output/TestJffs2/build/host-lzo-2.10/.stamp_configured] Error 1
Makefile:16: recipe for target '_all' failed
make: *** [_all] Error 2
make: Leaving directory '/builds/buildroot.org/buildroot/test-output/TestJffs2'

Regards,
Ricardo
