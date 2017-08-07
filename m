From: Steve Calfee <stevecalfee@gmail.com>
Date: Mon, 7 Aug 2017 14:06:21 -0700
Subject: [Buildroot] mysqld run-time breakage
Message-ID: <CAJJ6jxuyCmsTT69n4K0aZLt2xeT0GAF3MqRx_Z3Q1VhHWguYig@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, I am trying to upgrade to the latest buildroot from I think it was
2016.08. As an intermediate step, while waiting for 2017.08, I am
upgrading to 2017.05.02.

Everything builds fine, it boots and runs ok.

But mysqld did not get started. I did have it working before. I know
something was done with the mariadb and mysql becoming virtual
packages, but I am not sure what. The problem I see is S97mysqld wants
to start /usr/bin/mysqld_safe and mysqld_safe is not installed
anywhere in the target.

So I would appreciate any tips on where to look.

Thanks, Steve

Here is my dockstar_glibc_buildroot_defconfig

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_PATH="$(TOPDIR)/../new_sept_2014_tools/output/host/usr"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="arm-linux"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_8=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_HOST_GDB=y
BR2_TOOLCHAIN_GLIBC_GCONV_LIBS_COPY=y
BR2_TARGET_GENERIC_HOSTNAME="dockstar"
BR2_TARGET_GENERIC_ISSUE="Welcome to Steve's Dockstar"
BR2_ROOTFS_DEVICE_TABLE="$(BR2_EXTERNAL)/seagatedockstar/device_table.txt"
BR2_GENERATE_LOCALE="en_US.UTF-8"
BR2_ROOTFS_OVERLAY="$(BR2_EXTERNAL)/seagatedockstar/skeleton"
BR2_ROOTFS_POST_BUILD_SCRIPT="$(BR2_EXTERNAL)/seagatedockstar/patchrootfs.sh"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="configs/dockstar_linux_defconfig"
BR2_LINUX_KERNEL_UIMAGE=y
BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="kirkwood-dockstar"
BR2_LINUX_KERNEL_INSTALL_TARGET=y
BR2_PACKAGE_BUSYBOX_CONFIG="$(BR2_EXTERNAL)/configs/testbb_defconfig"
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_STRACE=y
BR2_PACKAGE_GETTEXT=y
BR2_PACKAGE_MTD=y
BR2_PACKAGE_MTD_MKFSUBIFS=y
BR2_PACKAGE_NFS_UTILS=y
BR2_PACKAGE_NFS_UTILS_RPCDEBUG=y
BR2_PACKAGE_SSHFS=y
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_PY_PYC=y
BR2_PACKAGE_PYTHON_UCS4=y
BR2_PACKAGE_PYTHON_HASHLIB=y
BR2_PACKAGE_PYTHON_PYMYSQL=y
BR2_PACKAGE_PYTHON_PYRATEMP=y
BR2_PACKAGE_PYTHON_REQUESTS=y
BR2_PACKAGE_PYTHON_TORNADO=y
BR2_PACKAGE_MYSQL=y
BR2_PACKAGE_ORACLE_MYSQL_SERVER=y
BR2_PACKAGE_NSS_MDNS=y
BR2_PACKAGE_ICU=y
BR2_PACKAGE_NCURSES_WCHAR=y
BR2_PACKAGE_AVAHI=y
BR2_PACKAGE_AVAHI_DAEMON=y
BR2_PACKAGE_BASH=y
BR2_PACKAGE_LESS=y
BR2_PACKAGE_MC=y
BR2_PACKAGE_NANO=y
BR2_TARGET_ROOTFS_UBIFS=y
BR2_TARGET_ROOTFS_UBI=y
BR2_PACKAGE_HOST_MKE2IMG=y
BR2_TARGET_SHEEVAPLUG=y

There are quite a few warnings in the server build, but no errors that
I can see:

mysql-5.1.73.tar.gz: OK (md5: 887f869bcc757957067b9198f707f32f)
mysql-5.1.73.tar.gz: OK (sha256:
05ebe21305408b24407d14b77607a3e5ffa3c300e03f1359d3066f301989dcb5)
>>> oracle-mysql 5.1.73 Extracting
gzip -d -c /home/calfee/nobu/br/downloads/mysql-5.1.73.tar.gz | tar
--strip-components=1 -C
/home/calfee/nobu/br/dockstar/ds_9_2914/output/build/oracle-mysql-5.1.73
  -xf -
>>> oracle-mysql 5.1.73 Patching

Applying 0000-ac_cache_check.patch using patch:
patching file storage/innodb_plugin/plug.in
Hunk #1 succeeded at 56 (offset 3 lines).
Hunk #2 succeeded at 99 (offset 3 lines).
Hunk #3 succeeded at 135 with fuzz 1 (offset 3 lines).
Hunk #4 succeeded at 168 with fuzz 2 (offset 10 lines).
Hunk #5 succeeded at 202 (offset 10 lines).
Hunk #6 succeeded at 236 (offset 10 lines).

Applying 0001-configure-ps-cache-check.patch using patch:
patching file configure.in
Hunk #1 succeeded at 487 (offset 25 lines).
Hunk #2 succeeded at 527 (offset 25 lines).

Applying 0002-use-new-readline-iface.patch using patch:
patching file configure.in
Hunk #1 succeeded at 2679 (offset -10 lines).

Applying 0003-ac_stack_direction-is-unset.patch using patch:
patching file config/ac-macros/misc.m4

Applying 0004-Fix-gen_lex_hash-execution.patch using patch:
patching file sql/Makefile.am
patching file sql/Makefile.in

Applying 0005-bison_3_breaks_mysql_server_build.patch using patch:
patching file sql/sql_lex.cc
patching file sql/sql_lex.h
patching file sql/sql_parse.cc
patching file sql/sql_yacc.yy

Applying 0006-no-force-static-build.patch using patch:
patching file configure.in

Applying 0007-dont-install-in-mysql-directory.patch using patch:
patching file dbug/Makefile.am
patching file libmysql/Makefile.shared
patching file libmysqld/Makefile.am
patching file mysys/Makefile.am
patching file storage/csv/Makefile.am
patching file storage/heap/Makefile.am
patching file storage/myisam/Makefile.am
patching file storage/myisammrg/Makefile.am
patching file strings/Makefile.am
patching file tests/Makefile.am
patching file vio/Makefile.am
patching file zlib/Makefile.am

Applying 0008-fix-type-conversion.patch using patch:
patching file server-tools/instance-manager/protocol.cc
>>> oracle-mysql 5.1.73 Updating config.sub and config.guess
for file in config.guess config.sub; do for i in $(find
/home/calfee/nobu/br/dockstar/ds_9_2914/output/build/oracle-mysql-5.1.73
-name $file); do cp support/gnuconfig/$file $i; done; done
>>> oracle-mysql 5.1.73 Configuring
>>> oracle-mysql 5.1.73 Autoreconfiguring
aclocal: warning: autoconf input should be named 'configure.ac', not
'configure.in'
config/ac-macros/character_sets.m4:6: warning: prefer named diversions
config/ac-macros/character_sets.m4:6: warning: prefer named diversions
libtoolize: putting auxiliary files in '.'.
libtoolize: copying file './ltmain.sh'
libtoolize: Consider adding 'AC_CONFIG_MACRO_DIRS([m4])' to configure.in,
libtoolize: and rerunning libtoolize and aclocal.
libtoolize: Consider adding '-I m4' to ACLOCAL_AMFLAGS in Makefile.am.
libtoolize: 'AC_PROG_RANLIB' is rendered obsolete by 'LT_INIT'
aclocal: warning: autoconf input should be named 'configure.ac', not
'configure.in'
config/ac-macros/character_sets.m4:6: warning: prefer named diversions
config/ac-macros/character_sets.m4:6: warning: prefer named diversions
config/ac-macros/character_sets.m4:6: warning: prefer named diversions
automake: warning: autoconf input should be named 'configure.ac', not
'configure.in'
config/ac-macros/character_sets.m4:6: warning: prefer named diversions
configure.in:23: installing './compile'
configure.in:22: installing './missing'
BUILD/Makefile.am:82: warning: '%'-style pattern rules are a GNU make extension
Docs/Makefile.am:42: warning: '%'-style pattern rules are a GNU make extension
client/Makefile.am:127: warning: '%'-style pattern rules are a GNU
make extension
client/Makefile.am:24: warning: 'INCLUDES' is the old name for
'AM_CPPFLAGS' (or '*_CPPFLAGS')
client/Makefile.am:98: warning: source file
'$(top_srcdir)/mysys/my_getpagesize.c' is in a subdirectory,
client/Makefile.am:98: but option 'subdir-objects' is disabled
automake: warning: possible forward-incompatibility.
automake: At least a source file is in a subdirectory, but the 'subdir-objects'
automake: automake option hasn't been enabled.  For now, the
corresponding output
automake: object file(s) will be placed in the top-level directory.  However,
automake: this behaviour will change in future Automake versions: they will
automake: unconditionally cause object files to be placed in the same
subdirectory
automake: of the corresponding sources.
automake: You are advised to start using 'subdir-objects' option throughout your
automake: project, to avoid future incompatibilities.
client/Makefile.am:60: warning: source file
'$(top_srcdir)/mysys/mf_tempdir.c' is in a subdirectory,
client/Makefile.am:60: but option 'subdir-objects' is disabled
client/Makefile.am:60: warning: source file
'$(top_srcdir)/mysys/my_new.cc' is in a subdirectory,
client/Makefile.am:60: but option 'subdir-objects' is disabled
client/Makefile.am:60: warning: source file
'$(top_srcdir)/mysys/my_bit.c' is in a subdirectory,
client/Makefile.am:60: but option 'subdir-objects' is disabled
client/Makefile.am:60: warning: source file
'$(top_srcdir)/mysys/my_bitmap.c' is in a subdirectory,
client/Makefile.am:60: but option 'subdir-objects' is disabled
client/Makefile.am:60: warning: source file
'$(top_srcdir)/mysys/my_vle.c' is in a subdirectory,
client/Makefile.am:60: but option 'subdir-objects' is disabled
client/Makefile.am:60: warning: source file
'$(top_srcdir)/mysys/base64.c' is in a subdirectory,
client/Makefile.am:60: but option 'subdir-objects' is disabled
client/Makefile.am:69: warning: source file
'$(top_srcdir)/mysys/mf_getdate.c' is in a subdirectory,
client/Makefile.am:69: but option 'subdir-objects' is disabled
client/Makefile.am: installing './depcomp'
automake: warning: autoconf input should be named 'configure.ac', not
'configure.in'
cmd-line-utils/Makefile.am:24: warning: '%'-style pattern rules are a
GNU make extension
cmd-line-utils/libedit/Makefile.am:6: warning: 'INCLUDES' is the old
name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
cmd-line-utils/libedit/Makefile.am:10: warning: source file
'np/unvis.c' is in a subdirectory,
cmd-line-utils/libedit/Makefile.am:10: but option 'subdir-objects' is disabled
cmd-line-utils/libedit/Makefile.am:10: warning: source file
'np/strlcpy.c' is in a subdirectory,
cmd-line-utils/libedit/Makefile.am:10: but option 'subdir-objects' is disabled
cmd-line-utils/libedit/Makefile.am:10: warning: source file 'np/vis.c'
is in a subdirectory,
cmd-line-utils/libedit/Makefile.am:10: but option 'subdir-objects' is disabled
cmd-line-utils/libedit/Makefile.am:10: warning: source file
'np/strlcat.c' is in a subdirectory,
cmd-line-utils/libedit/Makefile.am:10: but option 'subdir-objects' is disabled
cmd-line-utils/libedit/Makefile.am:10: warning: source file
'np/fgetln.c' is in a subdirectory,
cmd-line-utils/libedit/Makefile.am:10: but option 'subdir-objects' is disabled
cmd-line-utils/libedit/Makefile.am:10: warning: source file
'np/wcsdup.c' is in a subdirectory,
cmd-line-utils/libedit/Makefile.am:10: but option 'subdir-objects' is disabled
cmd-line-utils/readline/Makefile.am:37: warning: '%'-style pattern
rules are a GNU make extension
cmd-line-utils/readline/Makefile.am:6: warning: 'INCLUDES' is the old
name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
dbug/Makefile.am:65: warning: '%'-style pattern rules are a GNU make extension
dbug/Makefile.am:18: warning: 'INCLUDES' is the old name for
'AM_CPPFLAGS' (or '*_CPPFLAGS')
extra/Makefile.am:60: warning: '%'-style pattern rules are a GNU make extension
extra/Makefile.am:16: warning: 'INCLUDES' is the old name for
'AM_CPPFLAGS' (or '*_CPPFLAGS')
extra/yassl/Makefile.am:20: warning: '%'-style pattern rules are a GNU
make extension
extra/yassl/src/Makefile.am:22: warning: wildcard ../include/*.hpp:
non-POSIX variable name
extra/yassl/src/Makefile.am:22: (probably a GNU make extension)
extra/yassl/src/Makefile.am:22: warning: wildcard
../include/openssl/*.h: non-POSIX variable name
extra/yassl/src/Makefile.am:22: (probably a GNU make extension)
extra/yassl/src/Makefile.am:26: warning: '%'-style pattern rules are a
GNU make extension
extra/yassl/src/Makefile.am:16: warning: 'INCLUDES' is the old name
for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
extra/yassl/taocrypt/Makefile.am:17: warning: wildcard mySTL/*.hpp:
non-POSIX variable name
extra/yassl/taocrypt/Makefile.am:17: (probably a GNU make extension)
extra/yassl/taocrypt/Makefile.am:20: warning: '%'-style pattern rules
are a GNU make extension
extra/yassl/taocrypt/benchmark/Makefile.am:24: warning: '%'-style
pattern rules are a GNU make extension
extra/yassl/taocrypt/benchmark/Makefile.am:16: warning: 'INCLUDES' is
the old name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
extra/yassl/taocrypt/src/Makefile.am:29: warning: wildcard
../include/*.hpp: non-POSIX variable name
extra/yassl/taocrypt/src/Makefile.am:29: (probably a GNU make extension)
extra/yassl/taocrypt/src/Makefile.am:32: warning: '%'-style pattern
rules are a GNU make extension
extra/yassl/taocrypt/src/Makefile.am:16: warning: 'INCLUDES' is the
old name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
extra/yassl/taocrypt/test/Makefile.am:24: warning: '%'-style pattern
rules are a GNU make extension
extra/yassl/taocrypt/test/Makefile.am:16: warning: 'INCLUDES' is the
old name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
extra/yassl/testsuite/Makefile.am:28: warning: '%'-style pattern rules
are a GNU make extension
extra/yassl/testsuite/Makefile.am:16: warning: 'INCLUDES' is the old
name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
extra/yassl/testsuite/Makefile.am:18: warning: source file
'../taocrypt/test/test.cpp' is in a subdirectory,
extra/yassl/testsuite/Makefile.am:18: but option 'subdir-objects' is disabled
extra/yassl/testsuite/Makefile.am:18: warning: source file
'../examples/client/client.cpp' is in a subdirectory,
extra/yassl/testsuite/Makefile.am:18: but option 'subdir-objects' is disabled
extra/yassl/testsuite/Makefile.am:18: warning: source file
'../examples/server/server.cpp' is in a subdirectory,
extra/yassl/testsuite/Makefile.am:18: but option 'subdir-objects' is disabled
extra/yassl/testsuite/Makefile.am:18: warning: source file
'../examples/echoclient/echoclient.cpp' is in a subdirectory,
extra/yassl/testsuite/Makefile.am:18: but option 'subdir-objects' is disabled
extra/yassl/testsuite/Makefile.am:18: warning: source file
'../examples/echoserver/echoserver.cpp' is in a subdirectory,
extra/yassl/testsuite/Makefile.am:18: but option 'subdir-objects' is disabled
include/Makefile.am:70: warning: '%'-style pattern rules are a GNU
make extension
libmysql/Makefile.shared:118: warning: '%'-style pattern rules are a
GNU make extension
libmysql/Makefile.am:28:   'libmysql/Makefile.shared' included from here
libmysql/Makefile.am:115: warning: '%'-style pattern rules are a GNU
make extension
libmysql/Makefile.am:25: warning: 'INCLUDES' is the old name for
'AM_CPPFLAGS' (or '*_CPPFLAGS')
libmysql/Makefile.shared:118: warning: '%'-style pattern rules are a
GNU make extension
libmysql_r/Makefile.am:29:   'libmysql/Makefile.shared' included from here
libmysql_r/Makefile.am:46: warning: '%'-style pattern rules are a GNU
make extension
libmysql_r/Makefile.am:26: warning: 'INCLUDES' is the old name for
'AM_CPPFLAGS' (or '*_CPPFLAGS')
libmysqld/Makefile.am:237: warning: '%'-style pattern rules are a GNU
make extension
libmysqld/Makefile.am:33: warning: 'INCLUDES' is the old name for
'AM_CPPFLAGS' (or '*_CPPFLAGS')
libmysqld/examples/Makefile.am:57: warning: '%'-style pattern rules
are a GNU make extension
libmysqld/examples/Makefile.am:36: warning: 'INCLUDES' is the old name
for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
man/Makefile.am:29: warning: '%'-style pattern rules are a GNU make extension
mysql-test/Makefile.am:145: warning: '%'-style pattern rules are a GNU
make extension
mysql-test/lib/My/SafeProcess/Makefile.am:30: warning: '%'-style
pattern rules are a GNU make extension
mysys/Makefile.am:137: warning: '%'-style pattern rules are a GNU make extension
mysys/Makefile.am:19: warning: 'INCLUDES' is the old name for
'AM_CPPFLAGS' (or '*_CPPFLAGS')
netware/Makefile.am:121: warning: '%'-style pattern rules are a GNU
make extension
netware/Makefile.am:19: warning: 'INCLUDES' is the old name for
'AM_CPPFLAGS' (or '*_CPPFLAGS')
regex/Makefile.am:36: warning: '%'-style pattern rules are a GNU make extension
regex/Makefile.am:18: warning: 'INCLUDES' is the old name for
'AM_CPPFLAGS' (or '*_CPPFLAGS')
scripts/Makefile.am:198: warning: '%'-style pattern rules are a GNU
make extension
server-tools/Makefile.am:20: warning: '%'-style pattern rules are a
GNU make extension
server-tools/instance-manager/Makefile.am:103: warning: '%'-style
pattern rules are a GNU make extension
server-tools/instance-manager/Makefile.am:16: warning: 'INCLUDES' is
the old name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
sql-bench/Makefile.am:86: warning: '%'-style pattern rules are a GNU
make extension
sql-common/Makefile.am:20: warning: '%'-style pattern rules are a GNU
make extension
sql/Makefile.am:195: warning: '%'-style pattern rules are a GNU make extension
sql/Makefile.am:23: warning: 'INCLUDES' is the old name for
'AM_CPPFLAGS' (or '*_CPPFLAGS')
sql/share/Makefile.am:62: warning: '%'-style pattern rules are a GNU
make extension
storage/archive/Makefile.am:70: warning: '%'-style pattern rules are a
GNU make extension
storage/archive/Makefile.am:23: warning: 'INCLUDES' is the old name
for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/blackhole/Makefile.am:52: warning: '%'-style pattern rules are
a GNU make extension
storage/blackhole/Makefile.am:23: warning: 'INCLUDES' is the old name
for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/csv/Makefile.am:45: warning: '%'-style pattern rules are a GNU
make extension
storage/csv/Makefile.am:22: warning: 'INCLUDES' is the old name for
'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/example/Makefile.am:52: warning: '%'-style pattern rules are a
GNU make extension
storage/example/Makefile.am:23: warning: 'INCLUDES' is the old name
for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/federated/Makefile.am:52: warning: '%'-style pattern rules are
a GNU make extension
storage/federated/Makefile.am:23: warning: 'INCLUDES' is the old name
for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/federated/Makefile.am:47: warning: source file
'$(top_srcdir)/mysys/string.c' is in a subdirectory,
storage/federated/Makefile.am:47: but option 'subdir-objects' is disabled
storage/federated/Makefile.am:40: warning: source file
'$(top_srcdir)/mysys/string.c' is in a subdirectory,
storage/federated/Makefile.am:40: but option 'subdir-objects' is disabled
storage/heap/Makefile.am:55: warning: '%'-style pattern rules are a
GNU make extension
storage/heap/Makefile.am:20: warning: 'INCLUDES' is the old name for
'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/innobase/Makefile.am:175: warning: '%'-style pattern rules are
a GNU make extension
storage/innobase/Makefile.am:23: warning: 'INCLUDES' is the old name
for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/innobase/Makefile.am:127: warning: source file 'btr/btr0btr.c'
is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'btr/btr0cur.c'
is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'btr/btr0pcur.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'btr/btr0sea.c'
is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'buf/buf0buf.c'
is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'buf/buf0flu.c'
is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'buf/buf0lru.c'
is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'buf/buf0rea.c'
is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'data/data0data.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'data/data0type.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'dict/dict0boot.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'dict/dict0crea.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'dict/dict0dict.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'dict/dict0load.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'dict/dict0mem.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'dyn/dyn0dyn.c'
is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'eval/eval0eval.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'eval/eval0proc.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'fil/fil0fil.c'
is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'fsp/fsp0fsp.c'
is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'fut/fut0fut.c'
is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'fut/fut0lst.c'
is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'ha/ha0ha.c' is
in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'ha/hash0hash.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'ibuf/ibuf0ibuf.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'lock/lock0iter.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'lock/lock0lock.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'log/log0log.c'
is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'log/log0recv.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'mach/mach0data.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'mem/mem0mem.c'
is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'mem/mem0pool.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'mtr/mtr0log.c'
is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'mtr/mtr0mtr.c'
is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'os/os0file.c'
is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'os/os0proc.c'
is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'os/os0sync.c'
is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'os/os0thread.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'page/page0cur.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'page/page0page.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'pars/lexyy.c'
is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'pars/pars0grm.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'pars/pars0opt.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'pars/pars0pars.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'pars/pars0sym.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'que/que0que.c'
is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'read/read0read.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'rem/rem0cmp.c'
is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'rem/rem0rec.c'
is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'row/row0ins.c'
is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'row/row0mysql.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'row/row0purge.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'row/row0row.c'
is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'row/row0sel.c'
is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'row/row0uins.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'row/row0umod.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'row/row0undo.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'row/row0upd.c'
is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'row/row0vers.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'srv/srv0que.c'
is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'srv/srv0srv.c'
is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'srv/srv0start.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'sync/sync0arr.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'sync/sync0rw.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'sync/sync0sync.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'thr/thr0loc.c'
is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'trx/trx0purge.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'trx/trx0rec.c'
is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'trx/trx0roll.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'trx/trx0rseg.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'trx/trx0sys.c'
is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'trx/trx0trx.c'
is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'trx/trx0undo.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'usr/usr0sess.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'ut/ut0byte.c'
is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'ut/ut0dbg.c'
is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'ut/ut0list.c'
is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'ut/ut0mem.c'
is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'ut/ut0rnd.c'
is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'ut/ut0ut.c' is
in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file 'ut/ut0vec.c'
is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'ut/ut0wqueue.c' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innobase/Makefile.am:127: warning: source file
'handler/ha_innodb.cc' is in a subdirectory,
storage/innobase/Makefile.am:127: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:344: warning: '%'-style pattern
rules are a GNU make extension
storage/innodb_plugin/Makefile.am:23: warning: 'INCLUDES' is the old
name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/innodb_plugin/Makefile.am:233: warning: source file
'btr/btr0btr.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'btr/btr0cur.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'btr/btr0pcur.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'btr/btr0sea.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'buf/buf0buddy.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'buf/buf0buf.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'buf/buf0flu.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'buf/buf0lru.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'buf/buf0rea.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'data/data0data.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'data/data0type.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'dict/dict0boot.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'dict/dict0crea.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'dict/dict0dict.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'dict/dict0load.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'dict/dict0mem.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'dyn/dyn0dyn.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'eval/eval0eval.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'eval/eval0proc.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'fil/fil0fil.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'fsp/fsp0fsp.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'fut/fut0fut.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'fut/fut0lst.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'ha/ha0ha.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'ha/ha0storage.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'ha/hash0hash.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'handler/ha_innodb.cc' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'handler/handler0alter.cc' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'handler/i_s.cc' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'handler/mysql_addons.cc' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'ibuf/ibuf0ibuf.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'lock/lock0iter.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'lock/lock0lock.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'log/log0log.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'log/log0recv.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'mach/mach0data.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'mem/mem0mem.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'mem/mem0pool.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'mtr/mtr0log.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'mtr/mtr0mtr.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'os/os0file.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'os/os0proc.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'os/os0sync.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'os/os0thread.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'page/page0cur.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'page/page0page.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'page/page0zip.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'pars/lexyy.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'pars/pars0grm.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'pars/pars0opt.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'pars/pars0pars.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'pars/pars0sym.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'que/que0que.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'read/read0read.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'rem/rem0cmp.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'rem/rem0rec.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'row/row0ext.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'row/row0ins.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'row/row0merge.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'row/row0mysql.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'row/row0purge.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'row/row0row.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'row/row0sel.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'row/row0uins.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'row/row0umod.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'row/row0undo.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'row/row0upd.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'row/row0vers.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'srv/srv0que.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'srv/srv0srv.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'srv/srv0start.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'sync/sync0arr.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'sync/sync0rw.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'sync/sync0sync.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'thr/thr0loc.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'trx/trx0i_s.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'trx/trx0purge.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'trx/trx0rec.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'trx/trx0roll.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'trx/trx0rseg.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'trx/trx0sys.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'trx/trx0trx.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'trx/trx0undo.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'usr/usr0sess.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'ut/ut0byte.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'ut/ut0dbg.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'ut/ut0list.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'ut/ut0mem.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'ut/ut0rbt.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'ut/ut0rnd.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'ut/ut0ut.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'ut/ut0vec.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/innodb_plugin/Makefile.am:233: warning: source file
'ut/ut0wqueue.c' is in a subdirectory,
storage/innodb_plugin/Makefile.am:233: but option 'subdir-objects' is disabled
storage/myisam/Makefile.am:154: warning: '%'-style pattern rules are a
GNU make extension
storage/myisam/Makefile.am:20: warning: 'INCLUDES' is the old name for
'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/myisammrg/Makefile.am:44: warning: '%'-style pattern rules are
a GNU make extension
storage/myisammrg/Makefile.am:20: warning: 'INCLUDES' is the old name
for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/ndb/config/common.mk.am:28: warning: ':='-style assignments
are not portable
storage/ndb/Makefile.am:21:   'storage/ndb/config/common.mk.am'
included from here
storage/ndb/Makefile.am:49: warning: '%'-style pattern rules are a GNU
make extension
storage/ndb/config/common.mk.am:24: warning: 'INCLUDES' is the old
name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/ndb/Makefile.am:21:   'storage/ndb/config/common.mk.am'
included from here
storage/ndb/docs/Makefile.am:132: warning: '%'-style pattern rules are
a GNU make extension
storage/ndb/config/common.mk.am:28: warning: ':='-style assignments
are not portable
storage/ndb/include/Makefile.am:16:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/include/Makefile.am:68: warning: '%'-style pattern rules
are a GNU make extension
storage/ndb/config/common.mk.am:24: warning: 'INCLUDES' is the old
name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/ndb/include/Makefile.am:16:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/config/common.mk.am:28: warning: ':='-style assignments
are not portable
storage/ndb/src/Makefile.am:18:   'storage/ndb/config/common.mk.am'
included from here
storage/ndb/src/Makefile.am:53: warning: '%'-style pattern rules are a
GNU make extension
storage/ndb/config/common.mk.am:24: warning: 'INCLUDES' is the old
name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/ndb/src/Makefile.am:18:   'storage/ndb/config/common.mk.am'
included from here
storage/ndb/src/common/Makefile.am:33: warning: '%'-style pattern
rules are a GNU make extension
storage/ndb/config/common.mk.am:28: warning: ':='-style assignments
are not portable
storage/ndb/src/common/debugger/Makefile.am:22:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/src/common/debugger/Makefile.am:26: warning: '%'-style
pattern rules are a GNU make extension
storage/ndb/config/common.mk.am:24: warning: 'INCLUDES' is the old
name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/ndb/src/common/debugger/Makefile.am:22:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/config/common.mk.am:28: warning: ':='-style assignments
are not portable
storage/ndb/src/common/debugger/signaldata/Makefile.am:43:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/src/common/debugger/signaldata/Makefile.am:47: warning:
'%'-style pattern rules are a GNU make extension
storage/ndb/config/common.mk.am:24: warning: 'INCLUDES' is the old
name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/ndb/src/common/debugger/signaldata/Makefile.am:43:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/config/common.mk.am:28: warning: ':='-style assignments
are not portable
storage/ndb/src/common/logger/Makefile.am:22:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/src/common/logger/Makefile.am:26: warning: '%'-style
pattern rules are a GNU make extension
storage/ndb/config/common.mk.am:24: warning: 'INCLUDES' is the old
name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/ndb/src/common/logger/Makefile.am:22:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/config/common.mk.am:28: warning: ':='-style assignments
are not portable
storage/ndb/src/common/mgmcommon/Makefile.am:24:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/src/common/mgmcommon/Makefile.am:29: warning: '%'-style
pattern rules are a GNU make extension
storage/ndb/config/common.mk.am:24: warning: 'INCLUDES' is the old
name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/ndb/src/common/mgmcommon/Makefile.am:24:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/config/common.mk.am:28: warning: ':='-style assignments
are not portable
storage/ndb/src/common/portlib/Makefile.am:24:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/src/common/portlib/Makefile.am:59: warning: '%'-style
pattern rules are a GNU make extension
storage/ndb/config/common.mk.am:24: warning: 'INCLUDES' is the old
name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/ndb/src/common/portlib/Makefile.am:24:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/config/common.mk.am:28: warning: ':='-style assignments
are not portable
storage/ndb/src/common/transporter/Makefile.am:32:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/src/common/transporter/Makefile.am:36: warning: '%'-style
pattern rules are a GNU make extension
storage/ndb/config/common.mk.am:24: warning: 'INCLUDES' is the old
name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/ndb/src/common/transporter/Makefile.am:32:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/config/common.mk.am:28: warning: ':='-style assignments
are not portable
storage/ndb/src/common/util/Makefile.am:46:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/src/common/util/Makefile.am:50: warning: '%'-style pattern
rules are a GNU make extension
storage/ndb/config/common.mk.am:24: warning: 'INCLUDES' is the old
name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/ndb/src/common/util/Makefile.am:46:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/src/cw/Makefile.am:21: warning: '%'-style pattern rules
are a GNU make extension
storage/ndb/config/common.mk.am:28: warning: ':='-style assignments
are not portable
storage/ndb/src/cw/cpcd/Makefile.am:26:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/src/cw/cpcd/Makefile.am:32: warning: '%'-style pattern
rules are a GNU make extension
storage/ndb/config/common.mk.am:24: warning: 'INCLUDES' is the old
name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/ndb/src/cw/cpcd/Makefile.am:26:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/config/common.mk.am:28: warning: ':='-style assignments
are not portable
storage/ndb/src/kernel/Makefile.am:18:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/src/kernel/Makefile.am:75: warning: '%'-style pattern
rules are a GNU make extension
storage/ndb/config/common.mk.am:24: warning: 'INCLUDES' is the old
name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/ndb/src/kernel/Makefile.am:18:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/config/common.mk.am:28: warning: ':='-style assignments
are not portable
storage/ndb/src/kernel/blocks/Makefile.am:64:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/src/kernel/blocks/Makefile.am:68: warning: '%'-style
pattern rules are a GNU make extension
storage/ndb/src/kernel/blocks/Makefile.am:73: warning: '%'-style
pattern rules are a GNU make extension
storage/ndb/config/common.mk.am:24: warning: 'INCLUDES' is the old
name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/ndb/src/kernel/blocks/Makefile.am:64:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'cmvmi/Cmvmi.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dbacc/DbaccInit.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dbacc/DbaccMain.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dbdict/Dbdict.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dbdih/DbdihInit.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dbdih/DbdihMain.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dblqh/DblqhInit.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dblqh/DblqhMain.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dbtc/DbtcInit.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dbtc/DbtcMain.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dbtup/DbtupExecQuery.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dbtup/DbtupBuffer.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dbtup/DbtupRoutines.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dbtup/DbtupCommit.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dbtup/DbtupFixAlloc.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dbtup/DbtupTrigger.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dbtup/DbtupAbort.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dbtup/DbtupPageMap.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dbtup/DbtupPagMan.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dbtup/DbtupStoredProcDef.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dbtup/DbtupMeta.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dbtup/DbtupTabDesMan.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dbtup/DbtupGen.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dbtup/DbtupIndex.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dbtup/DbtupDebug.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dbtup/DbtupScan.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dbtup/DbtupDiskAlloc.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dbtup/DbtupVarAlloc.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dbtup/tuppage.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dbtup/Undo_buffer.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'ndbfs/AsyncFile.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'ndbfs/Ndbfs.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'ndbfs/VoidFs.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'ndbfs/Filename.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'ndbfs/CircularIndex.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'ndbcntr/NdbcntrInit.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'ndbcntr/NdbcntrSysTable.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'ndbcntr/NdbcntrMain.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'qmgr/QmgrInit.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'qmgr/QmgrMain.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'trix/Trix.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'backup/Backup.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'backup/BackupInit.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dbutil/DbUtil.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'suma/Suma.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'suma/SumaInit.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dbtux/DbtuxGen.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dbtux/DbtuxMeta.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dbtux/DbtuxMaint.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dbtux/DbtuxNode.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dbtux/DbtuxTree.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dbtux/DbtuxScan.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dbtux/DbtuxSearch.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dbtux/DbtuxCmp.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dbtux/DbtuxStat.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:26: warning: source file
'dbtux/DbtuxDebug.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:26: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/Makefile.am:57: warning: source file
'dbtup/tuppage.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/Makefile.am:57: but option
'subdir-objects' is disabled
storage/ndb/config/common.mk.am:28: warning: ':='-style assignments
are not portable
storage/ndb/src/kernel/blocks/backup/Makefile.am:24:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/src/kernel/blocks/backup/Makefile.am:28: warning:
'%'-style pattern rules are a GNU make extension
storage/ndb/config/common.mk.am:24: warning: 'INCLUDES' is the old
name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/ndb/src/kernel/blocks/backup/Makefile.am:24:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/config/common.mk.am:28: warning: ':='-style assignments
are not portable
storage/ndb/src/kernel/blocks/dbdict/Makefile.am:16:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/src/kernel/blocks/dbdict/Makefile.am:35: warning:
'%'-style pattern rules are a GNU make extension
storage/ndb/config/common.mk.am:24: warning: 'INCLUDES' is the old
name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/ndb/src/kernel/blocks/dbdict/Makefile.am:16:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/config/common.mk.am:28: warning: ':='-style assignments
are not portable
storage/ndb/src/kernel/blocks/dbdih/Makefile.am:25:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/src/kernel/blocks/dbdih/Makefile.am:29: warning: '%'-style
pattern rules are a GNU make extension
storage/ndb/config/common.mk.am:24: warning: 'INCLUDES' is the old
name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/ndb/src/kernel/blocks/dbdih/Makefile.am:25:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/config/common.mk.am:28: warning: ':='-style assignments
are not portable
storage/ndb/src/kernel/blocks/dblqh/Makefile.am:21:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/src/kernel/blocks/dblqh/Makefile.am:31: warning: '%'-style
pattern rules are a GNU make extension
storage/ndb/config/common.mk.am:24: warning: 'INCLUDES' is the old
name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/ndb/src/kernel/blocks/dblqh/Makefile.am:21:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/src/kernel/blocks/dblqh/Makefile.am:18: warning: source
file 'redoLogReader/records.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/dblqh/Makefile.am:18: but option
'subdir-objects' is disabled
storage/ndb/src/kernel/blocks/dblqh/Makefile.am:18: warning: source
file 'redoLogReader/reader.cpp' is in a subdirectory,
storage/ndb/src/kernel/blocks/dblqh/Makefile.am:18: but option
'subdir-objects' is disabled
storage/ndb/config/common.mk.am:28: warning: ':='-style assignments
are not portable
storage/ndb/src/kernel/blocks/dbtup/Makefile.am:16:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/src/kernel/blocks/dbtup/Makefile.am:28: warning: '%'-style
pattern rules are a GNU make extension
storage/ndb/config/common.mk.am:24: warning: 'INCLUDES' is the old
name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/ndb/src/kernel/blocks/dbtup/Makefile.am:16:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/config/common.mk.am:28: warning: ':='-style assignments
are not portable
storage/ndb/src/kernel/error/Makefile.am:22:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/src/kernel/error/Makefile.am:26: warning: '%'-style
pattern rules are a GNU make extension
storage/ndb/config/common.mk.am:24: warning: 'INCLUDES' is the old
name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/ndb/src/kernel/error/Makefile.am:22:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/config/common.mk.am:28: warning: ':='-style assignments
are not portable
storage/ndb/src/kernel/vm/Makefile.am:43:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/src/kernel/vm/Makefile.am:47: warning: '%'-style pattern
rules are a GNU make extension
storage/ndb/config/common.mk.am:24: warning: 'INCLUDES' is the old
name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/ndb/src/kernel/vm/Makefile.am:43:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/config/common.mk.am:28: warning: ':='-style assignments
are not portable
storage/ndb/src/mgmapi/Makefile.am:27:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/src/mgmapi/Makefile.am:33: warning: '%'-style pattern
rules are a GNU make extension
storage/ndb/config/common.mk.am:24: warning: 'INCLUDES' is the old
name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/ndb/src/mgmapi/Makefile.am:27:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/src/mgmapi/Makefile.am:20: warning: source file
'../kernel/error/ndbd_exit_codes.c' is in a subdirectory,
storage/ndb/src/mgmapi/Makefile.am:20: but option 'subdir-objects' is disabled
storage/ndb/src/mgmapi/Makefile.am:20: warning: source file
'../mgmsrv/ConfigInfo.cpp' is in a subdirectory,
storage/ndb/src/mgmapi/Makefile.am:20: but option 'subdir-objects' is disabled
storage/ndb/config/common.mk.am:28: warning: ':='-style assignments
are not portable
storage/ndb/src/mgmclient/Makefile.am:30:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/src/mgmclient/Makefile.am:48: warning: '%'-style pattern
rules are a GNU make extension
storage/ndb/config/common.mk.am:24: warning: 'INCLUDES' is the old
name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/ndb/src/mgmclient/Makefile.am:30:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/config/common.mk.am:28: warning: ':='-style assignments
are not portable
storage/ndb/src/mgmsrv/Makefile.am:56:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/src/mgmsrv/Makefile.am:62: warning: '%'-style pattern
rules are a GNU make extension
storage/ndb/config/common.mk.am:24: warning: 'INCLUDES' is the old
name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/ndb/src/mgmsrv/Makefile.am:56:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/config/common.mk.am:28: warning: ':='-style assignments
are not portable
storage/ndb/src/ndbapi/Makefile.am:66:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/src/ndbapi/Makefile.am:75: warning: '%'-style pattern
rules are a GNU make extension
storage/ndb/config/common.mk.am:24: warning: 'INCLUDES' is the old
name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/ndb/src/ndbapi/Makefile.am:66:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/test/Makefile.am:26: warning: '%'-style pattern rules are
a GNU make extension
storage/ndb/config/common.mk.am:28: warning: ':='-style assignments
are not portable
storage/ndb/test/ndbapi/Makefile.am:116:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/test/ndbapi/Makefile.am:129: warning: '%'-style pattern
rules are a GNU make extension
storage/ndb/config/common.mk.am:24: warning: 'INCLUDES' is the old
name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/ndb/test/ndbapi/Makefile.am:116:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/test/ndbapi/Makefile.am:108: warning: source file
'bench/mainAsyncGenerator.cpp' is in a subdirectory,
storage/ndb/test/ndbapi/Makefile.am:108: but option 'subdir-objects' is disabled
storage/ndb/test/ndbapi/Makefile.am:108: warning: source file
'bench/asyncGenerator.cpp' is in a subdirectory,
storage/ndb/test/ndbapi/Makefile.am:108: but option 'subdir-objects' is disabled
storage/ndb/test/ndbapi/Makefile.am:108: warning: source file
'bench/ndb_async2.cpp' is in a subdirectory,
storage/ndb/test/ndbapi/Makefile.am:108: but option 'subdir-objects' is disabled
storage/ndb/test/ndbapi/Makefile.am:107: warning: source file
'bench/mainPopulate.cpp' is in a subdirectory,
storage/ndb/test/ndbapi/Makefile.am:107: but option 'subdir-objects' is disabled
storage/ndb/test/ndbapi/Makefile.am:107: warning: source file
'bench/dbPopulate.cpp' is in a subdirectory,
storage/ndb/test/ndbapi/Makefile.am:107: but option 'subdir-objects' is disabled
storage/ndb/test/ndbapi/Makefile.am:107: warning: source file
'bench/userInterface.cpp' is in a subdirectory,
storage/ndb/test/ndbapi/Makefile.am:107: but option 'subdir-objects' is disabled
storage/ndb/test/ndbapi/Makefile.am:106: warning: source file
'acrt/NdbRepStress.cpp' is in a subdirectory,
storage/ndb/test/ndbapi/Makefile.am:106: but option 'subdir-objects' is disabled
storage/ndb/config/common.mk.am:28: warning: ':='-style assignments
are not portable
storage/ndb/test/ndbapi/bank/Makefile.am:32:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/test/ndbapi/bank/Makefile.am:36: warning: '%'-style
pattern rules are a GNU make extension
storage/ndb/config/common.mk.am:24: warning: 'INCLUDES' is the old
name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/ndb/test/ndbapi/bank/Makefile.am:32:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/config/common.mk.am:28: warning: ':='-style assignments
are not portable
storage/ndb/test/run-test/Makefile.am:20:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/test/run-test/Makefile.am:56: warning: '%'-style pattern
rules are a GNU make extension
storage/ndb/config/common.mk.am:24: warning: 'INCLUDES' is the old
name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/ndb/test/run-test/Makefile.am:20:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/config/common.mk.am:28: warning: ':='-style assignments
are not portable
storage/ndb/test/src/Makefile.am:31:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/test/src/Makefile.am:35: warning: '%'-style pattern rules
are a GNU make extension
storage/ndb/config/common.mk.am:24: warning: 'INCLUDES' is the old
name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/ndb/test/src/Makefile.am:31:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/config/common.mk.am:28: warning: ':='-style assignments
are not portable
storage/ndb/test/tools/Makefile.am:40:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/test/tools/Makefile.am:47: warning: '%'-style pattern
rules are a GNU make extension
storage/ndb/config/common.mk.am:24: warning: 'INCLUDES' is the old
name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/ndb/test/tools/Makefile.am:40:
'storage/ndb/config/common.mk.am' included from here
storage/ndb/config/common.mk.am:28: warning: ':='-style assignments
are not portable
storage/ndb/tools/Makefile.am:63:   'storage/ndb/config/common.mk.am'
included from here
storage/ndb/tools/Makefile.am:79: warning: '%'-style pattern rules are
a GNU make extension
storage/ndb/config/common.mk.am:24: warning: 'INCLUDES' is the old
name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
storage/ndb/tools/Makefile.am:63:   'storage/ndb/config/common.mk.am'
included from here
storage/ndb/tools/Makefile.am:53: warning: source file
'../src/mgmsrv/Config.cpp' is in a subdirectory,
storage/ndb/tools/Makefile.am:53: but option 'subdir-objects' is disabled
storage/ndb/tools/Makefile.am:53: warning: source file
'../src/mgmsrv/ConfigInfo.cpp' is in a subdirectory,
storage/ndb/tools/Makefile.am:53: but option 'subdir-objects' is disabled
storage/ndb/tools/Makefile.am:53: warning: source file
'../src/mgmsrv/InitConfigFileParser.cpp' is in a subdirectory,
storage/ndb/tools/Makefile.am:53: but option 'subdir-objects' is disabled
storage/ndb/tools/Makefile.am:31: warning: source file
'../test/src/NDBT_ReturnCodes.cpp' is in a subdirectory,
storage/ndb/tools/Makefile.am:31: but option 'subdir-objects' is disabled
storage/ndb/tools/Makefile.am:31: warning: source file
'../test/src/NDBT_Table.cpp' is in a subdirectory,
storage/ndb/tools/Makefile.am:31: but option 'subdir-objects' is disabled
storage/ndb/tools/Makefile.am:31: warning: source file
'../test/src/NDBT_Output.cpp' is in a subdirectory,
storage/ndb/tools/Makefile.am:31: but option 'subdir-objects' is disabled
storage/ndb/tools/Makefile.am:46: warning: source file
'restore/restore_main.cpp' is in a subdirectory,
storage/ndb/tools/Makefile.am:46: but option 'subdir-objects' is disabled
storage/ndb/tools/Makefile.am:46: warning: source file
'restore/consumer.cpp' is in a subdirectory,
storage/ndb/tools/Makefile.am:46: but option 'subdir-objects' is disabled
storage/ndb/tools/Makefile.am:46: warning: source file
'restore/consumer_restore.cpp' is in a subdirectory,
storage/ndb/tools/Makefile.am:46: but option 'subdir-objects' is disabled
storage/ndb/tools/Makefile.am:46: warning: source file
'restore/consumer_printer.cpp' is in a subdirectory,
storage/ndb/tools/Makefile.am:46: but option 'subdir-objects' is disabled
storage/ndb/tools/Makefile.am:46: warning: source file
'restore/Restore.cpp' is in a subdirectory,
storage/ndb/tools/Makefile.am:46: but option 'subdir-objects' is disabled
storage/ndb/tools/Makefile.am:46: warning: source file
'../test/src/NDBT_ResultRow.cpp' is in a subdirectory,
storage/ndb/tools/Makefile.am:46: but option 'subdir-objects' is disabled
storage/ndb/tools/Makefile.am:42: warning: source file
'../test/src/NDBT_ResultRow.cpp' is in a subdirectory,
storage/ndb/tools/Makefile.am:42: but option 'subdir-objects' is disabled
strings/Makefile.am:84: warning: '%'-style pattern rules are a GNU
make extension
strings/Makefile.am:18: warning: 'INCLUDES' is the old name for
'AM_CPPFLAGS' (or '*_CPPFLAGS')
support-files/MacOSX/Makefile.am:57: warning: '%'-style pattern rules
are a GNU make extension
support-files/Makefile.am:133: warning: '%'-style pattern rules are a
GNU make extension
support-files/RHEL4-SElinux/Makefile.am:23: warning: '%'-style pattern
rules are a GNU make extension
tests/Makefile.am:67: warning: '%'-style pattern rules are a GNU make extension
tests/Makefile.am:41: warning: 'INCLUDES' is the old name for
'AM_CPPFLAGS' (or '*_CPPFLAGS')
tests/Makefile.am:48: warning: source file
'$(top_srcdir)/mysys/my_memmem.c' is in a subdirectory,
tests/Makefile.am:48: but option 'subdir-objects' is disabled
unittest/Makefile.am:30: warning: '%'-style pattern rules are a GNU
make extension
unittest/examples/Makefile.am:27: warning: '%'-style pattern rules are
a GNU make extension
unittest/my_decimal/Makefile.am:32: warning: '%'-style pattern rules
are a GNU make extension
unittest/mysys/Makefile.am:27: warning: '%'-style pattern rules are a
GNU make extension
unittest/mytap/Makefile.am:26: warning: '%'-style pattern rules are a
GNU make extension
unittest/mytap/t/Makefile.am:25: warning: '%'-style pattern rules are
a GNU make extension
unittest/strings/Makefile.am:27: warning: '%'-style pattern rules are
a GNU make extension
vio/Makefile.am:28: warning: '%'-style pattern rules are a GNU make extension
vio/Makefile.am:16: warning: 'INCLUDES' is the old name for
'AM_CPPFLAGS' (or '*_CPPFLAGS')
win/Makefile.am:23: warning: '%'-style pattern rules are a GNU make extension
zlib/Makefile.am:38: warning: '%'-style pattern rules are a GNU make extension
zlib/Makefile.am:18: warning: 'INCLUDES' is the old name for
'AM_CPPFLAGS' (or '*_CPPFLAGS')
