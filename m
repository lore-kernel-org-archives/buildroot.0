From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 24 Aug 2008 00:50:15 -0700
Subject: [Buildroot] [buildroot 0003954]: gdb fails to build: double
	patching in gdb.mk
Message-ID: <16a874e45f7819860e7b3df624e742cc@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=3954 
====================================================================== 
Reported By:                Souf
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3954
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             07-06-2008 02:37 PDT
Last Modified:              08-24-2008 00:50 PDT
====================================================================== 
Summary:                    gdb fails to build: double patching in gdb.mk
Description: 
gdb-unpacked: $(GDB_DIR)/.unpacked
$(GDB_DIR)/.unpacked: $(DL_DIR)/$(GDB_SOURCE)
	mkdir -p $(TOOL_BUILD_DIR)
	$(GDB_CAT) $(DL_DIR)/$(GDB_SOURCE) | tar -C $(TOOL_BUILD_DIR)
$(TAR_OPTIONS) -
ifeq ($(GDB_VERSION),snapshot)
	GDB_REAL_DIR=$(shell \
		tar jtf $(DL_DIR)/$(GDB_SOURCE) | head -1 | cut -d"/" -f1)
	ln -sf $(TOOL_BUILD_DIR)/$(shell tar jtf $(DL_DIR)/$(GDB_SOURCE) | head
-1 | cut -d"/" -f1) $(GDB_DIR)
endif
	toolchain/patch-kernel.sh $(GDB_DIR) $(GDB_PATCH_DIR) \*.patch  <======
	$(CONFIG_UPDATE) $(GDB_DIR)
	touch $@

gdb-patched: $(GDB_DIR)/.unpacked
$(GDB_DIR)/.patched: $(GDB_DIR)/.unpacked
	toolchain/patch-kernel.sh $(GDB_DIR) $(GDB_PATCH_DIR) \*.patch   <======
	$(CONFIG_UPDATE) $(GDB_DIR)
	touch $@

gdb-dirclean:
	rm -rf $(GDB_DIR)
====================================================================== 

---------------------------------------------------------------------- 
 jacmet - 08-24-08 00:50  
---------------------------------------------------------------------- 
Sorry about that - Got broken in r22624 and is now fixed in r23193.

Thanks! 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-06-08 02:37  Souf           New Issue                                    
07-06-08 02:37  Souf           Status                   new => assigned     
07-06-08 02:37  Souf           Assigned To               => buildroot       
07-06-08 02:37  Souf           File Added: gdb.mk.patch                     
08-24-08 00:50  jacmet         Status                   assigned => closed  
08-24-08 00:50  jacmet         Note Added: 0010724                          
======================================================================
