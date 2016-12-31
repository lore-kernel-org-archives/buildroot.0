From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 31 Dec 2016 02:31:44 +0000
Subject: [Buildroot] [Bug 9531] NPM fails to build embedded modules
In-Reply-To: <bug-9531-163@https.bugs.busybox.net/>
References: <bug-9531-163@https.bugs.busybox.net/>
Message-ID: <bug-9531-163-yI1GkkGBif@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9531

--- Comment #6 from bilge at scriptfusion.com ---
Hi Peter, unfortunately I cannot stop producing this error. I do not believe
this is related to `env` on the target at all because I just spent the entire
day upgrading my toolchain and rebuilding everything to find exactly the same
error is produced even when `env` is successfully built and installed to the
target prior to running the NPM module build process.

NPM tries to run the following command:

PATH="/root/buildroot-2016.11/output/host/bin:/root/buildroot-2016.11/output/host/sbin:/root/buildroot-2016.11/output/host/usr/bin:/root/buildroot-2016.11/output/host/usr/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
AR="/root/buildroot-2016.11/output/host/usr/bin/x86_64-nano-linux-uclibc-ar"
AS="/root/buildroot-2016.11/output/host/usr/bin/x86_64-nano-linux-uclibc-as"
LD="/root/buildroot-2016.11/output/host/usr/bin/x86_64-nano-linux-uclibc-ld"
NM="/root/buildroot-2016.11/output/host/usr/bin/x86_64-nano-linux-uclibc-nm"
CC="/root/buildroot-2016.11/output/host/usr/bin/x86_64-nano-linux-uclibc-gcc"
GCC="/root/buildroot-2016.11/output/host/usr/bin/x86_64-nano-linux-uclibc-gcc"
CPP="/root/buildroot-2016.11/output/host/usr/bin/x86_64-nano-linux-uclibc-cpp"
CXX="/root/buildroot-2016.11/output/host/usr/bin/x86_64-nano-linux-uclibc-g++"
FC="/root/buildroot-2016.11/output/host/usr/bin/x86_64-nano-linux-uclibc-gfortran"
F77="/root/buildroot-2016.11/output/host/usr/bin/x86_64-nano-linux-uclibc-gfortran"
RANLIB="/root/buildroot-2016.11/output/host/usr/bin/x86_64-nano-linux-uclibc-ranlib"
READELF="/root/buildroot-2016.11/output/host/usr/bin/x86_64-nano-linux-uclibc-readelf"
STRIP="/root/buildroot-2016.11/output/host/usr/bin/x86_64-nano-linux-uclibc-strip"
OBJCOPY="/root/buildroot-2016.11/output/host/usr/bin/x86_64-nano-linux-uclibc-objcopy"
OBJDUMP="/root/buildroot-2016.11/output/host/usr/bin/x86_64-nano-linux-uclibc-objdump"
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc"
CXX_FOR_BUILD="/usr/bin/g++" LD_FOR_BUILD="/usr/bin/ld"
CPPFLAGS_FOR_BUILD="-I/root/buildroot-2016.11/output/host/usr/include"
CFLAGS_FOR_BUILD="-O2 -I/root/buildroot-2016.11/output/host/usr/include"
CXXFLAGS_FOR_BUILD="-O2 -I/root/buildroot-2016.11/output/host/usr/include"
LDFLAGS_FOR_BUILD="-L/root/buildroot-2016.11/output/host/lib
-L/root/buildroot-2016.11/output/host/usr/lib
-Wl,-rpath,/root/buildroot-2016.11/output/host/usr/lib" FCFLAGS_FOR_BUILD=""
DEFAULT_ASSEMBLER="/root/buildroot-2016.11/output/host/usr/bin/x86_64-nano-linux-uclibc-as"
DEFAULT_LINKER="/root/buildroot-2016.11/output/host/usr/bin/x86_64-nano-linux-uclibc-ld"
CPPFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os "
CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os
" LDFLAGS="" FCFLAGS=" -Os " FFLAGS=" -Os "
PKG_CONFIG="/root/buildroot-2016.11/output/host/usr/bin/pkg-config"
STAGING_DIR="/root/buildroot-2016.11/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot"
INTLTOOL_PERL=/usr/bin/perl
LD="/root/buildroot-2016.11/output/host/usr/bin/x86_64-nano-linux-uclibc-g++"
npm_config_arch=x64 npm_config_target_arch=x64
npm_config_build_from_source=true
npm_config_nodedir=/root/buildroot-2016.11/output/build/nodejs-6.9.2
npm_config_prefix=/root/buildroot-2016.11/output/target/usr
/root/buildroot-2016.11/output/host/usr/bin/npm install -g ghost at 0.11.3

Which spits out the same errors mentioned previously:

npm WARN lifecycle ghost at 0.11.3~preinstall: cannot run in wd %s %s (wd=%s)
ghost at 0.11.3 node core/server/utils/npm/preinstall.js
/root/buildroot-2016.11/output/target/usr/lib/node_modules/.staging/ghost-88d37318

> sqlite3 at 3.1.8 install /root/buildroot-2016.11/output/target/usr/lib/node_modules/ghost/node_modules/sqlite3
> node-pre-gyp install --fallback-to-build

sh: 1: node-pre-gyp: Permission denied
/root/buildroot-2016.11/output/target/usr/lib
`-- (empty)

npm ERR! Linux 3.13.0-68-generic
npm ERR! argv "/root/buildroot-2016.11/output/host/usr/bin/node"
"/root/buildroot-2016.11/output/host/usr/bin/npm" "install" "-g" "ghost at 0.11.3"
npm ERR! node v6.9.2
npm ERR! npm  v3.10.9
npm ERR! file sh
npm ERR! code ELIFECYCLE
npm ERR! errno ENOENT
npm ERR! syscall spawn

npm ERR! sqlite3 at 3.1.8 install: `node-pre-gyp install --fallback-to-build`
npm ERR! spawn ENOENT
npm ERR!
npm ERR! Failed at the sqlite3 at 3.1.8 install script 'node-pre-gyp install
--fallback-to-build'.
npm ERR! Make sure you have the latest version of node.js and npm installed.
npm ERR! If you do, this is most likely a problem with the sqlite3 package,
npm ERR! not with npm itself.
npm ERR! Tell the author that this fails on your system:
npm ERR!     node-pre-gyp install --fallback-to-build
npm ERR! You can get information on how to open an issue for this project with:
npm ERR!     npm bugs sqlite3
npm ERR! Or if that isn't available, you can get their info via:
npm ERR!     npm owner ls sqlite3
npm ERR! There is likely additional logging output above.

npm ERR! Please include the following file with any support request:
npm ERR!     /root/buildroot-2016.11/package/nodejs/npm-debug.log
npm ERR! code 1

As before, simply removing the `-g` flag results in a successful build in
whatever the working directory happens to be. This is true for literally any
directory because I'm root and I can write everywhere, so I do not understand
where the "sh: 1: node-pre-gyp: Permission denied" error comes from when the
`-g` flag is specified.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
