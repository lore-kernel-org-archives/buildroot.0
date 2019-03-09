From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  9 Mar 2019 19:28:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/stella: fix build with PAGE_SIZE
Message-ID: <20190309182855.19594-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/22a9b009749af2a0862750a1fb2b2dc7167cd589

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/stella/0003-Rename-PAGE_SIZE.patch | 1369 ++++++++++++++++++++
 1 file changed, 1369 insertions(+)
 create mode 100644 package/stella/0003-Rename-PAGE_SIZE.patch

diff --git a/package/stella/0003-Rename-PAGE_SIZE.patch b/package/stella/0003-Rename-PAGE_SIZE.patch
new file mode 100644
index 0000000000..c356a64947
--- /dev/null
+++ b/package/stella/0003-Rename-PAGE_SIZE.patch
@@ -0,0 +1,1369 @@
+From b38b50422ed53d938e4dd2c6ff61640b4bbe16ff Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 9 Mar 2019 18:15:49 +0100
+Subject: [PATCH] Rename PAGE_SIZE
+
+PAGE_SIZE is sometimes already defined by the toolchain so rename it:
+
+/home/naourr/work/instance-3/output/host/bin/x86_64-linux-g++ -MMD -MF "src/debugger/.deps/CpuDebug.d" -MQ "src/debugger/CpuDebug.o" -MP -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -x c++ -Wall -Wextra -Wno-unused-parameter -Wno-ignored-qualifiers -Wno-multichar -Wunused -fno-rtti -Woverloaded-virtual -Wnon-virtual-dtor -std=c++14 -fomit-frame-pointer -D_GLIBCXX_USE_CXX11_ABI=1 -DUNIX -DBSPF_UNIX -DWINDOWED_SUPPORT -DSOUND_SUPPORT -DDEBUGGER_SUPPORT -DJOYSTICK_SUPPORT -DCHEATCODE_SUPPORT  -Isrc/emucore -Isrc/common -Isrc/common/tv_filters -Isrc/gui -Isrc/emucore/tia -Isrc/emucore/tia/frame-manager -I/home/naourr/work/instance-3/output/host/x86_64-buildroot-linux-musl/sysroot/usr/bin/../../usr/include/SDL2 -D_REENTRANT -Isrc/unix -Isrc/debugger -Isrc/debugger/gui -Isrc/yacc -Isrc/cheat -c src/debugger/CpuDebug.cxx -o src/debugger/CpuDebug.o
+In file included from /home/naourr/work/instance-3/output/host/x86_64-buildroot-linux-musl/sysroot/usr/include/limits.h:8:0,
+                 from /home/naourr/work/instance-3/output/host/opt/ext-toolchain/x86_64-buildroot-linux-musl/include/c++/7.4.0/climits:42,
+                 from src/common/bspf.hxx:28,
+                 from src/debugger/CartDebug.cxx:18:
+src/emucore/System.hxx:64:29: error: expected unqualified-id before numeric constant
+     static constexpr uInt16 PAGE_SIZE = (1 << PAGE_SHIFT);
+
+Fixes:
+ - http://autobuild.buildroot.org/results/22a9b009749af2a0862750a1fb2b2dc7167cd589
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/stella-emu/stella/pull/419]
+---
+ src/debugger/gui/FlashWidget.cxx |  4 ++--
+ src/emucore/Cart0840.cxx         |  4 ++--
+ src/emucore/Cart2K.cxx           |  4 ++--
+ src/emucore/Cart3E.cxx           | 10 +++++-----
+ src/emucore/Cart3EPlus.cxx       |  8 ++++----
+ src/emucore/Cart3F.cxx           |  6 +++---
+ src/emucore/Cart4A50.cxx         |  2 +-
+ src/emucore/Cart4K.cxx           |  2 +-
+ src/emucore/Cart4KSC.cxx         |  6 +++---
+ src/emucore/CartAR.cxx           |  2 +-
+ src/emucore/CartBF.cxx           |  4 ++--
+ src/emucore/CartBFSC.cxx         |  8 ++++----
+ src/emucore/CartBUS.cxx          |  4 ++--
+ src/emucore/CartCDF.cxx          |  4 ++--
+ src/emucore/CartCM.cxx           |  4 ++--
+ src/emucore/CartCTY.cxx          |  4 ++--
+ src/emucore/CartCV.cxx           |  6 +++---
+ src/emucore/CartCVPlus.cxx       |  8 ++++----
+ src/emucore/CartDASH.cxx         |  8 ++++----
+ src/emucore/CartDF.cxx           |  4 ++--
+ src/emucore/CartDFSC.cxx         |  8 ++++----
+ src/emucore/CartDPC.cxx          |  6 +++---
+ src/emucore/CartDPCPlus.cxx      |  4 ++--
+ src/emucore/CartE0.cxx           | 10 +++++-----
+ src/emucore/CartEF.cxx           |  4 ++--
+ src/emucore/CartEFSC.cxx         |  8 ++++----
+ src/emucore/CartF0.cxx           |  4 ++--
+ src/emucore/CartF4.cxx           |  4 ++--
+ src/emucore/CartF4SC.cxx         |  8 ++++----
+ src/emucore/CartF6.cxx           |  4 ++--
+ src/emucore/CartF6SC.cxx         |  8 ++++----
+ src/emucore/CartF8.cxx           |  4 ++--
+ src/emucore/CartF8SC.cxx         |  8 ++++----
+ src/emucore/CartFA.cxx           |  8 ++++----
+ src/emucore/CartFA2.cxx          |  8 ++++----
+ src/emucore/CartFE.cxx           |  4 ++--
+ src/emucore/CartMDM.cxx          |  4 ++--
+ src/emucore/CartMNetwork.cxx     |  6 +++---
+ src/emucore/CartSB.cxx           |  4 ++--
+ src/emucore/CartUA.cxx           |  2 +-
+ src/emucore/CartWD.cxx           | 12 ++++++------
+ src/emucore/CartX07.cxx          |  4 ++--
+ src/emucore/M6532.cxx            |  2 +-
+ src/emucore/MT24LC256.cxx        |  8 ++++----
+ src/emucore/MT24LC256.hxx        |  2 +-
+ src/emucore/System.hxx           |  4 ++--
+ src/emucore/tia/TIA.cxx          |  2 +-
+ 47 files changed, 126 insertions(+), 126 deletions(-)
+
+diff --git a/src/debugger/gui/FlashWidget.cxx b/src/debugger/gui/FlashWidget.cxx
+index 692ae7c2..e8c72676 100644
+--- a/src/debugger/gui/FlashWidget.cxx
++++ b/src/debugger/gui/FlashWidget.cxx
+@@ -81,8 +81,8 @@ void FlashWidget::loadConfig()
+     {
+       if(startPage != -1)
+       {
+-        int from = startPage * MT24LC256::PAGE_SIZE;
+-        int to = page * MT24LC256::PAGE_SIZE - 1;
++        int from = startPage * MT24LC256::MT24LC256_PAGE_SIZE;
++        int to = page * MT24LC256::MT24LC256_PAGE_SIZE - 1;
+         ostringstream label;
+ 
+         label.str("");
+diff --git a/src/emucore/Cart0840.cxx b/src/emucore/Cart0840.cxx
+index 4e816b03..59bac1f0 100644
+--- a/src/emucore/Cart0840.cxx
++++ b/src/emucore/Cart0840.cxx
+@@ -55,7 +55,7 @@ void Cartridge0840::install(System& system)
+ 
+   // Set the page accessing methods for the hot spots
+   System::PageAccess access(this, System::PA_READ);
+-  for(uInt16 addr = 0x0800; addr < 0x0FFF; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x0800; addr < 0x0FFF; addr += System::SYSTEM_PAGE_SIZE)
+     mySystem->setPageAccess(addr, access);
+ 
+   // Install pages for bank 0
+@@ -135,7 +135,7 @@ bool Cartridge0840::bank(uInt16 bank)
+   System::PageAccess access(this, System::PA_READ);
+ 
+   // Map ROM image into the system
+-  for(uInt16 addr = 0x1000; addr < 0x2000; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1000; addr < 0x2000; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myImage[myBankOffset + (addr & 0x0FFF)];
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+diff --git a/src/emucore/Cart2K.cxx b/src/emucore/Cart2K.cxx
+index 5b28e2cc..ea2ca055 100644
+--- a/src/emucore/Cart2K.cxx
++++ b/src/emucore/Cart2K.cxx
+@@ -32,7 +32,7 @@ Cartridge2K::Cartridge2K(const BytePtr& image, uInt32 size,
+     mySize <<= 1;
+ 
+   // We can't use a size smaller than the minimum page size in Stella
+-  mySize = std::max<uInt32>(mySize, System::PAGE_SIZE);
++  mySize = std::max<uInt32>(mySize, System::SYSTEM_PAGE_SIZE);
+ 
+   // Initialize ROM with illegal 6502 opcode that causes a real 6502 to jam
+   myImage = make_unique<uInt8[]>(mySize);
+@@ -62,7 +62,7 @@ void Cartridge2K::install(System& system)
+   // Note that we don't need our own peek/poke methods, since the mapping
+   // takes care of the entire address space
+   System::PageAccess access(this, System::PA_READ);
+-  for(uInt16 addr = 0x1000; addr < 0x2000; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1000; addr < 0x2000; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myImage[addr & myMask];
+     access.codeAccessBase = &myCodeAccessBase[addr & myMask];
+diff --git a/src/emucore/Cart3E.cxx b/src/emucore/Cart3E.cxx
+index a6b9c138..3b86b8ee 100644
+--- a/src/emucore/Cart3E.cxx
++++ b/src/emucore/Cart3E.cxx
+@@ -52,12 +52,12 @@ void Cartridge3E::install(System& system)
+   System::PageAccess access(this, System::PA_READWRITE);
+ 
+   // The hotspots ($3E and $3F) are in TIA address space, so we claim it here
+-  for(uInt16 addr = 0x00; addr < 0x40; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x00; addr < 0x40; addr += System::SYSTEM_PAGE_SIZE)
+     mySystem->setPageAccess(addr, access);
+ 
+   // Setup the second segment to always point to the last ROM slice
+   access.type = System::PA_READ;
+-  for(uInt16 addr = 0x1800; addr < 0x2000; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1800; addr < 0x2000; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myImage[(mySize - 2048) + (addr & 0x07FF)];
+     access.codeAccessBase = &myCodeAccessBase[(mySize - 2048) + (addr & 0x07FF)];
+@@ -143,7 +143,7 @@ bool Cartridge3E::bank(uInt16 bank)
+     System::PageAccess access(this, System::PA_READ);
+ 
+     // Map ROM image into the system
+-    for(uInt16 addr = 0x1000; addr < 0x1800; addr += System::PAGE_SIZE)
++    for(uInt16 addr = 0x1000; addr < 0x1800; addr += System::SYSTEM_PAGE_SIZE)
+     {
+       access.directPeekBase = &myImage[offset + (addr & 0x07FF)];
+       access.codeAccessBase = &myCodeAccessBase[offset + (addr & 0x07FF)];
+@@ -162,7 +162,7 @@ bool Cartridge3E::bank(uInt16 bank)
+     System::PageAccess access(this, System::PA_READ);
+ 
+     // Map read-port RAM image into the system
+-    for(uInt16 addr = 0x1000; addr < 0x1400; addr += System::PAGE_SIZE)
++    for(uInt16 addr = 0x1000; addr < 0x1400; addr += System::SYSTEM_PAGE_SIZE)
+     {
+       access.directPeekBase = &myRAM[offset + (addr & 0x03FF)];
+       access.codeAccessBase = &myCodeAccessBase[mySize + offset + (addr & 0x03FF)];
+@@ -175,7 +175,7 @@ bool Cartridge3E::bank(uInt16 bank)
+     // Map write-port RAM image into the system
+     // Map access to this class, since we need to inspect all accesses to
+     // check if RWP happens
+-    for(uInt16 addr = 0x1400; addr < 0x1800; addr += System::PAGE_SIZE)
++    for(uInt16 addr = 0x1400; addr < 0x1800; addr += System::SYSTEM_PAGE_SIZE)
+     {
+       access.codeAccessBase = &myCodeAccessBase[mySize + offset + (addr & 0x03FF)];
+       mySystem->setPageAccess(addr, access);
+diff --git a/src/emucore/Cart3EPlus.cxx b/src/emucore/Cart3EPlus.cxx
+index 961cfcc4..f9a47d3c 100644
+--- a/src/emucore/Cart3EPlus.cxx
++++ b/src/emucore/Cart3EPlus.cxx
+@@ -62,7 +62,7 @@ void Cartridge3EPlus::install(System& system)
+   System::PageAccess access(this, System::PA_READWRITE);
+ 
+   // The hotspots are in TIA address space, so we claim it here
+-  for(uInt16 addr = 0x00; addr < 0x40; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x00; addr < 0x40; addr += System::SYSTEM_PAGE_SIZE)
+     mySystem->setPageAccess(addr, access);
+ 
+   // Initialise bank values for all ROM/RAM access
+@@ -185,7 +185,7 @@ void Cartridge3EPlus::bankRAMSlot(uInt16 bank)
+ 
+ //cerr << "bank RAM: " << bankNumber << " -> " << (bankNumber * 2 + (upper ? 1 : 0)) << (upper ? " (W)" : " (R)") << endl
+ //     << "start=" << std::hex << start << ", end=" << end << endl << endl;
+-  for(uInt16 addr = start; addr <= end; addr += System::PAGE_SIZE)
++  for(uInt16 addr = start; addr <= end; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     if(!upper)
+       access.directPeekBase = &myRAM[startCurrentBank + (addr & (RAM_BANK_SIZE - 1))];
+@@ -227,7 +227,7 @@ void Cartridge3EPlus::bankROMSlot(uInt16 bank)
+   uInt16 start = 0x1000 + (bankNumber << ROM_BANK_TO_POWER) + (upper ? ROM_BANK_SIZE / 2 : 0);
+   uInt16 end = start + ROM_BANK_SIZE / 2 - 1;
+ 
+-  for(uInt16 addr = start; addr <= end; addr += System::PAGE_SIZE)
++  for(uInt16 addr = start; addr <= end; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myImage[startCurrentBank + (addr & (ROM_BANK_SIZE - 1))];
+     access.codeAccessBase = &myCodeAccessBase[startCurrentBank + (addr & (ROM_BANK_SIZE - 1))];
+@@ -247,7 +247,7 @@ void Cartridge3EPlus::initializeBankState()
+       System::PageAccess access(this, System::PA_READ);
+       uInt16 start = 0x1000 + (b << RAM_BANK_TO_POWER);
+       uInt16 end = start + RAM_BANK_SIZE - 1;
+-      for(uInt16 addr = start; addr <= end; addr += System::PAGE_SIZE)
++      for(uInt16 addr = start; addr <= end; addr += System::SYSTEM_PAGE_SIZE)
+         mySystem->setPageAccess(addr, access);
+     }
+     else if (bankInUse[b] & BITMASK_ROMRAM)
+diff --git a/src/emucore/Cart3F.cxx b/src/emucore/Cart3F.cxx
+index c2adccd1..849b120a 100644
+--- a/src/emucore/Cart3F.cxx
++++ b/src/emucore/Cart3F.cxx
+@@ -50,12 +50,12 @@ void Cartridge3F::install(System& system)
+   System::PageAccess access(this, System::PA_READWRITE);
+ 
+   // The hotspot ($3F) is in TIA address space, so we claim it here
+-  for(uInt16 addr = 0x00; addr < 0x40; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x00; addr < 0x40; addr += System::SYSTEM_PAGE_SIZE)
+     mySystem->setPageAccess(addr, access);
+ 
+   // Setup the second segment to always point to the last ROM slice
+   access.type = System::PA_READ;
+-  for(uInt16 addr = 0x1800; addr < 0x2000; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1800; addr < 0x2000; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myImage[(mySize - 2048) + (addr & 0x07FF)];
+     access.codeAccessBase = &myCodeAccessBase[(mySize - 2048) + (addr & 0x07FF)];
+@@ -115,7 +115,7 @@ bool Cartridge3F::bank(uInt16 bank)
+   System::PageAccess access(this, System::PA_READ);
+ 
+   // Map ROM image into the system
+-  for(uInt16 addr = 0x1000; addr < 0x1800; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1000; addr < 0x1800; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myImage[offset + (addr & 0x07FF)];
+     access.codeAccessBase = &myCodeAccessBase[offset + (addr & 0x07FF)];
+diff --git a/src/emucore/Cart4A50.cxx b/src/emucore/Cart4A50.cxx
+index 6d6ee3f6..27463783 100644
+--- a/src/emucore/Cart4A50.cxx
++++ b/src/emucore/Cart4A50.cxx
+@@ -73,7 +73,7 @@ void Cartridge4A50::install(System& system)
+ 
+   // Map all of the accesses to call peek and poke (We don't yet indicate RAM areas)
+   System::PageAccess access(this, System::PA_READ);
+-  for(uInt16 addr = 0x1000; addr < 0x2000; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1000; addr < 0x2000; addr += System::SYSTEM_PAGE_SIZE)
+     mySystem->setPageAccess(addr, access);
+ 
+   // Mirror all access in TIA and RIOT; by doing so we're taking responsibility
+diff --git a/src/emucore/Cart4K.cxx b/src/emucore/Cart4K.cxx
+index 944300a9..c997fb8d 100644
+--- a/src/emucore/Cart4K.cxx
++++ b/src/emucore/Cart4K.cxx
+@@ -43,7 +43,7 @@ void Cartridge4K::install(System& system)
+   // Note that we don't need our own peek/poke methods, since the mapping
+   // takes care of the entire address space
+   System::PageAccess access(this, System::PA_READ);
+-  for(uInt16 addr = 0x1000; addr < 0x2000; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1000; addr < 0x2000; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myImage[addr & 0x0FFF];
+     access.codeAccessBase = &myCodeAccessBase[addr & 0x0FFF];
+diff --git a/src/emucore/Cart4KSC.cxx b/src/emucore/Cart4KSC.cxx
+index 232439bc..fc9970ff 100644
+--- a/src/emucore/Cart4KSC.cxx
++++ b/src/emucore/Cart4KSC.cxx
+@@ -47,7 +47,7 @@ void Cartridge4KSC::install(System& system)
+   // Map access to this class, since we need to inspect all accesses to
+   // check if RWP happens
+   access.type = System::PA_WRITE;
+-  for(uInt16 addr = 0x1000; addr < 0x1080; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1000; addr < 0x1080; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.codeAccessBase = &myCodeAccessBase[addr & 0x007F];
+     mySystem->setPageAccess(addr, access);
+@@ -55,7 +55,7 @@ void Cartridge4KSC::install(System& system)
+ 
+   // Set the page accessing method for the RAM reading pages
+   access.type = System::PA_READ;
+-  for(uInt16 addr = 0x1080; addr < 0x1100; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1080; addr < 0x1100; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myRAM[addr & 0x007F];
+     access.codeAccessBase = &myCodeAccessBase[0x80 + (addr & 0x007F)];
+@@ -63,7 +63,7 @@ void Cartridge4KSC::install(System& system)
+   }
+ 
+   // Map ROM image into the system
+-  for(uInt16 addr = 0x1100; addr < 0x2000; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1100; addr < 0x2000; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myImage[addr & 0x0FFF];
+     access.codeAccessBase = &myCodeAccessBase[addr & 0x0FFF];
+diff --git a/src/emucore/CartAR.cxx b/src/emucore/CartAR.cxx
+index 7a2f6225..099a1151 100644
+--- a/src/emucore/CartAR.cxx
++++ b/src/emucore/CartAR.cxx
+@@ -80,7 +80,7 @@ void CartridgeAR::install(System& system)
+ 
+   // Map all of the accesses to call peek and poke (we don't yet indicate RAM areas)
+   System::PageAccess access(this, System::PA_READ);
+-  for(uInt16 addr = 0x1000; addr < 0x2000; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1000; addr < 0x2000; addr += System::SYSTEM_PAGE_SIZE)
+     mySystem->setPageAccess(addr, access);
+ 
+   bankConfiguration(0);
+diff --git a/src/emucore/CartBF.cxx b/src/emucore/CartBF.cxx
+index 367b7c43..c60b9ced 100644
+--- a/src/emucore/CartBF.cxx
++++ b/src/emucore/CartBF.cxx
+@@ -87,7 +87,7 @@ bool CartridgeBF::bank(uInt16 bank)
+ 
+   // Set the page accessing methods for the hot spots
+   for(uInt16 addr = (0x1F80 & ~System::PAGE_MASK); addr < 0x2000;
+-      addr += System::PAGE_SIZE)
++      addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+     mySystem->setPageAccess(addr, access);
+@@ -95,7 +95,7 @@ bool CartridgeBF::bank(uInt16 bank)
+ 
+   // Setup the page access methods for the current bank
+   for(uInt16 addr = 0x1000; addr < (0x1F80U & ~System::PAGE_MASK);
+-      addr += System::PAGE_SIZE)
++      addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myImage[myBankOffset + (addr & 0x0FFF)];
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+diff --git a/src/emucore/CartBFSC.cxx b/src/emucore/CartBFSC.cxx
+index d39e7a41..4718847f 100644
+--- a/src/emucore/CartBFSC.cxx
++++ b/src/emucore/CartBFSC.cxx
+@@ -50,7 +50,7 @@ void CartridgeBFSC::install(System& system)
+   // Map access to this class, since we need to inspect all accesses to
+   // check if RWP happens
+   access.type = System::PA_WRITE;
+-  for(uInt16 addr = 0x1000; addr < 0x1080; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1000; addr < 0x1080; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.codeAccessBase = &myCodeAccessBase[addr & 0x007F];
+     mySystem->setPageAccess(addr, access);
+@@ -58,7 +58,7 @@ void CartridgeBFSC::install(System& system)
+ 
+   // Set the page accessing method for the RAM reading pages
+   access.type = System::PA_READ;
+-  for(uInt16 addr = 0x1080; addr < 0x1100; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1080; addr < 0x1100; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myRAM[addr & 0x007F];
+     access.codeAccessBase = &myCodeAccessBase[0x80 + (addr & 0x007F)];
+@@ -114,7 +114,7 @@ bool CartridgeBFSC::bank(uInt16 bank)
+ 
+   // Set the page accessing methods for the hot spots
+   for(uInt16 addr = (0x1F80 & ~System::PAGE_MASK); addr < 0x2000;
+-      addr += System::PAGE_SIZE)
++      addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+     mySystem->setPageAccess(addr, access);
+@@ -122,7 +122,7 @@ bool CartridgeBFSC::bank(uInt16 bank)
+ 
+   // Setup the page access methods for the current bank
+   for(uInt16 addr = 0x1100; addr < (0x1F80U & ~System::PAGE_MASK);
+-      addr += System::PAGE_SIZE)
++      addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myImage[myBankOffset + (addr & 0x0FFF)];
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+diff --git a/src/emucore/CartBUS.cxx b/src/emucore/CartBUS.cxx
+index 90f06086..dff47c5d 100644
+--- a/src/emucore/CartBUS.cxx
++++ b/src/emucore/CartBUS.cxx
+@@ -124,7 +124,7 @@ void CartridgeBUS::install(System& system)
+ 
+   // Map all of the accesses to call peek and poke
+   System::PageAccess access(this, System::PA_READ);
+-  for(uInt16 addr = 0x1000; addr < 0x1040; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1000; addr < 0x1040; addr += System::SYSTEM_PAGE_SIZE)
+     mySystem->setPageAccess(addr, access);
+ 
+   // Mirror all access in TIA and RIOT; by doing so we're taking responsibility
+@@ -440,7 +440,7 @@ bool CartridgeBUS::bank(uInt16 bank)
+   System::PageAccess access(this, System::PA_READ);
+ 
+   // Map Program ROM image into the system
+-  for(uInt16 addr = 0x1040; addr < 0x2000; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1040; addr < 0x2000; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+     mySystem->setPageAccess(addr, access);
+diff --git a/src/emucore/CartCDF.cxx b/src/emucore/CartCDF.cxx
+index 173a9062..52d730a7 100644
+--- a/src/emucore/CartCDF.cxx
++++ b/src/emucore/CartCDF.cxx
+@@ -124,7 +124,7 @@ void CartridgeCDF::install(System& system)
+ 
+   // Map all of the accesses to call peek and poke
+   System::PageAccess access(this, System::PA_READ);
+-  for(uInt16 addr = 0x1000; addr < 0x1040; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1000; addr < 0x1040; addr += System::SYSTEM_PAGE_SIZE)
+     mySystem->setPageAccess(addr, access);
+ 
+   // Install pages for the startup bank
+@@ -397,7 +397,7 @@ bool CartridgeCDF::bank(uInt16 bank)
+   System::PageAccess access(this, System::PA_READ);
+ 
+   // Map Program ROM image into the system
+-  for(uInt16 addr = 0x1040; addr < 0x2000; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1040; addr < 0x2000; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+     mySystem->setPageAccess(addr, access);
+diff --git a/src/emucore/CartCM.cxx b/src/emucore/CartCM.cxx
+index 1ba62460..f57d9def 100644
+--- a/src/emucore/CartCM.cxx
++++ b/src/emucore/CartCM.cxx
+@@ -118,7 +118,7 @@ bool CartridgeCM::bank(uInt16 bank)
+   System::PageAccess access(this, System::PA_READ);
+ 
+   // Lower 2K (always ROM)
+-  for(uInt16 addr = 0x1000; addr < 0x1800; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1000; addr < 0x1800; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myImage[myBankOffset + (addr & 0x0FFF)];
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+@@ -126,7 +126,7 @@ bool CartridgeCM::bank(uInt16 bank)
+   }
+ 
+   // Upper 2K (RAM or ROM)
+-  for(uInt16 addr = 0x1800; addr < 0x2000; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1800; addr < 0x2000; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.type = System::PA_READWRITE;
+ 
+diff --git a/src/emucore/CartCTY.cxx b/src/emucore/CartCTY.cxx
+index 2b1cf199..47b19f41 100644
+--- a/src/emucore/CartCTY.cxx
++++ b/src/emucore/CartCTY.cxx
+@@ -74,7 +74,7 @@ void CartridgeCTY::install(System& system)
+ 
+   // Map all RAM accesses to call peek and poke
+   System::PageAccess access(this, System::PA_READ);
+-  for(uInt16 addr = 0x1000; addr < 0x1080; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1000; addr < 0x1080; addr += System::SYSTEM_PAGE_SIZE)
+     mySystem->setPageAccess(addr, access);
+ 
+   // Install pages for the startup bank
+@@ -242,7 +242,7 @@ bool CartridgeCTY::bank(uInt16 bank)
+ 
+   // Setup the page access methods for the current bank
+   System::PageAccess access(this, System::PA_READ);
+-  for(uInt16 addr = 0x1080; addr < 0x2000; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1080; addr < 0x2000; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+     mySystem->setPageAccess(addr, access);
+diff --git a/src/emucore/CartCV.cxx b/src/emucore/CartCV.cxx
+index f051a137..8f835194 100644
+--- a/src/emucore/CartCV.cxx
++++ b/src/emucore/CartCV.cxx
+@@ -66,7 +66,7 @@ void CartridgeCV::install(System& system)
+   System::PageAccess access(this, System::PA_READ);
+ 
+   // Map ROM image into the system
+-  for(uInt16 addr = 0x1800; addr < 0x2000; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1800; addr < 0x2000; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myImage[addr & 0x07FF];
+     access.codeAccessBase = &myCodeAccessBase[addr & 0x07FF];
+@@ -79,13 +79,13 @@ void CartridgeCV::install(System& system)
+   access.directPeekBase = nullptr;
+   access.codeAccessBase = nullptr;
+   access.type = System::PA_WRITE;
+-  for(uInt16 addr = 0x1400; addr < 0x1800; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1400; addr < 0x1800; addr += System::SYSTEM_PAGE_SIZE)
+     mySystem->setPageAccess(addr, access);
+ 
+   // Set the page accessing method for the RAM reading pages
+   access.directPokeBase = nullptr;
+   access.type = System::PA_READ;
+-  for(uInt16 addr = 0x1000; addr < 0x1400; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1000; addr < 0x1400; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myRAM[addr & 0x03FF];
+     access.codeAccessBase = &myCodeAccessBase[2048 + (addr & 0x03FF)];
+diff --git a/src/emucore/CartCVPlus.cxx b/src/emucore/CartCVPlus.cxx
+index 5236563a..5d520f73 100644
+--- a/src/emucore/CartCVPlus.cxx
++++ b/src/emucore/CartCVPlus.cxx
+@@ -52,7 +52,7 @@ void CartridgeCVPlus::install(System& system)
+   System::PageAccess access(this, System::PA_READWRITE);
+ 
+   // The hotspot ($3D) is in TIA address space, so we claim it here
+-  for(uInt16 addr = 0x00; addr < 0x40; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x00; addr < 0x40; addr += System::SYSTEM_PAGE_SIZE)
+     mySystem->setPageAccess(addr, access);
+ 
+   // Set the page accessing method for the RAM writing pages
+@@ -61,7 +61,7 @@ void CartridgeCVPlus::install(System& system)
+   access.directPeekBase = access.directPokeBase = nullptr;
+   access.codeAccessBase = nullptr;
+   access.type = System::PA_WRITE;
+-  for(uInt16 addr = 0x1400; addr < 0x1800; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1400; addr < 0x1800; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.codeAccessBase = &myCodeAccessBase[mySize + (addr & 0x03FF)];
+     mySystem->setPageAccess(addr, access);
+@@ -69,7 +69,7 @@ void CartridgeCVPlus::install(System& system)
+ 
+   // Set the page accessing method for the RAM reading pages
+   access.type = System::PA_READ;
+-  for(uInt16 addr = 0x1000; addr < 0x1400; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1000; addr < 0x1400; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myRAM[addr & 0x03FF];
+     access.codeAccessBase = &myCodeAccessBase[mySize + (addr & 0x03FF)];
+@@ -133,7 +133,7 @@ bool CartridgeCVPlus::bank(uInt16 bank)
+   System::PageAccess access(this, System::PA_READ);
+ 
+   // Map ROM image into the system
+-  for(uInt16 addr = 0x1800; addr < 0x2000; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1800; addr < 0x2000; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myImage[offset + (addr & 0x07FF)];
+     access.codeAccessBase = &myCodeAccessBase[offset + (addr & 0x07FF)];
+diff --git a/src/emucore/CartDASH.cxx b/src/emucore/CartDASH.cxx
+index f2bc5f5f..4c66ab57 100644
+--- a/src/emucore/CartDASH.cxx
++++ b/src/emucore/CartDASH.cxx
+@@ -64,7 +64,7 @@ void CartridgeDASH::install(System& system)
+   System::PageAccess access(this, System::PA_READWRITE);
+ 
+   // The hotspots are in TIA address space, so we claim it here
+-  for (uInt16 addr = 0x00; addr < 0x40; addr += System::PAGE_SIZE)
++  for (uInt16 addr = 0x00; addr < 0x40; addr += System::SYSTEM_PAGE_SIZE)
+     mySystem->setPageAccess(addr, access);
+ 
+   // Initialise bank values for all ROM/RAM access
+@@ -187,7 +187,7 @@ void CartridgeDASH::bankRAMSlot(uInt16 bank)
+   uInt16 start = 0x1000 + (bankNumber << RAM_BANK_TO_POWER) + (upper ? RAM_WRITE_OFFSET : 0);
+   uInt16 end = start + RAM_BANK_SIZE - 1;
+ 
+-  for (uInt16 addr = start; addr <= end; addr += System::PAGE_SIZE)
++  for (uInt16 addr = start; addr <= end; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     if(!upper)
+       access.directPeekBase = &myRAM[startCurrentBank + (addr & (RAM_BANK_SIZE - 1))];
+@@ -232,7 +232,7 @@ void CartridgeDASH::bankROMSlot(uInt16 bank)
+   uInt16 start = 0x1000 + (bankNumber << ROM_BANK_TO_POWER) + (upper ? ROM_BANK_SIZE / 2 : 0);
+   uInt16 end = start + ROM_BANK_SIZE / 2 - 1;
+ 
+-  for (uInt16 addr = start; addr <= end; addr += System::PAGE_SIZE)
++  for (uInt16 addr = start; addr <= end; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myImage[startCurrentBank + (addr & (ROM_BANK_SIZE - 1))];
+     access.codeAccessBase = &myCodeAccessBase[startCurrentBank + (addr & (ROM_BANK_SIZE - 1))];
+@@ -252,7 +252,7 @@ void CartridgeDASH::initializeBankState()
+       System::PageAccess access(this, System::PA_READ);
+       uInt16 start = 0x1000 + (b << RAM_BANK_TO_POWER);
+       uInt16 end = start + RAM_BANK_SIZE - 1;
+-      for (uInt16 addr = start; addr <= end; addr += System::PAGE_SIZE)
++      for (uInt16 addr = start; addr <= end; addr += System::SYSTEM_PAGE_SIZE)
+         mySystem->setPageAccess(addr, access);
+     }
+     else if (bankInUse[b] & BITMASK_ROMRAM)
+diff --git a/src/emucore/CartDF.cxx b/src/emucore/CartDF.cxx
+index d99a6c73..51f27e2a 100644
+--- a/src/emucore/CartDF.cxx
++++ b/src/emucore/CartDF.cxx
+@@ -83,7 +83,7 @@ bool CartridgeDF::bank(uInt16 bank)
+ 
+   // Set the page accessing methods for the hot spots
+   for(uInt16 addr = (0x1FC0 & ~System::PAGE_MASK); addr < 0x2000;
+-      addr += System::PAGE_SIZE)
++      addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+     mySystem->setPageAccess(addr, access);
+@@ -91,7 +91,7 @@ bool CartridgeDF::bank(uInt16 bank)
+ 
+   // Setup the page access methods for the current bank
+   for(uInt16 addr = 0x1000; addr < (0x1FC0U & ~System::PAGE_MASK);
+-      addr += System::PAGE_SIZE)
++      addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myImage[myBankOffset + (addr & 0x0FFF)];
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+diff --git a/src/emucore/CartDFSC.cxx b/src/emucore/CartDFSC.cxx
+index 01c58dc9..535fed05 100644
+--- a/src/emucore/CartDFSC.cxx
++++ b/src/emucore/CartDFSC.cxx
+@@ -50,7 +50,7 @@ void CartridgeDFSC::install(System& system)
+   // Map access to this class, since we need to inspect all accesses to
+   // check if RWP happens
+   access.type = System::PA_WRITE;
+-  for(uInt16 addr = 0x1000; addr < 0x1080; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1000; addr < 0x1080; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.codeAccessBase = &myCodeAccessBase[addr & 0x007F];
+     mySystem->setPageAccess(addr, access);
+@@ -58,7 +58,7 @@ void CartridgeDFSC::install(System& system)
+ 
+   // Set the page accessing method for the RAM reading pages
+   access.type = System::PA_READ;
+-  for(uInt16 addr = 0x1080; addr < 0x1100; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1080; addr < 0x1100; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myRAM[addr & 0x007F];
+     access.codeAccessBase = &myCodeAccessBase[0x80 + (addr & 0x007F)];
+@@ -114,7 +114,7 @@ bool CartridgeDFSC::bank(uInt16 bank)
+ 
+   // Set the page accessing methods for the hot spots
+   for(uInt16 addr = (0x1FC0 & ~System::PAGE_MASK); addr < 0x2000;
+-      addr += System::PAGE_SIZE)
++      addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+     mySystem->setPageAccess(addr, access);
+@@ -122,7 +122,7 @@ bool CartridgeDFSC::bank(uInt16 bank)
+ 
+   // Setup the page access methods for the current bank
+   for(uInt16 addr = 0x1100; addr < (0x1FC0U & ~System::PAGE_MASK);
+-      addr += System::PAGE_SIZE)
++      addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myImage[myBankOffset + (addr & 0x0FFF)];
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+diff --git a/src/emucore/CartDPC.cxx b/src/emucore/CartDPC.cxx
+index 5a276dd0..acdc375f 100644
+--- a/src/emucore/CartDPC.cxx
++++ b/src/emucore/CartDPC.cxx
+@@ -69,7 +69,7 @@ void CartridgeDPC::install(System& system)
+ 
+   // Set the page accessing method for the DPC reading & writing pages
+   System::PageAccess access(this, System::PA_READWRITE);
+-  for(uInt16 addr = 0x1000; addr < 0x1080; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1000; addr < 0x1080; addr += System::SYSTEM_PAGE_SIZE)
+     mySystem->setPageAccess(addr, access);
+ 
+   // Install pages for the startup bank
+@@ -384,7 +384,7 @@ bool CartridgeDPC::bank(uInt16 bank)
+ 
+   // Set the page accessing methods for the hot spots
+   for(uInt16 addr = (0x1FF8 & ~System::PAGE_MASK); addr < 0x2000;
+-      addr += System::PAGE_SIZE)
++      addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+     mySystem->setPageAccess(addr, access);
+@@ -392,7 +392,7 @@ bool CartridgeDPC::bank(uInt16 bank)
+ 
+   // Setup the page access methods for the current bank
+   for(uInt16 addr = 0x1080; addr < (0x1FF8U & ~System::PAGE_MASK);
+-      addr += System::PAGE_SIZE)
++      addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myProgramImage[myBankOffset + (addr & 0x0FFF)];
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+diff --git a/src/emucore/CartDPCPlus.cxx b/src/emucore/CartDPCPlus.cxx
+index 8e425ca6..ad867433 100644
+--- a/src/emucore/CartDPCPlus.cxx
++++ b/src/emucore/CartDPCPlus.cxx
+@@ -118,7 +118,7 @@ void CartridgeDPCPlus::install(System& system)
+ 
+   // Map all of the accesses to call peek and poke
+   System::PageAccess access(this, System::PA_READ);
+-  for(uInt16 addr = 0x1000; addr < 0x1080; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1000; addr < 0x1080; addr += System::SYSTEM_PAGE_SIZE)
+     mySystem->setPageAccess(addr, access);
+ 
+   // Install pages for the startup bank
+@@ -584,7 +584,7 @@ bool CartridgeDPCPlus::bank(uInt16 bank)
+   System::PageAccess access(this, System::PA_READ);
+ 
+   // Map Program ROM image into the system
+-  for(uInt16 addr = 0x1080; addr < 0x2000; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1080; addr < 0x2000; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+     mySystem->setPageAccess(addr, access);
+diff --git a/src/emucore/CartE0.cxx b/src/emucore/CartE0.cxx
+index 4c703efd..a9100764 100644
+--- a/src/emucore/CartE0.cxx
++++ b/src/emucore/CartE0.cxx
+@@ -58,7 +58,7 @@ void CartridgeE0::install(System& system)
+ 
+   // Set the page acessing methods for the first part of the last segment
+   for(uInt16 addr = 0x1C00; addr < (0x1FE0U & ~System::PAGE_MASK);
+-      addr += System::PAGE_SIZE)
++      addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myImage[7168 + (addr & 0x03FF)];
+     access.codeAccessBase = &myCodeAccessBase[7168 + (addr & 0x03FF)];
+@@ -70,7 +70,7 @@ void CartridgeE0::install(System& system)
+   access.codeAccessBase = &myCodeAccessBase[8128];
+   access.type = System::PA_READ;
+   for(uInt16 addr = (0x1FE0 & ~System::PAGE_MASK); addr < 0x2000;
+-      addr += System::PAGE_SIZE)
++      addr += System::SYSTEM_PAGE_SIZE)
+     mySystem->setPageAccess(addr, access);
+ }
+ 
+@@ -129,7 +129,7 @@ void CartridgeE0::segmentZero(uInt16 slice)
+   // Setup the page access methods for the current bank
+   System::PageAccess access(this, System::PA_READ);
+ 
+-  for(uInt16 addr = 0x1000; addr < 0x1400; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1000; addr < 0x1400; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myImage[offset + (addr & 0x03FF)];
+     access.codeAccessBase = &myCodeAccessBase[offset + (addr & 0x03FF)];
+@@ -150,7 +150,7 @@ void CartridgeE0::segmentOne(uInt16 slice)
+   // Setup the page access methods for the current bank
+   System::PageAccess access(this, System::PA_READ);
+ 
+-  for(uInt16 addr = 0x1400; addr < 0x1800; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1400; addr < 0x1800; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myImage[offset + (addr & 0x03FF)];
+     access.codeAccessBase = &myCodeAccessBase[offset + (addr & 0x03FF)];
+@@ -171,7 +171,7 @@ void CartridgeE0::segmentTwo(uInt16 slice)
+   // Setup the page access methods for the current bank
+   System::PageAccess access(this, System::PA_READ);
+ 
+-  for(uInt16 addr = 0x1800; addr < 0x1C00; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1800; addr < 0x1C00; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myImage[offset + (addr & 0x03FF)];
+     access.codeAccessBase = &myCodeAccessBase[offset + (addr & 0x03FF)];
+diff --git a/src/emucore/CartEF.cxx b/src/emucore/CartEF.cxx
+index 96ff22cf..befae301 100644
+--- a/src/emucore/CartEF.cxx
++++ b/src/emucore/CartEF.cxx
+@@ -83,7 +83,7 @@ bool CartridgeEF::bank(uInt16 bank)
+ 
+   // Set the page accessing methods for the hot spots
+   for(uInt16 addr = (0x1FE0 & ~System::PAGE_MASK); addr < 0x2000;
+-      addr += System::PAGE_SIZE)
++      addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+     mySystem->setPageAccess(addr, access);
+@@ -91,7 +91,7 @@ bool CartridgeEF::bank(uInt16 bank)
+ 
+   // Setup the page access methods for the current bank
+   for(uInt16 addr = 0x1000; addr < (0x1FE0U & ~System::PAGE_MASK);
+-      addr += System::PAGE_SIZE)
++      addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myImage[myBankOffset + (addr & 0x0FFF)];
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+diff --git a/src/emucore/CartEFSC.cxx b/src/emucore/CartEFSC.cxx
+index 144aa9e5..7b7d6aee 100644
+--- a/src/emucore/CartEFSC.cxx
++++ b/src/emucore/CartEFSC.cxx
+@@ -50,7 +50,7 @@ void CartridgeEFSC::install(System& system)
+   // Map access to this class, since we need to inspect all accesses to
+   // check if RWP happens
+   access.type = System::PA_WRITE;
+-  for(uInt16 addr = 0x1000; addr < 0x1080; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1000; addr < 0x1080; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.codeAccessBase = &myCodeAccessBase[addr & 0x007F];
+     mySystem->setPageAccess(addr, access);
+@@ -58,7 +58,7 @@ void CartridgeEFSC::install(System& system)
+ 
+   // Set the page accessing method for the RAM reading pages
+   access.type = System::PA_READ;
+-  for(uInt16 addr = 0x1080; addr < 0x1100; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1080; addr < 0x1100; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myRAM[addr & 0x007F];
+     access.codeAccessBase = &myCodeAccessBase[0x80 + (addr & 0x007F)];
+@@ -114,7 +114,7 @@ bool CartridgeEFSC::bank(uInt16 bank)
+ 
+   // Set the page accessing methods for the hot spots
+   for(uInt16 addr = (0x1FE0 & ~System::PAGE_MASK); addr < 0x2000;
+-      addr += System::PAGE_SIZE)
++      addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+     mySystem->setPageAccess(addr, access);
+@@ -122,7 +122,7 @@ bool CartridgeEFSC::bank(uInt16 bank)
+ 
+   // Setup the page access methods for the current bank
+   for(uInt16 addr = 0x1100; addr < (0x1FE0U & ~System::PAGE_MASK);
+-      addr += System::PAGE_SIZE)
++      addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myImage[myBankOffset + (addr & 0x0FFF)];
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+diff --git a/src/emucore/CartF0.cxx b/src/emucore/CartF0.cxx
+index 7693b352..222c2bce 100644
+--- a/src/emucore/CartF0.cxx
++++ b/src/emucore/CartF0.cxx
+@@ -90,7 +90,7 @@ bool CartridgeF0::bank(uInt16 bank)
+ 
+   // Set the page accessing methods for the hot spots
+   for(uInt16 addr = (0x1FF0 & ~System::PAGE_MASK); addr < 0x2000;
+-      addr += System::PAGE_SIZE)
++      addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+     mySystem->setPageAccess(addr, access);
+@@ -98,7 +98,7 @@ bool CartridgeF0::bank(uInt16 bank)
+ 
+   // Setup the page access methods for the current bank
+   for(uInt16 addr = 0x1000; addr < (0x1FF0U & ~System::PAGE_MASK);
+-      addr += System::PAGE_SIZE)
++      addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myImage[myBankOffset + (addr & 0x0FFF)];
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+diff --git a/src/emucore/CartF4.cxx b/src/emucore/CartF4.cxx
+index 44ce27db..db537965 100644
+--- a/src/emucore/CartF4.cxx
++++ b/src/emucore/CartF4.cxx
+@@ -87,7 +87,7 @@ bool CartridgeF4::bank(uInt16 bank)
+ 
+   // Set the page accessing methods for the hot spots
+   for(uInt16 addr = (0x1FF4 & ~System::PAGE_MASK); addr < 0x2000;
+-      addr += System::PAGE_SIZE)
++      addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+     mySystem->setPageAccess(addr, access);
+@@ -95,7 +95,7 @@ bool CartridgeF4::bank(uInt16 bank)
+ 
+   // Setup the page access methods for the current bank
+   for(uInt16 addr = 0x1000; addr < (0x1FF4U & ~System::PAGE_MASK);
+-      addr += System::PAGE_SIZE)
++      addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myImage[myBankOffset + (addr & 0x0FFF)];
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+diff --git a/src/emucore/CartF4SC.cxx b/src/emucore/CartF4SC.cxx
+index 959f4653..fca1e098 100644
+--- a/src/emucore/CartF4SC.cxx
++++ b/src/emucore/CartF4SC.cxx
+@@ -50,7 +50,7 @@ void CartridgeF4SC::install(System& system)
+   // Map access to this class, since we need to inspect all accesses to
+   // check if RWP happens
+   access.type = System::PA_WRITE;
+-  for(uInt16 addr = 0x1000; addr < 0x1080; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1000; addr < 0x1080; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.codeAccessBase = &myCodeAccessBase[addr & 0x007F];
+     mySystem->setPageAccess(addr, access);
+@@ -58,7 +58,7 @@ void CartridgeF4SC::install(System& system)
+ 
+   // Set the page accessing method for the RAM reading pages
+   access.type = System::PA_READ;
+-  for(uInt16 addr = 0x1080; addr < 0x1100; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1080; addr < 0x1100; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myRAM[addr & 0x007F];
+     access.codeAccessBase = &myCodeAccessBase[0x80 + (addr & 0x007F)];
+@@ -114,7 +114,7 @@ bool CartridgeF4SC::bank(uInt16 bank)
+ 
+   // Set the page accessing methods for the hot spots
+   for(uInt16 addr = (0x1FF4 & ~System::PAGE_MASK); addr < 0x2000;
+-      addr += System::PAGE_SIZE)
++      addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+     mySystem->setPageAccess(addr, access);
+@@ -122,7 +122,7 @@ bool CartridgeF4SC::bank(uInt16 bank)
+ 
+   // Setup the page access methods for the current bank
+   for(uInt16 addr = 0x1100; addr < (0x1FF4U & ~System::PAGE_MASK);
+-      addr += System::PAGE_SIZE)
++      addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myImage[myBankOffset + (addr & 0x0FFF)];
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+diff --git a/src/emucore/CartF6.cxx b/src/emucore/CartF6.cxx
+index 496c4e48..b389fa43 100644
+--- a/src/emucore/CartF6.cxx
++++ b/src/emucore/CartF6.cxx
+@@ -127,7 +127,7 @@ bool CartridgeF6::bank(uInt16 bank)
+ 
+   // Set the page accessing methods for the hot spots
+   for(uInt16 addr = (0x1FF6 & ~System::PAGE_MASK); addr < 0x2000;
+-      addr += System::PAGE_SIZE)
++      addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+     mySystem->setPageAccess(addr, access);
+@@ -135,7 +135,7 @@ bool CartridgeF6::bank(uInt16 bank)
+ 
+   // Setup the page access methods for the current bank
+   for(uInt16 addr = 0x1000; addr < (0x1FF6U & ~System::PAGE_MASK);
+-      addr += System::PAGE_SIZE)
++      addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myImage[myBankOffset + (addr & 0x0FFF)];
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+diff --git a/src/emucore/CartF6SC.cxx b/src/emucore/CartF6SC.cxx
+index 59afa47d..9b5bff51 100644
+--- a/src/emucore/CartF6SC.cxx
++++ b/src/emucore/CartF6SC.cxx
+@@ -50,7 +50,7 @@ void CartridgeF6SC::install(System& system)
+   // Map access to this class, since we need to inspect all accesses to
+   // check if RWP happens
+   access.type = System::PA_WRITE;
+-  for(uInt16 addr = 0x1000; addr < 0x1080; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1000; addr < 0x1080; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.codeAccessBase = &myCodeAccessBase[addr & 0x007F];
+     mySystem->setPageAccess(addr, access);
+@@ -58,7 +58,7 @@ void CartridgeF6SC::install(System& system)
+ 
+   // Set the page accessing method for the RAM reading pages
+   access.type = System::PA_READ;
+-  for(uInt16 addr = 0x1080; addr < 0x1100; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1080; addr < 0x1100; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myRAM[addr & 0x007F];
+     access.codeAccessBase = &myCodeAccessBase[0x80 + (addr & 0x007F)];
+@@ -154,7 +154,7 @@ bool CartridgeF6SC::bank(uInt16 bank)
+ 
+   // Set the page accessing methods for the hot spots
+   for(uInt16 addr = (0x1FF6 & ~System::PAGE_MASK); addr < 0x2000;
+-      addr += System::PAGE_SIZE)
++      addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+     mySystem->setPageAccess(addr, access);
+@@ -162,7 +162,7 @@ bool CartridgeF6SC::bank(uInt16 bank)
+ 
+   // Setup the page access methods for the current bank
+   for(uInt16 addr = 0x1100; addr < (0x1FF6U & ~System::PAGE_MASK);
+-      addr += System::PAGE_SIZE)
++      addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myImage[myBankOffset + (addr & 0x0FFF)];
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+diff --git a/src/emucore/CartF8.cxx b/src/emucore/CartF8.cxx
+index c0ca34a8..0123a85c 100644
+--- a/src/emucore/CartF8.cxx
++++ b/src/emucore/CartF8.cxx
+@@ -108,7 +108,7 @@ bool CartridgeF8::bank(uInt16 bank)
+ 
+   // Set the page accessing methods for the hot spots
+   for(uInt16 addr = (0x1FF8 & ~System::PAGE_MASK); addr < 0x2000;
+-      addr += System::PAGE_SIZE)
++      addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+     mySystem->setPageAccess(addr, access);
+@@ -116,7 +116,7 @@ bool CartridgeF8::bank(uInt16 bank)
+ 
+   // Setup the page access methods for the current bank
+   for(uInt16 addr = 0x1000; addr < (0x1FF8U & ~System::PAGE_MASK);
+-      addr += System::PAGE_SIZE)
++      addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myImage[myBankOffset + (addr & 0x0FFF)];
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+diff --git a/src/emucore/CartF8SC.cxx b/src/emucore/CartF8SC.cxx
+index a4e374fd..a7517b9a 100644
+--- a/src/emucore/CartF8SC.cxx
++++ b/src/emucore/CartF8SC.cxx
+@@ -50,7 +50,7 @@ void CartridgeF8SC::install(System& system)
+   // Map access to this class, since we need to inspect all accesses to
+   // check if RWP happens
+   access.type = System::PA_WRITE;
+-  for(uInt16 addr = 0x1000; addr < 0x1080; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1000; addr < 0x1080; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.codeAccessBase = &myCodeAccessBase[addr & 0x007F];
+     mySystem->setPageAccess(addr, access);
+@@ -58,7 +58,7 @@ void CartridgeF8SC::install(System& system)
+ 
+   // Set the page accessing method for the RAM reading pages
+   access.type = System::PA_READ;
+-  for(uInt16 addr = 0x1080; addr < 0x1100; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1080; addr < 0x1100; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myRAM[addr & 0x007F];
+     access.codeAccessBase = &myCodeAccessBase[0x80 + (addr & 0x007F)];
+@@ -134,7 +134,7 @@ bool CartridgeF8SC::bank(uInt16 bank)
+ 
+   // Set the page accessing methods for the hot spots
+   for(uInt16 addr = (0x1FF8 & ~System::PAGE_MASK); addr < 0x2000;
+-      addr += System::PAGE_SIZE)
++      addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+     mySystem->setPageAccess(addr, access);
+@@ -142,7 +142,7 @@ bool CartridgeF8SC::bank(uInt16 bank)
+ 
+   // Setup the page access methods for the current bank
+   for(uInt16 addr = 0x1100; addr < (0x1FF8U & ~System::PAGE_MASK);
+-      addr += System::PAGE_SIZE)
++      addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myImage[myBankOffset + (addr & 0x0FFF)];
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+diff --git a/src/emucore/CartFA.cxx b/src/emucore/CartFA.cxx
+index 4fc6acf8..076fb8dc 100644
+--- a/src/emucore/CartFA.cxx
++++ b/src/emucore/CartFA.cxx
+@@ -50,7 +50,7 @@ void CartridgeFA::install(System& system)
+   // Map access to this class, since we need to inspect all accesses to
+   // check if RWP happens
+   access.type = System::PA_WRITE;
+-  for(uInt16 addr = 0x1000; addr < 0x1100; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1000; addr < 0x1100; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.codeAccessBase = &myCodeAccessBase[addr & 0x00FF];
+     mySystem->setPageAccess(addr, access);
+@@ -58,7 +58,7 @@ void CartridgeFA::install(System& system)
+ 
+   // Set the page accessing method for the RAM reading pages
+   access.type = System::PA_READ;
+-  for(uInt16 addr = 0x1100; addr < 0x1200; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1100; addr < 0x1200; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myRAM[addr & 0x00FF];
+     access.codeAccessBase = &myCodeAccessBase[0x100 + (addr & 0x00FF)];
+@@ -144,7 +144,7 @@ bool CartridgeFA::bank(uInt16 bank)
+ 
+   // Set the page accessing methods for the hot spots
+   for(uInt16 addr = (0x1FF8 & ~System::PAGE_MASK); addr < 0x2000;
+-      addr += System::PAGE_SIZE)
++      addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+     mySystem->setPageAccess(addr, access);
+@@ -152,7 +152,7 @@ bool CartridgeFA::bank(uInt16 bank)
+ 
+   // Setup the page access methods for the current bank
+   for(uInt16 addr = 0x1200; addr < (0x1FF8U & ~System::PAGE_MASK);
+-      addr += System::PAGE_SIZE)
++      addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myImage[myBankOffset + (addr & 0x0FFF)];
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+diff --git a/src/emucore/CartFA2.cxx b/src/emucore/CartFA2.cxx
+index e46f9f78..932fd45e 100644
+--- a/src/emucore/CartFA2.cxx
++++ b/src/emucore/CartFA2.cxx
+@@ -62,7 +62,7 @@ void CartridgeFA2::install(System& system)
+   // Map access to this class, since we need to inspect all accesses to
+   // check if RWP happens
+   access.type = System::PA_WRITE;
+-  for(uInt16 addr = 0x1000; addr < 0x1100; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1000; addr < 0x1100; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.codeAccessBase = &myCodeAccessBase[addr & 0x00FF];
+     mySystem->setPageAccess(addr, access);
+@@ -71,7 +71,7 @@ void CartridgeFA2::install(System& system)
+   // Set the page accessing method for the RAM reading pages
+   access.directPokeBase = nullptr;
+   access.type = System::PA_READ;
+-  for(uInt16 addr = 0x1100; addr < 0x1200; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1100; addr < 0x1200; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myRAM[addr & 0x00FF];
+     access.codeAccessBase = &myCodeAccessBase[0x100 + (addr & 0x00FF)];
+@@ -211,7 +211,7 @@ bool CartridgeFA2::bank(uInt16 bank)
+ 
+   // Set the page accessing methods for the hot spots
+   for(uInt16 addr = (0x1FF4 & ~System::PAGE_MASK); addr < 0x2000;
+-      addr += System::PAGE_SIZE)
++      addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+     mySystem->setPageAccess(addr, access);
+@@ -219,7 +219,7 @@ bool CartridgeFA2::bank(uInt16 bank)
+ 
+   // Setup the page access methods for the current bank
+   for(uInt16 addr = 0x1200; addr < (0x1FF4U & ~System::PAGE_MASK);
+-      addr += System::PAGE_SIZE)
++      addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myImage[myBankOffset + (addr & 0x0FFF)];
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+diff --git a/src/emucore/CartFE.cxx b/src/emucore/CartFE.cxx
+index 6f5e0c2c..f5f773ff 100644
+--- a/src/emucore/CartFE.cxx
++++ b/src/emucore/CartFE.cxx
+@@ -49,12 +49,12 @@ void CartridgeFE::install(System& system)
+   // The hotspot $01FE is in a mirror of zero-page RAM
+   // We need to claim access to it here, and deal with it in peek/poke below
+   System::PageAccess access(this, System::PA_READWRITE);
+-  for(uInt16 addr = 0x180; addr < 0x200; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x180; addr < 0x200; addr += System::SYSTEM_PAGE_SIZE)
+     mySystem->setPageAccess(addr, access);
+ 
+   // Map all of the cart accesses to call peek and poke
+   access.type = System::PA_READ;
+-  for(uInt16 addr = 0x1000; addr < 0x2000; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1000; addr < 0x2000; addr += System::SYSTEM_PAGE_SIZE)
+     mySystem->setPageAccess(addr, access);
+ }
+ 
+diff --git a/src/emucore/CartMDM.cxx b/src/emucore/CartMDM.cxx
+index 54f98fbf..e30baf2e 100644
+--- a/src/emucore/CartMDM.cxx
++++ b/src/emucore/CartMDM.cxx
+@@ -61,7 +61,7 @@ void CartridgeMDM::install(System& system)
+ 
+   // Set the page accessing methods for the hot spots
+   System::PageAccess access(this, System::PA_READWRITE);
+-  for(uInt16 addr = 0x0800; addr < 0x0BFF; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x0800; addr < 0x0BFF; addr += System::SYSTEM_PAGE_SIZE)
+     mySystem->setPageAccess(addr, access);
+ 
+   // Install pages for bank 0
+@@ -110,7 +110,7 @@ bool CartridgeMDM::bank(uInt16 bank)
+   System::PageAccess access(this, System::PA_READ);
+ 
+   // Map ROM image into the system
+-  for(uInt16 addr = 0x1000; addr < 0x2000; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1000; addr < 0x2000; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myImage[myBankOffset + (addr & 0x0FFF)];
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+diff --git a/src/emucore/CartMNetwork.cxx b/src/emucore/CartMNetwork.cxx
+index e012174f..991a0343 100644
+--- a/src/emucore/CartMNetwork.cxx
++++ b/src/emucore/CartMNetwork.cxx
+@@ -66,7 +66,7 @@ void CartridgeMNetwork::setAccess(uInt16 addrFrom, uInt16 size,
+     addrMask = size - 1;
+   System::PageAccess access(this, type);
+ 
+-  for(uInt16 addr = addrFrom; addr < addrFrom + size; addr += System::PAGE_SIZE)
++  for(uInt16 addr = addrFrom; addr < addrFrom + size; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     if(type == System::PA_READ)
+       access.directPeekBase = &directData[directOffset + (addr & addrMask)];
+@@ -86,12 +86,12 @@ void CartridgeMNetwork::install(System& system)
+ 
+   // Set the page accessing methods for the hot spots
+   for(uInt16 addr = (0x1FE0 & ~System::PAGE_MASK); addr < 0x2000;
+-      addr += System::PAGE_SIZE)
++      addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.codeAccessBase = &myCodeAccessBase[0x1fc0];
+     mySystem->setPageAccess(addr, access);
+   }
+-  /*setAccess(0x1FE0 & ~System::PAGE_MASK, System::PAGE_SIZE,
++  /*setAccess(0x1FE0 & ~System::PAGE_MASK, System::SYSTEM_PAGE_SIZE,
+             0, nullptr, 0x1fc0, System::PA_NONE, 0x1fc0);*/
+ 
+   // Setup the second segment to always point to the last ROM slice
+diff --git a/src/emucore/CartSB.cxx b/src/emucore/CartSB.cxx
+index 618d9c88..6ea555fa 100644
+--- a/src/emucore/CartSB.cxx
++++ b/src/emucore/CartSB.cxx
+@@ -61,7 +61,7 @@ void CartridgeSB::install(System& system)
+   System::PageAccess access(this, System::PA_READ);
+ 
+   // Set the page accessing methods for the hot spots
+-  for(uInt16 addr = 0x0800; addr < 0x0FFF; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x0800; addr < 0x0FFF; addr += System::SYSTEM_PAGE_SIZE)
+     mySystem->setPageAccess(addr, access);
+ 
+   // Install pages for startup bank
+@@ -119,7 +119,7 @@ bool CartridgeSB::bank(uInt16 bank)
+   System::PageAccess access(this, System::PA_READ);
+ 
+   // Map ROM image into the system
+-  for(uInt16 addr = 0x1000; addr < 0x2000; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1000; addr < 0x2000; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myImage[myBankOffset + (addr & 0x0FFF)];
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+diff --git a/src/emucore/CartUA.cxx b/src/emucore/CartUA.cxx
+index fea9ea72..b62c5bbe 100644
+--- a/src/emucore/CartUA.cxx
++++ b/src/emucore/CartUA.cxx
+@@ -124,7 +124,7 @@ bool CartridgeUA::bank(uInt16 bank)
+   System::PageAccess access(this, System::PA_READ);
+ 
+   // Map ROM image into the system
+-  for(uInt16 addr = 0x1000; addr < 0x2000; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1000; addr < 0x2000; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myImage[myBankOffset + (addr & 0x0FFF)];
+     access.codeAccessBase = &myCodeAccessBase[myBankOffset + (addr & 0x0FFF)];
+diff --git a/src/emucore/CartWD.cxx b/src/emucore/CartWD.cxx
+index c5040535..3bfc474c 100644
+--- a/src/emucore/CartWD.cxx
++++ b/src/emucore/CartWD.cxx
+@@ -54,7 +54,7 @@ void CartridgeWD::install(System& system)
+ 
+   // Set the page accessing method for the RAM reading pages
+   System::PageAccess read(this, System::PA_READ);
+-  for(uInt16 addr = 0x1000; addr < 0x1040; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1000; addr < 0x1040; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     read.directPeekBase = &myRAM[addr & 0x003F];
+     read.codeAccessBase = &myCodeAccessBase[addr & 0x003F];
+@@ -65,7 +65,7 @@ void CartridgeWD::install(System& system)
+   // Map access to this class, since we need to inspect all accesses to
+   // check if RWP happens
+   System::PageAccess write(this, System::PA_WRITE);
+-  for(uInt16 addr = 0x1040; addr < 0x1080; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1040; addr < 0x1080; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     write.codeAccessBase = &myCodeAccessBase[addr & 0x003F];
+     mySystem->setPageAccess(addr, write);
+@@ -156,7 +156,7 @@ void CartridgeWD::segmentZero(uInt8 slice)
+   System::PageAccess access(this, System::PA_READ);
+ 
+   // Skip first 128 bytes; it is always RAM
+-  for(uInt16 addr = 0x1080; addr < 0x1400; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1080; addr < 0x1400; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.codeAccessBase = &myCodeAccessBase[offset + (addr & 0x03FF)];
+     mySystem->setPageAccess(addr, access);
+@@ -170,7 +170,7 @@ void CartridgeWD::segmentOne(uInt8 slice)
+   uInt16 offset = slice << 10;
+   System::PageAccess access(this, System::PA_READ);
+ 
+-  for(uInt16 addr = 0x1400; addr < 0x1800; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1400; addr < 0x1800; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.codeAccessBase = &myCodeAccessBase[offset + (addr & 0x03FF)];
+     mySystem->setPageAccess(addr, access);
+@@ -184,7 +184,7 @@ void CartridgeWD::segmentTwo(uInt8 slice)
+   uInt16 offset = slice << 10;
+   System::PageAccess access(this, System::PA_READ);
+ 
+-  for(uInt16 addr = 0x1800; addr < 0x1C00; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1800; addr < 0x1C00; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.codeAccessBase = &myCodeAccessBase[offset + (addr & 0x03FF)];
+     mySystem->setPageAccess(addr, access);
+@@ -209,7 +209,7 @@ void CartridgeWD::segmentThree(uInt8 slice, bool map3bytes)
+ 
+   System::PageAccess access(this, System::PA_READ);
+ 
+-  for(uInt16 addr = 0x1C00; addr < 0x2000; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1C00; addr < 0x2000; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.codeAccessBase = &myCodeAccessBase[offset + (addr & 0x03FF)];
+     mySystem->setPageAccess(addr, access);
+diff --git a/src/emucore/CartX07.cxx b/src/emucore/CartX07.cxx
+index 4c251ee3..8c22af34 100644
+--- a/src/emucore/CartX07.cxx
++++ b/src/emucore/CartX07.cxx
+@@ -48,7 +48,7 @@ void CartridgeX07::install(System& system)
+   // The hotspots use almost all addresses below 0x1000, so we simply grab them
+   // all and forward the TIA/RIOT calls from the peek and poke methods.
+   System::PageAccess access(this, System::PA_READWRITE);
+-  for(uInt16 addr = 0x00; addr < 0x1000; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x00; addr < 0x1000; addr += System::SYSTEM_PAGE_SIZE)
+     mySystem->setPageAccess(addr, access);
+ 
+   // Install pages for the startup bank
+@@ -113,7 +113,7 @@ bool CartridgeX07::bank(uInt16 bank)
+   System::PageAccess access(this, System::PA_READ);
+ 
+   // Map ROM image into the system
+-  for(uInt16 addr = 0x1000; addr < 0x2000; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0x1000; addr < 0x2000; addr += System::SYSTEM_PAGE_SIZE)
+   {
+     access.directPeekBase = &myImage[offset + (addr & 0x0FFF)];
+     access.codeAccessBase = &myCodeAccessBase[offset + (addr & 0x0FFF)];
+diff --git a/src/emucore/M6532.cxx b/src/emucore/M6532.cxx
+index 9c209ad0..0d84c2c3 100644
+--- a/src/emucore/M6532.cxx
++++ b/src/emucore/M6532.cxx
+@@ -177,7 +177,7 @@ void M6532::installDelegate(System& system, Device& device)
+   //    (addr & 0x0200) == 0x0200 is IO     (A9 is 1)
+   //    (addr & 0x0300) == 0x0100 is Stack  (A8 is 1, A9 is 0)
+   //    (addr & 0x0300) == 0x0000 is ZP RAM (A8 is 0, A9 is 0)
+-  for (uInt16 addr = 0; addr < 0x1000; addr += System::PAGE_SIZE)
++  for (uInt16 addr = 0; addr < 0x1000; addr += System::SYSTEM_PAGE_SIZE)
+     if ((addr & 0x0080) == 0x0080) {
+       mySystem->setPageAccess(addr, access);
+     }
+diff --git a/src/emucore/MT24LC256.cxx b/src/emucore/MT24LC256.cxx
+index 0fb1e8eb..f48fbe69 100644
+--- a/src/emucore/MT24LC256.cxx
++++ b/src/emucore/MT24LC256.cxx
+@@ -167,7 +167,7 @@ void MT24LC256::eraseCurrent()
+   {
+     if(myPageHit[page])
+     {
+-      memset(myData + page * PAGE_SIZE, INIT_VALUE, PAGE_SIZE);
++      memset(myData + page * MT24LC256_PAGE_SIZE, INIT_VALUE, MT24LC256_PAGE_SIZE);
+       myDataChanged = true;
+     }
+   }
+@@ -189,7 +189,7 @@ void MT24LC256::jpee_init()
+   jpee_address = 0;
+   jpee_state=0;
+   jpee_sizemask = FLASH_SIZE - 1;
+-  jpee_pagemask = PAGE_SIZE - 1;
++  jpee_pagemask = MT24LC256_PAGE_SIZE - 1;
+   jpee_smallmode = 0;
+   jpee_logmode = -1;
+   if(!myDataFileExists)
+@@ -250,7 +250,7 @@ void MT24LC256::jpee_data_stop()
+     for (int i=3; i<jpee_pptr; i++)
+     {
+       myDataChanged = true;
+-      myPageHit[jpee_address / PAGE_SIZE] = true;
++      myPageHit[jpee_address / MT24LC256_PAGE_SIZE] = true;
+       bool devSettings = mySystem.oSystem().settings().getBool("dev.settings");
+       if(mySystem.oSystem().settings().getBool(devSettings ? "dev.eepromaccess" : "plr.eepromaccess"))
+ 
+@@ -350,7 +350,7 @@ void MT24LC256::jpee_clock_fall()
+         break;
+       }
+       jpee_state=3;
+-      myPageHit[jpee_address / PAGE_SIZE] = true;
++      myPageHit[jpee_address / MT24LC256_PAGE_SIZE] = true;
+ 
+       myCallback("AtariVox/SaveKey EEPROM read");
+ 
+diff --git a/src/emucore/MT24LC256.hxx b/src/emucore/MT24LC256.hxx
+index fc5d6a49..95ad4543 100644
+--- a/src/emucore/MT24LC256.hxx
++++ b/src/emucore/MT24LC256.hxx
+@@ -49,7 +49,7 @@ class MT24LC256
+     static constexpr uInt32 FLASH_SIZE = 32 * 1024;
+ 
+   public:
+-    static constexpr uInt32 PAGE_SIZE = 64;
++    static constexpr uInt32 MT24LC256_PAGE_SIZE = 64;
+     static constexpr uInt32 PAGE_NUM = FLASH_SIZE / PAGE_SIZE;
+ 
+     /** Read boolean data from the SDA line */
+diff --git a/src/emucore/System.hxx b/src/emucore/System.hxx
+index e31202df..70a2adaf 100644
+--- a/src/emucore/System.hxx
++++ b/src/emucore/System.hxx
+@@ -60,10 +60,10 @@ class System : public Serializable
+     static constexpr uInt16 PAGE_SHIFT = 6;
+ 
+     // Size of a page
+-    static constexpr uInt16 PAGE_SIZE = (1 << PAGE_SHIFT);
++    static constexpr uInt16 SYSTEM_PAGE_SIZE = (1 << PAGE_SHIFT);
+ 
+     // Mask to apply to an address to obtain its page offset
+-    static constexpr uInt16 PAGE_MASK = PAGE_SIZE - 1;
++    static constexpr uInt16 PAGE_MASK = SYSTEM_PAGE_SIZE - 1;
+ 
+     // Number of pages in the system
+     static constexpr uInt16 NUM_PAGES = 1 << (13 - PAGE_SHIFT);
+diff --git a/src/emucore/tia/TIA.cxx b/src/emucore/tia/TIA.cxx
+index 5ed963b8..c222362a 100644
+--- a/src/emucore/tia/TIA.cxx
++++ b/src/emucore/tia/TIA.cxx
+@@ -250,7 +250,7 @@ void TIA::installDelegate(System& system, Device& device)
+   // Map all peek/poke to mirrors of TIA address space to this class
+   // That is, all mirrors of ($00 - $3F) in the lower 4K of the 2600
+   // address space are mapped here
+-  for(uInt16 addr = 0; addr < 0x1000; addr += System::PAGE_SIZE)
++  for(uInt16 addr = 0; addr < 0x1000; addr += System::SYSTEM_PAGE_SIZE)
+     if((addr & TIA_BIT) == 0x0000)
+       mySystem->setPageAccess(addr, access);
+ 
+-- 
+2.20.1
+
-- 
2.20.1
