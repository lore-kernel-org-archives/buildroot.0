From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 5 Dec 2016 04:46:15 +0100
Subject: [Buildroot] [PATCH] berkeleydb: fix static linking issues
In-Reply-To: <20161204215605.680c9070@free-electrons.com>
References: <20161204173924.GA1647@waldemar-brodkorb.de>
 <20161204215605.680c9070@free-electrons.com>
Message-ID: <20161205034615.GA8584@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Hello,
> 
> On Sun, 4 Dec 2016 18:39:24 +0100, Waldemar Brodkorb wrote:
> > Libtool by default drops -static, so force libtool with -all-static
> > to do static linking.
> 
> This needs a little bit more details, because libtool is used by a
> large fraction of our packages, we pass -static only, and it just works.
> 
> Why do we have a different situation here? I thought this undefined
> reference to `dl_iterate_phdr' issue was more a toolchain problem.

It is not a toolchain problem, it is more likely a change in
toolchain behaviour with uClibc-ng >= 1.0.18.
We can not avoid the circular dependency between libc and libgcc, so
every static compiled package must use -static while linking.

> It's affecting a number of different packages, and is apparently a new
> problem, so a fix at the package level looks a bit odd.

In this case it is similar to autossh a package level problem.

All the libtool packages are working out-of-the box in buildroot with
-static, because LIBTOOL_PATCH_HOOK patches libtool to behave like
-all-static.

In this case the hook isn't working correctly, because ltmain.sh
isn't found:

ESC[3m>>> berkeleydb 5.3.28 Patching libtoolESC[23m
for i in `find /home/wbx/buildroot/output/build/berkeleydb-5.3.28/build_unix -name
ltmain.sh`; do ltmain_version=`sed -n '/^[ \t]*VERSION=/{s/^[
\t]*VERSION=//;p;q;}' $i | sed -e 's/\([0-9]*\.[0-9]*\).*/\1/' -e
's/\"//'`; ltmain_patchlevel=`sed -n '/^[ \t]*VERSION=/{s/^[
\t]*VERSION=//;p;q;}' $i | sed -e
's/\([0-9]*\.[0-9]*\.*\)\([0-9]*\).*/\2/' -e 's/\"//'`; if test
${ltmain_version} = '1.5'; then patch -i
support/libtool/buildroot-libtool-v1.5.patch ${i}; elif test
${ltmain_version} = "2.2"; then patch -i
support/libtool/buildroot-libtool-v2.2.patch ${i}; elif test
${ltmain_version} = "2.4"; then if test ${ltmain_patchlevel:-0} -gt
2; then patch -i support/libtool/buildroot-libtool-v2.4.4.patch
${i}; else patch -i support/libtool/buildroot-libtool-v2.4.patch
${i}; fi fi done
touch

wbx at helium:~/buildroot $ find /home/wbx/buildroot/output/build/berkeleydb-5.3.28/ -name ltmain.sh                             
/home/wbx/buildroot/output/build/berkeleydb-5.3.28/dist/ltmain.sh
/home/wbx/buildroot/output/build/berkeleydb-5.3.28/lang/sql/jdbc/ltmain.sh
/home/wbx/buildroot/output/build/berkeleydb-5.3.28/lang/sql/odbc/ltmain.sh
/home/wbx/buildroot/output/build/berkeleydb-5.3.28/lang/sql/sqlite/ltmain.sh

The hook searches in
/home/wbx/buildroot/output/build/berkeleydb-5.3.28/build_unix, but
it seems berkeley db provides ltmain.sh in
/home/wbx/buildroot/output/build/berkeleydb-5.3.28/dist/.

best regards
 Waldemar
