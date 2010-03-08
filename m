From: Chris Packham <judge.packham@gmail.com>
Date: Mon,  8 Mar 2010 14:10:55 -0800
Subject: [Buildroot] [PATCH] docs/howto: add howto for nfsroot
In-Reply-To: <a038bef51003081406h716cafacq4aaff768992383fe@mail.gmail.com>
References: <a038bef51003081406h716cafacq4aaff768992383fe@mail.gmail.com>
Message-ID: <1268086255-23927-1-git-send-email-judge.packham@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Document how to use buildroot to generate a kernel/filesystem cabable of
using/being used for a root filesystem over NFS.
---
 docs/howto/Makefile    |   22 ++++++++++++++++++
 docs/howto/nfsroot.txt |   58 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 80 insertions(+), 0 deletions(-)
 create mode 100644 docs/howto/Makefile
 create mode 100644 docs/howto/nfsroot.txt

diff --git a/docs/howto/Makefile b/docs/howto/Makefile
new file mode 100644
index 0000000..d81bbcb
--- /dev/null
+++ b/docs/howto/Makefile
@@ -0,0 +1,22 @@
+OBJS=$(subst .txt,.html,$(wildcard *.txt))
+
+ASCIIDOC=$(shell which asciidoc)
+ASCIIDOC_VER=$(shell $(ASCIIDOC) --version | cut -d' ' -f2)
+ASCIIDOC_ICONDIR=/etc/asciidoc/images/icons
+
+ifeq ($V,)
+	Q=@
+	VERBOSE=
+else
+	Q=
+	VERBOSE=--verbose
+endif
+
+%.html: %.txt
+	$(Q)$(ASCIIDOC) $(VERBOSE) -a toc -a icons \
+		-a iconsdir=$(ASCIIDOC_ICONDIR) -a numbered $<
+
+all: $(OBJS)
+
+clean:
+	$(Q)rm -f $(OBJ)
diff --git a/docs/howto/nfsroot.txt b/docs/howto/nfsroot.txt
new file mode 100644
index 0000000..8a58503
--- /dev/null
+++ b/docs/howto/nfsroot.txt
@@ -0,0 +1,58 @@
+== Buildroot: NFS Root Howto ==
+
+This howto attempts to explain what is needed to mount a file system generated
+by Buildroot and hosted on a development system (referred to as the host) from
+an embedded target device (referred to as the target).
+
+For the purposes of clarity the kernel that was used for this howto was Linux
+Kernel v2.6.32.9 and the Buildroot version was 2010.02-216-gc9d195e.
+
+=== Linux Config ===
+
+The Linux kernel needs to be configured to include a NFS client _and_ support a
+root file system on NFS. The config options +CONFIG_NFS_FS+ and +CONFIG_ROOT_NFS+
+need to be set to Y.
+----
+  buildroot$ make linux26-menuconfig
+----
+The NFS options can be found under the "File Systems" -> "Network File Systems"
+menu. The options are called "NFS client support" and "Root file system on NFS".
+
+=== Linux Command Line (bootargs) ===
+
+The Linux Kernel needs to be told to mount its root file system via NFS, the
+address of the NFS server and the IP address it should use. This is done
+by supplying the kernel a command line with the appropriate arguments. There
+are many ways to do this, the following is the U-Boot setup for a target
+(192.168.1.254) that will mount its filesystem from the directory
++/tftboot/rootfs+ on the host (192.168.1.1).
+----
+  uboot> setenv ipaddr 192.168.1.254
+  uboot> setenv serverip 192.168.1.1
+  uboot> setenv bootargs root=/dev/nfs nfsroot=/tftpboot/rootfs ip=192.168.1.254:192.168.1.1::::eth0:off
+----
+
+=== Buildroot Config ===
+
+The +output/target+ directory is not directly suitable for exporting as a rootfs
+as the permissions are not set correctly and the device nodes are not created.
+To generate a filesystem suitable for exporting the +BR2_TARGET_ROOTFS_TAR+
+config option needs to be set to Y.
+----
+  buildroot$ make menuconfig
+----
+The option can be found under the "Target filesystem options" menu. The option
+is called "tar the root filesystem"
+
+=== Exporting rootfs ===
+
+To export the root file system create a tarball then extract it into the
+directory to be served by the host.
+----
+  buildroot$ make
+  buildroot$ make tarroot
+  buildroot$ sudo tar -xf output/images/rootfs.powerpc.tar -C /tftpboot/rootfs/
+----
+
+=== References ===
+* http://git.kernel.org/?p=linux/kernel/git/stable/linux-2.6.32.y.git;a=blob;f=Documentation/filesystems/nfsroot.txt;hb=HEAD[Documentation/filesystems/nfsroot.txt]
-- 
1.7.0.1
