From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 15:53:12 +0100
Subject: [Buildroot] [git commit] package/softether: New package
Message-ID: <20150308145357.62F787F9F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6aa6a84de0c08da282c443c7688409ce3c1a0edf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Package description was copied from
https://launchpad.net/~dajhorn/+archive/ubuntu/softether/

[Thomas:
 - reorganize patches by pulling the two biggest patches from Github,
   and only having the remaining patches in Buildroot.
 - use a full destination path when installing hamcorebuilder in
   $(HOST_DIR)/usr/bin.
 - minor reformatting.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    1 +
 .../0001-use-fhs-install-directories.patch         |  318 ++++++++++++++++++++
 ...orking-softetherd-for-upstart-and-systemd.patch |  218 ++++++++++++++
 ...xeDir-to-GetStateDir-in-Cedar-and-Mayaqua.patch |   90 ++++++
 package/softether/0004-cross-compile.patch         |   30 ++
 package/softether/0005-iconv.patch                 |   28 ++
 package/softether/Config.in                        |   28 ++
 package/softether/softether.mk                     |   42 +++
 8 files changed, 755 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 1bce00a..cab9382 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1203,6 +1203,7 @@ endif
 	source "package/smcroute/Config.in"
 	source "package/socat/Config.in"
 	source "package/socketcand/Config.in"
+	source "package/softether/Config.in"
 	source "package/spawn-fcgi/Config.in"
 	source "package/spice/Config.in"
 	source "package/spice-protocol/Config.in"
diff --git a/package/softether/0001-use-fhs-install-directories.patch b/package/softether/0001-use-fhs-install-directories.patch
new file mode 100644
index 0000000..c489cc1
--- /dev/null
+++ b/package/softether/0001-use-fhs-install-directories.patch
@@ -0,0 +1,318 @@
+From b9420c3bfc2a8b9d35d0c8e5f6849007c2bc21fa Mon Sep 17 00:00:00 2001
+From: Darik Horn <dajhorn@vanadac.com>
+Date: Mon, 14 Apr 2014 13:22:24 -0400
+Subject: [PATCH] Use FHS installation directories.
+
+Install to `/usr/sbin`, `/usr/lib`, and `/var/lib` according to the Linux
+filesystem hierarchy standard if SoftEther is built through autotools.
+
+In a managed installation, the FHS stipulates that the application must
+accomodate a read-only installation path.  This requires a new `GetStateDir`
+function that substitues `GetExeDir` in some parts of the code.
+
+Taken from Github at
+https://github.com/dajhorn/SoftEtherVPN/commit/b9420c3bfc2a8b9d35d0c8e5f6849007c2bc21fa.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ autotools/softether.am      |  1 +
+ src/Cedar/Admin.c           |  2 +-
+ src/Cedar/Command.c         |  6 +++++-
+ src/Cedar/Logging.c         |  2 +-
+ src/Cedar/Server.c          |  4 ++--
+ src/Mayaqua/Encrypt.c       |  2 +-
+ src/Mayaqua/FileIO.c        | 39 ++++++++++++++++++++++++++++++++++++---
+ src/Mayaqua/FileIO.h        |  2 ++
+ src/Mayaqua/Mayaqua.c       |  4 ++++
+ src/Mayaqua/Table.c         |  6 +++++-
+ src/Mayaqua/Unix.c          |  6 +++---
+ src/bin/hamcore/Makefile.am |  8 ++++++--
+ 12 files changed, 67 insertions(+), 15 deletions(-)
+
+Index: b/autotools/softether.am
+===================================================================
+--- a/autotools/softether.am
++++ b/autotools/softether.am
+@@ -27,6 +27,7 @@
+ 	-I$(top_srcdir)/src \
+ 	-I$(top_srcdir)/src/Mayaqua \
+ 	-I$(top_srcdir)/src/Cedar \
++	-DSTATE_DIR='"@localstatedir@/lib/softether"' \
+ 	-DUNIX \
+ 	-DUNIX_LINUX \
+ 	-D_REENTRANT \
+Index: b/src/Cedar/Admin.c
+===================================================================
+--- a/src/Cedar/Admin.c
++++ b/src/Cedar/Admin.c
+@@ -10334,7 +10334,7 @@
+ 
+ 	Zero(t, sizeof(RPC_READ_LOG_FILE));
+ 
+-	GetExeDir(exe_dir, sizeof(exe_dir));
++	GetStateDir(exe_dir, sizeof(exe_dir));
+ 	Format(full_path, sizeof(full_path), "%s/%s", exe_dir, filepath);
+ 
+ 	// Read file
+Index: b/src/Cedar/Command.c
+===================================================================
+--- a/src/Cedar/Command.c
++++ b/src/Cedar/Command.c
+@@ -527,7 +527,7 @@
+ 	UINT i;
+ 
+ 	GetExeName(exe, sizeof(exe));
+-	GetExeDir(exe_dir, sizeof(exe_dir));
++	GetStateDir(exe_dir, sizeof(exe_dir));
+ 
+ 	ok = false;
+ 	dirs = EnumDir(exe_dir);
+@@ -552,7 +552,11 @@
+ 		UCHAR *buf;
+ 		IO *io;
+ #ifndef	OS_WIN32
++#ifdef STATE_DIR
++		wchar_t *filename = L"" STATE_DIR L"/vpn_checker_tmp";
++#else
+ 		wchar_t *filename = L"/tmp/vpn_checker_tmp";
++#endif
+ #else	// OS_WIN32
+ 		wchar_t filename[MAX_PATH];
+ 		CombinePathW(filename, sizeof(filename), MsGetMyTempDirW(), L"vpn_checker_tmp");
+Index: b/src/Cedar/Logging.c
+===================================================================
+--- a/src/Cedar/Logging.c
++++ b/src/Cedar/Logging.c
+@@ -508,7 +508,7 @@
+ 
+ 	e = ZeroMalloc(sizeof(ERASER));
+ 
+-	GetExeDir(dir, sizeof(dir));
++	GetStateDir(dir, sizeof(dir));
+ 
+ 	e->Log = log;
+ 	e->MinFreeSpace = min_size;
+Index: b/src/Cedar/Server.c
+===================================================================
+--- a/src/Cedar/Server.c
++++ b/src/Cedar/Server.c
+@@ -1060,7 +1060,7 @@
+ 		hubname = NULL;
+ 	}
+ 
+-	GetExeDir(exe_dir, sizeof(exe_dir));
++	GetStateDir(exe_dir, sizeof(exe_dir));
+ 
+ 	// Enumerate in the server_log
+ 	if (hubname == NULL)
+@@ -1134,7 +1134,7 @@
+ 		return;
+ 	}
+ 
+-	GetExeDir(exe_dir, sizeof(exe_dir));
++	GetStateDir(exe_dir, sizeof(exe_dir));
+ 	Format(dir_full_path, sizeof(dir_full_path), "%s/%s", exe_dir, dirname);
+ 
+ 	dir = EnumDir(dir_full_path);
+Index: b/src/Mayaqua/Encrypt.c
+===================================================================
+--- a/src/Mayaqua/Encrypt.c
++++ b/src/Mayaqua/Encrypt.c
+@@ -579,7 +579,7 @@
+ 		return false;
+ 	}
+ 
+-	GetExeDir(dirname, sizeof(dirname));
++	GetStateDir(dirname, sizeof(dirname));
+ 
+ 	// Search the CRL file
+ 	t = EnumDir(dirname);
+Index: b/src/Mayaqua/FileIO.c
+===================================================================
+--- a/src/Mayaqua/FileIO.c
++++ b/src/Mayaqua/FileIO.c
+@@ -122,8 +122,14 @@
+ #include <errno.h>
+ #include <Mayaqua/Mayaqua.h>
+ 
++#ifdef STATE_DIR
++static char exe_file_name[MAX_SIZE] = STATE_DIR "/a.out";
++static wchar_t exe_file_name_w[MAX_SIZE] = L"" STATE_DIR L"/a.out";
++#else
+ static char exe_file_name[MAX_SIZE] = "/tmp/a.out";
+ static wchar_t exe_file_name_w[MAX_SIZE] = L"/tmp/a.out";
++#endif
++
+ static LIST *hamcore = NULL;
+ static IO *hamcore_io = NULL;
+ 
+@@ -1038,7 +1044,7 @@
+ 	}
+ 
+ 	// If the file exist in hamcore/ directory on the local disk, read it
+-	GetExeDirW(exe_dir, sizeof(exe_dir));
++	GetStateDirW(exe_dir, sizeof(exe_dir));
+ 
+ 	UniFormat(tmp, sizeof(tmp), L"%s/%S/%S", exe_dir, HAMCORE_DIR_NAME, filename);
+ 
+@@ -1154,7 +1160,7 @@
+ 		return;
+ 	}
+ 
+-	GetExeDirW(exe_dir, sizeof(exe_dir));
++	GetStateDirW(exe_dir, sizeof(exe_dir));
+ 	UniFormat(tmp, sizeof(tmp), L"%s/%S", exe_dir, HAMCORE_FILE_NAME);
+ 
+ 	UniFormat(tmp2, sizeof(tmp2), L"%s/%S", exe_dir, HAMCORE_FILE_NAME_2);
+@@ -1438,6 +1444,33 @@
+ 	GetDirNameFromFilePathW(name, size, exe_file_name_w);
+ }
+ 
++void GetStateDir(char *name, UINT size)
++{
++	// Validate arguments
++	if (name == NULL)
++	{
++		return;
++	}
++#ifdef STATE_DIR
++	StrCpy(name, size, STATE_DIR);
++#else
++	GetExeDir(name, size)
++#endif
++}
++void GetStateDirW(wchar_t *name, UINT size)
++{
++	// Validate arguments
++	if (name == NULL)
++	{
++		return;
++	}
++#ifdef STATE_DIR
++	UniStrCpy(name, size, L"" STATE_DIR L"");
++#else
++	GetExeDirW(name, size)
++#endif
++}
++
+ // Get the EXE file name
+ void GetExeName(char *name, UINT size)
+ {
+@@ -2389,7 +2422,7 @@
+ 	else
+ 	{
+ 		wchar_t dir[MAX_SIZE];
+-		GetExeDirW(dir, sizeof(dir));
++		GetStateDirW(dir, sizeof(dir));
+ 		ConbinePathW(dst, size, dir, &src[1]);
+ 	}
+ }
+Index: b/src/Mayaqua/FileIO.h
+===================================================================
+--- a/src/Mayaqua/FileIO.h
++++ b/src/Mayaqua/FileIO.h
+@@ -349,6 +349,8 @@
+ void GetExeNameW(wchar_t *name, UINT size);
+ void GetExeDir(char *name, UINT size);
+ void GetExeDirW(wchar_t *name, UINT size);
++void GetStateDir(char *name, UINT size);
++void GetStateDirW(wchar_t *name, UINT size);
+ void BuildHamcore(char *dst_filename, char *src_dir, bool unix_only);
+ int CompareHamcore(void *p1, void *p2);
+ void InitHamcore();
+Index: b/src/Mayaqua/Mayaqua.c
+===================================================================
+--- a/src/Mayaqua/Mayaqua.c
++++ b/src/Mayaqua/Mayaqua.c
+@@ -611,7 +611,11 @@
+ 		_exit(0);
+ 	}
+ 
++#ifndef STATE_DIR
++	// This check causes hamcorebuilder to fail in an unprivileged
++	// environment, and is unnecessary for a managed installation.
+ 	CheckUnixTempDir();
++#endif
+ 
+ 	// Initialization of Probe
+ 	InitProbe();
+Index: b/src/Mayaqua/Table.c
+===================================================================
+--- a/src/Mayaqua/Table.c
++++ b/src/Mayaqua/Table.c
+@@ -1191,7 +1191,7 @@
+ 		return;
+ 	}
+ 
+-	GetExeDirW(exe, sizeof(exe));
++	GetStateDirW(exe, sizeof(exe));
+ 	UniStrCpy(hashtemp, sizeof(hashtemp), strfilename);
+ 	BinToStrW(tmp, sizeof(tmp), filehash, MD5_SIZE);
+ 	UniStrCat(hashtemp, sizeof(hashtemp), tmp);
+@@ -1204,7 +1204,11 @@
+ 	UniStrLower(tmp);
+ 
+ #ifndef	OS_WIN32
++#ifdef STATE_DIR
++	UniStrCpy(exe, sizeof(exe), L"" STATE_DIR L"");
++#else
+ 	UniStrCpy(exe, sizeof(exe), L"/tmp");
++#endif
+ #else	// OS_WIN32
+ 	StrToUni(exe, sizeof(exe), MsGetTempDir());
+ #endif	// OS_WIN32
+Index: b/src/Mayaqua/Unix.c
+===================================================================
+--- a/src/Mayaqua/Unix.c
++++ b/src/Mayaqua/Unix.c
+@@ -928,7 +928,7 @@
+ 		StrCpy(tmp, sizeof(tmp), instance_name);
+ 	}
+ 
+-	GetExeDir(dir, sizeof(dir));
++	GetStateDir(dir, sizeof(dir));
+ 
+ 	// File name generation
+ 	Format(name, sizeof(name), "%s/.%s", dir, tmp);
+@@ -2260,7 +2260,7 @@
+ 		return;
+ 	}
+ 
+-	GetExeDir(dir, sizeof(dir));
++	GetStateDir(dir, sizeof(dir));
+ 
+ 	GetExeName(exe_name, sizeof(exe_name));
+ 	StrCat(exe_name, sizeof(exe_name), ":pid_hash");
+@@ -2305,7 +2305,7 @@
+ 		return;
+ 	}
+ 
+-	GetExeDir(dir, sizeof(dir));
++	GetStateDir(dir, sizeof(dir));
+ 
+ 	GetExeName(exe_name, sizeof(exe_name));
+ 	StrCat(exe_name, sizeof(exe_name), ":pid_hash");
+Index: b/src/bin/hamcore/Makefile.am
+===================================================================
+--- a/src/bin/hamcore/Makefile.am
++++ b/src/bin/hamcore/Makefile.am
+@@ -18,12 +18,16 @@
+ 
+ include $(top_srcdir)/autotools/softether.am
+ 
+-# This is required to use a custom build rule with -Wall and -Werror enabled.
++# An empty EXEEXT required for overrides with -Wall and -Werror enabled.
+ AUTOMAKE_OPTIONS = -Wno-override
+ EXEEXT =
++
+ HAMCOREBUILDER = $(top_builddir)/src/hamcorebuilder/hamcorebuilder
+ 
+-sbin_PROGRAMS = hamcore.se2
++noinst_PROGRAMS = hamcore.se2
+ 
+ hamcore.se2$(EXEEXT): $(HAMCOREBUILDER)
+ 	$(HAMCOREBUILDER) $(top_srcdir)/src/bin/hamcore $@
++
++install-exec-local: hamcore.se2$(EXEEXT)
++	$(INSTALL_DATA) -D hamcore.se2$(EXEEXT) $(DESTDIR)$(localstatedir)/lib/softether/hamcore.se2
diff --git a/package/softether/0002-create-non-forking-softetherd-for-upstart-and-systemd.patch b/package/softether/0002-create-non-forking-softetherd-for-upstart-and-systemd.patch
new file mode 100644
index 0000000..72913b0
--- /dev/null
+++ b/package/softether/0002-create-non-forking-softetherd-for-upstart-and-systemd.patch
@@ -0,0 +1,218 @@
+From 64dd780905ae339a0a57e4aba541799016816a1a Mon Sep 17 00:00:00 2001
+From: Darik Horn <dajhorn@vanadac.com>
+Date: Fri, 3 Oct 2014 13:30:24 -0400
+Subject: [PATCH] Create a non-forking softetherd for upstart and systemd.
+
+Implement a daemon that expects to be invoked by a new-style init like upstart
+or systemd as:
+
+	/usr/sbin/softetherd [vpnbridge|vpnclient|vpnserver]
+
+Alternatively, if the command line argument is empty, then use the
+`SOFTETHER_MODE` environment variable instead.
+
+Conflicts:
+	src/bin/hamcore/strtable_en.stb
+
+Taken from Github at
+https://github.com/dajhorn/SoftEtherVPN/commit/64dd780905ae339a0a57e4aba541799016816a1a.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ configure.ac                    |   1 +
+ src/Makefile.am                 |   3 ++
+ src/bin/hamcore/strtable_en.stb |   1 +
+ src/softetherd/Makefile.am      |  28 ++++++++++
+ src/softetherd/softetherd.c     | 114 ++++++++++++++++++++++++++++++++++++++++
+ 5 files changed, 147 insertions(+)
+ create mode 100644 src/softetherd/Makefile.am
+ create mode 100644 src/softetherd/softetherd.c
+
+Index: b/configure.ac
+===================================================================
+--- a/configure.ac
++++ b/configure.ac
+@@ -36,6 +36,7 @@
+ 	src/vpnclient/Makefile
+ 	src/vpnbridge/Makefile
+ 	src/vpncmd/Makefile
++	src/softetherd/Makefile
+ ])
+ 
+ 
+Index: b/src/Makefile.am
+===================================================================
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -27,3 +27,6 @@
+ 
+ # These are the final build products.
+ SUBDIRS += vpnserver vpnclient vpnbridge vpncmd
++
++# This is a daemon for upstart and systemd.
++SUBDIRS += softetherd
+Index: b/src/bin/hamcore/strtable_en.stb
+===================================================================
+--- a/src/bin/hamcore/strtable_en.stb
++++ b/src/bin/hamcore/strtable_en.stb
+@@ -1062,6 +1062,7 @@
+ 
+ 
+ # Concerning services (UNIX)
++UNIX_DAEMON_HELP		SoftEther VPN non-forking daemon for upstart and systemd.\nCommand Usage:\n %S vpnbridge  - Enable bridging features.\n %S vpnclient  - Enable client features.\n %S vpnserver  - Enable all features.\nThe parameter can be set in the SOFTETHER_MODE environment variable.\n\n
+ UNIX_SVC_HELP			%S service program\nCopyright (c) SoftEther VPN Project. All Rights Reserved.\n\n%S command usage:\n %S start  - Start the %S service.\n %S stop   - Stop the %S service if the service has been already started.\n\n
+ UNIX_SVC_STARTED		The %S service has been started.\n
+ UNIX_SVC_STOPPING		Stopping the %S service ...\n
+Index: b/src/softetherd/Makefile.am
+===================================================================
+--- /dev/null
++++ b/src/softetherd/Makefile.am
+@@ -0,0 +1,28 @@
++#  Copyright 2014 Darik Horn <dajhorn@vanadac.com>
++#
++#  This file is part of SoftEther.
++#
++#  SoftEther is free software: you can redistribute it and/or modify it under
++#  the terms of the GNU General Public License as published by the Free 
++#  Software Foundation, either version 2 of the License, or (at your option)
++#  any later version.
++#
++#  SoftEther is distributed in the hope that it will be useful, but WITHOUT ANY
++#  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
++#  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
++#  details.
++#
++#  You should have received a copy of the GNU General Public License along with
++#  SoftEther.  If not, see <http://www.gnu.org/licenses/>.
++
++
++include $(top_srcdir)/autotools/softether.am
++
++sbin_PROGRAMS = \
++	softetherd
++
++softetherd_SOURCES = \
++	softetherd.c
++
++softetherd_LDADD = \
++	$(top_builddir)/src/libsoftether/libsoftether.la
+Index: b/src/softetherd/softetherd.c
+===================================================================
+--- /dev/null
++++ b/src/softetherd/softetherd.c
+@@ -0,0 +1,114 @@
++//  SoftEther VPN daemon for upstart and systemd.
++//
++//  Copyright 2014 Darik Horn <dajhorn@vanadac.com>
++//
++//  This file is part of SoftEther.
++//
++//  SoftEther is free software: you can redistribute it and/or modify it under
++//  the terms of the GNU General Public License as published by the Free 
++//  Software Foundation, either version 2 of the License, or (at your option)
++//  any later version.
++//
++//  SoftEther is distributed in the hope that it will be useful, but WITHOUT ANY
++//  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
++//  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
++//  details.
++//
++//  You should have received a copy of the GNU General Public License along with
++//  SoftEther.  If not, see <http://www.gnu.org/licenses/>.
++
++
++#include <GlobalConst.h>
++
++#define	VPN_EXE
++
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++#include <wchar.h>
++#include <stdarg.h>
++#include <time.h>
++#include <Mayaqua/Mayaqua.h>
++#include <Cedar/Cedar.h>
++
++void DaemonUsage(char *name)
++{
++	UniPrint(_UU("UNIX_DAEMON_HELP"), name, name, name);
++}
++
++
++void DaemonStartProcess()
++{
++	// This environment variable is exported by upstart.
++	char *upstart_job = getenv("UPSTART_JOB");
++
++	InitCedar();
++	StInit();
++	StStartServer(false);
++
++	// Notify upstart that softetherd is ready.
++	if (upstart_job != NULL)
++	{
++		unsetenv("UPSTART_JOB");
++		raise(SIGSTOP);
++	}
++}
++
++
++void DaemonStopProcess()
++{
++	StStopServer();
++	StFree();
++	FreeCedar();
++}
++
++
++int main(int argc, char *argv[])
++{
++	// This environment variable is sourced and exported by the init process from /etc/default/softether.
++	char *softether_mode = getenv("SOFTETHER_MODE");
++
++	InitMayaqua(false, false, argc, argv);
++
++	// Check for an explicit invocation. (eg: "/usr/sbin/softetherd vpnserver")
++	if (argc >= 2)
++	{
++		if (StrCmpi(argv[1], "vpnbridge") == 0
++		 || StrCmpi(argv[1], "vpnclient") == 0
++		 || StrCmpi(argv[1], "vpnserver") == 0)
++		{
++			UnixExecService(argv[1], DaemonStartProcess, DaemonStopProcess);
++			FreeMayaqua();
++			return 0;
++		}
++
++		// Exit status codes 150..199 are reserved for the application by the LSB.
++		fprintf(stderr, "Error: Unrecognized parameter: %s\n", argv[1]);
++		fflush(stderr);
++		FreeMayaqua();
++		return 150;
++	}
++
++	// Alternatively, use the environment variable.
++	if (softether_mode != NULL)
++	{
++		if (StrCmpi(softether_mode, "vpnbridge") == 0 
++		 || StrCmpi(softether_mode, "vpnclient") == 0
++		 || StrCmpi(softether_mode, "vpnserver") == 0)
++		{
++			UnixExecService(softether_mode, DaemonStartProcess, DaemonStopProcess);
++			FreeMayaqua();
++			return 0;
++		}
++
++		// Exit status codes 150..199 are reserved for the application by the LSB.
++		fprintf(stderr, "Error: Unrecognized environment variable: SOFTETHER_MODE=%s\n", softether_mode);
++		fflush(stderr);
++		FreeMayaqua();
++		return 151;
++	}
++
++	DaemonUsage(argv[0]);
++	FreeMayaqua();
++	return 3;
++}
diff --git a/package/softether/0003-change-GetExeDir-to-GetStateDir-in-Cedar-and-Mayaqua.patch b/package/softether/0003-change-GetExeDir-to-GetStateDir-in-Cedar-and-Mayaqua.patch
new file mode 100644
index 0000000..6cb4e72
--- /dev/null
+++ b/package/softether/0003-change-GetExeDir-to-GetStateDir-in-Cedar-and-Mayaqua.patch
@@ -0,0 +1,90 @@
+From d68db9f2cee975aad5e07b44485615f3d842ab45 Mon Sep 17 00:00:00 2001
+From: Darik Horn <dajhorn@vanadac.com>
+Date: Fri, 11 Jul 2014 16:17:18 -0400
+Subject: [PATCH] Change GetExeDir to GetStateDir in Cedar and Mayaqua.
+
+Resolve this AppArmor error by ensuring that certificate files files are
+written into /var/lib/softether instead of the current working directory:
+
+	Profile: /usr/sbin/softetherd
+	Operation: mkdir
+	Name: /usr/sbin/chain_certs
+	Denied: c
+	Logfile: /var/log/kern.log
+
+	type=1400 audit: apparmor="DENIED" operation="mkdir" profile="/usr/sbin/softetherd" name="/usr/sbin/chain_certs/" pid=36448 comm="softetherd" requested_mask="c" denied_mask="c" fsuid=0 ouid=0
+
+Taken from Github
+https://github.com/dajhorn/SoftEtherVPN/commit/d68db9f2cee975aad5e07b44485615f3d842ab45.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ src/Cedar/Protocol.c  | 12 ++++++------
+ src/Mayaqua/Network.c |  6 +++---
+ 2 files changed, 9 insertions(+), 9 deletions(-)
+
+Index: b/src/Cedar/Protocol.c
+===================================================================
+--- a/src/Cedar/Protocol.c
++++ b/src/Cedar/Protocol.c
+@@ -161,10 +161,10 @@
+ 		UINT i;
+ 		DIRLIST *dir;
+ 		wchar_t dirname[MAX_SIZE];
+-		wchar_t exedir[MAX_SIZE];
++		wchar_t statedir[MAX_SIZE];
+ 
+-		GetExeDirW(exedir, sizeof(exedir));
+-		CombinePathW(dirname, sizeof(dirname), exedir, L"chain_certs");
++		GetStateDirW(statedir, sizeof(statedir));
++		CombinePathW(dirname, sizeof(dirname), statedir, L"chain_certs");
+ 		MakeDirExW(dirname);
+ 
+ 		if (auto_save)
+@@ -461,7 +461,7 @@
+ void AddAllChainCertsToCertList(LIST *o)
+ {
+ 	wchar_t dirname[MAX_SIZE];
+-	wchar_t exedir[MAX_SIZE];
++	wchar_t statedir[MAX_SIZE];
+ 	DIRLIST *dir;
+ 	// Validate arguments
+ 	if (o == NULL)
+@@ -469,9 +469,9 @@
+ 		return;
+ 	}
+ 
+-	GetExeDirW(exedir, sizeof(exedir));
++	GetStateDirW(statedir, sizeof(statedir));
+ 
+-	CombinePathW(dirname, sizeof(dirname), exedir, L"chain_certs");
++	CombinePathW(dirname, sizeof(dirname), statedir, L"chain_certs");
+ 
+ 	MakeDirExW(dirname);
+ 
+Index: b/src/Mayaqua/Network.c
+===================================================================
+--- a/src/Mayaqua/Network.c
++++ b/src/Mayaqua/Network.c
+@@ -12588,7 +12588,7 @@
+ void AddChainSslCertOnDirectory(struct ssl_ctx_st *ctx)
+ {
+ 	wchar_t dirname[MAX_SIZE];
+-	wchar_t exedir[MAX_SIZE];
++	wchar_t statedir[MAX_SIZE];
+ 	wchar_t txtname[MAX_SIZE];
+ 	DIRLIST *dir;
+ 	LIST *o;
+@@ -12602,9 +12602,9 @@
+ 
+ 	o = NewListFast(NULL);
+ 
+-	GetExeDirW(exedir, sizeof(exedir));
++	GetStateDirW(statedir, sizeof(statedir));
+ 
+-	CombinePathW(dirname, sizeof(dirname), exedir, L"chain_certs");
++	CombinePathW(dirname, sizeof(dirname), statedir, L"chain_certs");
+ 
+ 	MakeDirExW(dirname);
+ 
diff --git a/package/softether/0004-cross-compile.patch b/package/softether/0004-cross-compile.patch
new file mode 100644
index 0000000..0b31eca
--- /dev/null
+++ b/package/softether/0004-cross-compile.patch
@@ -0,0 +1,30 @@
+Host version of hamcorebuilder is needed during cross-compile
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+diff -uNr SoftEtherVPN-16b713b98da8dba29f0f845d5a8c36d6f7c34824.org/src/bin/hamcore/Makefile.am SoftEtherVPN-16b713b98da8dba29f0f845d5a8c36d6f7c34824/src/bin/hamcore/Makefile.am
+--- SoftEtherVPN-16b713b98da8dba29f0f845d5a8c36d6f7c34824.org/src/bin/hamcore/Makefile.am	2014-09-27 12:56:53.108725793 +0200
++++ SoftEtherVPN-16b713b98da8dba29f0f845d5a8c36d6f7c34824/src/bin/hamcore/Makefile.am	2014-09-27 12:57:50.280009025 +0200
+@@ -26,8 +26,8 @@
+ 
+ noinst_PROGRAMS = hamcore.se2
+ 
+-hamcore.se2$(EXEEXT): $(HAMCOREBUILDER)
+-	$(HAMCOREBUILDER) $(top_srcdir)/src/bin/hamcore $@
++hamcore.se2$(EXEEXT):
++	hamcorebuilder $(top_srcdir)/src/bin/hamcore $@
+ 
+ install-exec-local: hamcore.se2$(EXEEXT)
+ 	$(INSTALL_DATA) -D hamcore.se2$(EXEEXT) $(DESTDIR)$(localstatedir)/lib/softether/hamcore.se2
+diff -uNr SoftEtherVPN-16b713b98da8dba29f0f845d5a8c36d6f7c34824.org/src/Makefile.am SoftEtherVPN-16b713b98da8dba29f0f845d5a8c36d6f7c34824/src/Makefile.am
+--- SoftEtherVPN-16b713b98da8dba29f0f845d5a8c36d6f7c34824.org/src/Makefile.am	2014-09-27 12:56:53.136726809 +0200
++++ SoftEtherVPN-16b713b98da8dba29f0f845d5a8c36d6f7c34824/src/Makefile.am	2014-09-27 12:58:12.959723109 +0200
+@@ -20,7 +20,7 @@
+ SUBDIRS = Mayaqua Cedar
+ 
+ # This is a nodist helper.
+-SUBDIRS += hamcorebuilder
++# SUBDIRS += hamcorebuilder
+ 
+ # These are shared components.
+ SUBDIRS += libsoftether bin/hamcore
diff --git a/package/softether/0005-iconv.patch b/package/softether/0005-iconv.patch
new file mode 100644
index 0000000..09d7777
--- /dev/null
+++ b/package/softether/0005-iconv.patch
@@ -0,0 +1,28 @@
+Fix linking with libiconv
+
+Inspired by https://github.com/el1n/OpenWRT-package-softether/blob/4cb1cd9073a76edf34c512e587069626e02e2404/patches/120-fix-iconv-headers-common.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+Index: b/src/Mayaqua/Mayaqua.h
+===================================================================
+--- a/src/Mayaqua/Mayaqua.h
++++ b/src/Mayaqua/Mayaqua.h
+@@ -282,17 +282,7 @@
+ #include <ifaddrs.h>
+ #endif	// MAYAQUA_SUPPORTS_GETIFADDRS
+ 
+-#ifdef	UNIX_LINUX
+-typedef void *iconv_t;
+-iconv_t iconv_open (__const char *__tocode, __const char *__fromcode);
+-size_t iconv (iconv_t __cd, char **__restrict __inbuf,
+-                     size_t *__restrict __inbytesleft,
+-                     char **__restrict __outbuf,
+-                     size_t *__restrict __outbytesleft);
+-int iconv_close (iconv_t __cd);
+-#else	// UNIX_LINUX
+ #include <iconv.h>
+-#endif	// UNIX_LINUX
+ 
+ 
+ 
diff --git a/package/softether/Config.in b/package/softether/Config.in
new file mode 100644
index 0000000..15d5834
--- /dev/null
+++ b/package/softether/Config.in
@@ -0,0 +1,28 @@
+config BR2_PACKAGE_SOFTETHER
+	bool "softether"
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_READLINE
+	depends on BR2_LARGEFILE
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_USE_WCHAR
+	help
+	  The SoftEther Server is a fully integrated implementation of the SSTP,
+	  L2TP, L2TPv3, OpenVPN, and IPSec virtual private networking protocols
+	  on Linux and several other platforms. It is generally compatible with
+	  other implementations by Apple, Cisco, Juniper, Microsoft, et al.
+
+	  Convenient Layer-2 and Layer-3 bridging capabilities can connect
+	  several branch offices into a single broadcast or routing domain, even
+	  behind a NAT or without a static IPv4 address.
+
+	  In addition to supporting most VPN protocols, the SoftEther Client can
+	  penetrate hardened firewalls and captured gateways through HTTPS, DNS,
+	  and ICMP exfiltration.
+
+	  http://www.softether.org
+
+comment "softether needs a toolchain w/ largefile, wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS)
diff --git a/package/softether/softether.mk b/package/softether/softether.mk
new file mode 100644
index 0000000..7f2dfb8
--- /dev/null
+++ b/package/softether/softether.mk
@@ -0,0 +1,42 @@
+################################################################################
+#
+# softether
+#
+################################################################################
+
+SOFTETHER_VERSION = 16b713b98da8dba29f0f845d5a8c36d6f7c34824
+SOFTETHER_SITE = $(call github,SoftEtherVPN,SoftEtherVPN,$(SOFTETHER_VERSION))
+SOFTETHER_PATCH = \
+	https://github.com/dajhorn/SoftEtherVPN/commit/c5e5d7e93c6f3302adf5821c29c4efdb7630e418.patch \
+	https://github.com/dajhorn/SoftEtherVPN/commit/75625af541fd128f51079d0ffe5ef24645b8f421.patch
+SOFTETHER_LICENSE = GPLv2
+SOFTETHER_LICENSE_FILES = LICENSE
+SOFTETHER_DEPENDENCIES = host-softether openssl readline
+SOFTETHER_AUTORECONF = YES
+
+ifeq ($(BR2_ENABLE_LOCALE),)
+SOFTETHER_DEPENDENCIES += libiconv
+SOFTETHER_CONF_ENV = LIBS="-liconv"
+endif
+
+SOFTETHER_CONF_OPTS = \
+	--with-openssl="$(STAGING_DIR)/usr" \
+	--with-zlib="$(STAGING_DIR)/usr"
+
+# host-libiconv does not exist, therefore we need this extra line
+HOST_SOFTETHER_DEPENDENCIES = host-pkgconf host-openssl host-readline
+
+# target build creates the file hamcore.se2 which needs the host variant of
+# hamcorebuilder, for details see http://www.vpnusers.com/viewtopic.php?p=5426
+define HOST_SOFTETHER_BUILD_CMDS
+	$(MAKE) -C $(@D)/src/Mayaqua
+	$(MAKE) -C $(@D)/src/Cedar
+	$(MAKE) -C $(@D)/src/hamcorebuilder
+endef
+
+define HOST_SOFTETHER_INSTALL_CMDS
+	$(INSTALL) -m 0755 $(@D)/src/hamcorebuilder/hamcorebuilder $(HOST_DIR)/usr/bin/hamcorebuilder
+endef
+
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
