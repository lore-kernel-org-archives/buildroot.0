From: don <don_reid@comcast.net>
Date: Sun, 27 Aug 2006 15:06:50 -0700
Subject: [Buildroot] Ndiswrapper - kernel module
Message-ID: <20060827220650.GA31887@reid1.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am trying to build ndiswrapper within buildroot (for a WiFi card).

The ndiswrapper makefile seems to use the kernel makefile to link the
module (not unreasonable) with:

	$(MAKE) -C $(KBUILD) SUBDIRS=$(SRC_DIR)

I am getting an error "...ld: cannot find -lgcc_s" (full log below).

The library is in place:
	 ./build_i486/root/lib/libgcc_s.so -> libgcc_s.so.1
	 ./build_i486/root/lib/libgcc_s.so.1
	 ./build_i486/staging_dir/lib/libgcc_s.so -> libgcc_s.so.1
	 ./build_i486/staging_dir/lib/libgcc_s.so.1
	 ./toolchain_build_i486/gcc-3.4.5-final/gcc/libgcc_s.so -> libgcc_s.so.1
	 ./toolchain_build_i486/gcc-3.4.5-final/gcc/libgcc_s.so.1

Any ideas why this is happening?  

Is there another package that builds a module I should look at?
(I've looked at pcmcia.mk already).

Thanks
Don Reid

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Here is my ndiswrapper.mk:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#############################################################
#
# ndiswrapper
#
#############################################################
NDISWRAPPER_VER:=1.23
NDISWRAPPER_SOURCE:=ndiswrapper-$(NDISWRAPPER_VER).tar.gz
NDISWRAPPER_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/ndiswrapper
NDISWRAPPER_DIR:=$(BUILD_DIR)/ndiswrapper-$(NDISWRAPPER_VER)
NDISWRAPPER_CAT:=zcat
NDISWRAPPER_BINARY:=driver/ndiswrapper.ko
NDISWRAPPER_TARGET_BINARY:=lib/modules/$(LINUX_VERSION)/misc/ndiswrapper.ko

$(DL_DIR)/$(NDISWRAPPER_SOURCE):
	 $(WGET) -P $(DL_DIR) $(NDISWRAPPER_SITE)/$(NDISWRAPPER_SOURCE)

ndiswrapper-source: $(DL_DIR)/$(NDISWRAPPER_SOURCE)

$(NDISWRAPPER_DIR)/.unpacked: $(DL_DIR)/$(NDISWRAPPER_SOURCE)
	$(NDISWRAPPER_CAT) $(DL_DIR)/$(NDISWRAPPER_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
	touch $(NDISWRAPPER_DIR)/.unpacked

ndiswrapper-unpacked: $(NDISWRAPPER_DIR)/.unpacked

$(NDISWRAPPER_DIR)/$(NDISWRAPPER_BINARY): $(NDISWRAPPER_DIR)/.unpacked
	$(MAKE) $(TARGET_CONFIGURE_OPTS) LD=$(TARGET_CC) \
		-C $(NDISWRAPPER_DIR) \
		KVERS=$(LINUX_VERSION) \
		KBUILD=$(LINUX_SOURCE_DIR) \
		KSRC=$(LINUX_SOURCE_DIR) \
		DIST_DESTDIR=$(TARGET_DIR) \
		INST_DIR=$(TARGET_DIR)/lib/modules/$(LINUX_VERSION)/misc

$(TARGET_DIR)/$(NDISWRAPPER_TARGET_BINARY): $(NDISWRAPPER_DIR)/$(NDISWRAPPER_BINARY)
	$(MAKE) $(TARGET_CONFIGURE_OPTS) LD=$(TARGET_CC) \
		-C $(NDISWRAPPER_DIR) \
		KVERS=$(LINUX_VERSION) \
		KBUILD=$(LINUX_SOURCE_DIR) \
		KSRC=$(LINUX_SOURCE_DIR) \
		DIST_DESTDIR=$(TARGET_DIR) \
		INST_DIR=$(TARGET_DIR)/lib/modules/$(LINUX_VERSION)/misc
		install


ndiswrapper: $(TARGET_DIR)/$(NDISWRAPPER_TARGET_BINARY)

ndiswrapper-clean:
	$(MAKE) DESTDIR=$(TARGET_DIR) $(TARGET_CONFIGURE_OPTS) \
		LD=$(TARGET_CC) -C $(NDISWRAPPER_DIR) uninstall
	-$(MAKE) -C $(NDISWRAPPER_DIR) clean

ndiswrapper-dirclean:
	rm -rf $(NDISWRAPPER_DIR)

#############################################################
#
# Toplevel Makefile options
#
#############################################################
ifeq ($(strip $(BR2_PACKAGE_NDISWRAPPER)),y)
TARGETS+=ndiswrapper
endif




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Here is the full outout:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

make -j2 PATH=/home/don/Robots/Bot1/EPIA/buildroot/build_i486/staging_dir/bin:/home/don/Robots/Bot1/EPIA/buildroot/toolchain_build_i486/bin:/bin:/sbin:/usr/bin:/usr/sbin AR=/home/don/Robots/Bot1/EPIA/buildroot/build_i486/staging_dir/bin/i486-linux-uclibc-ar AS=/home/don/Robots/Bot1/EPIA/buildroot/build_i486/staging_dir/bin/i486-linux-uclibc-as LD=/home/don/Robots/Bot1/EPIA/buildroot/build_i486/staging_dir/bin/i486-linux-uclibc-ld NM=/home/don/Robots/Bot1/EPIA/buildroot/build_i486/staging_dir/bin/i486-linux-uclibc-nm CC=/home/don/Robots/Bot1/EPIA/buildroot/build_i486/staging_dir/bin/i486-linux-uclibc-gcc GCC=/home/don/Robots/Bot1/EPIA/buildroot/build_i486/staging_dir/bin/i486-linux-uclibc-gcc CXX=/home/don/Robots/Bot1/EPIA/buildroot/build_i486/staging_dir/bin/i486-linux-uclibc-g++ CPP=/home/don/Robots/Bot1/EPIA/buildroot/build_i486/staging_dir/bin/i486-linux-uclibc-cpp RANLIB=/home/don/Robots/Bot1/EPIA/buildroot/build_i486/staging_dir/bin/i486-linux-uclibc-ranlib STRIP=/home/don/Robots/Bot1/EPIA/buildroot/build_i486/staging_dir/bin/i486-linux-uclibc-strip OBJCOPY=/home/don/Robots/Bot1/EPIA/buildroot/build_i486/staging_dir/bin/i486-linux-uclibc-objcopy LD=/home/don/Robots/Bot1/EPIA/buildroot/build_i486/staging_dir/bin/i486-linux-uclibc-gcc \
	-C /home/don/Robots/Bot1/EPIA/buildroot/build_i486/ndiswrapper-1.23 \
	KVERS=2.6.11.5 \
	KBUILD=/home/don/Robots/Bot1/EPIA/buildroot/build_i486/linux-2.6.11.5 \
	KSRC=/home/don/Robots/Bot1/EPIA/buildroot/build_i486/linux-2.6.11.5 \
	DIST_DESTDIR=/home/don/Robots/Bot1/EPIA/buildroot/build_i486/root \
	INST_DIR=/home/don/Robots/Bot1/EPIA/buildroot/build_i486/root/lib/modules/2.6.11.5/misc
make[1]: Entering directory `/home/don/Robots/Bot1/EPIA/buildroot/build_i486/ndiswrapper-1.23'
make -C driver
make[2]: Entering directory `/home/don/Robots/Bot1/EPIA/buildroot/build_i486/ndiswrapper-1.23/driver'
make[2]: warning: jobserver unavailable: using -j1.  Add `+' to parent make rule.
make -C /home/don/Robots/Bot1/EPIA/buildroot/build_i486/linux-2.6.11.5 SUBDIRS=/home/don/Robots/Bot1/EPIA/buildroot/build_i486/ndiswrapper-1.23/driver
make[3]: Entering directory `/home/don/Robots/Bot1/EPIA/buildroot/build_i486/linux-2.6.11.5'
  LD      /home/don/Robots/Bot1/EPIA/buildroot/build_i486/ndiswrapper-1.23/driver/built-in.o
  CC [M]  /home/don/Robots/Bot1/EPIA/buildroot/build_i486/ndiswrapper-1.23/driver/hal.o
  CC [M]  /home/don/Robots/Bot1/EPIA/buildroot/build_i486/ndiswrapper-1.23/driver/iw_ndis.o
  CC [M]  /home/don/Robots/Bot1/EPIA/buildroot/build_i486/ndiswrapper-1.23/driver/loader.o
  CC [M]  /home/don/Robots/Bot1/EPIA/buildroot/build_i486/ndiswrapper-1.23/driver/misc_funcs.o
  CC [M]  /home/don/Robots/Bot1/EPIA/buildroot/build_i486/ndiswrapper-1.23/driver/ndis.o
  CC [M]  /home/don/Robots/Bot1/EPIA/buildroot/build_i486/ndiswrapper-1.23/driver/ntoskernel.o
  CC [M]  /home/don/Robots/Bot1/EPIA/buildroot/build_i486/ndiswrapper-1.23/driver/ntoskernel_io.o
  CC [M]  /home/don/Robots/Bot1/EPIA/buildroot/build_i486/ndiswrapper-1.23/driver/pe_linker.o
  CC [M]  /home/don/Robots/Bot1/EPIA/buildroot/build_i486/ndiswrapper-1.23/driver/pnp.o
  CC [M]  /home/don/Robots/Bot1/EPIA/buildroot/build_i486/ndiswrapper-1.23/driver/proc.o
  CC [M]  /home/don/Robots/Bot1/EPIA/buildroot/build_i486/ndiswrapper-1.23/driver/wrapmem.o
  CC [M]  /home/don/Robots/Bot1/EPIA/buildroot/build_i486/ndiswrapper-1.23/driver/wrapndis.o
  CC [M]  /home/don/Robots/Bot1/EPIA/buildroot/build_i486/ndiswrapper-1.23/driver/wrapper.o
  CC [M]  /home/don/Robots/Bot1/EPIA/buildroot/build_i486/ndiswrapper-1.23/driver/divdi3.o
  LD [M]  /home/don/Robots/Bot1/EPIA/buildroot/build_i486/ndiswrapper-1.23/driver/ndiswrapper.o
/home/don/Robots/Bot1/EPIA/buildroot/build_i486/staging_dir/lib/gcc/i486-linux-uclibc/3.4.5/../../../../i486-linux-uclibc/bin/ld: cannot find -lgcc_s
collect2: ld returned 1 exit status
make[4]: *** [/home/don/Robots/Bot1/EPIA/buildroot/build_i486/ndiswrapper-1.23/driver/ndiswrapper.o] Error 1
make[3]: *** [_module_/home/don/Robots/Bot1/EPIA/buildroot/build_i486/ndiswrapper-1.23/driver] Error 2
make[3]: Leaving directory `/home/don/Robots/Bot1/EPIA/buildroot/build_i486/linux-2.6.11.5'
make[2]: *** [default] Error 2
make[2]: Leaving directory `/home/don/Robots/Bot1/EPIA/buildroot/build_i486/ndiswrapper-1.23/driver'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/home/don/Robots/Bot1/EPIA/buildroot/build_i486/ndiswrapper-1.23'
make: *** [/home/don/Robots/Bot1/EPIA/buildroot/build_i486/ndiswrapper-1.23/driver/ndiswrapper.ko] Error 2
