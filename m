From: Stephen Beckwith <embeddedsteve@gmail.com>
Date: Tue, 26 Apr 2016 14:44:28 -0400
Subject: [Buildroot] Multi-File Kernel Module Build Fails
Message-ID: <CAN34fowqUhJX9LZ-7qkzr=20-dKFFX9r8suAuXpVnn-brbacQw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings,
   I posted this same issue last week and received no response.  After some
more investigation and trying several different options, I am still STUCK
and cannot move forward.
Problem:
 -  if a kernel module has more than 1 source file, Buildroot does NOT pass
in the MAKE_OPTS defined (path for header files).  Compile fails due to
"file not found".

With a single source file, no problems.

In the .mk file:

KMOD_MEM_MODULE_MAKE_OPTS = NETAPP_DIR=$(BR2_EXTERNAL)/netapp

The "Makefile" in the directory:

#inform the kernel that a module needs to be build
obj-m := hwdd_memory.o
hwdd_memory-objs := hwdd_mem.o hwdd_memalgo.o hwdd_cache_algos.o

# Global Includes here
GBL_INCLUDES = $(NETAPP_DIR)/include
KNL_INCLUDES = $(NETAPP_DIR)/include/kernel

#Add here the CFLAGS to pass in to get the Defined Symbol
CFLAGS_hwdd_memory.o := -DCONFIG_NETAPP_HWDD -I$(GBL_INCLUDES)
-I$(KNL_INCLUDES)

Failure:
In file included from
/home/sbeckwith/HBE-1/hwdd/output/build/kmod_mem-0.1.0/./hwdd_memalgo.c:11:0:
/home/sbeckwith/HBE-1/hwdd/output/build/kmod_mem-0.1.0/./hwdd_mem.h:12:26:
fatal error: hwdd_klogger.h: No such file or directory
compilation terminated.

The .mk setup uses:

$(eval $(kernel-module))
$(eval $(generic-package))

Are multi-file inputs NOT supported in this scheme?  These are custom
kernel modules, referencing unique hardware on the target.
Can someone please verify that multi-file kernel modules work using this
setup?

Thanks!
Stephen
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160426/515eca24/attachment.html>
