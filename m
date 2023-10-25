Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4830C0032E
	for <buildroot@archiver.kernel.org>; Wed, 25 Oct 2023 20:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4AEBB404C1;
	Wed, 25 Oct 2023 20:46:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AEBB404C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6oxkzXU-Tzmo; Wed, 25 Oct 2023 20:46:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4DE5404F4;
	Wed, 25 Oct 2023 20:46:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4DE5404F4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 17B631BF476
 for <buildroot@lists.busybox.net>; Wed, 25 Oct 2023 20:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E525F60BB6
 for <buildroot@lists.busybox.net>; Wed, 25 Oct 2023 20:46:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E525F60BB6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JWT7b0aUzCih for <buildroot@lists.busybox.net>;
 Wed, 25 Oct 2023 20:46:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C0B9260BB9
 for <buildroot@uclibc.org>; Wed, 25 Oct 2023 20:46:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0B9260BB9
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id A0B7485EDB; Wed, 25 Oct 2023 20:46:49 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Wed, 25 Oct 2023 20:46:49 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: marcus.hoffmann@othermo.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 target_milestone
Message-ID: <bug-15826-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 15826] New: nodejs modules with native extensions
 fail to install
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://bugs.busybox.net/show_bug.cgi?id=15826

            Bug ID: 15826
           Summary: nodejs modules with native extensions fail to install
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned@buildroot.uclibc.org
          Reporter: marcus.hoffmann@othermo.de
                CC: buildroot@uclibc.org
  Target Milestone: ---

On current master installing a nodejs module with native extionsion (i.e.
serialport) fails with some node-gyp errors. I suspect this got broken by the
nodejs-src/nodejs-bin split.

I'm building the the raspberrypi4_64_defconfig with the following
changes/additions:

```
BR2_CCACHE=y
BR2_PACKAGE_NODEJS=y
BR2_PACKAGE_NODEJS_MODULES_ADDITIONAL="serialport"
BR2_TARGET_ROOTFS_EXT2_SIZE="300M"
```

Error is the following:
```
# If you're having trouble with module installation, adding -d to the
# npm install call below and setting npm_config_rollback=false can both
# help in diagnosing the problem.
PATH="/home/marcus/repos/buildroot-upstream/output/host/bin:/home/marcus/repos/buildroot-upstream/output/host/sbin:/home/marcus/.local/bin:/home/marcus/bin:/home/marcus/.pyenv/shims:/home/marcus/.cargo/bin:/home/marcus/.pyenv/bin:/home/marcus/bin:/home/marcus/.local/bin:/home/marcus/.local/bin:/home/marcus/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
AR="/home/marcus/repos/buildroot-upstream/output/host/bin/aarch64-buildroot-linux-gnu-gcc-ar"
AS="/home/marcus/repos/buildroot-upstream/output/host/bin/aarch64-buildroot-linux-gnu-as"
LD="/home/marcus/repos/buildroot-upstream/output/host/bin/aarch64-buildroot-linux-gnu-ld"
NM="/home/marcus/repos/buildroot-upstream/output/host/bin/aarch64-buildroot-linux-gnu-gcc-nm"
CC="/home/marcus/repos/buildroot-upstream/output/host/bin/aarch64-buildroot-linux-gnu-gcc"
GCC="/home/marcus/repos/buildroot-upstream/output/host/bin/aarch64-buildroot-linux-gnu-gcc"
CPP="/home/marcus/repos/buildroot-upstream/output/host/bin/aarch64-buildroot-linux-gnu-cpp"
CXX="/home/marcus/repos/buildroot-upstream/output/host/bin/aarch64-buildroot-linux-gnu-g++"
FC="/home/marcus/repos/buildroot-upstream/output/host/bin/aarch64-buildroot-linux-gnu-gfortran"
F77="/home/marcus/repos/buildroot-upstream/output/host/bin/aarch64-buildroot-linux-gnu-gfortran"
RANLIB="/home/marcus/repos/buildroot-upstream/output/host/bin/aarch64-buildroot-linux-gnu-gcc-ranlib"
READELF="/home/marcus/repos/buildroot-upstream/output/host/bin/aarch64-buildroot-linux-gnu-readelf"
STRIP="/home/marcus/repos/buildroot-upstream/output/host/bin/aarch64-buildroot-linux-gnu-strip"
OBJCOPY="/home/marcus/repos/buildroot-upstream/output/host/bin/aarch64-buildroot-linux-gnu-objcopy"
OBJDUMP="/home/marcus/repos/buildroot-upstream/output/host/bin/aarch64-buildroot-linux-gnu-objdump"
AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
CC_FOR_BUILD="/home/marcus/repos/buildroot-upstream/output/host/bin/ccache
/usr/bin/gcc"
GCC_FOR_BUILD="/home/marcus/repos/buildroot-upstream/output/host/bin/ccache
/usr/bin/gcc"
CXX_FOR_BUILD="/home/marcus/repos/buildroot-upstream/output/host/bin/ccache
/usr/bin/g++" LD_FOR_BUILD="/usr/bin/ld"
CPPFLAGS_FOR_BUILD="-I/home/marcus/repos/buildroot-upstream/output/host/include"
CFLAGS_FOR_BUILD="-O2
-I/home/marcus/repos/buildroot-upstream/output/host/include"
CXXFLAGS_FOR_BUILD="-O2
-I/home/marcus/repos/buildroot-upstream/output/host/include"
LDFLAGS_FOR_BUILD="-L/home/marcus/repos/buildroot-upstream/output/host/lib
-Wl,-rpath,/home/marcus/repos/buildroot-upstream/output/host/lib"
FCFLAGS_FOR_BUILD=""
DEFAULT_ASSEMBLER="/home/marcus/repos/buildroot-upstream/output/host/bin/aarch64-buildroot-linux-gnu-as"
DEFAULT_LINKER="/home/marcus/repos/buildroot-upstream/output/host/bin/aarch64-buildroot-linux-gnu-ld"
CPPFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64"
CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os
-g0 -D_FORTIFY_SOURCE=1" CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64  -Os -g0 -D_FORTIFY_SOURCE=1" LDFLAGS="" FCFLAGS=" -Os
-g0" FFLAGS=" -Os -g0"
PKG_CONFIG="/home/marcus/repos/buildroot-upstream/output/host/bin/pkg-config"
STAGING_DIR="/home/marcus/repos/buildroot-upstream/output/host/aarch64-buildroot-linux-gnu/sysroot"
INTLTOOL_PERL=/usr/bin/perl LDFLAGS=""
LD="/home/marcus/repos/buildroot-upstream/output/host/bin/aarch64-buildroot-linux-gnu-g++"
npm_config_arch= npm_config_target_arch= npm_config_build_from_source=true
npm_config_nodedir=/home/marcus/repos/buildroot-upstream/output/build/nodejs-
npm_config_prefix=/home/marcus/repos/buildroot-upstream/output/target/usr
npm_config_cache=/home/marcus/repos/buildroot-upstream/output/build/.npm-cache
/home/marcus/repos/buildroot-upstream/output/host/bin/npm install -g
node-red@3.1.0 serialport
npm notice 
npm notice New major version of npm available! 8.19.4 -> 10.2.1
npm notice Changelog: https://github.com/npm/cli/releases/tag/v10.2.1
npm notice Run npm install -g npm@10.2.1 to update!
npm notice 
npm ERR! code 1
npm ERR! path
/home/marcus/repos/buildroot-upstream/output/target/usr/lib/node_modules/serialport/node_modules/@serialport/bindings-cpp
npm ERR! command failed
npm ERR! command sh -c -- node-gyp-build
npm ERR! gyp info it worked if it ends with ok
npm ERR! gyp info using node-gyp@9.1.0
npm ERR! gyp info using node@16.20.0 | linux | x64
npm ERR! gyp info find Python using Python version 3.11.6 found at
"/home/marcus/repos/buildroot-upstream/output/host/bin/python3"
npm ERR! gyp WARN read config.gypi ENOENT: no such file or directory, open
'/home/marcus/repos/buildroot-upstream/output/build/nodejs-/include/node/config.gypi'
npm ERR! gyp info spawn
/home/marcus/repos/buildroot-upstream/output/host/bin/python3
npm ERR! gyp info spawn args [
npm ERR! gyp info spawn args  
'/home/marcus/repos/buildroot-upstream/output/host/lib/node_modules/npm/node_modules/node-gyp/gyp/gyp_main.py',
npm ERR! gyp info spawn args   'binding.gyp',
npm ERR! gyp info spawn args   '-f',
npm ERR! gyp info spawn args   'make',
npm ERR! gyp info spawn args   '-I',
npm ERR! gyp info spawn args  
'/home/marcus/repos/buildroot-upstream/output/target/usr/lib/node_modules/serialport/node_modules/@serialport/bindings-cpp/build/config.gypi',
npm ERR! gyp info spawn args   '-I',
npm ERR! gyp info spawn args  
'/home/marcus/repos/buildroot-upstream/output/host/lib/node_modules/npm/node_modules/node-gyp/addon.gypi',
npm ERR! gyp info spawn args   '-I',
npm ERR! gyp info spawn args  
'/home/marcus/repos/buildroot-upstream/output/build/nodejs-/common.gypi',
npm ERR! gyp info spawn args   '-Dlibrary=shared_library',
npm ERR! gyp info spawn args   '-Dvisibility=default',
npm ERR! gyp info spawn args  
'-Dnode_root_dir=/home/marcus/repos/buildroot-upstream/output/build/nodejs-',
npm ERR! gyp info spawn args  
'-Dnode_gyp_dir=/home/marcus/repos/buildroot-upstream/output/host/lib/node_modules/npm/node_modules/node-gyp',
npm ERR! gyp info spawn args  
'-Dnode_lib_file=/home/marcus/repos/buildroot-upstream/output/build/nodejs-/$(Configuration)/node.lib',
npm ERR! gyp info spawn args  
'-Dmodule_root_dir=/home/marcus/repos/buildroot-upstream/output/target/usr/lib/node_modules/serialport/node_modules/@serialport/bindings-cpp',
npm ERR! gyp info spawn args   '-Dnode_engine=v8',
npm ERR! gyp info spawn args   '--depth=.',
npm ERR! gyp info spawn args   '--no-parallel',
npm ERR! gyp info spawn args   '--generator-output',
npm ERR! gyp info spawn args   'build',
npm ERR! gyp info spawn args   '-Goutput_dir=.'
npm ERR! gyp info spawn args ]
npm ERR! gyp:
/home/marcus/repos/buildroot-upstream/output/build/nodejs-/common.gypi not
found (cwd:
/home/marcus/repos/buildroot-upstream/output/target/usr/lib/node_modules/serialport/node_modules/@serialport/bindings-cpp)
while reading includes of binding.gyp while trying to load binding.gyp
npm ERR! gyp ERR! configure error 
npm ERR! gyp ERR! stack Error: `gyp` failed with exit code: 1
npm ERR! gyp ERR! stack     at ChildProcess.onCpExit
(/home/marcus/repos/buildroot-upstream/output/host/lib/node_modules/npm/node_modules/node-gyp/lib/configure.js:284:16)
npm ERR! gyp ERR! stack     at ChildProcess.emit (node:events:513:28)
npm ERR! gyp ERR! stack     at Process.ChildProcess._handle.onexit
(node:internal/child_process:293:12)
npm ERR! gyp ERR! System Linux 6.2.0-10027-tuxedo
npm ERR! gyp ERR! command
"/home/marcus/repos/buildroot-upstream/output/host/bin/node"
"/home/marcus/repos/buildroot-upstream/output/host/lib/node_modules/npm/node_modules/node-gyp/bin/node-gyp.js"
"rebuild"
npm ERR! gyp ERR! cwd
/home/marcus/repos/buildroot-upstream/output/target/usr/lib/node_modules/serialport/node_modules/@serialport/bindings-cpp
npm ERR! gyp ERR! node -v v16.20.0
npm ERR! gyp ERR! node-gyp -v v9.1.0
npm ERR! gyp ERR! not ok

npm ERR! A complete log of this run can be found in:
npm ERR!    
/home/marcus/repos/buildroot-upstream/output/build/.npm-cache/_logs/2023-10-25T20_44_09_239Z-debug-0.log
make[1]: *** [package/pkg-generic.mk:374:
/home/marcus/repos/buildroot-upstream/output/build/nodejs-src-16.20.0/.stamp_target_installed]
Error 1
make: *** [Makefile:82: _all] Error 2
```

The culprit seems to be 

> gyp: /home/marcus/repos/buildroot-upstream/output/build/nodejs-/common.gypi not found

Where specifically the 'nodejs-' part of the path looks wrong.

Installing this module works correctly on 2023.8.2 and 2023.02.6. (It's using
prebuilts there though maybe and we never invoke node-gyp because of that?)

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
