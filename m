From: Christopher Taylor <chtaylo3@gmail.com>
Date: Thu, 14 Aug 2008 15:45:46 -0400
Subject: [Buildroot] GDB attempting to apply patches severla times
In-Reply-To: <2590773a0808141241u4210fa5bh114585858cff6080@mail.gmail.com>
References: <2590773a0808141241u4210fa5bh114585858cff6080@mail.gmail.com>
Message-ID: <2590773a0808141245y57fe1166n3d1646ab285b9824@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Has anyone noticed that buildroot attempts to apply the GDB  patches twice?
>
> Seems like this only happens when I have buildroot build GDB for the
> target (as a server and regularly) and for the host.  When I take the
> host out, it seems to work ok....


Should have mentioned that it looks like it may have something to do
with how the gdb.mk file is layed out and buildroot references it.
Specifically, the section below from the gdb.mk file:

gdb-unpacked: $(GDB_DIR)/.unpacked
$(GDB_DIR)/.unpacked: $(DL_DIR)/$(GDB_SOURCE)
        mkdir -p $(TOOL_BUILD_DIR)
        $(GDB_CAT) $(DL_DIR)/$(GDB_SOURCE) | tar -C $(TOOL_BUILD_DIR)
$(TAR_OPTIONS) -
ifeq ($(GDB_VERSION),snapshot)
        GDB_REAL_DIR=$(shell \
                tar jtf $(DL_DIR)/$(GDB_SOURCE) | head -1 | cut -d"/" -f1)
        ln -sf $(TOOL_BUILD_DIR)/$(shell tar jtf
$(DL_DIR)/$(GDB_SOURCE) | head -1 | cut -d"/" -f1) $(GDB_DIR)
endif
        toolchain/patch-kernel.sh $(GDB_DIR) $(GDB_PATCH_DIR) \*.patch
        $(CONFIG_UPDATE) $(GDB_DIR)
        touch $@

gdb-patched: $(GDB_DIR)/.unpacked
$(GDB_DIR)/.patched: $(GDB_DIR)/.unpacked
        toolchain/patch-kernel.sh $(GDB_DIR) $(GDB_PATCH_DIR) \*.patch
        $(CONFIG_UPDATE) $(GDB_DIR)
        touch $@
