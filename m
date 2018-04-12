From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 21:16:01 +0200
Subject: [Buildroot] [PATCH] support/scripts/fix-rpath: exclude
 /lib/firmware in the target
In-Reply-To: <20180412115009.8432-1-thomas.petazzoni@bootlin.com>
References: <20180412115009.8432-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180412211601.7886676e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 Apr 2018 13:50:09 +0200, Thomas Petazzoni wrote:
> The /lib/firmware directory contains random firmware for various
> devices. It happens that some of them might be or appear to be ELF
> files, but they shouldn't be checked by fix-rpath. For example, one of
> the Qualcomm VPU firmware file appears to be an ELF file, but patchelf
> isn't happy about it:
> 
> $ ./output/host/bin/patchelf --print-rpath output/target/lib/firmware/qcom/venus-4.2/venus.b00
> patchelf: patchelf.cc:387: void ElfFile<Elf_Ehdr, Elf_Phdr, Elf_Shdr, Elf_Addr, Elf_Off, Elf_Dyn, Elf_Sym>::parse() [with Elf_Ehdr = Elf32_Ehdr; Elf_Phdr = Elf32_Phdr; Elf_Shdr = Elf32_Shdr; Elf_Addr = unsigned int; Elf_Off = unsigned int; Elf_Dyn = Elf32_Dyn; Elf_Sym = Elf32_Sym]: Assertion `shstrtabIndex < shdrs.size()' failed.
> Aborted (core dumped)
> 
> Even though patchelf definitely shouldn't crash, it anyway doesn't
> make sense to check ELF files in /lib/firmware, so let's exclude this
> directory from our check.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/scripts/fix-rpath | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
