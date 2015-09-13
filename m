From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Sun, 13 Sep 2015 18:53:10 +0200
Subject: [Buildroot] [PATCH v3] android-tools: add new package
Message-ID: <1442163190-30820-1-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This package allows to build the fastboot and adb host utilities,
which can be used to interact with target devices implementing one of
these protocols.

The work behind the host utilities was funded by ECA Group
<http://www.ecagroup.com>. ECA Group is the copyright owner of the
contributed code.

The package also allows to build fastboot, adb and adbd daemon for the
target.

Regarding adbd, the target is required to have the FunctionFS USB Gadget
configuration. Then the following commands enable the use of adb:
 # modprobe g_ffs idVendor=0x18d1 idProduct=0x4e42 \
   iSerialNumber="buildroot"
 # mkdir -p /dev/usb-ffs/adb
 # mount -t functionfs adb /dev/usb-ffs/adb -o uid=2000,gid=2000
 # adbd &

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
This patch is the follow-up of "android-tools: new host package"
http://patchwork.ozlabs.org/patch/467019/

To which has been squashed "android-tools: add target and adbd support"
http://patchwork.ozlabs.org/patch/516635/

Since v2:
- added default selection for adb (host) and adbd (target)
- switched from debian to ubuntu package to get adbd support
- added target and adbd support
- removed AndroidConfig.h as not needed anymore (defines in Makefiles)
- removed libselinux dependency for adb/adbd

Since v1:
- fixed typos
- added android-tools.hash
---
 package/Config.in                                  |   1 +
 package/Config.in.host                             |   1 +
 .../0001-Fix-makefiles-for-out-of-tree-build.patch | 162 +++++++++++++
 .../0002-Fix-adbd-for-non-Ubuntu-systems.patch     | 264 +++++++++++++++++++++
 package/android-tools/Config.in                    |  39 +++
 package/android-tools/Config.in.host               |  25 ++
 package/android-tools/android-tools.hash           |   3 +
 package/android-tools/android-tools.mk             |  85 +++++++
 8 files changed, 580 insertions(+)
 create mode 100644 package/android-tools/0001-Fix-makefiles-for-out-of-tree-build.patch
 create mode 100644 package/android-tools/0002-Fix-adbd-for-non-Ubuntu-systems.patch
 create mode 100644 package/android-tools/Config.in
 create mode 100644 package/android-tools/Config.in.host
 create mode 100644 package/android-tools/android-tools.hash
 create mode 100644 package/android-tools/android-tools.mk

diff --git a/package/Config.in b/package/Config.in
index 030477a..072ea95 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1454,6 +1454,7 @@ endmenu
 
 menu "System tools"
 	source "package/acl/Config.in"
+	source "package/android-tools/Config.in"
 	source "package/attr/Config.in"
 	source "package/audit/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
diff --git a/package/Config.in.host b/package/Config.in.host
index 1e047aa..c24a79f 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -1,5 +1,6 @@
 menu "Host utilities"
 
+	source "package/android-tools/Config.in.host"
 	source "package/checkpolicy/Config.in.host"
 	source "package/cramfs/Config.in.host"
 	source "package/dfu-util/Config.in.host"
diff --git a/package/android-tools/0001-Fix-makefiles-for-out-of-tree-build.patch b/package/android-tools/0001-Fix-makefiles-for-out-of-tree-build.patch
new file mode 100644
index 0000000..af07236
--- /dev/null
+++ b/package/android-tools/0001-Fix-makefiles-for-out-of-tree-build.patch
@@ -0,0 +1,162 @@
+[PATCH] Fix makefiles for out-of-tree build
+
+Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
+---
+ debian/makefiles/adb.mk      | 10 +++++-----
+ debian/makefiles/adbd.mk     | 33 ++++++++++++++++-----------------
+ debian/makefiles/fastboot.mk | 17 +++++++++--------
+ 3 files changed, 30 insertions(+), 30 deletions(-)
+
+diff --git a/debian/makefiles/adb.mk b/debian/makefiles/adb.mk
+index d9d4feb..654b9f1 100644
+--- a/debian/makefiles/adb.mk
++++ b/debian/makefiles/adb.mk
+@@ -1,5 +1,6 @@
+ # Makefile for adb; from https://heiher.info/2227.html
+ 
++VPATH+= $(SRCDIR)/core/adb
+ SRCS+= adb.c
+ SRCS+= adb_client.c
+ SRCS+= adb_auth_host.c
+@@ -17,7 +18,7 @@ SRCS+= usb_linux.c
+ SRCS+= usb_vendors.c
+ SRCS+= utils.c
+ 
+-VPATH+= ../libcutils
++VPATH+= $(SRCDIR)/core/libcutils
+ SRCS+= abort_socket.c
+ SRCS+= socket_inaddr_any_server.c
+ SRCS+= socket_local_client.c
+@@ -28,7 +29,7 @@ SRCS+= socket_network_client.c
+ SRCS+= list.c
+ SRCS+= load_file.c
+ 
+-VPATH+= ../libzipfile
++VPATH+= $(SRCDIR)/core/libzipfile
+ SRCS+= centraldir.c
+ SRCS+= zipfile.c
+ 
+@@ -37,9 +38,8 @@ CPPFLAGS+= -DADB_HOST=1
+ CPPFLAGS+= -DHAVE_FORKEXEC=1
+ CPPFLAGS+= -DHAVE_SYMLINKS
+ CPPFLAGS+= -DHAVE_TERMIO_H
+-CPPFLAGS+= -I.
+-CPPFLAGS+= -I../include
+-CPPFLAGS+= -I../../../external/zlib
++CPPFLAGS+= -I$(SRCDIR)/core/adb
++CPPFLAGS+= -I$(SRCDIR)/core/include
+ 
+ LIBS+= -lc -lpthread -lz -lcrypto
+ 
+diff --git a/debian/makefiles/adbd.mk b/debian/makefiles/adbd.mk
+index 94d3a90..49dab8c 100644
+--- a/debian/makefiles/adbd.mk
++++ b/debian/makefiles/adbd.mk
+@@ -1,18 +1,6 @@
+ # Makefile for adbd
+ 
+-VPATH+= ../libcutils
+-SRCS+= abort_socket.c
+-SRCS+= socket_inaddr_any_server.c
+-SRCS+= socket_local_client.c
+-SRCS+= socket_local_server.c
+-SRCS+= socket_loopback_client.c
+-SRCS+= socket_loopback_server.c
+-SRCS+= socket_network_client.c
+-SRCS+= list.c
+-SRCS+= load_file.c
+-SRCS+= android_reboot.c
+-
+-#VPATH+= ../adb
++VPATH+= $(SRCDIR)/core/adbd
+ SRCS+=  adb.c
+ SRCS+=	backup_service.c
+ SRCS+=	fdevent.c
+@@ -31,7 +19,19 @@ SRCS+=	log_service.c
+ SRCS+=	utils.c
+ SRCS+=	base64.c
+ 
+-VPATH+= ../libzipfile
++VPATH+= $(SRCDIR)/core/libcutils
++SRCS+= abort_socket.c
++SRCS+= socket_inaddr_any_server.c
++SRCS+= socket_local_client.c
++SRCS+= socket_local_server.c
++SRCS+= socket_loopback_client.c
++SRCS+= socket_loopback_server.c
++SRCS+= socket_network_client.c
++SRCS+= list.c
++SRCS+= load_file.c
++SRCS+= android_reboot.c
++
++VPATH+= $(SRCDIR)/core/libzipfile
+ SRCS+= centraldir.c
+ SRCS+= zipfile.c
+ 
+@@ -40,10 +40,9 @@ CPPFLAGS+= -O2 -g -Wall -Wno-unused-parameter
+ CPPFLAGS+= -DADB_HOST=0 -DHAVE_FORKEXEC=1 -D_XOPEN_SOURCE -D_GNU_SOURCE -DALLOW_ADBD_ROOT=1
+ CPPFLAGS+= -DHAVE_SYMLINKS -DBOARD_ALWAYS_INSECURE
+ CPPFLAGS+= -DHAVE_TERMIO_H
+-CPPFLAGS+= -I.
+-CPPFLAGS+= -I../include
+-CPPFLAGS+= -I../../../external/zlib
+ CPPFLAGS+= `pkg-config --cflags glib-2.0 gio-2.0`
++CPPFLAGS+= -I$(SRCDIR)/core/adbd
++CPPFLAGS+= -I$(SRCDIR)/core/include
+ 
+ LIBS+= -lc -lpthread -lz -lcrypto -lcrypt `pkg-config --libs glib-2.0 gio-2.0`
+ 
+diff --git a/debian/makefiles/fastboot.mk b/debian/makefiles/fastboot.mk
+index 9e8b751..94a069b 100644
+--- a/debian/makefiles/fastboot.mk
++++ b/debian/makefiles/fastboot.mk
+@@ -1,5 +1,6 @@
+ # Makefile for fastboot; from https://heiher.info/2227.html
+ 
++VPATH+= $(SRCDIR)/core/fastboot
+ SRCS+= bootimg.c
+ SRCS+= engine.c
+ SRCS+= fastboot.c
+@@ -7,11 +8,11 @@ SRCS+= protocol.c
+ SRCS+= usb_linux.c
+ SRCS+= util_linux.c
+ 
+-VPATH+= ../libzipfile
++VPATH+= $(SRCDIR)/core/libzipfile
+ SRCS+= centraldir.c
+ SRCS+= zipfile.c
+ 
+-VPATH+= ../libsparse
++VPATH+= $(SRCDIR)/core/libsparse
+ SRCS+= backed_block.c
+ SRCS+= sparse_crc32.c
+ SRCS+= sparse.c
+@@ -19,7 +20,7 @@ SRCS+= sparse_read.c
+ SRCS+= sparse_err.c
+ SRCS+= output_file.c
+ 
+-VPATH+= ../../extras/ext4_utils/
++VPATH+= $(SRCDIR)/extras/ext4_utils/
+ SRCS+= make_ext4fs.c
+ SRCS+= crc16.c
+ SRCS+= ext4_utils.c
+@@ -31,11 +32,11 @@ SRCS+= extent.c
+ SRCS+= wipe.c
+ SRCS+= sha1.c
+ 
+-CPPFLAGS+= -I.
+-CPPFLAGS+= -I../include
+-CPPFLAGS+= -I../mkbootimg
+-CPPFLAGS+= -I../../extras/ext4_utils/
+-CPPFLAGS+= -I../libsparse/include/
++CPPFLAGS+= -I$(SRCDIR)/core/fastboot
++CPPFLAGS+= -I$(SRCDIR)/core/include
++CPPFLAGS+= -I$(SRCDIR)/core/mkbootimg
++CPPFLAGS+= -I$(SRCDIR)/extras/ext4_utils/
++CPPFLAGS+= -I$(SRCDIR)/core/libsparse/include/
+ 
+ LIBS+= -lz -lselinux
+ 
+-- 
+2.5.1
+
diff --git a/package/android-tools/0002-Fix-adbd-for-non-Ubuntu-systems.patch b/package/android-tools/0002-Fix-adbd-for-non-Ubuntu-systems.patch
new file mode 100644
index 0000000..35f6c8a
--- /dev/null
+++ b/package/android-tools/0002-Fix-adbd-for-non-Ubuntu-systems.patch
@@ -0,0 +1,264 @@
+[PATCH] Fix adbd for non-Ubuntu systems
+
+Remove glib/dbus dependencies and partially restore services.c to be
+closer to the original source code in order to run on systems without
+sudo.
+
+Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
+---
+ core/adbd/adb.c          |   1 -
+ core/adbd/services.c     | 160 ++++-------------------------------------------
+ debian/makefiles/adbd.mk |   4 +-
+ 3 files changed, 14 insertions(+), 151 deletions(-)
+
+diff --git a/core/adbd/adb.c b/core/adbd/adb.c
+index d90e6b8..7fe6445 100644
+--- a/core/adbd/adb.c
++++ b/core/adbd/adb.c
+@@ -1165,7 +1165,6 @@ void build_local_name(char* target_str, size_t target_size, int server_port)
+ 
+ #if !ADB_HOST
+ static int should_drop_privileges() {
+-    return 1;
+ #ifndef ALLOW_ADBD_ROOT
+     return 1;
+ #else /* ALLOW_ADBD_ROOT */
+diff --git a/core/adbd/services.c b/core/adbd/services.c
+index 05bd0d0..5adcefe 100644
+--- a/core/adbd/services.c
++++ b/core/adbd/services.c
+@@ -20,15 +20,6 @@
+ #include <string.h>
+ #include <errno.h>
+ #include <pwd.h>
+-#include <glib.h>
+-#include <gio/gio.h>
+-
+-#define UNITY_SERVICE "com.canonical.UnityGreeter"
+-#define GREETER_OBJ "/"
+-#define GREETER_INTERFACE "com.canonical.UnityGreeter"
+-#define PROPERTIES_INTERFACE "org.freedesktop.DBus.Properties"
+-#define ACTIVE_PROPERTY "IsActive"
+-#define UNLOCK_PATH "/userdata/.adb_onlock"
+ 
+ #include "sysdeps.h"
+ 
+@@ -268,11 +259,11 @@ static int create_service_thread(void (*func)(int, void *), void *cookie)
+ }
+ 
+ #if !ADB_HOST
+-static int create_subprocess(const char *cmd, const char *arg0, const char *arg1, const char *arg2, const char *arg3,  const char *arg4, pid_t *pid)
++static int create_subprocess(const char *cmd, const char *arg0, const char *arg1, pid_t *pid)
+ {
+ #ifdef HAVE_WIN32_PROC
+-    D("create_subprocess(cmd=%s, arg0=%s, arg1=%s, arg2=%s, arg3=%, arg4=%ss)\n", cmd, arg0, arg1, arg2, arg3, arg4);
+-    fprintf(stderr, "error: create_subprocess not implemented on Win32 (%s %s %s %s %s %s)\n", cmd, arg0, arg1, arg2, arg3, arg4);
++    D("create_subprocess(cmd=%s, arg0=%s, arg1=%s)\n", cmd, arg0, arg1);
++    fprintf(stderr, "error: create_subprocess not implemented on Win32 (%s %s %s)\n", cmd, arg0, arg1);
+     return -1;
+ #else /* !HAVE_WIN32_PROC */
+     char *devname;
+@@ -327,7 +318,7 @@ static int create_subprocess(const char *cmd, const char *arg0, const char *arg1
+         } else {
+            D("adb: unable to open %s\n", text);
+         }
+-	execl(cmd, cmd, arg0, arg1, arg2, arg3, arg4, NULL);
++        execl(cmd, cmd, arg0, arg1, NULL);
+         fprintf(stderr, "- exec '%s' failed: %s (%d) -\n",
+                 cmd, strerror(errno), errno);
+         exit(-1);
+@@ -342,7 +333,7 @@ static int create_subprocess(const char *cmd, const char *arg0, const char *arg1
+ }
+ #endif  /* !ABD_HOST */
+ 
+-#if ADB_HOST
++#if ADB_HOST || ADBD_NON_ANDROID
+ #define SHELL_COMMAND "/bin/sh"
+ #else
+ #define SHELL_COMMAND "/system/bin/sh"
+@@ -380,139 +371,16 @@ static void subproc_waiter_service(int fd, void *cookie)
+     }
+ }
+ 
+-int is_phone_locked() {
+-    GError *error = NULL;
+-    GVariant *variant = NULL;
+-    GDBusConnection *connection = NULL;
+-
+-    if (g_file_test(UNLOCK_PATH, G_FILE_TEST_EXISTS)) {
+-        D("unlock path present.");
+-        return 0;
+-    }
+-
+-    // check if the environment variable is present, if not we grab it from
+-    // the phablet user
+-    if (g_getenv("DBUS_SESSION_BUS_ADDRESS") == NULL) {
+-        D("DBUS_SESSION_BUS_ADDRESS missing.\n");
+-        struct passwd *pw = getpwuid(AID_SHELL);
+-        char user_id[15];
+-        gchar *path = NULL;
+-        gchar *contents = NULL;
+-        gchar *session_path = NULL;
+-
+-        snprintf(user_id, sizeof user_id, "%d", pw->pw_uid);
+-
+-        path = g_build_filename("/run", "user", user_id, "dbus-session", NULL);
+-
+-        g_file_get_contents(path, &contents, NULL, &error);
+-        session_path = g_strstrip(g_strsplit(contents, "DBUS_SESSION_BUS_ADDRESS=", -1)[1]);
+-        D("Session bus is %s\n", session_path);
+-
+-        // path is not longer used
+-        g_free(path);
+-
+-        if (error != NULL) {
+-            g_clear_error(&error);
+-            D("Couldn't set session bus\n");
+-            return 1;
+-        }
+-
+-        g_setenv("DBUS_SESSION_BUS_ADDRESS", session_path, TRUE);
+-        g_free(contents);
+-    }
+-
+-    // set the uid to be able to connect to the phablet user session bus
+-    setuid(AID_SHELL);
+-    connection =  g_dbus_connection_new_for_address_sync(g_getenv("DBUS_SESSION_BUS_ADDRESS"),
+-                                                         G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_CLIENT | G_DBUS_CONNECTION_FLAGS_MESSAGE_BUS_CONNECTION,
+-                                                         NULL,
+-                                                         NULL,
+-                                                         &error);
+-    if (connection == NULL) {
+-        D("session bus not available: %s", error->message);
+-        g_error_free (error);
+-        return 1;
+-    }
+-
+-    variant = g_dbus_connection_call_sync(connection,
+-                                          UNITY_SERVICE,
+-                                          GREETER_OBJ,
+-                                          PROPERTIES_INTERFACE,
+-                                          "Get",
+-                                          g_variant_new("(ss)", GREETER_INTERFACE, ACTIVE_PROPERTY),
+-                                          g_variant_type_new("(v)"),
+-                                          G_DBUS_CALL_FLAGS_NONE,
+-                                          -1,
+-                                          NULL,
+-                                          &error);
+-
+-    if (error != NULL) {
+-        D("Could not get property: %s", error->message);
+-        g_object_unref(connection);
+-        g_error_free(error);
+-        return 1;
+-    }
+-
+-    if (variant == NULL) {
+-        D("Failed to get property '%s': %s", "IsActive", error->message);
+-        g_object_unref(connection);
+-        g_error_free(error);
+-        return 1;
+-    }
+-
+-    variant = g_variant_get_variant(g_variant_get_child_value(variant, 0));
+-
+-    int active = 1;
+-    if (!g_variant_get_boolean(variant)) {
+-        active = 0;
+-    }
+-
+-    // get back to be root and return the value
+-    g_object_unref(connection);
+-    g_variant_unref(variant);
+-    setuid(0);
+-    return active;
+-}
+-
+ static int create_subproc_thread(const char *name)
+ {
+-    if (is_phone_locked() ) {
+-        fprintf(stderr, "device is locked\n");
+-        return -1;
+-    }
+-
+     stinfo *sti;
+     adb_thread_t t;
+     int ret_fd;
+     pid_t pid;
+-
+-    struct passwd *user = getpwuid(getuid());
+-    char *shell;
+-    char *shellopts = "-c";
+-    char *home;
+-    char *sudo = "/usr/bin/sudo";
+-    char useropt[256] = "-u";
+-
+-    if (user->pw_name)
+-        strcat(useropt, user->pw_name);
+-
+-    if (user && user->pw_shell) {
+-        shell = user->pw_shell;
+-        shellopts = "-cl";
+-    } else {
+-        shell = SHELL_COMMAND;
+-    }
+-
+-    if (user->pw_dir)
+-        home = user->pw_dir;
+-        if(chdir(home) < 0 )
+-            return 1;
+-
+     if(name) {
+-	ret_fd = create_subprocess(sudo, useropt, "-i", shell, shellopts, name, &pid);
++        ret_fd = create_subprocess(SHELL_COMMAND, "-c", name, &pid);
+     } else {
+-	shellopts = "-l";
+-	ret_fd = create_subprocess(sudo, useropt, "-i", shell, shellopts, 0, &pid);
++        ret_fd = create_subprocess(SHELL_COMMAND, "-", 0, &pid);
+     }
+     D("create_subprocess() ret_fd=%d pid=%d\n", ret_fd, pid);
+ 
+@@ -585,17 +453,13 @@ int service_to_fd(const char *name)
+     } else if (!strncmp(name, "log:", 4)) {
+         ret = create_service_thread(log_service, get_log_file_path(name + 4));
+     } else if(!HOST && !strncmp(name, "shell:", 6)) {
+-        if (!is_phone_locked() ) {
+-            if(name[6]) {
+-                ret = create_subproc_thread(name + 6);
+-            } else {
+-                ret = create_subproc_thread(0);
+-            }
++        if(name[6]) {
++            ret = create_subproc_thread(name + 6);
++        } else {
++            ret = create_subproc_thread(0);
+         }
+     } else if(!strncmp(name, "sync:", 5)) {
+-        if (!is_phone_locked() ) {
+-            ret = create_service_thread(file_sync_service, NULL);
+-        }
++        ret = create_service_thread(file_sync_service, NULL);
+     } else if(!strncmp(name, "remount:", 8)) {
+         ret = create_service_thread(remount_service, NULL);
+     } else if(!strncmp(name, "reboot:", 7)) {
+diff --git a/debian/makefiles/adbd.mk b/debian/makefiles/adbd.mk
+index 49dab8c..22c1816 100644
+--- a/debian/makefiles/adbd.mk
++++ b/debian/makefiles/adbd.mk
+@@ -40,11 +40,11 @@ CPPFLAGS+= -O2 -g -Wall -Wno-unused-parameter
+ CPPFLAGS+= -DADB_HOST=0 -DHAVE_FORKEXEC=1 -D_XOPEN_SOURCE -D_GNU_SOURCE -DALLOW_ADBD_ROOT=1
+ CPPFLAGS+= -DHAVE_SYMLINKS -DBOARD_ALWAYS_INSECURE
+ CPPFLAGS+= -DHAVE_TERMIO_H
+-CPPFLAGS+= `pkg-config --cflags glib-2.0 gio-2.0`
++CPPFLAGS+= -DADBD_NON_ANDROID
+ CPPFLAGS+= -I$(SRCDIR)/core/adbd
+ CPPFLAGS+= -I$(SRCDIR)/core/include
+ 
+-LIBS+= -lc -lpthread -lz -lcrypto -lcrypt `pkg-config --libs glib-2.0 gio-2.0`
++LIBS+= -lc -lpthread -lz -lcrypto -lcrypt
+ 
+ OBJS= $(patsubst %, %.o, $(basename $(SRCS)))
+ 
+-- 
+2.5.1
+
diff --git a/package/android-tools/Config.in b/package/android-tools/Config.in
new file mode 100644
index 0000000..a8048bd
--- /dev/null
+++ b/package/android-tools/Config.in
@@ -0,0 +1,39 @@
+config BR2_PACKAGE_ANDROID_TOOLS
+       bool "android-tools"
+       help
+         This package contains the fastboot and adb utilities, that
+         can be used to interact with target devices using of these
+         protocols.
+
+if BR2_PACKAGE_ANDROID_TOOLS
+
+config BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT
+       bool "fastboot"
+       select BR2_PACKAGE_LIBSELINUX
+       select BR2_PACKAGE_ZLIB
+       help
+         This option will build and install the fastboot utility for
+         the target, which can be used to reflash other target devices
+         implementing the fastboot protocol.
+
+config BR2_PACKAGE_ANDROID_TOOLS_ADB
+       bool "adb"
+       select BR2_PACKAGE_OPENSSL
+       select BR2_PACKAGE_ZLIB
+       help
+         This option will build and install the adb utility for the
+         target, which can be used to interact with other target devices
+         implementing the ADB protocol.
+
+config BR2_PACKAGE_ANDROID_TOOLS_ADBD
+       bool "adbd"
+       default y if !BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT
+       default y if !BR2_PACKAGE_ANDROID_TOOLS_ADB
+       select BR2_PACKAGE_OPENSSL
+       select BR2_PACKAGE_ZLIB
+       help
+         This option will build and install the adbd utility for the
+         target, which can be used to interact with a host machine
+         implementing the ADB protocol.
+
+endif
diff --git a/package/android-tools/Config.in.host b/package/android-tools/Config.in.host
new file mode 100644
index 0000000..4f16e9c
--- /dev/null
+++ b/package/android-tools/Config.in.host
@@ -0,0 +1,25 @@
+config BR2_PACKAGE_HOST_ANDROID_TOOLS
+       bool "android-tools"
+       help
+         This package contains the fastboot and adb utilities, that
+         can be used to interact with target devices using of these
+         protocols.
+
+if BR2_PACKAGE_HOST_ANDROID_TOOLS
+
+config BR2_PACKAGE_HOST_ANDROID_TOOLS_FASTBOOT
+       bool "fastboot"
+       help
+         This option will build and install the fastboot utility for
+         the host, which can be used to reflash target devices
+         implementing the fastboot protocol.
+
+config BR2_PACKAGE_HOST_ANDROID_TOOLS_ADB
+       bool "adb"
+       default y if !BR2_PACKAGE_HOST_ANDROID_TOOLS_FASTBOOT
+       help
+         This option will build and install the adb utility for the
+         host, which can be used to interact with target devices
+         implementing the ADB protocol.
+
+endif
diff --git a/package/android-tools/android-tools.hash b/package/android-tools/android-tools.hash
new file mode 100644
index 0000000..5d8ae59
--- /dev/null
+++ b/package/android-tools/android-tools.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha512	c5bfd3c8e514809db257ba5559c865742768b7520b38aa2f53185aff5c328e5cf7fb328a6ff6450eeddd5056985f232d492eba63a87978440e2147e26d62f458  android-tools_4.2.2+git20130218.orig.tar.xz
+sha512	aa3fee593cecf5d9a5fbc60b18d67dadc5b832fdea75a098ec7371b8f774673af3a3b6052d7eecaf315943beaa984a1f5a3c114a698620275af1682bd05d4d23  android-tools_4.2.2+git20130218-3ubuntu41.debian.tar.gz
diff --git a/package/android-tools/android-tools.mk b/package/android-tools/android-tools.mk
new file mode 100644
index 0000000..25817d5
--- /dev/null
+++ b/package/android-tools/android-tools.mk
@@ -0,0 +1,85 @@
+################################################################################
+#
+# android-tools
+#
+################################################################################
+
+ANDROID_TOOLS_SITE = https://launchpad.net/ubuntu/+archive/primary/+files/
+ANDROID_TOOLS_VERSION = 4.2.2+git20130218
+ANDROID_TOOLS_SOURCE = android-tools_$(ANDROID_TOOLS_VERSION).orig.tar.xz
+ANDROID_TOOLS_EXTRA_DOWNLOADS = android-tools_$(ANDROID_TOOLS_VERSION)-3ubuntu41.debian.tar.gz
+HOST_ANDROID_TOOLS_EXTRA_DOWNLOADS = $(ANDROID_TOOLS_EXTRA_DOWNLOADS)
+ANDROID_TOOLS_LICENSE = Apache-2.0
+ANDROID_TOOLS_LICENSE_FILES = debian/copyright
+
+# Extract the Debian tarball inside the sources
+define ANDROID_TOOLS_DEBIAN_EXTRACT
+	$(call suitable-extractor,$(notdir $(ANDROID_TOOLS_EXTRA_DOWNLOADS))) \
+		$(DL_DIR)/$(notdir $(ANDROID_TOOLS_EXTRA_DOWNLOADS)) | \
+		$(TAR) -C $(@D) $(TAR_OPTIONS) -
+endef
+
+HOST_ANDROID_TOOLS_POST_EXTRACT_HOOKS += ANDROID_TOOLS_DEBIAN_EXTRACT
+ANDROID_TOOLS_POST_EXTRACT_HOOKS += ANDROID_TOOLS_DEBIAN_EXTRACT
+
+# Apply the Debian patches before applying the Buildroot patches
+define ANDROID_TOOLS_DEBIAN_PATCH
+	$(APPLY_PATCHES) $(@D) $(@D)/debian/patches \*
+endef
+
+HOST_ANDROID_TOOLS_PRE_PATCH_HOOKS += ANDROID_TOOLS_DEBIAN_PATCH
+ANDROID_TOOLS_PRE_PATCH_HOOKS += ANDROID_TOOLS_DEBIAN_PATCH
+
+ifeq ($(BR2_PACKAGE_HOST_ANDROID_TOOLS_FASTBOOT),y)
+HOST_ANDROID_TOOLS_TARGETS += fastboot
+HOST_ANDROID_TOOLS_DEPENDENCIES += host-zlib host-libselinux
+endif
+
+ifeq ($(BR2_PACKAGE_HOST_ANDROID_TOOLS_ADB),y)
+HOST_ANDROID_TOOLS_TARGETS += adb
+HOST_ANDROID_TOOLS_DEPENDENCIES += host-zlib host-openssl
+endif
+
+ifeq ($(BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT),y)
+ANDROID_TOOLS_TARGETS += fastboot
+ANDROID_TOOLS_DEPENDENCIES += zlib libselinux
+endif
+
+ifeq ($(BR2_PACKAGE_ANDROID_TOOLS_ADB),y)
+ANDROID_TOOLS_TARGETS += adb
+ANDROID_TOOLS_DEPENDENCIES += zlib openssl
+endif
+
+ifeq ($(BR2_PACKAGE_ANDROID_TOOLS_ADBD),y)
+ANDROID_TOOLS_TARGETS += adbd
+ANDROID_TOOLS_DEPENDENCIES += zlib openssl
+endif
+
+# Build each tool in its own directory not to share object files
+
+define HOST_ANDROID_TOOLS_BUILD_CMDS
+	$(foreach t,$(HOST_ANDROID_TOOLS_TARGETS),\
+		mkdir -p $(@D)/build-$(t) && \
+		$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) SRCDIR=$(@D) \
+			-C $(@D)/build-$(t) -f $(@D)/debian/makefiles/$(t).mk$(sep))
+endef
+
+define ANDROID_TOOLS_BUILD_CMDS
+	$(foreach t,$(ANDROID_TOOLS_TARGETS),\
+		mkdir -p $(@D)/build-$(t) && \
+		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) SRCDIR=$(@D) \
+			-C $(@D)/build-$(t) -f $(@D)/debian/makefiles/$(t).mk$(sep))
+endef
+
+define HOST_ANDROID_TOOLS_INSTALL_CMDS
+	$(foreach t,$(HOST_ANDROID_TOOLS_TARGETS),\
+		$(INSTALL) -D -m 0755 $(@D)/build-$(t)/$(t) $(HOST_DIR)/usr/bin/$(t)$(sep))
+endef
+
+define ANDROID_TOOLS_INSTALL_TARGET_CMDS
+	$(foreach t,$(ANDROID_TOOLS_TARGETS),\
+		$(INSTALL) -D -m 0755 $(@D)/build-$(t)/$(t) $(TARGET_DIR)/usr/bin/$(t)$(sep))
+endef
+
+$(eval $(host-generic-package))
+$(eval $(generic-package))
-- 
2.5.1
