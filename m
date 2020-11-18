From: Christian Stewart <christian@paral.in>
Date: Tue, 17 Nov 2020 18:52:50 -0800
Subject: [Buildroot] [PATCH v3 3/5] package/libnvidia-container: new package
In-Reply-To: <20201118025252.3806860-1-christian@paral.in>
References: <20201118025252.3806860-1-christian@paral.in>
Message-ID: <20201118025252.3806860-3-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libnvidia-container package adds a library and CLI for GPU-backed
containers, agnostic to container runtime.

https://github.com/NVIDIA/libnvidia-container

Signed-off-by: Christian Stewart <christian@paral.in>

v1 -> v2:

 - cjs: thanks Asaf thanks for review
 - cjs: remove extra include dirs
 - cjs: simplify configuration opts

v2 -> v3:

 - cjs: add fixup for go-module support

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/Config.in                             |    1 +
 ...d-fixes-from-vowstar-portage-overlay.patch | 1890 +++++++++++++++++
 ...ve-dependency-handling-from-Makefile.patch |  698 ++++++
 package/libnvidia-container/Config.in         |   18 +
 .../libnvidia-container.hash                  |    3 +
 .../libnvidia-container.mk                    |   44 +
 6 files changed, 2654 insertions(+)
 create mode 100644 package/libnvidia-container/0001-Build-fixes-from-vowstar-portage-overlay.patch
 create mode 100644 package/libnvidia-container/0002-Remove-dependency-handling-from-Makefile.patch
 create mode 100644 package/libnvidia-container/Config.in
 create mode 100644 package/libnvidia-container/libnvidia-container.hash
 create mode 100644 package/libnvidia-container/libnvidia-container.mk

diff --git a/package/Config.in b/package/Config.in
index 01072c3e45..ef01361fdb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1532,6 +1532,7 @@ menu "Hardware handling"
 	source "package/libllcp/Config.in"
 	source "package/libmbim/Config.in"
 	source "package/libnfc/Config.in"
+	source "package/libnvidia-container/Config.in"
 	source "package/libpciaccess/Config.in"
 	source "package/libphidget/Config.in"
 	source "package/libpri/Config.in"
diff --git a/package/libnvidia-container/0001-Build-fixes-from-vowstar-portage-overlay.patch b/package/libnvidia-container/0001-Build-fixes-from-vowstar-portage-overlay.patch
new file mode 100644
index 0000000000..7232e76d97
--- /dev/null
+++ b/package/libnvidia-container/0001-Build-fixes-from-vowstar-portage-overlay.patch
@@ -0,0 +1,1890 @@
+From bd633a208446c86e11097e3cd3b019a086738ae3 Mon Sep 17 00:00:00 2001
+From: Christian Stewart <christian@paral.in>
+Date: Sun, 19 Jul 2020 09:56:42 -0700
+Subject: [PATCH] Build fixes from vowstar portage overlay
+
+This commit brings in build fixes written by @vowstar in the overlay:
+
+https://github.com/vowstar/vowstar-overlay/tree/master/app-emulation/libnvidia-container/files
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+---
+ Makefile                    |  30 +-
+ mk/Dockerfile.debian        |   1 -
+ mk/Dockerfile.ubuntu        |   1 -
+ mk/common.mk                |   2 +-
+ src/nvc.c                   |   4 +-
+ src/nvidia-modprobe-utils.c | 794 ++++++++++++++++++++++++++++++++++++
+ src/nvidia-modprobe-utils.h | 157 +++++++
+ src/pci-enum.h              | 112 +++++
+ src/pci-sysfs.c             | 529 ++++++++++++++++++++++++
+ src/pci-sysfs.h             |  85 ++++
+ 10 files changed, 1696 insertions(+), 19 deletions(-)
+ create mode 100644 src/nvidia-modprobe-utils.c
+ create mode 100644 src/nvidia-modprobe-utils.h
+ create mode 100644 src/pci-enum.h
+ create mode 100644 src/pci-sysfs.c
+ create mode 100644 src/pci-sysfs.h
+
+diff --git a/Makefile b/Makefile
+index c07863b..f1c56a9 100644
+--- a/Makefile
++++ b/Makefile
+@@ -4,21 +4,21 @@
+ 
+ .PHONY: all tools shared static deps install uninstall dist depsclean mostlyclean clean distclean
+ .DEFAULT_GOAL := all
+-
++STRIP  := @echo skipping: strip
+ ##### Global variables #####
+ 
+-WITH_LIBELF  ?= no
+-WITH_TIRPC   ?= no
++WITH_LIBELF  ?= yes
++WITH_TIRPC   ?= yes
+ WITH_SECCOMP ?= yes
+ 
+ ##### Global definitions #####
+ 
+-export prefix      = /usr/local
++export prefix      = /usr
+ export exec_prefix = $(prefix)
+ export bindir      = $(exec_prefix)/bin
+-export libdir      = $(exec_prefix)/lib
++export libdir      = $(exec_prefix)/lib64
+ export docdir      = $(prefix)/share/doc
+-export libdbgdir   = $(prefix)/lib/debug$(libdir)
++export libdbgdir   = $(prefix)/lib64/debug$(libdir)
+ export includedir  = $(prefix)/include
+ export pkgconfdir  = $(libdir)/pkgconfig
+ 
+@@ -52,6 +52,8 @@ LIB_SRCS     := $(SRCS_DIR)/driver.c        \
+                 $(SRCS_DIR)/error_generic.c \
+                 $(SRCS_DIR)/error.c         \
+                 $(SRCS_DIR)/ldcache.c       \
++                $(SRCS_DIR)/pci-sysfs.c     \
++                $(SRCS_DIR)/nvidia-modprobe-utils.c \
+                 $(SRCS_DIR)/nvc.c           \
+                 $(SRCS_DIR)/nvc_ldcache.c   \
+                 $(SRCS_DIR)/nvc_info.c      \
+@@ -121,8 +123,8 @@ LDLIBS   := $(LDLIBS)
+ LIB_CPPFLAGS       = -DNV_LINUX -isystem $(DEPS_DIR)$(includedir) -include $(BUILD_DEFS)
+ LIB_CFLAGS         = -fPIC
+ LIB_LDFLAGS        = -L$(DEPS_DIR)$(libdir) -shared -Wl,-soname=$(LIB_SONAME)
+-LIB_LDLIBS_STATIC  = -l:libnvidia-modprobe-utils.a
+-LIB_LDLIBS_SHARED  = -ldl -lcap
++# LIB_LDLIBS_STATIC  = -l:libnvidia-modprobe-utils.a
++LIB_LDLIBS_SHARED  = -ldl -lcap -ltirpc
+ ifeq ($(WITH_LIBELF), yes)
+ LIB_CPPFLAGS       += -DWITH_LIBELF
+ LIB_LDLIBS_SHARED  += -lelf
+@@ -131,7 +133,7 @@ LIB_LDLIBS_STATIC  += -l:libelf.a
+ endif
+ ifeq ($(WITH_TIRPC), yes)
+ LIB_CPPFLAGS       += -isystem $(DEPS_DIR)$(includedir)/tirpc -DWITH_TIRPC
+-LIB_LDLIBS_STATIC  += -l:libtirpc.a
++# LIB_LDLIBS_STATIC  += -l:libtirpc.a
+ LIB_LDLIBS_SHARED  += -lpthread
+ endif
+ ifeq ($(WITH_SECCOMP), yes)
+@@ -146,7 +148,7 @@ LIB_LDLIBS_SHARED  += $(LDLIBS)
+ LIB_LDLIBS         = $(LIB_LDLIBS_STATIC) $(LIB_LDLIBS_SHARED)
+ 
+ # Binary flags (recursively expanded to handle target-specific flags)
+-BIN_CPPFLAGS       = -include $(BUILD_DEFS) $(CPPFLAGS)
++BIN_CPPFLAGS       = -include $(BUILD_DEFS) $(CPPFLAGS) -DWITH_TIRPC
+ BIN_CFLAGS         = -I$(SRCS_DIR) -fPIE -flto $(CFLAGS)
+ BIN_LDFLAGS        = -L. -pie $(LDFLAGS) -Wl,-rpath='$$ORIGIN/../$$LIB'
+ BIN_LDLIBS         = -l:$(LIB_SHARED) -lcap $(LDLIBS)
+@@ -220,12 +222,12 @@ static: $(LIB_STATIC)($(LIB_STATIC_OBJ))
+ deps: export DESTDIR:=$(DEPS_DIR)
+ deps: $(LIB_RPC_SRCS) $(BUILD_DEFS)
+ 	$(MKDIR) -p $(DEPS_DIR)
+-	$(MAKE) -f $(MAKE_DIR)/nvidia-modprobe.mk install
++	# $(MAKE) -f $(MAKE_DIR)/nvidia-modprobe.mk install
+ ifeq ($(WITH_LIBELF), no)
+-	$(MAKE) -f $(MAKE_DIR)/elftoolchain.mk install
++	# $(MAKE) -f $(MAKE_DIR)/elftoolchain.mk install
+ endif
+ ifeq ($(WITH_TIRPC), yes)
+-	$(MAKE) -f $(MAKE_DIR)/libtirpc.mk install
++	# $(MAKE) -f $(MAKE_DIR)/libtirpc.mk install
+ endif
+ 
+ install: all
+@@ -238,7 +240,7 @@ install: all
+ 	$(LN) -sf $(LIB_SONAME) $(DESTDIR)$(libdir)/$(LIB_SYMLINK)
+ 	$(LDCONFIG) -n $(DESTDIR)$(libdir)
+ 	# Install debugging symbols
+-	$(INSTALL) -m 644 $(DEBUG_DIR)/$(LIB_SONAME) $(DESTDIR)$(libdbgdir)
++	# $(INSTALL) -m 644 $(DEBUG_DIR)/$(LIB_SONAME) $(DESTDIR)$(libdbgdir)
+ 	# Install configuration files
+ 	$(MAKE_DIR)/$(LIB_PKGCFG).in "$(strip $(VERSION))" "$(strip $(LIB_LDLIBS_SHARED))" > $(DESTDIR)$(pkgconfdir)/$(LIB_PKGCFG)
+ 	# Install binary files
+diff --git a/mk/Dockerfile.debian b/mk/Dockerfile.debian
+index 8e8a560..096e1d0 100644
+--- a/mk/Dockerfile.debian
++++ b/mk/Dockerfile.debian
+@@ -41,7 +41,6 @@ RUN make distclean && make -j"$(nproc)"
+ ENV DIST_DIR /dist
+ VOLUME $DIST_DIR
+ CMD bash -c " \
+-        export DISTRIB=$(lsb_release -c -s); \
+         export SECTION="" \
+         make dist; \
+         make deb; \
+diff --git a/mk/Dockerfile.ubuntu b/mk/Dockerfile.ubuntu
+index 8b8cea8..d1f64d0 100644
+--- a/mk/Dockerfile.ubuntu
++++ b/mk/Dockerfile.ubuntu
+@@ -40,7 +40,6 @@ RUN make distclean && make -j"$(nproc)"
+ ENV DIST_DIR /dist
+ VOLUME $DIST_DIR
+ CMD bash -c " \
+-        export DISTRIB=$(lsb_release -c -s); \
+         export SECTION="" \
+         make dist; \
+         make deb; \
+diff --git a/mk/common.mk b/mk/common.mk
+index 73bc27a..cdd93c9 100644
+--- a/mk/common.mk
++++ b/mk/common.mk
+@@ -21,7 +21,7 @@ DOCKER   ?= docker
+ UID      := $(shell id -u)
+ GID      := $(shell id -g)
+ DATE     := $(shell date -u --iso-8601=minutes)
+-REVISION := $(shell git rev-parse HEAD)
++REVISION := 61f82bf25f0b3afaa75c6df8a0a6551ecfdf81f4
+ COMPILER := $(realpath $(shell which $(CC)))
+ PLATFORM ?= $(shell uname -m)
+ 
+diff --git a/src/nvc.c b/src/nvc.c
+index 35ad5be..f1d9b62 100644
+--- a/src/nvc.c
++++ b/src/nvc.c
+@@ -14,8 +14,8 @@
+ #include <stdlib.h>
+ #include <unistd.h>
+ 
+-#include <pci-enum.h>
+-#include <nvidia-modprobe-utils.h>
++#include "pci-enum.h"
++#include "nvidia-modprobe-utils.h"
+ 
+ #include "nvc_internal.h"
+ 
+diff --git a/src/nvidia-modprobe-utils.c b/src/nvidia-modprobe-utils.c
+new file mode 100644
+index 0000000..d3f3233
+--- /dev/null
++++ b/src/nvidia-modprobe-utils.c
+@@ -0,0 +1,794 @@
++
++#if defined(NV_LINUX)
++
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++#include <sys/types.h>
++#include <sys/stat.h>
++#include <unistd.h>
++#include <errno.h>
++#include <sys/types.h>
++#include <sys/wait.h>
++#include <fcntl.h>
++
++#include "nvidia-modprobe-utils.h"
++#include "pci-enum.h"
++
++#define NV_PROC_MODPROBE_PATH "/proc/sys/kernel/modprobe"
++#define NV_PROC_MODULES_PATH "/proc/modules"
++#define NV_PROC_DEVICES_PATH "/proc/devices"
++
++#define NV_PROC_MODPROBE_PATH_MAX        1024
++#define NV_MAX_MODULE_NAME_SIZE          16
++#define NV_MAX_PROC_REGISTRY_PATH_SIZE   NV_MAX_CHARACTER_DEVICE_FILE_STRLEN
++#define NV_MAX_LINE_LENGTH               256
++
++#define NV_NVIDIA_MODULE_NAME "nvidia"
++#define NV_PROC_REGISTRY_PATH "/proc/driver/nvidia/params"
++
++#define NV_NMODULE_NVIDIA_MODULE_NAME "nvidia%d"
++#define NV_NMODULE_PROC_REGISTRY_PATH "/proc/driver/nvidia/%d/params"
++
++#define NV_UVM_MODULE_NAME "nvidia-uvm"
++#define NV_UVM_DEVICE_NAME "/dev/nvidia-uvm"
++#define NV_UVM_TOOLS_DEVICE_NAME "/dev/nvidia-uvm-tools"
++
++#define NV_MODESET_MODULE_NAME "nvidia-modeset"
++
++#define NV_VGPU_VFIO_MODULE_NAME "nvidia-vgpu-vfio"
++
++#define NV_NVLINK_MODULE_NAME "nvidia-nvlink"
++#define NV_NVLINK_PROC_PERM_PATH "/proc/driver/nvidia-nvlink/permissions"
++
++#define NV_DEVICE_FILE_MODE_MASK (S_IRWXU|S_IRWXG|S_IRWXO)
++#define NV_DEVICE_FILE_MODE (S_IRUSR|S_IWUSR|S_IRGRP|S_IWGRP|S_IROTH|S_IWOTH)
++#define NV_DEVICE_FILE_UID 0
++#define NV_DEVICE_FILE_GID 0
++
++#define NV_MAKE_DEVICE(x,y) ((dev_t)((x) << 8 | (y)))
++
++#define NV_MAJOR_DEVICE_NUMBER 195
++
++#define NV_PCI_VENDOR_ID    0x10DE
++
++#define NV_MIN(a, b) (((a) < (b)) ? (a) : (b))
++
++/*
++ * Construct the nvidia kernel module name based on the input
++ * module instance provided.  If an error occurs, the null
++ * terminator will be written to nv_module_name[0].
++ */
++static __inline__ void assign_nvidia_kernel_module_name
++(
++    char nv_module_name[NV_MAX_MODULE_NAME_SIZE],
++    int module_instance
++)
++{
++    int ret;
++
++    if (is_multi_module(module_instance))
++    {
++        ret = snprintf(nv_module_name, NV_MAX_MODULE_NAME_SIZE,
++                       NV_NMODULE_NVIDIA_MODULE_NAME, module_instance);
++    }
++    else
++    {
++        ret = snprintf(nv_module_name, NV_MAX_MODULE_NAME_SIZE,
++                       NV_NVIDIA_MODULE_NAME);
++    }
++
++    if (ret <= 0)
++    {
++        goto fail;
++    }
++
++    nv_module_name[NV_MAX_MODULE_NAME_SIZE - 1] = '\0';
++
++    return;
++
++fail:
++
++    nv_module_name[0] = '\0';
++}
++
++
++/*
++ * Construct the proc registry path name based on the input
++ * module instance provided.  If an error occurs, the null
++ * terminator will be written to proc_path[0].
++ */
++static __inline__ void assign_proc_registry_path
++(
++    char proc_path[NV_MAX_PROC_REGISTRY_PATH_SIZE],
++    int module_instance
++)
++{
++    int ret;
++
++    if (is_multi_module(module_instance))
++    {
++        ret = snprintf(proc_path, NV_MAX_PROC_REGISTRY_PATH_SIZE,
++                       NV_NMODULE_PROC_REGISTRY_PATH, module_instance);
++    }
++    else
++    {
++        ret = snprintf(proc_path, NV_MAX_PROC_REGISTRY_PATH_SIZE,
++                       NV_PROC_REGISTRY_PATH);
++    }
++
++    if (ret <= 0)
++    {
++        goto fail;
++    }
++
++    proc_path[NV_MAX_PROC_REGISTRY_PATH_SIZE - 1] = '\0';
++
++    return;
++
++fail:
++
++    proc_path[0] = '\0';
++}
++
++
++/*
++ * Just like strcmp(3), except that differences between '-' and '_' are
++ * ignored. This is useful for comparing module names, where '-' and '_'
++ * are supposed to be treated interchangeably.
++ */
++static int modcmp(const char *a, const char *b)
++{
++    int i;
++
++    /* Walk both strings and compare each character */
++    for (i = 0; a[i] && b[i]; i++)
++    {
++        if (a[i] != b[i])
++        {
++            /* ignore differences between '-' and '_' */
++            if (((a[i] == '-') || (a[i] == '_')) &&
++                ((b[i] == '-') || (b[i] == '_')))
++            {
++                continue;
++            }
++
++            break;
++        }
++    }
++
++    /*
++     * If the strings are of unequal length, only one of a[i] or b[i] == '\0'.
++     * If they are the same length, both will be '\0', and the strings match.
++     */
++    return a[i] - b[i];
++}
++
++
++/*
++ * Check whether the specified module is loaded by reading
++ * NV_PROC_MODULES_PATH; returns 1 if the kernel module is loaded.
++ * Otherwise, it returns 0.
++ */
++static int is_kernel_module_loaded(const char *nv_module_name)
++{
++    FILE *fp;
++    char module_name[NV_MAX_MODULE_NAME_SIZE];
++    int module_loaded = 0;
++
++    fp = fopen(NV_PROC_MODULES_PATH, "r");
++
++    if (fp == NULL)
++    {
++        return 0;
++    }
++
++    while (fscanf(fp, "%15s%*[^\n]\n", module_name) == 1)
++    {
++        module_name[15] = '\0';
++        if (modcmp(module_name, nv_module_name) == 0)
++        {
++            module_loaded = 1;
++            break;
++        }
++    }
++
++    fclose(fp);
++
++    return module_loaded;
++}
++
++/*
++ * Attempt to redirect STDOUT and STDERR to /dev/null.
++ *
++ * This is only for the cosmetics of silencing warnings, so do not
++ * treat any errors here as fatal.
++ */
++static void silence_current_process(void)
++{
++    int dev_null_fd = open("/dev/null", O_RDWR);
++    if (dev_null_fd < 0)
++    {
++        return;
++    }
++
++    dup2(dev_null_fd, STDOUT_FILENO);
++    dup2(dev_null_fd, STDERR_FILENO);
++    close(dev_null_fd);
++}
++
++/*
++ * Attempt to load a kernel module; returns 1 if kernel module is
++ * successfully loaded.  Returns 0 if the kernel module could not be
++ * loaded.
++ *
++ * If any error is encountered and print_errors is non-0, then print the
++ * error to stderr.
++ */
++static int modprobe_helper(const int print_errors, const char *module_name)
++{
++    char modprobe_path[NV_PROC_MODPROBE_PATH_MAX];
++    int status = 1;
++    struct stat file_status;
++    pid_t pid;
++    const char *envp[] = { "PATH=/sbin", NULL };
++    FILE *fp;
++
++    /*
++     * Use PCI_BASE_CLASS_MASK to cover both types of DISPLAY controllers that
++     * NVIDIA ships (VGA = 0x300 and 3D = 0x302).
++     */
++    struct pci_id_match id_match = {
++        NV_PCI_VENDOR_ID,       /* Vendor ID    = 0x10DE                 */
++        PCI_MATCH_ANY,          /* Device ID    = any                    */
++        PCI_MATCH_ANY,          /* Subvendor ID = any                    */
++        PCI_MATCH_ANY,          /* Subdevice ID = any                    */
++        0x0300,                 /* Device Class = PCI_BASE_CLASS_DISPLAY */
++        PCI_BASE_CLASS_MASK,    /* Display Mask = base class only        */
++        0                       /* Initial number of matches             */
++    };
++
++    modprobe_path[0] = '\0';
++
++    if (module_name == NULL || module_name[0] == '\0') {
++        return 0;
++    }
++
++    /* If the kernel module is already loaded, nothing more to do: success. */
++
++    if (is_kernel_module_loaded(module_name))
++    {
++        return 1;
++    }
++
++    /*
++     * Before attempting to load the module, look for any NVIDIA PCI devices.
++     * If none exist, exit instead of attempting the modprobe, because doing so
++     * would issue error messages that are really irrelevant if there are no
++     * NVIDIA PCI devices present.
++     *
++     * If our check fails, for whatever reason, continue with the modprobe just
++     * in case.
++     */
++    status = pci_enum_match_id(&id_match);
++    if (status == 0 && id_match.num_matches == 0)
++    {
++        if (print_errors)
++        {
++            fprintf(stderr,
++                    "NVIDIA: no NVIDIA devices found\n");
++        }
++
++        return 0;
++    }
++
++    /* Only attempt to load the kernel module if root. */
++
++    if (geteuid() != 0)
++    {
++        return 0;
++    }
++
++    /* Attempt to read the full path to the modprobe executable from /proc. */
++
++    fp = fopen(NV_PROC_MODPROBE_PATH, "r");
++    if (fp != NULL)
++    {
++        char *str;
++        size_t n;
++
++        n = fread(modprobe_path, 1, sizeof(modprobe_path), fp);
++
++        /*
++         * Null terminate the string, but make sure 'n' is in the range
++         * [0, sizeof(modprobe_path)-1].
++         */
++        n = NV_MIN(n, sizeof(modprobe_path) - 1);
++        modprobe_path[n] = '\0';
++
++        /*
++         * If str was longer than a line, we might still have a
++         * newline in modprobe_path: if so, overwrite it with the nul
++         * terminator.
++         */
++        str = strchr(modprobe_path, '\n');
++        if (str != NULL)
++        {
++            *str = '\0';
++        }
++
++        fclose(fp);
++    }
++
++    /* If we couldn't read it from /proc, pick a reasonable default. */
++
++    if (modprobe_path[0] == '\0')
++    {
++        sprintf(modprobe_path, "/sbin/modprobe");
++    }
++
++    /* Do not attempt to exec(3) modprobe if it does not exist. */
++
++    if (stat(modprobe_path, &file_status) != 0 ||
++        !S_ISREG(file_status.st_mode) ||
++        (file_status.st_mode & S_IXUSR) != S_IXUSR)
++    {
++        return 0;
++    }
++
++    /* Fork and exec modprobe from the child process. */
++
++    switch (pid = fork())
++    {
++        case 0:
++
++            /*
++             * modprobe might complain in expected scenarios.  E.g.,
++             * `modprobe nvidia` on a Tegra system with dGPU where no nvidia.ko is
++             * present will complain:
++             *
++             *  "modprobe: FATAL: Module nvidia not found."
++             *
++             * Silence the current process to avoid such unwanted messages.
++             */
++            silence_current_process();
++
++            execle(modprobe_path, "modprobe",
++                   module_name, NULL, envp);
++
++            /* If execl(3) returned, then an error has occurred. */
++
++            if (print_errors)
++            {
++                fprintf(stderr,
++                        "NVIDIA: failed to execute `%s`: %s.\n",
++                        modprobe_path, strerror(errno));
++            }
++            exit(1);
++
++        case -1:
++            return 0;
++
++        default:
++            if (waitpid(pid, &status, 0) < 0)
++            {
++                return 0;
++            }
++            if (WIFEXITED(status) && WEXITSTATUS(status) == 0)
++            {
++                return 1;
++            }
++            else
++            {
++                return 0;
++            }
++    }
++
++    return 1;
++}
++
++
++/*
++ * Attempt to load an NVIDIA kernel module
++ */
++int nvidia_modprobe(const int print_errors, int module_instance)
++{
++    char nv_module_name[NV_MAX_MODULE_NAME_SIZE];
++
++    assign_nvidia_kernel_module_name(nv_module_name, module_instance);
++
++    return modprobe_helper(print_errors, nv_module_name);
++}
++
++
++/*
++ * Determine the requested device file parameters: allow users to
++ * override the default UID/GID and/or mode of the NVIDIA device
++ * files, or even whether device file modification should be allowed;
++ * the attributes are managed globally, and can be adjusted via the
++ * appropriate kernel module parameters.
++ */
++static void init_device_file_parameters(uid_t *uid, gid_t *gid, mode_t *mode,
++                                        int *modify, const char *proc_path)
++{
++    FILE *fp;
++    char name[32];
++    unsigned int value;
++
++    *mode = NV_DEVICE_FILE_MODE;
++    *uid = NV_DEVICE_FILE_UID;
++    *gid = NV_DEVICE_FILE_GID;
++    *modify = 1;
++
++    if (proc_path == NULL || proc_path[0] == '\0')
++    {
++        return;
++    }
++
++    fp = fopen(proc_path, "r");
++
++    if (fp == NULL)
++    {
++        return;
++    }
++
++    while (fscanf(fp, "%31[^:]: %u\n", name, &value) == 2)
++    {
++        name[31] = '\0';
++        if (strcmp(name, "DeviceFileUID") == 0)
++        {
++            *uid = value;
++        }
++        if (strcmp(name, "DeviceFileGID") == 0)
++        {
++            *gid = value;
++        }
++        if (strcmp(name, "DeviceFileMode") == 0)
++        {
++            *mode = value;
++        }
++        if (strcmp(name, "ModifyDeviceFiles") == 0)
++        {
++            *modify = value;
++        }
++    }
++
++    fclose(fp);
++}
++
++/* 
++ * A helper to query device file states.
++ */
++static int get_file_state_helper(
++    const char *path,
++    int major,
++    int minor,
++    const char *proc_path,
++    uid_t uid,
++    gid_t gid,
++    mode_t mode)
++{
++    dev_t dev = NV_MAKE_DEVICE(major, minor);
++    struct stat stat_buf;
++    int ret;
++    int state = 0;
++
++    ret = stat(path, &stat_buf);
++    if (ret == 0)
++    {
++        nvidia_update_file_state(&state, NvDeviceFileStateFileExists);
++
++        if (S_ISCHR(stat_buf.st_mode) && (stat_buf.st_rdev == dev))
++        {
++            nvidia_update_file_state(&state, NvDeviceFileStateChrDevOk);
++        }
++
++        if (((stat_buf.st_mode & NV_DEVICE_FILE_MODE_MASK) == mode) &&
++            (stat_buf.st_uid == uid) &&
++            (stat_buf.st_gid == gid))
++        {
++            nvidia_update_file_state(&state, NvDeviceFileStatePermissionsOk);
++        }
++    }
++
++    return state;
++}
++
++int nvidia_get_file_state(int minor, int module_instance)
++{
++    char path[NV_MAX_CHARACTER_DEVICE_FILE_STRLEN];
++    char proc_path[NV_MAX_PROC_REGISTRY_PATH_SIZE];
++    mode_t mode;
++    uid_t uid;
++    gid_t gid;
++    int modification_allowed;
++    int state = 0;
++
++    assign_device_file_name(path, minor, module_instance);
++    assign_proc_registry_path(proc_path, module_instance);
++
++    init_device_file_parameters(&uid, &gid, &mode, &modification_allowed,
++                                proc_path);
++
++    state = get_file_state_helper(path, NV_MAJOR_DEVICE_NUMBER, minor,
++                                  proc_path, uid, gid, mode);
++
++    return state;
++}
++
++/*
++ * Attempt to create the specified device file with the specified major
++ * and minor number.  If proc_path is specified, scan it for custom file
++ * permissions.  Returns 1 if the file is successfully created; returns 0
++ * if the file could not be created.
++ */
++int mknod_helper(int major, int minor, const char *path,
++                 const char *proc_path)
++{
++    dev_t dev = NV_MAKE_DEVICE(major, minor);
++    mode_t mode;
++    uid_t uid;
++    gid_t gid;
++    int modification_allowed;
++    int ret;
++    int state;
++    int do_mknod;
++
++    if (path == NULL || path[0] == '\0')
++    {
++        return 0;
++    }
++
++    init_device_file_parameters(&uid, &gid, &mode, &modification_allowed,
++                                proc_path);
++
++    /* If device file modification is not allowed, nothing to do: success. */
++
++    if (modification_allowed != 1)
++    {
++        return 1;
++    }
++
++    state = get_file_state_helper(path, major, minor,
++                                  proc_path, uid, gid, mode);
++
++    if (nvidia_test_file_state(state, NvDeviceFileStateFileExists) &&
++        nvidia_test_file_state(state, NvDeviceFileStateChrDevOk) &&
++        nvidia_test_file_state(state, NvDeviceFileStatePermissionsOk))
++    {
++        return 1;
++    }
++
++    /* If the stat(2) above failed, we need to create the device file. */
++
++    do_mknod = 0;
++
++    if (!nvidia_test_file_state(state, NvDeviceFileStateFileExists))
++    {
++        do_mknod = 1;
++    }
++
++    /*
++     * If the file exists but the file is either not a character device or has
++     * the wrong major/minor character device number, then we need to delete it
++     * and recreate it.
++     */
++    if (!do_mknod &&
++        !nvidia_test_file_state(state, NvDeviceFileStateChrDevOk))
++    {
++        ret = remove(path);
++        if (ret != 0)
++        {
++            return 0;
++        }
++        do_mknod = 1;
++    }
++
++    if (do_mknod)
++    {
++        ret = mknod(path, S_IFCHR | mode, dev);
++        if (ret != 0)
++        {
++            return 0;
++        }
++    }
++
++    /*
++     * Make sure the permissions and ownership are set correctly; if
++     * we created the device above and either of the below fails, then
++     * also delete the device file.
++     */
++    if ((chmod(path, mode) != 0) ||
++        (chown(path, uid, gid) != 0))
++    {
++        if (do_mknod)
++        {
++            remove(path);
++        }
++        return 0;
++    }
++
++    return 1;
++}
++
++
++/*
++ * Attempt to create a device file with the specified minor number for
++ * the specified NVIDIA module instance.
++ */
++int nvidia_mknod(int minor, int module_instance)
++{
++    char path[NV_MAX_CHARACTER_DEVICE_FILE_STRLEN];
++    char proc_path[NV_MAX_PROC_REGISTRY_PATH_SIZE];
++
++    assign_device_file_name(path, minor, module_instance);
++    assign_proc_registry_path(proc_path, module_instance);
++
++    return mknod_helper(NV_MAJOR_DEVICE_NUMBER, minor, path, proc_path);
++}
++
++
++/*
++ * Scan NV_PROC_DEVICES_PATH to find the major number of the character
++ * device with the specified name.  Returns the major number on success,
++ * or -1 on failure.
++ */
++int get_chardev_major(const char *name)
++{
++    int ret = -1;
++    char line[NV_MAX_LINE_LENGTH];
++    FILE *fp;
++
++    line[NV_MAX_LINE_LENGTH - 1] = '\0';
++
++    fp = fopen(NV_PROC_DEVICES_PATH, "r");
++    if (!fp)
++    {
++        goto done;
++    }
++
++    /* Find the beginning of the 'Character devices:' section */
++
++    while (fgets(line, NV_MAX_LINE_LENGTH - 1, fp))
++    {
++        if (strcmp(line, "Character devices:\n") == 0)
++        {
++            break;
++        }
++    }
++
++    if (ferror(fp)) {
++        goto done;
++    }
++
++    /* Search for the given module name */
++
++    while (fgets(line, NV_MAX_LINE_LENGTH - 1, fp))
++    {
++        char *found;
++
++        if (strcmp(line, "\n") == 0 )
++        {
++            /* we've reached the end of the 'Character devices:' section */
++            break;
++        }
++
++        found = strstr(line, name);
++
++        /* Check for a newline to avoid partial matches */
++
++        if (found && found[strlen(name)] == '\n')
++        {
++            int major;
++
++            /* Read the device major number */
++
++            if (sscanf(line, " %d %*s", &major) == 1)
++            {
++                ret = major;
++            }
++
++            break;
++        }
++    }
++
++done:
++
++    if (fp)
++    {
++        fclose(fp);
++    }
++
++    return ret;
++}
++
++
++/*
++ * Attempt to create the NVIDIA Unified Memory device file
++ */
++int nvidia_uvm_mknod(int base_minor)
++{
++    int major = get_chardev_major(NV_UVM_MODULE_NAME);
++
++    if (major < 0)
++    {
++        return 0;
++    }
++
++    return mknod_helper(major, base_minor, NV_UVM_DEVICE_NAME, NULL) &&
++           mknod_helper(major, base_minor + 1, NV_UVM_TOOLS_DEVICE_NAME, NULL);
++}
++
++
++/*
++ * Attempt to load the NVIDIA Unified Memory kernel module
++ */
++int nvidia_uvm_modprobe(void)
++{
++    return modprobe_helper(0, NV_UVM_MODULE_NAME);
++}
++
++
++/*
++ * Attempt to load the NVIDIA modeset driver.
++ */
++int nvidia_modeset_modprobe(void)
++{
++    return modprobe_helper(0, NV_MODESET_MODULE_NAME);
++}
++
++
++/*
++ * Attempt to create the NVIDIA modeset driver device file.
++ */
++int nvidia_modeset_mknod(void)
++{
++    char proc_path[NV_MAX_PROC_REGISTRY_PATH_SIZE];
++
++    assign_proc_registry_path(proc_path, NV_MODULE_INSTANCE_NONE);
++
++    return mknod_helper(NV_MAJOR_DEVICE_NUMBER,
++                        NV_MODESET_MINOR_DEVICE_NUM,
++                        NV_MODESET_DEVICE_NAME, proc_path);
++}
++
++/*
++ * Attempt to create the NVIDIA NVLink driver device file.
++ */
++int nvidia_nvlink_mknod(void)
++{
++    int major = get_chardev_major(NV_NVLINK_MODULE_NAME);
++
++    if (major < 0)
++    {
++        return 0;
++    }
++
++    return mknod_helper(major,
++                        0,
++                        NV_NVLINK_DEVICE_NAME,
++                        NV_NVLINK_PROC_PERM_PATH);
++}
++
++int nvidia_vgpu_vfio_mknod(int minor_num)
++{
++    int major = get_chardev_major(NV_VGPU_VFIO_MODULE_NAME);
++    char vgpu_dev_name[NV_MAX_CHARACTER_DEVICE_FILE_STRLEN];
++    char proc_path[NV_MAX_PROC_REGISTRY_PATH_SIZE];
++
++    if (major < 0)
++    {
++        return 0;
++    }
++
++    assign_proc_registry_path(proc_path, NV_MODULE_INSTANCE_NONE);
++
++    snprintf(vgpu_dev_name, NV_MAX_CHARACTER_DEVICE_FILE_STRLEN,
++             NV_VGPU_VFIO_DEVICE_NAME, minor_num);
++
++    vgpu_dev_name[NV_MAX_CHARACTER_DEVICE_FILE_STRLEN - 1] = '\0';
++
++    return mknod_helper(major, minor_num, vgpu_dev_name, proc_path);
++}
++
++#endif /* NV_LINUX */
+\ No newline@end of file
+diff --git a/src/nvidia-modprobe-utils.h b/src/nvidia-modprobe-utils.h
+new file mode 100644
+index 0000000..e06b4a4
+--- /dev/null
++++ b/src/nvidia-modprobe-utils.h
+@@ -0,0 +1,157 @@
++/*
++ * Copyright (c) 2013, NVIDIA CORPORATION.
++ *
++ * Permission is hereby granted, free of charge, to any person
++ * obtaining a copy of this software and associated documentation
++ * files (the "Software"), to deal in the Software without
++ * restriction, including without limitation the rights to use, copy,
++ * modify, merge, publish, distribute, sublicense, and/or sell copies
++ * of the Software, and to permit persons to whom the Software is
++ * furnished to do so, subject to the following conditions:
++ *
++ * The above copyright notice and this permission notice shall be
++ * included in all copies or substantial portions of the Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
++ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
++ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
++ * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
++ * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
++ * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
++ * SOFTWARE.
++ *
++ * This file provides utility functions on Linux for loading the
++ * NVIDIA kernel module and creating NVIDIA device files.
++ */
++
++#ifndef __NVIDIA_MODPROBE_UTILS_H__
++#define __NVIDIA_MODPROBE_UTILS_H__
++
++#include <stdio.h>
++
++#define NV_MAX_CHARACTER_DEVICE_FILE_STRLEN  128
++#define NV_MODULE_INSTANCE_NONE              -1
++#define NV_MODULE_INSTANCE_ZERO              0
++#define NV_MAX_MODULE_INSTANCES              8
++#define NV_CTL_DEVICE_NUM                    255
++#define NV_MODESET_MINOR_DEVICE_NUM          254
++
++#define NV_FRONTEND_CONTROL_DEVICE_MINOR_MAX NV_CTL_DEVICE_NUM
++
++#define NV_DEVICE_FILE_PATH "/dev/nvidia%d"
++#define NV_CTRL_DEVICE_FILE_PATH "/dev/nvidiactl"
++#define NV_MODESET_DEVICE_NAME "/dev/nvidia-modeset"
++#define NV_VGPU_VFIO_DEVICE_NAME "/dev/nvidia-vgpu%d"
++#define NV_NVLINK_DEVICE_NAME "/dev/nvidia-nvlink"
++
++#define NV_NMODULE_CTRL_DEVICE_FILE_PATH "/dev/nvidiactl%d"
++
++#define NV_FRONTEND_CONTROL_DEVICE_MINOR_MIN \
++    (NV_FRONTEND_CONTROL_DEVICE_MINOR_MAX - \
++     NV_MAX_MODULE_INSTANCES)
++
++#define NV_FRONTEND_IS_CONTROL_DEVICE(x) \
++    ((x <= NV_FRONTEND_CONTROL_DEVICE_MINOR_MAX) && \
++     (x > NV_FRONTEND_CONTROL_DEVICE_MINOR_MIN))
++
++#if defined(NV_LINUX)
++
++typedef enum
++{
++    NvDeviceFileStateFileExists = 0,
++    NvDeviceFileStateChrDevOk,
++    NvDeviceFileStatePermissionsOk
++} NvDeviceFileState;
++
++static __inline__ void nvidia_update_file_state(int *state,
++                                                NvDeviceFileState value)
++{
++    *state |= (1 << value);
++}
++
++static __inline__ int nvidia_test_file_state(int state,
++                                             NvDeviceFileState value)
++{
++    return !!(state & (1 << value));
++}
++
++int nvidia_get_file_state(int minor, int module_instance);
++int nvidia_modprobe(const int print_errors, int module_instance);
++int nvidia_mknod(int minor, int module_instance);
++int nvidia_uvm_modprobe(void);
++int nvidia_uvm_mknod(int base_minor);
++int nvidia_modeset_modprobe(void);
++int nvidia_modeset_mknod(void);
++int nvidia_vgpu_vfio_mknod(int minor_num);
++int nvidia_nvlink_mknod(void);
++
++int mknod_helper(int major, int minor, const char *path, const char *proc_path);
++int get_chardev_major(const char *name);
++
++#endif /* NV_LINUX */
++
++/*
++ * Detect use of multiple kernel module instances. Use a single 
++ * module instance unless instance != NV_MODULE_INSTANCE_NONE
++ */
++static __inline__ int is_multi_module(int module_instance)
++{
++    return (module_instance != NV_MODULE_INSTANCE_NONE);
++}
++
++
++/*
++ * Construct the device file name, based on 'minor'.  If an error
++ * occurs, the nul terminator will be written to name[0].
++ */
++static __inline__ void assign_device_file_name
++(
++    char name[NV_MAX_CHARACTER_DEVICE_FILE_STRLEN],
++    int minor,
++    int module_instance
++)
++{
++    int ret;
++
++    if ((minor < 0) || (minor > NV_CTL_DEVICE_NUM))
++    {
++        goto fail;
++    }
++
++    if (!is_multi_module(module_instance) && minor == NV_CTL_DEVICE_NUM)
++    {
++        ret = snprintf(name,
++                       NV_MAX_CHARACTER_DEVICE_FILE_STRLEN,
++                       NV_CTRL_DEVICE_FILE_PATH);
++    }
++    else if (is_multi_module(module_instance) && 
++             NV_FRONTEND_IS_CONTROL_DEVICE(minor))
++    {
++        ret = snprintf(name,
++                       NV_MAX_CHARACTER_DEVICE_FILE_STRLEN,
++                       NV_NMODULE_CTRL_DEVICE_FILE_PATH,
++                       module_instance);
++    }
++    else
++    {
++        ret = snprintf(name,
++                       NV_MAX_CHARACTER_DEVICE_FILE_STRLEN,
++                       NV_DEVICE_FILE_PATH, minor);
++    }
++
++    if (ret <= 0)
++    {
++        goto fail;
++    }
++
++    name[NV_MAX_CHARACTER_DEVICE_FILE_STRLEN - 1] = '\0';
++
++    return;
++
++fail:
++
++    name[0] = '\0';
++}
++
++#endif /* __NVIDIA_MODPROBE_UTILS_H__ */
+\ No newline at end of file
+diff --git a/src/pci-enum.h b/src/pci-enum.h
+new file mode 100644
+index 0000000..73b8497
+--- /dev/null
++++ b/src/pci-enum.h
+@@ -0,0 +1,112 @@
++/*
++ * (C) Copyright IBM Corporation 2006
++ *
++ * Copyright (c) 2007 Paulo R. Zanoni, Tiago Vignatti
++ *
++ * Copyright 2009 Red Hat, Inc.
++ *
++ * Copyright (c) 2014 NVIDIA Corporation
++ *
++ * All Rights Reserved.
++ *
++ * Permission is hereby granted, free of charge, to any person obtaining a copy
++ * of this software and associated documentation files (the "Software"), to deal
++ * in the Software without restriction, including without limitation the rights
++ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
++ * copies of the Software, and to permit persons to whom the Software is
++ * furnished to do so, subject to the following conditions:
++ * 
++ * The above copyright notice and this permission notice shall be included in
++ * all copies or substantial portions of the Software.
++ * 
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
++ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
++ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
++ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
++ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
++ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
++ * THE SOFTWARE.
++ */
++
++/**
++ * pci-enum.h
++ * 
++ * Based on libpciaccess/include/pciaccess.h from libpciaccess-0.12.1, which
++ * can be found here:
++ *
++ * http://cgit.freedesktop.org/xorg/lib/libpciaccess
++ *
++ * Original authors: Ian Romanick <idr@us.ibm.com>, Paulo R. Zanoni,
++ *                   Tiago Vignatti
++ */
++
++#ifndef PCI_ENUM_H
++#define PCI_ENUM_H
++
++#include <inttypes.h>
++
++struct pci_id_match;
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++int pci_enum_match_id(struct pci_id_match *);
++
++#ifdef __cplusplus
++}
++#endif
++
++#define PCI_MATCH_ANY  (~0U)
++
++#define PCI_BASE_CLASS_MASK 0xff00
++#define PCI_SUB_CLASS_MASK  0x00ff
++#define PCI_FULL_CLASS_MASK PCI_BASE_CLASS_MASK | PCI_SUB_CLASS_MASK
++
++/**
++ * Compare two PCI ID values (either vendor or device).  This is used
++ * internally to compare the fields of pci_id_match to the fields of
++ * pci_device.
++ */
++#define PCI_ID_COMPARE(a, b) \
++    (((a) == PCI_MATCH_ANY) || ((a) == (b)))
++
++/**
++ */
++struct pci_id_match {
++    /**
++     * Device/vendor matching controls
++     * 
++     * Control the search based on the device, vendor, subdevice, or subvendor
++     * IDs.  Setting any of these fields to PCI_MATCH_ANY will cause the field
++     * to not be used in the comparison.
++     */
++    /*@{*/
++    uint32_t    vendor_id;
++    uint32_t    device_id;
++    uint32_t    subvendor_id;
++    uint32_t    subdevice_id;
++    /*@}*/
++
++
++    /**
++     * Device class matching controls
++     * 
++     * Device's class and subclass. The class is at bits [15:8], subclass is at
++     * bits [7:0].
++     */
++    /*@{*/
++    uint16_t    device_class;
++    uint16_t    device_class_mask;
++    /*@}*/
++
++    /**
++     * Match results
++     *
++     * Specifies the number of devices found that match this criteria.
++     */
++    /*@{*/
++    uint16_t    num_matches;
++};
++
++#endif /* PCI_ENUM_H */
+\ No newline at end of file
+diff --git a/src/pci-sysfs.c b/src/pci-sysfs.c
+new file mode 100644
+index 0000000..210bf40
+--- /dev/null
++++ b/src/pci-sysfs.c
+@@ -0,0 +1,529 @@
++/*
++ * (C) Copyright IBM Corporation 2006
++ *
++ * Copyright (c) 2014-2018 NVIDIA Corporation
++ *
++ * All Rights Reserved.
++ *
++ * Permission is hereby granted, free of charge, to any person obtaining a copy
++ * of this software and associated documentation files (the "Software"), to deal
++ * in the Software without restriction, including without limitation the rights
++ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
++ * copies of the Software, and to permit persons to whom the Software is
++ * furnished to do so, subject to the following conditions:
++ * 
++ * The above copyright notice and this permission notice shall be included in
++ * all copies or substantial portions of the Software.
++ * 
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
++ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
++ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
++ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
++ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
++ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
++ * THE SOFTWARE.
++ */
++
++/**
++ * pcienum-sysfs.c
++ *
++ * Based on libpciaccess/src/linux_sysfs.c from libpciaccess-0.12.1, which was
++ * found here:
++ *
++ * http://cgit.freedesktop.org/xorg/lib/libpciaccess
++ *
++ * Access PCI subsystem using Linux's sysfs interface.  This interface is
++ * available starting somewhere in the late 2.5.x kernel phase, and is the
++ * preferred method on all 2.6.x kernels.
++ *
++ * Original author: Ian Romanick <idr@us.ibm.com>
++ */
++
++#if defined(NV_LINUX)
++
++#include <stdlib.h>
++#include <string.h>
++#include <stdio.h>
++#include <unistd.h>
++#include <sys/types.h>
++#include <sys/stat.h>
++#include <fcntl.h>
++#include <sys/mman.h>
++#include <dirent.h>
++#include <errno.h>
++#include <sys/time.h>
++#include <time.h>
++#include <limits.h>
++
++#include "pci-enum.h"
++#include "pci-sysfs.h"
++
++#define SYS_BUS_PCI                     "/sys/bus/pci/"
++#define SYS_BUS_PCI_DEVICES SYS_BUS_PCI "devices"
++#define SYS_BUS_PCI_RESCAN  SYS_BUS_PCI "rescan"
++#define PCI_DBDF_FORMAT                 "%04x:%02x:%02x.%1u"
++#define SYSFS_PCI_BRIDGE_RESCAN_FMT     SYS_BUS_PCI_DEVICES "/" PCI_DBDF_FORMAT "/rescan"
++#define SYSFS_RESCAN_STRING             "1\n"
++#define SYSFS_RESCAN_STRING_SIZE        2
++#define PCI_CAP_TTL_MAX                 20
++#define SYSFS_PATH_SIZE                 256
++
++#define BAIL_ON_IO_ERR(buf, err, cnt, action)   \
++do  {                                           \
++    if (((err) != 0) || ((cnt) < sizeof(buf)))  \
++    {                                           \
++        (err) = ((err) == 0) ? EIO : (err);     \
++        action;                                 \
++    }                                           \
++} while (0)
++
++static int pci_sysfs_read_cfg(uint16_t, uint16_t, uint16_t, uint16_t, uint16_t, void *,
++                              uint16_t size, uint16_t *);
++
++static int find_matches(struct pci_id_match *match);
++
++/**
++ * Attempt to access PCI subsystem using Linux's sysfs interface to enumerate
++ * the matched devices.
++ */
++int
++pci_enum_match_id(struct pci_id_match *match)
++{
++    int err = 0;
++    struct stat st;
++
++
++    /* 
++     * If the directory "/sys/bus/pci/devices" exists, then the PCI subsystem
++     * can be accessed using this interface.
++     */
++    match->num_matches = 0;
++    if (stat(SYS_BUS_PCI_DEVICES, &st) == 0)
++    {
++        err = find_matches(match);
++    }
++    else
++    {
++        err = errno;
++    }
++
++    return err;
++}
++
++
++/**
++ * The sysfs lookup method uses the directory entries in /sys/bus/pci/devices
++ * to enumerate all PCI devices, and then uses a file in each that is mapped to
++ * the device's PCI config space to extract the data to match against.
++ */
++static int
++find_matches(struct pci_id_match *match)
++{
++    struct dirent *d;
++    DIR *sysfs_pci_dir;
++    int err = 0;
++
++    sysfs_pci_dir = opendir(SYS_BUS_PCI_DEVICES);
++    if (sysfs_pci_dir == NULL)
++    {
++        return errno;
++    }
++
++    while ((d = readdir(sysfs_pci_dir)) != NULL)
++    {
++        uint8_t config[48];
++        uint16_t bytes;
++        unsigned dom, bus, dev, func;
++        uint16_t vendor_id, device_id, subvendor_id, subdevice_id;
++        uint16_t device_class;
++
++        /* Ignore the . and .. dirents */
++        if ((strcmp(d->d_name, ".") == 0) || (strcmp(d->d_name, "..") == 0))
++        {
++            continue;
++        }
++
++        sscanf(d->d_name, PCI_DBDF_FORMAT,
++               & dom, & bus, & dev, & func);
++
++        err = pci_sysfs_read_cfg(dom, bus, dev, func, 0, config, 48, & bytes);
++        if ((bytes == 48) && !err)
++        {
++            vendor_id = (uint16_t)config[0] + ((uint16_t)config[1] << 8);
++            device_id = (uint16_t)config[2] + ((uint16_t)config[3] << 8);
++            device_class = (uint16_t)config[10] +
++                ((uint16_t)config[11] << 8);
++            subvendor_id = (uint16_t)config[44] +
++                ((uint16_t)config[45] << 8);
++            subdevice_id = (uint16_t)config[46] +
++                ((uint16_t)config[47] << 8);
++
++            /*
++             * This logic, originally in common_iterator.c, will tell if
++             * this device is a match for the search criteria.
++             */
++            if (PCI_ID_COMPARE(match->vendor_id,    vendor_id)    &&
++                PCI_ID_COMPARE(match->device_id,    device_id)    &&
++                PCI_ID_COMPARE(match->subvendor_id, subvendor_id) &&
++                PCI_ID_COMPARE(match->subdevice_id, subdevice_id) &&
++                ((device_class & match->device_class_mask) ==
++                    match->device_class))
++            {
++                match->num_matches++;
++            }
++        }
++
++        if (err)
++        {
++            break;
++        }
++    }
++
++    closedir(sysfs_pci_dir);
++    return err;
++}
++
++static int
++pci_sysfs_read_cfg(uint16_t domain, uint16_t bus, uint16_t device,
++                   uint16_t function, uint16_t off, void *data,
++                   uint16_t size, uint16_t *bytes_read)
++{
++    char name[SYSFS_PATH_SIZE];
++    uint16_t temp_size = size;
++    int err = 0;
++    int fd;
++    char *data_bytes = data;
++
++    if (bytes_read != NULL)
++    {
++        *bytes_read = 0;
++    }
++
++    /*
++     * Each device has a directory under sysfs.  Within that directory there
++     * is a file named "config".  This file used to access the PCI config
++     * space.  It is used here to obtain most of the information about the
++     * device.
++     */
++    snprintf(name, SYSFS_PATH_SIZE - 1, "%s/" PCI_DBDF_FORMAT "/config",
++             SYS_BUS_PCI_DEVICES, domain, bus, device, function);
++
++    fd = open(name, O_RDONLY);
++    if (fd < 0)
++    {
++        return errno;
++    }
++
++    if (off != 0)
++    {
++        if (lseek(fd, (off_t) off, SEEK_SET) < 0)
++        {
++            close(fd);
++            return errno;
++        }
++    }
++
++    while (temp_size > 0)
++    {
++        const ssize_t bytes = read(fd, data_bytes, temp_size);
++
++        /*
++         * If zero bytes were read, then we assume it's the end of the
++         * config file.
++         */
++        if (bytes <= 0)
++        {
++            err = errno;
++            break;
++        }
++
++        temp_size -= bytes;
++        data_bytes += bytes;
++    }
++    
++    if (bytes_read != NULL)
++    {
++        *bytes_read = size - temp_size;
++    }
++
++    close(fd);
++    return err;
++}
++
++static int
++pci_sysfs_write_cfg(uint16_t domain, uint16_t bus, uint16_t device,
++                   uint16_t function, uint16_t off, void *data,
++                   uint16_t size, uint16_t *bytes_written)
++{
++    char name[SYSFS_PATH_SIZE];
++    uint16_t temp_size = size;
++    int err = 0;
++    int fd;
++    char *data_bytes = data;
++
++    if (bytes_written != NULL)
++    {
++        *bytes_written = 0;
++    }
++
++    /*
++     * Each device has a directory under sysfs.  Within that directory there
++     * is a file named "config".  This file used to access the PCI config
++     * space.
++     */
++    snprintf(name, SYSFS_PATH_SIZE - 1, "%s/" PCI_DBDF_FORMAT "/config",
++             SYS_BUS_PCI_DEVICES, domain, bus, device, function);
++
++    fd = open(name, O_WRONLY);
++    if (fd < 0)
++    {
++        return errno;
++    }
++
++    if (off != 0)
++    {
++        if (lseek(fd, (off_t) off, SEEK_SET) < 0)
++        {
++            close(fd);
++            return errno;
++        }
++    }
++
++    while (temp_size > 0)
++    {
++        const ssize_t bytes = write(fd, data_bytes, temp_size);
++
++        if (bytes < 0)
++        {
++            err = errno;
++            break;
++        }
++        /*
++         * If zero bytes were written, then we assume it's the end of the
++         * config file.
++         */
++        if (bytes == 0)
++        {
++            break;
++        }
++
++        temp_size -= bytes;
++        data_bytes += bytes;
++    }
++    
++    if (bytes_written != NULL)
++    {
++        *bytes_written = size - temp_size;
++    }
++
++    close(fd);
++    return err;
++}
++
++int
++pci_rescan(uint16_t domain, uint8_t bus, uint8_t slot, uint8_t function)
++{
++    char const                      *node;
++    char                            node_buf[SYSFS_PATH_SIZE];
++    int                             node_fd;
++    ssize_t                         cnt;
++
++    if ((domain | bus | slot | function) == 0)
++    {
++        /* rescan the entire PCI tree */
++        node = SYS_BUS_PCI_RESCAN;
++    }
++    else
++    {
++        snprintf(node_buf, sizeof(node_buf) - 1, SYSFS_PCI_BRIDGE_RESCAN_FMT,
++                domain, bus, slot, function);
++        node = node_buf;
++    }
++
++    node_fd = open(node, O_WRONLY);
++
++    if (node_fd < 0)
++    {
++        return errno;
++    }
++
++    cnt = write(node_fd, SYSFS_RESCAN_STRING, SYSFS_RESCAN_STRING_SIZE);
++
++    close(node_fd);
++
++    return cnt == SYSFS_RESCAN_STRING_SIZE ? 0 : EIO;
++}
++
++int
++pci_find_parent_bridge(pci_info_t *p_gpu_info, pci_info_t *p_bridge_info)
++{
++    char    gpu_path[SYSFS_PATH_SIZE];
++    char    bridge_path[PATH_MAX];
++    char    *p_node;
++
++    snprintf(gpu_path, SYSFS_PATH_SIZE - 1, "%s/" PCI_DBDF_FORMAT "/..", SYS_BUS_PCI_DEVICES,
++            p_gpu_info->domain, p_gpu_info->bus,
++            p_gpu_info->dev, p_gpu_info->ftn);
++
++    if (realpath(gpu_path, bridge_path) == NULL)
++    {
++        return errno;
++    }
++
++    p_node = strrchr(bridge_path, '/');
++
++    if (p_node == NULL)
++    {
++        return ENOENT;
++    }
++
++    ++p_node;
++
++    if (sscanf(p_node, PCI_DBDF_FORMAT,
++                &p_bridge_info->domain, &p_bridge_info->bus,
++                &p_bridge_info->dev, &p_bridge_info->ftn) != 4)
++    {
++        return ENOENT;
++    }
++
++    return 0;
++}
++
++static int
++pci_find_pcie_caps(uint16_t domain, uint8_t bus, uint8_t device, uint8_t ftn, uint8_t *p_caps)
++{
++    unsigned    ttl;
++    uint8_t     off;
++    uint8_t     cap_id;
++    int         err = ENXIO;
++    uint16_t    cnt;
++
++    for (off = PCI_CAPABILITY_LIST, ttl = PCI_CAP_TTL_MAX; ttl; --ttl)
++    {
++        err = pci_sysfs_read_cfg(domain, bus, device, ftn, off,
++                                &off, sizeof(off), &cnt);
++        BAIL_ON_IO_ERR(off, err, cnt, break);
++
++        /* Capabilities must reside above the std config header */
++        if ((off < PCI_STD_HEADER_SIZEOF) || (off == 0xff))
++        {
++            break;
++        }
++
++        /* Clear the reserved bits */
++        off &= ~3;
++
++        err = pci_sysfs_read_cfg(domain, bus, device, ftn, off + PCI_CAP_LIST_ID,
++                                &cap_id, sizeof(cap_id), &cnt);
++        BAIL_ON_IO_ERR(cap_id, err, cnt, break);
++
++        if (cap_id == PCI_CAP_ID_EXP)
++        {
++            goto found;
++        }
++
++        if (cap_id == 0xff)
++        {
++            break;
++        }
++
++        off += PCI_CAP_LIST_NEXT;
++    }
++    return err;
++found:
++    *p_caps = off;
++    return 0;
++}
++
++int
++pci_bridge_link_set_enable(uint16_t domain, uint8_t bus, uint8_t device, uint8_t ftn, int enable)
++{
++    uint8_t         pcie_caps = 0;
++    uint16_t        reg;
++    uint32_t        cap_reg;
++    uint16_t        cnt;
++    int             err;
++    struct timeval  start;
++    struct timeval  curr;
++    struct timeval  diff;
++    struct timespec delay = {0, PCI_LINK_DELAY_NS};
++    struct timespec dlllar_disable_delay = {0, PCI_LINK_DLLLAR_DISABLE_DELAY_NS};
++
++    err = pci_find_pcie_caps(domain, bus, device, ftn, &pcie_caps);
++
++    if (err != 0)
++    {
++        return err;
++    }
++
++    err = pci_sysfs_read_cfg(domain, bus, device, ftn, pcie_caps + PCI_EXP_LNKCTL,
++                            &reg, sizeof(reg), &cnt);
++    BAIL_ON_IO_ERR(reg, err, cnt, return err);
++
++    if (enable)
++    {
++        reg &= ~PCI_EXP_LNKCTL_LD;
++    }
++    else
++    {
++        reg |= PCI_EXP_LNKCTL_LD;
++    }
++
++    err = pci_sysfs_write_cfg(domain, bus, device, ftn, pcie_caps + PCI_EXP_LNKCTL,
++                            &reg, sizeof(reg), &cnt);
++    BAIL_ON_IO_ERR(reg, err, cnt, return err);
++
++    if (enable)
++    {
++        /*
++         * Data Link Layer Link Active Reporting must be capable for
++         * zero power capable downstream port. But old controller might
++         * not implement it. In this case, we wait for 30 ms.
++         */
++        err = pci_sysfs_read_cfg(domain, bus, device, ftn, pcie_caps + PCI_EXP_LNKCAP,
++                                &cap_reg, sizeof(cap_reg), &cnt);
++        BAIL_ON_IO_ERR(cap_reg, err, cnt, return err);
++
++        if (cap_reg & PCI_EXP_LNKCAP_DLLLARC)
++        {
++            /* wait for the link to go up and then sleep for 100 ms */
++
++            gettimeofday(&start, NULL);
++
++            for (;;)
++            {
++                err = pci_sysfs_read_cfg(domain, bus, device, ftn, pcie_caps + PCI_EXP_LNKSTA,
++                                    &reg, sizeof(reg), &cnt);
++                BAIL_ON_IO_ERR(reg, err, cnt, return err);
++
++                if ((reg & PCI_EXP_LNKSTA_DLLLA) != 0)
++                {
++                    break;
++                }
++
++                gettimeofday(&curr, NULL);
++                timersub(&curr, &start, &diff);
++
++                if ((diff.tv_sec > 0) || (diff.tv_usec >= PCI_LINK_WAIT_US))
++                {
++                    return ETIME;
++                }
++            }
++        }
++        else
++        {
++            /*
++             * Measured the time on DGX1 for link to become established in a bridge,
++             * where the DLLLA reporting is supported and its approximately ~9ms,
++             * so wait for 30ms where DLLLA reporting is not supported.
++             */
++            PCI_NANOSLEEP(&dlllar_disable_delay, NULL);
++        }
++
++        PCI_NANOSLEEP(&delay, NULL);
++    }
++
++    return err;
++}
++
++#endif /* defined(NV_LINUX) */
+\ No newline at end of file
+diff --git a/src/pci-sysfs.h b/src/pci-sysfs.h
+new file mode 100644
+index 0000000..1fc695b
+--- /dev/null
++++ b/src/pci-sysfs.h
+@@ -0,0 +1,85 @@
++/*
++ * Copyright (c) 2016-2018, NVIDIA CORPORATION.
++ *
++ * Permission is hereby granted, free of charge, to any person
++ * obtaining a copy of this software and associated documentation
++ * files (the "Software"), to deal in the Software without
++ * restriction, including without limitation the rights to use, copy,
++ * modify, merge, publish, distribute, sublicense, and/or sell copies
++ * of the Software, and to permit persons to whom the Software is
++ * furnished to do so, subject to the following conditions:
++ *
++ * The above copyright notice and this permission notice shall be
++ * included in all copies or substantial portions of the Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
++ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
++ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
++ * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
++ * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
++ * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
++ * SOFTWARE.
++ *
++ * This file provides utility functions on Linux for interfacing
++ * with the sysfs/PCI kernel facility.
++ */
++
++#ifndef __PCI_SYSFS_H__
++#define __PCI_SYSFS_H__
++
++#if defined(NV_LINUX)
++
++#include <linux/pci.h>
++
++#if !defined(PCI_STD_HEADER_SIZEOF)
++#define PCI_STD_HEADER_SIZEOF   64
++#endif
++#if !defined(PCI_CAP_ID_EXP)
++#define  PCI_CAP_ID_EXP         0x10    /* PCI Express */
++#endif
++#if !defined(PCI_EXP_LNKCAP)
++#define PCI_EXP_LNKCAP          12          /* Link Capabilities */
++#endif
++#if !defined(PCI_EXP_LNKCAP_DLLLARC)
++#define PCI_EXP_LNKCAP_DLLLARC  0x00100000  /* Data Link Layer Link Active Reporting Capable */
++#endif
++#if !defined(PCI_EXP_LNKCTL)
++#define PCI_EXP_LNKCTL          16      /* Link Control */
++#endif
++#if !defined(PCI_EXP_LNKCTL_LD)
++#define  PCI_EXP_LNKCTL_LD      0x0010  /* Link Disable */
++#endif
++#if !defined(PCI_EXP_LNKSTA)
++#define PCI_EXP_LNKSTA          18      /* Link Status */
++#endif
++#if !defined(PCI_EXP_LNKSTA_DLLLA)
++#define  PCI_EXP_LNKSTA_DLLLA   0x2000  /* Data Link Layer Link Active */
++#endif
++
++#define PCI_LINK_WAIT_US                 200000      /* 200 ms, must be less than 1000000 (1s) */
++#define PCI_LINK_DELAY_NS                100000000   /* 100 ms */
++#define PCI_LINK_DLLLAR_DISABLE_DELAY_NS 30000000    /* 30ms */
++
++#if (_POSIX_C_SOURCE >= 199309L)
++#define PCI_NANOSLEEP(ts, rem)  nanosleep(ts, rem)
++#elif !(_POSIX_C_SOURCE >= 200809L)
++#define PCI_NANOSLEEP(ts, rem)  usleep((ts)->tv_sec * 1000000 + ((ts)->tv_nsec + 999) / 1000)
++#else
++#define PCI_NANOSLEEP(ts, rem)  sleep((ts)->tv_sec + ((ts)->tv_nsec + 999999999) / 1000000000)
++#endif
++
++typedef struct  {
++    unsigned    domain;
++    unsigned    bus;
++    unsigned    dev;
++    unsigned    ftn;
++}   pci_info_t;
++
++int pci_rescan(uint16_t domain, uint8_t bus, uint8_t slot, uint8_t function);
++int pci_find_parent_bridge(pci_info_t *p_gpu_info, pci_info_t *p_bridge_info);
++int pci_bridge_link_set_enable(uint16_t domain, uint8_t bus, uint8_t device, uint8_t ftn, int enable);
++
++#endif /* NV_LINUX */
++
++#endif /* __PCI_SYSFS_H__ */
+\ No newline at end of file
+-- 
+2.27.0
+
diff --git a/package/libnvidia-container/0002-Remove-dependency-handling-from-Makefile.patch b/package/libnvidia-container/0002-Remove-dependency-handling-from-Makefile.patch
new file mode 100644
index 0000000000..d4ba9dfe80
--- /dev/null
+++ b/package/libnvidia-container/0002-Remove-dependency-handling-from-Makefile.patch
@@ -0,0 +1,698 @@
+From 6752d8d5e315eb3f061498a9c35558f90f9600e2 Mon Sep 17 00:00:00 2001
+From: Christian Stewart <christian@paral.in>
+Date: Sat, 18 Jul 2020 15:26:22 -0700
+Subject: [PATCH] Remove dependency handling from Makefile
+
+Buildroot will handle this for the makefile.
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+---
+ Makefile                    |  54 +++------
+ mk/nvidia-modprobe.mk       |  55 ---------
+ src/nvc.c                   |   6 +-
+ src/nvidia-modprobe-utils.c | 225 ++++++++++++++++--------------------
+ src/nvidia-modprobe-utils.h |  53 ++-------
+ 5 files changed, 128 insertions(+), 265 deletions(-)
+ delete mode 100644 mk/nvidia-modprobe.mk
+
+diff --git a/Makefile b/Makefile
+index f1c56a9..80780d1 100644
+--- a/Makefile
++++ b/Makefile
+@@ -2,13 +2,13 @@
+ # Copyright (c) 2017-2018, NVIDIA CORPORATION. All rights reserved.
+ #
+ 
+-.PHONY: all tools shared static deps install uninstall dist depsclean mostlyclean clean distclean
++.PHONY: all tools shared static install uninstall dist mostlyclean clean distclean
+ .DEFAULT_GOAL := all
+-STRIP  := @echo skipping: strip
++
+ ##### Global variables #####
+ 
+-WITH_LIBELF  ?= yes
+-WITH_TIRPC   ?= yes
++WITH_LIBELF  ?= no
++WITH_TIRPC   ?= no
+ WITH_SECCOMP ?= yes
+ 
+ ##### Global definitions #####
+@@ -16,15 +16,14 @@ WITH_SECCOMP ?= yes
+ export prefix      = /usr
+ export exec_prefix = $(prefix)
+ export bindir      = $(exec_prefix)/bin
+-export libdir      = $(exec_prefix)/lib64
++export libdir      = $(exec_prefix)/lib
+ export docdir      = $(prefix)/share/doc
+-export libdbgdir   = $(prefix)/lib64/debug$(libdir)
++export libdbgdir   = $(prefix)/lib/debug$(libdir)
+ export includedir  = $(prefix)/include
+ export pkgconfdir  = $(libdir)/pkgconfig
+ 
+ export PKG_DIR     ?= $(CURDIR)/pkg
+ export SRCS_DIR    ?= $(CURDIR)/src
+-export DEPS_DIR    ?= $(CURDIR)/deps
+ export DIST_DIR    ?= $(CURDIR)/dist
+ export MAKE_DIR    ?= $(CURDIR)/mk
+ export DEBUG_DIR   ?= $(CURDIR)/.debug
+@@ -120,9 +119,9 @@ LDFLAGS  := -Wl,-zrelro -Wl,-znow -Wl,-zdefs -Wl,--gc-sections $(LDFLAGS)
+ LDLIBS   := $(LDLIBS)
+ 
+ # Library flags (recursively expanded to handle target-specific flags)
+-LIB_CPPFLAGS       = -DNV_LINUX -isystem $(DEPS_DIR)$(includedir) -include $(BUILD_DEFS)
++LIB_CPPFLAGS       = -DNV_LINUX -include $(BUILD_DEFS)
+ LIB_CFLAGS         = -fPIC
+-LIB_LDFLAGS        = -L$(DEPS_DIR)$(libdir) -shared -Wl,-soname=$(LIB_SONAME)
++LIB_LDFLAGS        = -shared -Wl,-soname=$(LIB_SONAME)
+ # LIB_LDLIBS_STATIC  = -l:libnvidia-modprobe-utils.a
+ LIB_LDLIBS_SHARED  = -ldl -lcap -ltirpc
+ ifeq ($(WITH_LIBELF), yes)
+@@ -132,7 +131,7 @@ else
+ LIB_LDLIBS_STATIC  += -l:libelf.a
+ endif
+ ifeq ($(WITH_TIRPC), yes)
+-LIB_CPPFLAGS       += -isystem $(DEPS_DIR)$(includedir)/tirpc -DWITH_TIRPC
++LIB_CPPFLAGS       += -DWITH_TIRPC
+ # LIB_LDLIBS_STATIC  += -l:libtirpc.a
+ LIB_LDLIBS_SHARED  += -lpthread
+ endif
+@@ -176,15 +175,15 @@ $(LIB_RPC_SRCS): $(LIB_RPC_SPEC)
+ 	$(RM) $@
+ 	cd $(dir $@) && $(RPCGEN) $(RPCGENFLAGS) -C -M -N -o $(notdir $@) $(LIB_RPC_SPEC)
+ 
+-$(LIB_OBJS): %.lo: %.c | deps
++$(LIB_OBJS): %.lo: %.c
+ 	$(CC) $(LIB_CFLAGS) $(LIB_CPPFLAGS) -MMD -MF $*.d -c $(OUTPUT_OPTION) $<
+ 
+-$(BIN_OBJS): %.o: %.c | shared
++$(BIN_OBJS): %.o: %.c
+ 	$(CC) $(BIN_CFLAGS) $(BIN_CPPFLAGS) -MMD -MF $*.d -c $(OUTPUT_OPTION) $<
+ 
+ -include $(DEPENDENCIES)
+ 
+-$(LIB_SHARED): $(LIB_OBJS)
++$(LIB_SHARED): $(BUILD_DEFS) $(SRCS_DIR)/driver_rpc.h $(LIB_OBJS)
+ 	$(MKDIR) -p $(DEBUG_DIR)
+ 	$(CC) $(LIB_CFLAGS) $(LIB_CPPFLAGS) $(LIB_LDFLAGS) $(OUTPUT_OPTION) $^ $(LIB_SCRIPT) $(LIB_LDLIBS)
+ 	$(OBJCPY) --only-keep-debug $@ $(LIB_SONAME)
+@@ -198,7 +197,7 @@ $(LIB_STATIC_OBJ): $(LIB_OBJS)
+ 	$(OBJCPY) --localize-hidden $@
+ 	$(STRIP) --strip-unneeded -R .comment $@
+ 
+-$(BIN_NAME): $(BIN_OBJS)
++$(BIN_NAME): $(BUILD_DEFS) $(SRCS_DIR)/driver_rpc.h $(LIB_SHARED) $(BIN_OBJS)
+ 	$(CC) $(BIN_CFLAGS) $(BIN_CPPFLAGS) $(BIN_LDFLAGS) $(OUTPUT_OPTION) $^ $(BIN_SCRIPT) $(BIN_LDLIBS)
+ 	$(STRIP) --strip-unneeded -R .comment $@
+ 
+@@ -219,17 +218,6 @@ shared: $(LIB_SHARED)
+ 
+ static: $(LIB_STATIC)($(LIB_STATIC_OBJ))
+ 
+-deps: export DESTDIR:=$(DEPS_DIR)
+-deps: $(LIB_RPC_SRCS) $(BUILD_DEFS)
+-	$(MKDIR) -p $(DEPS_DIR)
+-	# $(MAKE) -f $(MAKE_DIR)/nvidia-modprobe.mk install
+-ifeq ($(WITH_LIBELF), no)
+-	# $(MAKE) -f $(MAKE_DIR)/elftoolchain.mk install
+-endif
+-ifeq ($(WITH_TIRPC), yes)
+-	# $(MAKE) -f $(MAKE_DIR)/libtirpc.mk install
+-endif
+-
+ install: all
+ 	$(INSTALL) -d -m 755 $(addprefix $(DESTDIR),$(includedir) $(bindir) $(libdir) $(docdir) $(libdbgdir) $(pkgconfdir))
+ 	# Install header files
+@@ -237,8 +225,7 @@ install: all
+ 	# Install library files
+ 	$(INSTALL) -m 644 $(LIB_STATIC) $(DESTDIR)$(libdir)
+ 	$(INSTALL) -m 755 $(LIB_SHARED) $(DESTDIR)$(libdir)
+-	$(LN) -sf $(LIB_SONAME) $(DESTDIR)$(libdir)/$(LIB_SYMLINK)
+-	$(LDCONFIG) -n $(DESTDIR)$(libdir)
++	$(LN) -sf $(LIB_SHARED) $(DESTDIR)$(libdir)/$(LIB_SYMLINK)
+ 	# Install debugging symbols
+ 	# $(INSTALL) -m 644 $(DEBUG_DIR)/$(LIB_SONAME) $(DESTDIR)$(libdbgdir)
+ 	# Install configuration files
+@@ -268,23 +255,12 @@ dist: install
+ 	$(TAR) --numeric-owner --owner=0 --group=0 -C $(dir $(DESTDIR)) -caf $(DESTDIR)_$(ARCH).tar.xz $(notdir $(DESTDIR))
+ 	$(RM) -r $(DESTDIR)
+ 
+-depsclean:
+-	$(RM) $(BUILD_DEFS)
+-	-$(MAKE) -f $(MAKE_DIR)/nvidia-modprobe.mk clean
+-ifeq ($(WITH_LIBELF), no)
+-	-$(MAKE) -f $(MAKE_DIR)/elftoolchain.mk clean
+-endif
+-ifeq ($(WITH_TIRPC), yes)
+-	-$(MAKE) -f $(MAKE_DIR)/libtirpc.mk clean
+-endif
+-
+ mostlyclean:
+ 	$(RM) $(LIB_OBJS) $(LIB_STATIC_OBJ) $(BIN_OBJS) $(DEPENDENCIES)
+ 
+-clean: mostlyclean depsclean
++clean: mostlyclean
+ 
+ distclean: clean
+-	$(RM) -r $(DEPS_DIR) $(DIST_DIR) $(DEBUG_DIR)
+ 	$(RM) $(LIB_RPC_SRCS) $(LIB_STATIC) $(LIB_SHARED) $(BIN_NAME)
+ 
+ deb: DESTDIR:=$(DIST_DIR)/$(LIB_NAME)_$(VERSION)_$(ARCH)
+diff --git a/mk/nvidia-modprobe.mk b/mk/nvidia-modprobe.mk
+deleted file mode 100644
+index ad399de..0000000
+--- a/mk/nvidia-modprobe.mk
++++ /dev/null
+@@ -1,55 +0,0 @@
+-#
+-# Copyright (c) 2017-2018, NVIDIA CORPORATION. All rights reserved.
+-#
+-
+-include $(MAKE_DIR)/common.mk
+-
+-##### Source definitions #####
+-
+-VERSION        := 396.51
+-PREFIX         := nvidia-modprobe-$(VERSION)
+-URL            := https://github.com/NVIDIA/nvidia-modprobe/archive/$(VERSION).tar.gz
+-
+-SRCS_DIR       := $(DEPS_DIR)/src/$(PREFIX)
+-MODPROBE_UTILS := $(SRCS_DIR)/modprobe-utils
+-
+-LIB_STATIC     := $(MODPROBE_UTILS)/libnvidia-modprobe-utils.a
+-LIB_INCS       := $(MODPROBE_UTILS)/nvidia-modprobe-utils.h \
+-                  $(MODPROBE_UTILS)/pci-enum.h
+-LIB_SRCS       := $(MODPROBE_UTILS)/nvidia-modprobe-utils.c \
+-                  $(MODPROBE_UTILS)/pci-sysfs.c
+-
+-##### Flags definitions #####
+-
+-ARFLAGS  := -rU
+-CPPFLAGS := -D_FORTIFY_SOURCE=2 -DNV_LINUX
+-CFLAGS   := -O2 -g -fdata-sections -ffunction-sections -fstack-protector -fno-strict-aliasing -fPIC
+-
+-##### Private rules #####
+-
+-LIB_OBJS := $(LIB_SRCS:.c=.o)
+-
+-$(SRCS_DIR)/.download_stamp:
+-	$(MKDIR) -p $(SRCS_DIR)
+-	$(CURL) --progress-bar -fSL $(URL) | \
+-	$(TAR) -C $(SRCS_DIR) --strip-components=1 -xz $(PREFIX)/modprobe-utils
+-	@touch $@
+-
+-$(LIB_SRCS): $(SRCS_DIR)/.download_stamp
+-
+-##### Public rules #####
+-
+-.PHONY: all install clean
+-
+-all: $(LIB_STATIC)
+-
+-$(LIB_STATIC): $(LIB_OBJS)
+-	$(AR) rs $@ $^
+-
+-install: all
+-	$(INSTALL) -d -m 755 $(addprefix $(DESTDIR),$(includedir) $(libdir))
+-	$(INSTALL) -m 644 $(LIB_INCS) $(DESTDIR)$(includedir)
+-	$(INSTALL) -m 644 $(LIB_STATIC) $(DESTDIR)$(libdir)
+-
+-clean:
+-	$(RM) $(LIB_OBJS) $(LIB_STATIC)
+diff --git a/src/nvc.c b/src/nvc.c
+index f1d9b62..74ea61c 100644
+--- a/src/nvc.c
++++ b/src/nvc.c
+@@ -190,13 +190,13 @@ load_kernel_modules(struct error *err, const char *root)
+                 }
+ 
+                 log_info("loading kernel module nvidia");
+-                if (nvidia_modprobe(0, -1) == 0)
++                if (nvidia_modprobe(0) == 0)
+                         log_err("could not load kernel module nvidia");
+                 else {
+-                        if (nvidia_mknod(NV_CTL_DEVICE_MINOR, -1) == 0)
++                        if (nvidia_mknod(NV_CTL_DEVICE_MINOR) == 0)
+                                 log_err("could not create kernel module device node");
+                         for (int i = 0; i < (int)devs.num_matches; ++i) {
+-                                if (nvidia_mknod(i, -1) == 0)
++                                if (nvidia_mknod(i) == 0)
+                                         log_err("could not create kernel module device node");
+                         }
+                 }
+diff --git a/src/nvidia-modprobe-utils.c b/src/nvidia-modprobe-utils.c
+index d3f3233..fca21cf 100644
+--- a/src/nvidia-modprobe-utils.c
++++ b/src/nvidia-modprobe-utils.c
+@@ -1,3 +1,29 @@
++/*
++ * Copyright (c) 2013, NVIDIA CORPORATION.
++ *
++ * Permission is hereby granted, free of charge, to any person
++ * obtaining a copy of this software and associated documentation
++ * files (the "Software"), to deal in the Software without
++ * restriction, including without limitation the rights to use, copy,
++ * modify, merge, publish, distribute, sublicense, and/or sell copies
++ * of the Software, and to permit persons to whom the Software is
++ * furnished to do so, subject to the following conditions:
++ *
++ * The above copyright notice and this permission notice shall be
++ * included in all copies or substantial portions of the Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
++ * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
++ * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
++ * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
++ * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
++ * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
++ * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
++ * SOFTWARE.
++ *
++ * This file provides utility functions on Linux for loading the
++ * NVIDIA kernel module and creating NVIDIA device files.
++ */
+ 
+ #if defined(NV_LINUX)
+ 
+@@ -27,9 +53,6 @@
+ #define NV_NVIDIA_MODULE_NAME "nvidia"
+ #define NV_PROC_REGISTRY_PATH "/proc/driver/nvidia/params"
+ 
+-#define NV_NMODULE_NVIDIA_MODULE_NAME "nvidia%d"
+-#define NV_NMODULE_PROC_REGISTRY_PATH "/proc/driver/nvidia/%d/params"
+-
+ #define NV_UVM_MODULE_NAME "nvidia-uvm"
+ #define NV_UVM_DEVICE_NAME "/dev/nvidia-uvm"
+ #define NV_UVM_TOOLS_DEVICE_NAME "/dev/nvidia-uvm-tools"
+@@ -41,6 +64,9 @@
+ #define NV_NVLINK_MODULE_NAME "nvidia-nvlink"
+ #define NV_NVLINK_PROC_PERM_PATH "/proc/driver/nvidia-nvlink/permissions"
+ 
++#define NV_NVSWITCH_MODULE_NAME "nvidia-nvswitch"
++#define NV_NVSWITCH_PROC_PERM_PATH "/proc/driver/nvidia-nvswitch/permissions"
++
+ #define NV_DEVICE_FILE_MODE_MASK (S_IRWXU|S_IRWXG|S_IRWXO)
+ #define NV_DEVICE_FILE_MODE (S_IRUSR|S_IWUSR|S_IRGRP|S_IWGRP|S_IROTH|S_IWOTH)
+ #define NV_DEVICE_FILE_UID 0
+@@ -54,84 +80,6 @@
+ 
+ #define NV_MIN(a, b) (((a) < (b)) ? (a) : (b))
+ 
+-/*
+- * Construct the nvidia kernel module name based on the input
+- * module instance provided.  If an error occurs, the null
+- * terminator will be written to nv_module_name[0].
+- */
+-static __inline__ void assign_nvidia_kernel_module_name
+-(
+-    char nv_module_name[NV_MAX_MODULE_NAME_SIZE],
+-    int module_instance
+-)
+-{
+-    int ret;
+-
+-    if (is_multi_module(module_instance))
+-    {
+-        ret = snprintf(nv_module_name, NV_MAX_MODULE_NAME_SIZE,
+-                       NV_NMODULE_NVIDIA_MODULE_NAME, module_instance);
+-    }
+-    else
+-    {
+-        ret = snprintf(nv_module_name, NV_MAX_MODULE_NAME_SIZE,
+-                       NV_NVIDIA_MODULE_NAME);
+-    }
+-
+-    if (ret <= 0)
+-    {
+-        goto fail;
+-    }
+-
+-    nv_module_name[NV_MAX_MODULE_NAME_SIZE - 1] = '\0';
+-
+-    return;
+-
+-fail:
+-
+-    nv_module_name[0] = '\0';
+-}
+-
+-
+-/*
+- * Construct the proc registry path name based on the input
+- * module instance provided.  If an error occurs, the null
+- * terminator will be written to proc_path[0].
+- */
+-static __inline__ void assign_proc_registry_path
+-(
+-    char proc_path[NV_MAX_PROC_REGISTRY_PATH_SIZE],
+-    int module_instance
+-)
+-{
+-    int ret;
+-
+-    if (is_multi_module(module_instance))
+-    {
+-        ret = snprintf(proc_path, NV_MAX_PROC_REGISTRY_PATH_SIZE,
+-                       NV_NMODULE_PROC_REGISTRY_PATH, module_instance);
+-    }
+-    else
+-    {
+-        ret = snprintf(proc_path, NV_MAX_PROC_REGISTRY_PATH_SIZE,
+-                       NV_PROC_REGISTRY_PATH);
+-    }
+-
+-    if (ret <= 0)
+-    {
+-        goto fail;
+-    }
+-
+-    proc_path[NV_MAX_PROC_REGISTRY_PATH_SIZE - 1] = '\0';
+-
+-    return;
+-
+-fail:
+-
+-    proc_path[0] = '\0';
+-}
+-
+-
+ /*
+  * Just like strcmp(3), except that differences between '-' and '_' are
+  * ignored. This is useful for comparing module names, where '-' and '_'
+@@ -370,18 +318,20 @@ static int modprobe_helper(const int print_errors, const char *module_name)
+             return 0;
+ 
+         default:
+-            if (waitpid(pid, &status, 0) < 0)
+-            {
+-                return 0;
+-            }
+-            if (WIFEXITED(status) && WEXITSTATUS(status) == 0)
+-            {
+-                return 1;
+-            }
+-            else
+-            {
+-                return 0;
+-            }
++            /*
++             * waitpid(2) is not always guaranteed to return success even if
++             * the child terminated normally.  For example, if the process
++             * explicitly configured the handling of the SIGCHLD signal
++             * to SIG_IGN, then waitpid(2) will instead block until all
++             * children terminate and return the error ECHILD, regardless
++             * of the child's exit codes.
++             *
++             * Hence, ignore waitpid(2) error codes and instead check
++             * whether the desired kernel module is loaded.
++             */
++            waitpid(pid, NULL, 0);
++
++            return is_kernel_module_loaded(module_name);
+     }
+ 
+     return 1;
+@@ -391,13 +341,9 @@ static int modprobe_helper(const int print_errors, const char *module_name)
+ /*
+  * Attempt to load an NVIDIA kernel module
+  */
+-int nvidia_modprobe(const int print_errors, int module_instance)
++int nvidia_modprobe(const int print_errors)
+ {
+-    char nv_module_name[NV_MAX_MODULE_NAME_SIZE];
+-
+-    assign_nvidia_kernel_module_name(nv_module_name, module_instance);
+-
+-    return modprobe_helper(print_errors, nv_module_name);
++    return modprobe_helper(print_errors, NV_NVIDIA_MODULE_NAME);
+ }
+ 
+ 
+@@ -494,24 +440,22 @@ static int get_file_state_helper(
+     return state;
+ }
+ 
+-int nvidia_get_file_state(int minor, int module_instance)
++int nvidia_get_file_state(int minor)
+ {
+     char path[NV_MAX_CHARACTER_DEVICE_FILE_STRLEN];
+-    char proc_path[NV_MAX_PROC_REGISTRY_PATH_SIZE];
+     mode_t mode;
+     uid_t uid;
+     gid_t gid;
+     int modification_allowed;
+     int state = 0;
+ 
+-    assign_device_file_name(path, minor, module_instance);
+-    assign_proc_registry_path(proc_path, module_instance);
++    assign_device_file_name(path, minor);
+ 
+     init_device_file_parameters(&uid, &gid, &mode, &modification_allowed,
+-                                proc_path);
++                                NV_PROC_REGISTRY_PATH);
+ 
+     state = get_file_state_helper(path, NV_MAJOR_DEVICE_NUMBER, minor,
+-                                  proc_path, uid, gid, mode);
++                                  NV_PROC_REGISTRY_PATH, uid, gid, mode);
+ 
+     return state;
+ }
+@@ -522,8 +466,8 @@ int nvidia_get_file_state(int minor, int module_instance)
+  * permissions.  Returns 1 if the file is successfully created; returns 0
+  * if the file could not be created.
+  */
+-int mknod_helper(int major, int minor, const char *path,
+-                 const char *proc_path)
++static int mknod_helper(int major, int minor, const char *path,
++                        const char *proc_path)
+ {
+     dev_t dev = NV_MAKE_DEVICE(major, minor);
+     mode_t mode;
+@@ -616,15 +560,13 @@ int mknod_helper(int major, int minor, const char *path,
+  * Attempt to create a device file with the specified minor number for
+  * the specified NVIDIA module instance.
+  */
+-int nvidia_mknod(int minor, int module_instance)
++int nvidia_mknod(int minor)
+ {
+     char path[NV_MAX_CHARACTER_DEVICE_FILE_STRLEN];
+-    char proc_path[NV_MAX_PROC_REGISTRY_PATH_SIZE];
+ 
+-    assign_device_file_name(path, minor, module_instance);
+-    assign_proc_registry_path(proc_path, module_instance);
++    assign_device_file_name(path, minor);
+ 
+-    return mknod_helper(NV_MAJOR_DEVICE_NUMBER, minor, path, proc_path);
++    return mknod_helper(NV_MAJOR_DEVICE_NUMBER, minor, path, NV_PROC_REGISTRY_PATH);
+ }
+ 
+ 
+@@ -633,7 +575,7 @@ int nvidia_mknod(int minor, int module_instance)
+  * device with the specified name.  Returns the major number on success,
+  * or -1 on failure.
+  */
+-int get_chardev_major(const char *name)
++static int get_chardev_major(const char *name)
+ {
+     int ret = -1;
+     char line[NV_MAX_LINE_LENGTH];
+@@ -743,13 +685,9 @@ int nvidia_modeset_modprobe(void)
+  */
+ int nvidia_modeset_mknod(void)
+ {
+-    char proc_path[NV_MAX_PROC_REGISTRY_PATH_SIZE];
+-
+-    assign_proc_registry_path(proc_path, NV_MODULE_INSTANCE_NONE);
+-
+     return mknod_helper(NV_MAJOR_DEVICE_NUMBER,
+                         NV_MODESET_MINOR_DEVICE_NUM,
+-                        NV_MODESET_DEVICE_NAME, proc_path);
++                        NV_MODESET_DEVICE_NAME, NV_PROC_REGISTRY_PATH);
+ }
+ 
+ /*
+@@ -770,25 +708,62 @@ int nvidia_nvlink_mknod(void)
+                         NV_NVLINK_PROC_PERM_PATH);
+ }
+ 
++/*
++ * Attempt to create the NVIDIA NVSwitch driver device files.
++ */
++int nvidia_nvswitch_mknod(int minor)
++{
++    int major = 0;
++    char name[NV_MAX_CHARACTER_DEVICE_FILE_STRLEN];
++    int ret;
++
++    major = get_chardev_major(NV_NVSWITCH_MODULE_NAME);
++
++    if (major < 0)
++    {
++        return 0;
++    }
++
++    if (minor == NV_NVSWITCH_CTL_MINOR)
++    {
++        ret = snprintf(name, NV_MAX_CHARACTER_DEVICE_FILE_STRLEN,
++                       NV_NVSWITCH_CTL_NAME);
++    }
++    else
++    {
++        ret = snprintf(name, NV_MAX_CHARACTER_DEVICE_FILE_STRLEN,
++                       NV_NVSWITCH_DEVICE_NAME, minor);
++    }
++
++    if (ret <= 0)
++    {
++        return 0;
++    }
++
++    return mknod_helper(major, minor, name, NV_NVSWITCH_PROC_PERM_PATH);
++}
++
+ int nvidia_vgpu_vfio_mknod(int minor_num)
+ {
+     int major = get_chardev_major(NV_VGPU_VFIO_MODULE_NAME);
+     char vgpu_dev_name[NV_MAX_CHARACTER_DEVICE_FILE_STRLEN];
+-    char proc_path[NV_MAX_PROC_REGISTRY_PATH_SIZE];
++    int ret;
+ 
+     if (major < 0)
+     {
+         return 0;
+     }
+ 
+-    assign_proc_registry_path(proc_path, NV_MODULE_INSTANCE_NONE);
+-
+-    snprintf(vgpu_dev_name, NV_MAX_CHARACTER_DEVICE_FILE_STRLEN,
+-             NV_VGPU_VFIO_DEVICE_NAME, minor_num);
++    ret = snprintf(vgpu_dev_name, NV_MAX_CHARACTER_DEVICE_FILE_STRLEN,
++                   NV_VGPU_VFIO_DEVICE_NAME, minor_num);
++    if (ret <= 0)
++    {
++        return 0;
++    }
+ 
+     vgpu_dev_name[NV_MAX_CHARACTER_DEVICE_FILE_STRLEN - 1] = '\0';
+ 
+-    return mknod_helper(major, minor_num, vgpu_dev_name, proc_path);
++    return mknod_helper(major, minor_num, vgpu_dev_name, NV_PROC_REGISTRY_PATH);
+ }
+ 
+-#endif /* NV_LINUX */
+\ No newline@end of file
++#endif /* NV_LINUX */
+diff --git a/src/nvidia-modprobe-utils.h b/src/nvidia-modprobe-utils.h
+index e06b4a4..5ab3355 100644
+--- a/src/nvidia-modprobe-utils.h
++++ b/src/nvidia-modprobe-utils.h
+@@ -31,29 +31,17 @@
+ #include <stdio.h>
+ 
+ #define NV_MAX_CHARACTER_DEVICE_FILE_STRLEN  128
+-#define NV_MODULE_INSTANCE_NONE              -1
+-#define NV_MODULE_INSTANCE_ZERO              0
+-#define NV_MAX_MODULE_INSTANCES              8
+ #define NV_CTL_DEVICE_NUM                    255
+ #define NV_MODESET_MINOR_DEVICE_NUM          254
+-
+-#define NV_FRONTEND_CONTROL_DEVICE_MINOR_MAX NV_CTL_DEVICE_NUM
++#define NV_NVSWITCH_CTL_MINOR                255
+ 
+ #define NV_DEVICE_FILE_PATH "/dev/nvidia%d"
+ #define NV_CTRL_DEVICE_FILE_PATH "/dev/nvidiactl"
+ #define NV_MODESET_DEVICE_NAME "/dev/nvidia-modeset"
+ #define NV_VGPU_VFIO_DEVICE_NAME "/dev/nvidia-vgpu%d"
+ #define NV_NVLINK_DEVICE_NAME "/dev/nvidia-nvlink"
+-
+-#define NV_NMODULE_CTRL_DEVICE_FILE_PATH "/dev/nvidiactl%d"
+-
+-#define NV_FRONTEND_CONTROL_DEVICE_MINOR_MIN \
+-    (NV_FRONTEND_CONTROL_DEVICE_MINOR_MAX - \
+-     NV_MAX_MODULE_INSTANCES)
+-
+-#define NV_FRONTEND_IS_CONTROL_DEVICE(x) \
+-    ((x <= NV_FRONTEND_CONTROL_DEVICE_MINOR_MAX) && \
+-     (x > NV_FRONTEND_CONTROL_DEVICE_MINOR_MIN))
++#define NV_NVSWITCH_CTL_NAME "/dev/nvidia-nvswitchctl"
++#define NV_NVSWITCH_DEVICE_NAME "/dev/nvidia-nvswitch%d"
+ 
+ #if defined(NV_LINUX)
+ 
+@@ -76,31 +64,19 @@ static __inline__ int nvidia_test_file_state(int state,
+     return !!(state & (1 << value));
+ }
+ 
+-int nvidia_get_file_state(int minor, int module_instance);
+-int nvidia_modprobe(const int print_errors, int module_instance);
+-int nvidia_mknod(int minor, int module_instance);
++int nvidia_get_file_state(int minor);
++int nvidia_modprobe(const int print_errors);
++int nvidia_mknod(int minor);
+ int nvidia_uvm_modprobe(void);
+ int nvidia_uvm_mknod(int base_minor);
+ int nvidia_modeset_modprobe(void);
+ int nvidia_modeset_mknod(void);
+ int nvidia_vgpu_vfio_mknod(int minor_num);
+ int nvidia_nvlink_mknod(void);
+-
+-int mknod_helper(int major, int minor, const char *path, const char *proc_path);
+-int get_chardev_major(const char *name);
++int nvidia_nvswitch_mknod(int minor);
+ 
+ #endif /* NV_LINUX */
+ 
+-/*
+- * Detect use of multiple kernel module instances. Use a single 
+- * module instance unless instance != NV_MODULE_INSTANCE_NONE
+- */
+-static __inline__ int is_multi_module(int module_instance)
+-{
+-    return (module_instance != NV_MODULE_INSTANCE_NONE);
+-}
+-
+-
+ /*
+  * Construct the device file name, based on 'minor'.  If an error
+  * occurs, the nul terminator will be written to name[0].
+@@ -108,8 +84,7 @@ static __inline__ int is_multi_module(int module_instance)
+ static __inline__ void assign_device_file_name
+ (
+     char name[NV_MAX_CHARACTER_DEVICE_FILE_STRLEN],
+-    int minor,
+-    int module_instance
++    int minor
+ )
+ {
+     int ret;
+@@ -119,20 +94,12 @@ static __inline__ void assign_device_file_name
+         goto fail;
+     }
+ 
+-    if (!is_multi_module(module_instance) && minor == NV_CTL_DEVICE_NUM)
++    if (minor == NV_CTL_DEVICE_NUM)
+     {
+         ret = snprintf(name,
+                        NV_MAX_CHARACTER_DEVICE_FILE_STRLEN,
+                        NV_CTRL_DEVICE_FILE_PATH);
+     }
+-    else if (is_multi_module(module_instance) && 
+-             NV_FRONTEND_IS_CONTROL_DEVICE(minor))
+-    {
+-        ret = snprintf(name,
+-                       NV_MAX_CHARACTER_DEVICE_FILE_STRLEN,
+-                       NV_NMODULE_CTRL_DEVICE_FILE_PATH,
+-                       module_instance);
+-    }
+     else
+     {
+         ret = snprintf(name,
+@@ -154,4 +121,4 @@ fail:
+     name[0] = '\0';
+ }
+ 
+-#endif /* __NVIDIA_MODPROBE_UTILS_H__ */
+\ No newline@end of file
++#endif /* __NVIDIA_MODPROBE_UTILS_H__ */
+-- 
+2.27.0
+
diff --git a/package/libnvidia-container/Config.in b/package/libnvidia-container/Config.in
new file mode 100644
index 0000000000..7a452c3635
--- /dev/null
+++ b/package/libnvidia-container/Config.in
@@ -0,0 +1,18 @@
+config BR2_PACKAGE_LIBNVIDIA_CONTAINER
+	bool "libnvidia-container"
+	depends on BR2_SHARED_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS # tirpc
+	depends on BR2_TOOLCHAIN_USES_GLIBC # fexecve
+	select BR2_PACKAGE_ELFUTILS
+	select BR2_PACKAGE_LIBCAP
+	select BR2_PACKAGE_LIBTIRPC
+	select BR2_PACKAGE_NVIDIA_MODPROBE
+	help
+	  The libnvidia-container package adds a library and CLI for
+	  GPU-backed containers, agnostic to container runtime.
+
+	  https://github.com/NVIDIA/libnvidia-container
+
+comment "libnvidia-container needs a shared glibc toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAN_USES_GLIBC || \
+		!BR2_SHARED_LIBS
diff --git a/package/libnvidia-container/libnvidia-container.hash b/package/libnvidia-container/libnvidia-container.hash
new file mode 100644
index 0000000000..d356eb2b1e
--- /dev/null
+++ b/package/libnvidia-container/libnvidia-container.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256 fd447629fd65d171b68edb62fa2e581c67fdb450ff540f486987ab826150d06e  libnvidia-container-1.2.0.tar.gz
+sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/libnvidia-container/libnvidia-container.mk b/package/libnvidia-container/libnvidia-container.mk
new file mode 100644
index 0000000000..b040c0baaa
--- /dev/null
+++ b/package/libnvidia-container/libnvidia-container.mk
@@ -0,0 +1,44 @@
+################################################################################
+#
+# libnvidia-container
+#
+################################################################################
+
+LIBNVIDIA_CONTAINER_VERSION = 1.2.0
+LIBNVIDIA_CONTAINER_SITE = $(call github,NVIDIA,libnvidia-container,v$(LIBNVIDIA_CONTAINER_VERSION))
+LIBNVIDIA_CONTAINER_LICENSE = Apache-2.0
+LIBNVIDIA_CONTAINER_LICENSE_FILES = LICENSE
+
+LIBNVIDIA_CONTAINER_DEPENDENCIES = elfutils libcap libtirpc nvidia-modprobe \
+	host-pkgconf host-elfutils host-libcap
+
+LIBNVIDIA_CONTAINER_MAKE_OPTS = \
+	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
+	OBJCPY="$(TARGET_OBJCOPY)" \
+	RPCGEN="$(HOST_DIR)/bin/rpcgen" \
+	WITH_LIBELF=yes \
+	WITH_TIRPC=no
+
+ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
+LIBNVIDIA_CONTAINER_MAKE_OPTS += WITH_SECCOMP=yes
+LIBNVIDIA_CONTAINER_DEPENDENCIES += libseccomp
+else
+LIBNVIDIA_CONTAINER_MAKE_OPTS += WITH_SECCOMP=no
+endif
+
+define LIBNVIDIA_CONTAINER_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(LIBNVIDIA_CONTAINER_MAKE_OPTS) \
+		shared tools
+endef
+
+define LIBNVIDIA_CONTAINER_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(TARGET_CONFIGURE_OPTS) \
+		$(LIBNVIDIA_CONTAINER_MAKE_OPTS) \
+		DESTDIR="$(TARGET_DIR)" \
+		install
+endef
+
+$(eval $(generic-package))
-- 
2.29.2
