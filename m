From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 11 Sep 2020 22:04:41 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/apparmor: fix per-package build with apache
In-Reply-To: <20200905214736.2035306-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 5 Sep 2020 23:47:36 +0200")
References: <20200905214736.2035306-1-fontaine.fabrice@gmail.com>
Message-ID: <87o8mcxep2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Per-package build of apparmor with apache fails on:
 > /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apparmor/host/x86_64-buildroot-linux-musl/sysroot/usr/bin/apxs  -c mod_apparmor.c -L/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apparmor/host/bin/../x86_64-buildroot-linux-musl/sysroot/usr/lib -lapparmor

 > /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apache/host/x86_64-buildroot-linux-musl/sysroot/usr/bin/../../usr/build-1/libtool --silent --mode=compile /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apache/host/bin/x86_64-linux-gcc -prefer-pic -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -g2    -I/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apache/host/x86_64-buildroot-linux-musl/sysroot/usr/include  -I/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apache/host/x86_64-buildroot-linux-musl/sysroot/usr/bin/../../usr/include/apr-1   -I/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apache/host/x86_64-buildroot-linux-musl/sysroot/usr/bin/../../usr/include/apr-1 -I/usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apache/host/x86_64-buildroot-linux-musl/sysroot/usr/bin/../../../../x86_64-buildroot-
 lin
 >  ux-musl/sysroot/usr/include  -c -o mod_apparmor.lo mod_apparmor.c && touch mod_apparmor.slo
 > mod_apparmor.c:28:10: fatal error: sys/apparmor.h: No such file or directory
 >  #include <sys/apparmor.h>
 >           ^~~~~~~~~~~~~~~~

 > The issue is that sys/appamor.h is not installed in the apache
 > per-package directory which is mangled by
 > APACHE_FIX_STAGING_APACHE_CONFIG, i.e.
 > /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-0/output-1/per-package/apache/host/x86_64-buildroot-linux-musl/sysroot/usr/include

 > So implement the same workaround made on apache to replace those wrong
 > apache paths by apparmor paths in apxs binary and its configuration file
 > (i.e. config_vars.mk) as suggested by Thomas Petazzoni and Yann E. Morin
 > during review of the first iteration of this patch

 > Fixes:
 >  - http://autobuild.buildroot.org/results/ef1fcd57e0c09a2806bf2272bb21df6d3300b45b

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Yann E. Morin and Thomas Petazzoni):
 >  - Patch apxs and config_vars.mk

Committed to 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
