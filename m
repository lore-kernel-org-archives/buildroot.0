From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Dec 2020 23:35:59 +0100
Subject: [Buildroot] [PATCH] Revert "package/gdb: prevent gdbserver
 being selected for RISC-V builds"
In-Reply-To: <20201204014549.2669932-1-vgupta@synopsys.com>
References: <20201204014549.2669932-1-vgupta@synopsys.com>
Message-ID: <20201230233559.5ea5c26b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  3 Dec 2020 17:45:49 -0800
Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:

> This reverts commit 44a9babcc67cd011e957ba9fd1cf741891957c12.
> 
> As of Buildroot 2020.11 (glibc build of qemu_riscv64_virt_defconfig),
> cross-gdb for RISCV buildis fine and can also attach to a qemu
> instance, so remove the gate on not building it.
> 
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>

I am sorry, but I don't see how this can work. RISC-V support in
gdbserver was only added in upstream gdb in commit
bf84f7066626c78884436e1c39fb60f04c665f21, which first appeared in gdb
10.1.

And indeed, when I build:

BR2_riscv=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-riscv64-musl-2020.02.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_HOST_GDB=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_GDB=y
# BR2_TARGET_ROOTFS_TAR is not set

It fails to build gdbserver, with:

Error: target not supported by gdbserver.

However, if I build:

BR2_riscv=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/br-riscv64-musl-2020.02.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_19=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_HOST_GDB=y
BR2_GDB_VERSION_10=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_GDB=y
# BR2_TARGET_ROOTFS_TAR is not set

which uses gdb 10.x, then indeed, the gdbserver configure script
recognizes RISC-V as a supported CPU architecture, but it fails to
build with:

../../gdbserver/linux-riscv-low.cc: In function ?void riscv_fill_fpregset(regcache*, void*)?:
../../gdbserver/linux-riscv-low.cc:140:19: error: ?ELF_NFPREG? was not declared in this scope; did you mean ?ELF_NGREG??
  140 |   for (i = 0; i < ELF_NFPREG - 1; i++, regbuf += flen)
      |                   ^~~~~~~~~~
      |                   ELF_NGREG
../../gdbserver/linux-riscv-low.cc: In function ?void riscv_store_fpregset(regcache*, const void*)?:
../../gdbserver/linux-riscv-low.cc:156:19: error: ?ELF_NFPREG? was not declared in this scope; did you mean ?ELF_NGREG??
  156 |   for (i = 0; i < ELF_NFPREG - 1; i++, regbuf += flen)
      |                   ^~~~~~~~~~
      |                   ELF_NGREG

Note: this is with a musl toolchain, it is possible that it builds fine
with a glibc toolchain.

But regardless of that, RISC-V support in gdbserver only appeared in
gdb 10.x, so I don't see how your patch could have worked, as we only
introduced gdb 10.x support in Buildroot yesterday.

Could you clarify ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
