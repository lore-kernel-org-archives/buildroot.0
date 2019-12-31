From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 31 Dec 2019 15:50:48 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/libfreeimage: bump version
 to 3.18.0
In-Reply-To: <20190831140614.16535-1-bernd.kuhls@t-online.de>
References: <20190831140614.16535-1-bernd.kuhls@t-online.de>
Message-ID: <20191231145048.GE26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2019-08-31 16:06 +0200, Bernd Kuhls spake thusly:
> Release notes:
> http://freeimage.sourceforge.net/news.html
> 
> Removed patches
> 0003-LibWebP-fix-compilation-issue-with-GCC-5.x-C-11.patch
> 0004-fix-gcc-6.patch
> 0005-Manage-powf64-with-glibc.patch
> because upstream added updated version of various dependencies.
> 
> Added upstream patch to fix big endian build.
> Added md5 & sha1 hashes provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Aopplied to master, thanks.

However, because of the \r hell, I had to manually handle the sucker,
and in so doing, I forgot to carry the review from Giulio. Sorry... :-(

Regards,
Yann E. MORIN.

> ---
>  ...-compilation-issue-with-GCC-5.x-C-11.patch | 1172 -----------------
>  .../libfreeimage/0003-fix-big-endian-os.patch |   64 +
>  package/libfreeimage/0004-fix-gcc-6.patch     |   31 -
>  .../0005-Manage-powf64-with-glibc.patch       |  725 ----------
>  package/libfreeimage/libfreeimage.hash        |    6 +-
>  package/libfreeimage/libfreeimage.mk          |    2 +-
>  6 files changed, 70 insertions(+), 1930 deletions(-)
>  delete mode 100644 package/libfreeimage/0003-LibWebP-fix-compilation-issue-with-GCC-5.x-C-11.patch
>  create mode 100644 package/libfreeimage/0003-fix-big-endian-os.patch
>  delete mode 100644 package/libfreeimage/0004-fix-gcc-6.patch
>  delete mode 100644 package/libfreeimage/0005-Manage-powf64-with-glibc.patch
> 
> diff --git a/package/libfreeimage/0003-LibWebP-fix-compilation-issue-with-GCC-5.x-C-11.patch b/package/libfreeimage/0003-LibWebP-fix-compilation-issue-with-GCC-5.x-C-11.patch
> deleted file mode 100644
> index 6964827cca..0000000000
> --- a/package/libfreeimage/0003-LibWebP-fix-compilation-issue-with-GCC-5.x-C-11.patch
> +++ /dev/null
> @@ -1,1172 +0,0 @@
> -From 44bce1b66c1cdd5308ac3ac773ea0a53d83790fd Mon Sep 17 00:00:00 2001
> -From: Peter Korsgaard <peter@korsgaard.com>
> -Date: Tue, 24 Nov 2015 21:16:39 +0100
> -Subject: [PATCH] LibWebP: fix compilation issue with GCC 5.x / C++11
> -
> -GCC 5.1 / C++11 gets confused about the "#<TEXT>" in the inline assembly
> -code, and dies with errors like:
> -
> -Source/LibWebP/./src/dsp/dsp.upsampling_mips_dsp_r2.c:37:34: error: invalid
> -character ' ' in raw string delimiter
> -
> -Fix it by introducting white space around the string literals like it has
> -been done in upstream webp:
> -
> -https://chromium.googlesource.com/webm/libwebp/+/eebaf97f5a1cb713d81d311308d8a48c124e5aef
> -
> -Discussed upstream:
> -http://sourceforge.net/p/freeimage/discussion/36110/thread/605ef8e4/
> -
> -[Scripted by sed -i 's/"\(#[A-Z0-9]*\)"/" \1 "/g' *.c]
> -Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ----
> - Source/LibWebP/src/dsp/dsp.dec_mips_dsp_r2.c       |  28 +-
> - Source/LibWebP/src/dsp/dsp.enc_mips32.c            | 314 ++++++++++-----------
> - Source/LibWebP/src/dsp/dsp.enc_mips_dsp_r2.c       | 288 +++++++++----------
> - Source/LibWebP/src/dsp/dsp.filters_mips_dsp_r2.c   |  10 +-
> - Source/LibWebP/src/dsp/dsp.lossless_mips32.c       |  34 +--
> - Source/LibWebP/src/dsp/dsp.lossless_mips_dsp_r2.c  |   8 +-
> - .../LibWebP/src/dsp/dsp.upsampling_mips_dsp_r2.c   |  18 +-
> - Source/LibWebP/src/dsp/dsp.yuv_mips_dsp_r2.c       |  10 +-
> - 8 files changed, 355 insertions(+), 355 deletions(-)
> -
> -diff --git a/Source/LibWebP/src/dsp/dsp.dec_mips_dsp_r2.c b/Source/LibWebP/src/dsp/dsp.dec_mips_dsp_r2.c
> -index dac2c93..aaa8111 100644
> ---- a/Source/LibWebP/src/dsp/dsp.dec_mips_dsp_r2.c
> -+++ b/Source/LibWebP/src/dsp/dsp.dec_mips_dsp_r2.c
> -@@ -548,10 +548,10 @@ static void SimpleVFilter16(uint8_t* p, int stride, int thresh) {
> - // TEMP3 = SRC[D + D1 * BPS]
> - #define LOAD_4_BYTES(TEMP0, TEMP1, TEMP2, TEMP3,                               \
> -                      A, A1, B, B1, C, C1, D, D1, SRC)                          \
> --  "lbu          %["#TEMP0"],   "#A"+"#A1"*"XSTR(BPS)"(%["#SRC"])     \n\t"     \
> --  "lbu          %["#TEMP1"],   "#B"+"#B1"*"XSTR(BPS)"(%["#SRC"])     \n\t"     \
> --  "lbu          %["#TEMP2"],   "#C"+"#C1"*"XSTR(BPS)"(%["#SRC"])     \n\t"     \
> --  "lbu          %["#TEMP3"],   "#D"+"#D1"*"XSTR(BPS)"(%["#SRC"])     \n\t"     \
> -+  "lbu          %[" #TEMP0 "],   " #A "+" #A1 "*"XSTR(BPS)"(%[" #SRC "])     \n\t"     \
> -+  "lbu          %[" #TEMP1 "],   " #B "+" #B1 "*"XSTR(BPS)"(%[" #SRC "])     \n\t"     \
> -+  "lbu          %[" #TEMP2 "],   " #C "+" #C1 "*"XSTR(BPS)"(%[" #SRC "])     \n\t"     \
> -+  "lbu          %[" #TEMP3 "],   " #D "+" #D1 "*"XSTR(BPS)"(%[" #SRC "])     \n\t"     \
> - 
> - static void SimpleHFilter16(uint8_t* p, int stride, int thresh) {
> -   int i;
> -@@ -623,8 +623,8 @@ static void SimpleHFilter16i(uint8_t* p, int stride, int thresh) {
> - // DST[A * BPS]     = TEMP0
> - // DST[B + C * BPS] = TEMP1
> - #define STORE_8_BYTES(TEMP0, TEMP1, A, B, C, DST)                              \
> --  "usw          %["#TEMP0"],   "#A"*"XSTR(BPS)"(%["#DST"])         \n\t"       \
> --  "usw          %["#TEMP1"],   "#B"+"#C"*"XSTR(BPS)"(%["#DST"])    \n\t"
> -+  "usw          %[" #TEMP0 "],   " #A "*"XSTR(BPS)"(%[" #DST "])         \n\t"       \
> -+  "usw          %[" #TEMP1 "],   " #B "+" #C "*"XSTR(BPS)"(%[" #DST "])    \n\t"
> - 
> - static void VE4(uint8_t* dst) {    // vertical
> -   const uint8_t* top = dst - BPS;
> -@@ -725,8 +725,8 @@ static void RD4(uint8_t* dst) {   // Down-right
> - // TEMP0 = SRC[A * BPS]
> - // TEMP1 = SRC[B + C * BPS]
> - #define LOAD_8_BYTES(TEMP0, TEMP1, A, B, C, SRC)                               \
> --  "ulw          %["#TEMP0"],   "#A"*"XSTR(BPS)"(%["#SRC"])         \n\t"       \
> --  "ulw          %["#TEMP1"],   "#B"+"#C"*"XSTR(BPS)"(%["#SRC"])    \n\t"
> -+  "ulw          %[" #TEMP0 "],   " #A "*"XSTR(BPS)"(%[" #SRC "])         \n\t"       \
> -+  "ulw          %[" #TEMP1 "],   " #B "+" #C "*"XSTR(BPS)"(%[" #SRC "])    \n\t"
> - 
> - static void LD4(uint8_t* dst) {   // Down-Left
> -   int temp0, temp1, temp2, temp3, temp4;
> -@@ -873,24 +873,24 @@ static void DC8uvNoTop(uint8_t* dst) {  // DC with no top samples
> - #define CLIPPING(SIZE)                                                         \
> -   "preceu.ph.qbl   %[temp2],   %[temp0]                  \n\t"                 \
> -   "preceu.ph.qbr   %[temp0],   %[temp0]                  \n\t"                 \
> --".if "#SIZE" == 8                                        \n\t"                 \
> -+".if " #SIZE " == 8                                        \n\t"                 \
> -   "preceu.ph.qbl   %[temp3],   %[temp1]                  \n\t"                 \
> -   "preceu.ph.qbr   %[temp1],   %[temp1]                  \n\t"                 \
> - ".endif                                                  \n\t"                 \
> -   "addu.ph         %[temp2],   %[temp2],   %[dst_1]      \n\t"                 \
> -   "addu.ph         %[temp0],   %[temp0],   %[dst_1]      \n\t"                 \
> --".if "#SIZE" == 8                                        \n\t"                 \
> -+".if " #SIZE " == 8                                        \n\t"                 \
> -   "addu.ph         %[temp3],   %[temp3],   %[dst_1]      \n\t"                 \
> -   "addu.ph         %[temp1],   %[temp1],   %[dst_1]      \n\t"                 \
> - ".endif                                                  \n\t"                 \
> -   "shll_s.ph       %[temp2],   %[temp2],   7             \n\t"                 \
> -   "shll_s.ph       %[temp0],   %[temp0],   7             \n\t"                 \
> --".if "#SIZE" == 8                                        \n\t"                 \
> -+".if " #SIZE " == 8                                        \n\t"                 \
> -   "shll_s.ph       %[temp3],   %[temp3],   7             \n\t"                 \
> -   "shll_s.ph       %[temp1],   %[temp1],   7             \n\t"                 \
> - ".endif                                                  \n\t"                 \
> -   "precrqu_s.qb.ph %[temp0],   %[temp2],   %[temp0]      \n\t"                 \
> --".if "#SIZE" == 8                                        \n\t"                 \
> -+".if " #SIZE " == 8                                        \n\t"                 \
> -   "precrqu_s.qb.ph %[temp1],   %[temp3],   %[temp1]      \n\t"                 \
> - ".endif                                                  \n\t"
> - 
> -@@ -899,7 +899,7 @@ static void DC8uvNoTop(uint8_t* dst) {  // DC with no top samples
> -   int dst_1 = ((int)(DST)[-1] << 16) + (DST)[-1];                              \
> -   int temp0, temp1, temp2, temp3;                                              \
> -   __asm__ volatile (                                                           \
> --  ".if "#SIZE" < 8                                       \n\t"                 \
> -+  ".if " #SIZE " < 8                                       \n\t"                 \
> -     "ulw             %[temp0],   0(%[top])               \n\t"                 \
> -     "subu.ph         %[dst_1],   %[dst_1],    %[top_1]   \n\t"                 \
> -     CLIPPING(4)                                                                \
> -@@ -911,7 +911,7 @@ static void DC8uvNoTop(uint8_t* dst) {  // DC with no top samples
> -     CLIPPING(8)                                                                \
> -     "usw             %[temp0],   0(%[dst])               \n\t"                 \
> -     "usw             %[temp1],   4(%[dst])               \n\t"                 \
> --  ".if "#SIZE" == 16                                     \n\t"                 \
> -+  ".if " #SIZE " == 16                                     \n\t"                 \
> -     "ulw             %[temp0],   8(%[top])               \n\t"                 \
> -     "ulw             %[temp1],   12(%[top])              \n\t"                 \
> -     CLIPPING(8)                                                                \
> -diff --git a/Source/LibWebP/src/dsp/dsp.enc_mips32.c b/Source/LibWebP/src/dsp/dsp.enc_mips32.c
> -index 545aa3a..bf1c16d 100644
> ---- a/Source/LibWebP/src/dsp/dsp.enc_mips32.c
> -+++ b/Source/LibWebP/src/dsp/dsp.enc_mips32.c
> -@@ -31,26 +31,26 @@ static const int kC2 = 35468;
> - // TEMP0..TEMP3 - registers for corresponding tmp elements
> - // TEMP4..TEMP5 - temporary registers
> - #define VERTICAL_PASS(A, B, C, D, TEMP4, TEMP0, TEMP1, TEMP2, TEMP3)        \
> --  "lh      %[temp16],      "#A"(%[temp20])                 \n\t"            \
> --  "lh      %[temp18],      "#B"(%[temp20])                 \n\t"            \
> --  "lh      %[temp17],      "#C"(%[temp20])                 \n\t"            \
> --  "lh      %[temp19],      "#D"(%[temp20])                 \n\t"            \
> --  "addu    %["#TEMP4"],    %[temp16],      %[temp18]       \n\t"            \
> -+  "lh      %[temp16],      " #A "(%[temp20])                 \n\t"            \
> -+  "lh      %[temp18],      " #B "(%[temp20])                 \n\t"            \
> -+  "lh      %[temp17],      " #C "(%[temp20])                 \n\t"            \
> -+  "lh      %[temp19],      " #D "(%[temp20])                 \n\t"            \
> -+  "addu    %[" #TEMP4 "],    %[temp16],      %[temp18]       \n\t"            \
> -   "subu    %[temp16],      %[temp16],      %[temp18]       \n\t"            \
> --  "mul     %["#TEMP0"],    %[temp17],      %[kC2]          \n\t"            \
> -+  "mul     %[" #TEMP0 "],    %[temp17],      %[kC2]          \n\t"            \
> -   "mul     %[temp18],      %[temp19],      %[kC1]          \n\t"            \
> -   "mul     %[temp17],      %[temp17],      %[kC1]          \n\t"            \
> -   "mul     %[temp19],      %[temp19],      %[kC2]          \n\t"            \
> --  "sra     %["#TEMP0"],    %["#TEMP0"],    16              \n\n"            \
> -+  "sra     %[" #TEMP0 "],    %[" #TEMP0 "],    16              \n\n"            \
> -   "sra     %[temp18],      %[temp18],      16              \n\n"            \
> -   "sra     %[temp17],      %[temp17],      16              \n\n"            \
> -   "sra     %[temp19],      %[temp19],      16              \n\n"            \
> --  "subu    %["#TEMP2"],    %["#TEMP0"],    %[temp18]       \n\t"            \
> --  "addu    %["#TEMP3"],    %[temp17],      %[temp19]       \n\t"            \
> --  "addu    %["#TEMP0"],    %["#TEMP4"],    %["#TEMP3"]     \n\t"            \
> --  "addu    %["#TEMP1"],    %[temp16],      %["#TEMP2"]     \n\t"            \
> --  "subu    %["#TEMP2"],    %[temp16],      %["#TEMP2"]     \n\t"            \
> --  "subu    %["#TEMP3"],    %["#TEMP4"],    %["#TEMP3"]     \n\t"
> -+  "subu    %[" #TEMP2 "],    %[" #TEMP0 "],    %[temp18]       \n\t"            \
> -+  "addu    %[" #TEMP3 "],    %[temp17],      %[temp19]       \n\t"            \
> -+  "addu    %[" #TEMP0 "],    %[" #TEMP4 "],    %[" #TEMP3 "]     \n\t"            \
> -+  "addu    %[" #TEMP1 "],    %[temp16],      %[" #TEMP2 "]     \n\t"            \
> -+  "subu    %[" #TEMP2 "],    %[temp16],      %[" #TEMP2 "]     \n\t"            \
> -+  "subu    %[" #TEMP3 "],    %[" #TEMP4 "],    %[" #TEMP3 "]     \n\t"
> - 
> - // macro for one horizontal pass in ITransformOne
> - // MUL and STORE macros inlined
> -@@ -59,58 +59,58 @@ static const int kC2 = 35468;
> - // A - offset in bytes to load from ref and store to dst buffer
> - // TEMP0, TEMP4, TEMP8 and TEMP12 - registers for corresponding tmp elements
> - #define HORIZONTAL_PASS(A, TEMP0, TEMP4, TEMP8, TEMP12)                     \
> --  "addiu   %["#TEMP0"],    %["#TEMP0"],    4               \n\t"            \
> --  "addu    %[temp16],      %["#TEMP0"],    %["#TEMP8"]     \n\t"            \
> --  "subu    %[temp17],      %["#TEMP0"],    %["#TEMP8"]     \n\t"            \
> --  "mul     %["#TEMP0"],    %["#TEMP4"],    %[kC2]          \n\t"            \
> --  "mul     %["#TEMP8"],    %["#TEMP12"],   %[kC1]          \n\t"            \
> --  "mul     %["#TEMP4"],    %["#TEMP4"],    %[kC1]          \n\t"            \
> --  "mul     %["#TEMP12"],   %["#TEMP12"],   %[kC2]          \n\t"            \
> --  "sra     %["#TEMP0"],    %["#TEMP0"],    16              \n\t"            \
> --  "sra     %["#TEMP8"],    %["#TEMP8"],    16              \n\t"            \
> --  "sra     %["#TEMP4"],    %["#TEMP4"],    16              \n\t"            \
> --  "sra     %["#TEMP12"],   %["#TEMP12"],   16              \n\t"            \
> --  "subu    %[temp18],      %["#TEMP0"],    %["#TEMP8"]     \n\t"            \
> --  "addu    %[temp19],      %["#TEMP4"],    %["#TEMP12"]    \n\t"            \
> --  "addu    %["#TEMP0"],    %[temp16],      %[temp19]       \n\t"            \
> --  "addu    %["#TEMP4"],    %[temp17],      %[temp18]       \n\t"            \
> --  "subu    %["#TEMP8"],    %[temp17],      %[temp18]       \n\t"            \
> --  "subu    %["#TEMP12"],   %[temp16],      %[temp19]       \n\t"            \
> -+  "addiu   %[" #TEMP0 "],    %[" #TEMP0 "],    4               \n\t"            \
> -+  "addu    %[temp16],      %[" #TEMP0 "],    %[" #TEMP8 "]     \n\t"            \
> -+  "subu    %[temp17],      %[" #TEMP0 "],    %[" #TEMP8 "]     \n\t"            \
> -+  "mul     %[" #TEMP0 "],    %[" #TEMP4 "],    %[kC2]          \n\t"            \
> -+  "mul     %[" #TEMP8 "],    %[" #TEMP12 "],   %[kC1]          \n\t"            \
> -+  "mul     %[" #TEMP4 "],    %[" #TEMP4 "],    %[kC1]          \n\t"            \
> -+  "mul     %[" #TEMP12 "],   %[" #TEMP12 "],   %[kC2]          \n\t"            \
> -+  "sra     %[" #TEMP0 "],    %[" #TEMP0 "],    16              \n\t"            \
> -+  "sra     %[" #TEMP8 "],    %[" #TEMP8 "],    16              \n\t"            \
> -+  "sra     %[" #TEMP4 "],    %[" #TEMP4 "],    16              \n\t"            \
> -+  "sra     %[" #TEMP12 "],   %[" #TEMP12 "],   16              \n\t"            \
> -+  "subu    %[temp18],      %[" #TEMP0 "],    %[" #TEMP8 "]     \n\t"            \
> -+  "addu    %[temp19],      %[" #TEMP4 "],    %[" #TEMP12 "]    \n\t"            \
> -+  "addu    %[" #TEMP0 "],    %[temp16],      %[temp19]       \n\t"            \
> -+  "addu    %[" #TEMP4 "],    %[temp17],      %[temp18]       \n\t"            \
> -+  "subu    %[" #TEMP8 "],    %[temp17],      %[temp18]       \n\t"            \
> -+  "subu    %[" #TEMP12 "],   %[temp16],      %[temp19]       \n\t"            \
> -   "lw      %[temp20],      0(%[args])                      \n\t"            \
> --  "sra     %["#TEMP0"],    %["#TEMP0"],    3               \n\t"            \
> --  "sra     %["#TEMP4"],    %["#TEMP4"],    3               \n\t"            \
> --  "sra     %["#TEMP8"],    %["#TEMP8"],    3               \n\t"            \
> --  "sra     %["#TEMP12"],   %["#TEMP12"],   3               \n\t"            \
> --  "lbu     %[temp16],      0+"XSTR(BPS)"*"#A"(%[temp20])   \n\t"            \
> --  "lbu     %[temp17],      1+"XSTR(BPS)"*"#A"(%[temp20])   \n\t"            \
> --  "lbu     %[temp18],      2+"XSTR(BPS)"*"#A"(%[temp20])   \n\t"            \
> --  "lbu     %[temp19],      3+"XSTR(BPS)"*"#A"(%[temp20])   \n\t"            \
> --  "addu    %["#TEMP0"],    %[temp16],      %["#TEMP0"]     \n\t"            \
> --  "addu    %["#TEMP4"],    %[temp17],      %["#TEMP4"]     \n\t"            \
> --  "addu    %["#TEMP8"],    %[temp18],      %["#TEMP8"]     \n\t"            \
> --  "addu    %["#TEMP12"],   %[temp19],      %["#TEMP12"]    \n\t"            \
> --  "slt     %[temp16],      %["#TEMP0"],    $zero           \n\t"            \
> --  "slt     %[temp17],      %["#TEMP4"],    $zero           \n\t"            \
> --  "slt     %[temp18],      %["#TEMP8"],    $zero           \n\t"            \
> --  "slt     %[temp19],      %["#TEMP12"],   $zero           \n\t"            \
> --  "movn    %["#TEMP0"],    $zero,          %[temp16]       \n\t"            \
> --  "movn    %["#TEMP4"],    $zero,          %[temp17]       \n\t"            \
> --  "movn    %["#TEMP8"],    $zero,          %[temp18]       \n\t"            \
> --  "movn    %["#TEMP12"],   $zero,          %[temp19]       \n\t"            \
> -+  "sra     %[" #TEMP0 "],    %[" #TEMP0 "],    3               \n\t"            \
> -+  "sra     %[" #TEMP4 "],    %[" #TEMP4 "],    3               \n\t"            \
> -+  "sra     %[" #TEMP8 "],    %[" #TEMP8 "],    3               \n\t"            \
> -+  "sra     %[" #TEMP12 "],   %[" #TEMP12 "],   3               \n\t"            \
> -+  "lbu     %[temp16],      0+"XSTR(BPS)"*" #A "(%[temp20])   \n\t"            \
> -+  "lbu     %[temp17],      1+"XSTR(BPS)"*" #A "(%[temp20])   \n\t"            \
> -+  "lbu     %[temp18],      2+"XSTR(BPS)"*" #A "(%[temp20])   \n\t"            \
> -+  "lbu     %[temp19],      3+"XSTR(BPS)"*" #A "(%[temp20])   \n\t"            \
> -+  "addu    %[" #TEMP0 "],    %[temp16],      %[" #TEMP0 "]     \n\t"            \
> -+  "addu    %[" #TEMP4 "],    %[temp17],      %[" #TEMP4 "]     \n\t"            \
> -+  "addu    %[" #TEMP8 "],    %[temp18],      %[" #TEMP8 "]     \n\t"            \
> -+  "addu    %[" #TEMP12 "],   %[temp19],      %[" #TEMP12 "]    \n\t"            \
> -+  "slt     %[temp16],      %[" #TEMP0 "],    $zero           \n\t"            \
> -+  "slt     %[temp17],      %[" #TEMP4 "],    $zero           \n\t"            \
> -+  "slt     %[temp18],      %[" #TEMP8 "],    $zero           \n\t"            \
> -+  "slt     %[temp19],      %[" #TEMP12 "],   $zero           \n\t"            \
> -+  "movn    %[" #TEMP0 "],    $zero,          %[temp16]       \n\t"            \
> -+  "movn    %[" #TEMP4 "],    $zero,          %[temp17]       \n\t"            \
> -+  "movn    %[" #TEMP8 "],    $zero,          %[temp18]       \n\t"            \
> -+  "movn    %[" #TEMP12 "],   $zero,          %[temp19]       \n\t"            \
> -   "addiu   %[temp20],      $zero,          255             \n\t"            \
> --  "slt     %[temp16],      %["#TEMP0"],    %[temp20]       \n\t"            \
> --  "slt     %[temp17],      %["#TEMP4"],    %[temp20]       \n\t"            \
> --  "slt     %[temp18],      %["#TEMP8"],    %[temp20]       \n\t"            \
> --  "slt     %[temp19],      %["#TEMP12"],   %[temp20]       \n\t"            \
> --  "movz    %["#TEMP0"],    %[temp20],      %[temp16]       \n\t"            \
> --  "movz    %["#TEMP4"],    %[temp20],      %[temp17]       \n\t"            \
> -+  "slt     %[temp16],      %[" #TEMP0 "],    %[temp20]       \n\t"            \
> -+  "slt     %[temp17],      %[" #TEMP4 "],    %[temp20]       \n\t"            \
> -+  "slt     %[temp18],      %[" #TEMP8 "],    %[temp20]       \n\t"            \
> -+  "slt     %[temp19],      %[" #TEMP12 "],   %[temp20]       \n\t"            \
> -+  "movz    %[" #TEMP0 "],    %[temp20],      %[temp16]       \n\t"            \
> -+  "movz    %[" #TEMP4 "],    %[temp20],      %[temp17]       \n\t"            \
> -   "lw      %[temp16],      8(%[args])                      \n\t"            \
> --  "movz    %["#TEMP8"],    %[temp20],      %[temp18]       \n\t"            \
> --  "movz    %["#TEMP12"],   %[temp20],      %[temp19]       \n\t"            \
> --  "sb      %["#TEMP0"],    0+"XSTR(BPS)"*"#A"(%[temp16])   \n\t"            \
> --  "sb      %["#TEMP4"],    1+"XSTR(BPS)"*"#A"(%[temp16])   \n\t"            \
> --  "sb      %["#TEMP8"],    2+"XSTR(BPS)"*"#A"(%[temp16])   \n\t"            \
> --  "sb      %["#TEMP12"],   3+"XSTR(BPS)"*"#A"(%[temp16])   \n\t"
> -+  "movz    %[" #TEMP8 "],    %[temp20],      %[temp18]       \n\t"            \
> -+  "movz    %[" #TEMP12 "],   %[temp20],      %[temp19]       \n\t"            \
> -+  "sb      %[" #TEMP0 "],    0+"XSTR(BPS)"*" #A "(%[temp16])   \n\t"            \
> -+  "sb      %[" #TEMP4 "],    1+"XSTR(BPS)"*" #A "(%[temp16])   \n\t"            \
> -+  "sb      %[" #TEMP8 "],    2+"XSTR(BPS)"*" #A "(%[temp16])   \n\t"            \
> -+  "sb      %[" #TEMP12 "],   3+"XSTR(BPS)"*" #A "(%[temp16])   \n\t"
> - 
> - // Does one or two inverse transforms.
> - static WEBP_INLINE void ITransformOne(const uint8_t* ref, const int16_t* in,
> -@@ -161,9 +161,9 @@ static void ITransform(const uint8_t* ref, const int16_t* in,
> - // K - offset in bytes (kZigzag[n] * 4)
> - // N - offset in bytes (n * 2)
> - #define QUANTIZE_ONE(J, K, N)                                               \
> --  "lh           %[temp0],       "#J"(%[ppin])                       \n\t"   \
> --  "lhu          %[temp1],       "#J"(%[ppsharpen])                  \n\t"   \
> --  "lw           %[temp2],       "#K"(%[ppzthresh])                  \n\t"   \
> -+  "lh           %[temp0],       " #J "(%[ppin])                       \n\t"   \
> -+  "lhu          %[temp1],       " #J "(%[ppsharpen])                  \n\t"   \
> -+  "lw           %[temp2],       " #K "(%[ppzthresh])                  \n\t"   \
> -   "sra          %[sign],        %[temp0],           15              \n\t"   \
> -   "xor          %[coeff],       %[temp0],           %[sign]         \n\t"   \
> -   "subu         %[coeff],       %[coeff],           %[sign]         \n\t"   \
> -@@ -172,9 +172,9 @@ static void ITransform(const uint8_t* ref, const int16_t* in,
> -   "addiu        %[temp5],       $zero,              0               \n\t"   \
> -   "addiu        %[level],       $zero,              0               \n\t"   \
> -   "beqz         %[temp4],       2f                                  \n\t"   \
> --  "lhu          %[temp1],       "#J"(%[ppiq])                       \n\t"   \
> --  "lw           %[temp2],       "#K"(%[ppbias])                     \n\t"   \
> --  "lhu          %[temp3],       "#J"(%[ppq])                        \n\t"   \
> -+  "lhu          %[temp1],       " #J "(%[ppiq])                       \n\t"   \
> -+  "lw           %[temp2],       " #K "(%[ppbias])                     \n\t"   \
> -+  "lhu          %[temp3],       " #J "(%[ppq])                        \n\t"   \
> -   "mul          %[level],       %[coeff],           %[temp1]        \n\t"   \
> -   "addu         %[level],       %[level],           %[temp2]        \n\t"   \
> -   "sra          %[level],       %[level],           17              \n\t"   \
> -@@ -184,8 +184,8 @@ static void ITransform(const uint8_t* ref, const int16_t* in,
> -   "subu         %[level],       %[level],           %[sign]         \n\t"   \
> -   "mul          %[temp5],       %[level],           %[temp3]        \n\t"   \
> - "2:                                                                 \n\t"   \
> --  "sh           %[temp5],       "#J"(%[ppin])                       \n\t"   \
> --  "sh           %[level],       "#N"(%[pout])                       \n\t"
> -+  "sh           %[temp5],       " #J "(%[ppin])                       \n\t"   \
> -+  "sh           %[level],       " #N "(%[pout])                       \n\t"
> - 
> - static int QuantizeBlock(int16_t in[16], int16_t out[16],
> -                          const VP8Matrix* const mtx) {
> -@@ -254,14 +254,14 @@ static int Quantize2Blocks(int16_t in[32], int16_t out[32],
> - // E..H - offsets in bytes to store first results to tmp buffer
> - // E1..H1 - offsets in bytes to store second results to tmp buffer
> - #define HORIZONTAL_PASS(A, E, F, G, H, E1, F1, G1, H1)              \
> --  "lbu    %[temp0],  0+"XSTR(BPS)"*"#A"(%[a])  \n\t"                \
> --  "lbu    %[temp1],  1+"XSTR(BPS)"*"#A"(%[a])  \n\t"                \
> --  "lbu    %[temp2],  2+"XSTR(BPS)"*"#A"(%[a])  \n\t"                \
> --  "lbu    %[temp3],  3+"XSTR(BPS)"*"#A"(%[a])  \n\t"                \
> --  "lbu    %[temp4],  0+"XSTR(BPS)"*"#A"(%[b])  \n\t"                \
> --  "lbu    %[temp5],  1+"XSTR(BPS)"*"#A"(%[b])  \n\t"                \
> --  "lbu    %[temp6],  2+"XSTR(BPS)"*"#A"(%[b])  \n\t"                \
> --  "lbu    %[temp7],  3+"XSTR(BPS)"*"#A"(%[b])  \n\t"                \
> -+  "lbu    %[temp0],  0+"XSTR(BPS)"*" #A "(%[a])  \n\t"                \
> -+  "lbu    %[temp1],  1+"XSTR(BPS)"*" #A "(%[a])  \n\t"                \
> -+  "lbu    %[temp2],  2+"XSTR(BPS)"*" #A "(%[a])  \n\t"                \
> -+  "lbu    %[temp3],  3+"XSTR(BPS)"*" #A "(%[a])  \n\t"                \
> -+  "lbu    %[temp4],  0+"XSTR(BPS)"*" #A "(%[b])  \n\t"                \
> -+  "lbu    %[temp5],  1+"XSTR(BPS)"*" #A "(%[b])  \n\t"                \
> -+  "lbu    %[temp6],  2+"XSTR(BPS)"*" #A "(%[b])  \n\t"                \
> -+  "lbu    %[temp7],  3+"XSTR(BPS)"*" #A "(%[b])  \n\t"                \
> -   "addu   %[temp8],  %[temp0],    %[temp2]     \n\t"                \
> -   "subu   %[temp0],  %[temp0],    %[temp2]     \n\t"                \
> -   "addu   %[temp2],  %[temp1],    %[temp3]     \n\t"                \
> -@@ -278,14 +278,14 @@ static int Quantize2Blocks(int16_t in[32], int16_t out[32],
> -   "subu   %[temp3],  %[temp3],    %[temp6]     \n\t"                \
> -   "addu   %[temp6],  %[temp4],    %[temp5]     \n\t"                \
> -   "subu   %[temp4],  %[temp4],    %[temp5]     \n\t"                \
> --  "sw     %[temp7],  "#E"(%[tmp])              \n\t"                \
> --  "sw     %[temp2],  "#H"(%[tmp])              \n\t"                \
> --  "sw     %[temp8],  "#F"(%[tmp])              \n\t"                \
> --  "sw     %[temp0],  "#G"(%[tmp])              \n\t"                \
> --  "sw     %[temp1],  "#E1"(%[tmp])             \n\t"                \
> --  "sw     %[temp3],  "#H1"(%[tmp])             \n\t"                \
> --  "sw     %[temp6],  "#F1"(%[tmp])             \n\t"                \
> --  "sw     %[temp4],  "#G1"(%[tmp])             \n\t"
> -+  "sw     %[temp7],  " #E "(%[tmp])              \n\t"                \
> -+  "sw     %[temp2],  " #H "(%[tmp])              \n\t"                \
> -+  "sw     %[temp8],  " #F "(%[tmp])              \n\t"                \
> -+  "sw     %[temp0],  " #G "(%[tmp])              \n\t"                \
> -+  "sw     %[temp1],  " #E1 "(%[tmp])             \n\t"                \
> -+  "sw     %[temp3],  " #H1 "(%[tmp])             \n\t"                \
> -+  "sw     %[temp6],  " #F1 "(%[tmp])             \n\t"                \
> -+  "sw     %[temp4],  " #G1 "(%[tmp])             \n\t"
> - 
> - // macro for one vertical pass in Disto4x4 (TTransform)
> - // two calls of function TTransform are merged into single one
> -@@ -300,10 +300,10 @@ static int Quantize2Blocks(int16_t in[32], int16_t out[32],
> - // A1..D1 - offsets in bytes to load second results from tmp buffer
> - // E..H - offsets in bytes to load from w buffer
> - #define VERTICAL_PASS(A, B, C, D, A1, B1, C1, D1, E, F, G, H)     \
> --  "lw     %[temp0],  "#A1"(%[tmp])           \n\t"                \
> --  "lw     %[temp1],  "#C1"(%[tmp])           \n\t"                \
> --  "lw     %[temp2],  "#B1"(%[tmp])           \n\t"                \
> --  "lw     %[temp3],  "#D1"(%[tmp])           \n\t"                \
> -+  "lw     %[temp0],  " #A1 "(%[tmp])           \n\t"                \
> -+  "lw     %[temp1],  " #C1 "(%[tmp])           \n\t"                \
> -+  "lw     %[temp2],  " #B1 "(%[tmp])           \n\t"                \
> -+  "lw     %[temp3],  " #D1 "(%[tmp])           \n\t"                \
> -   "addu   %[temp8],  %[temp0],    %[temp1]   \n\t"                \
> -   "subu   %[temp0],  %[temp0],    %[temp1]   \n\t"                \
> -   "addu   %[temp1],  %[temp2],    %[temp3]   \n\t"                \
> -@@ -324,18 +324,18 @@ static int Quantize2Blocks(int16_t in[32], int16_t out[32],
> -   "subu   %[temp1],  %[temp1],    %[temp5]   \n\t"                \
> -   "subu   %[temp0],  %[temp0],    %[temp6]   \n\t"                \
> -   "subu   %[temp8],  %[temp8],    %[temp7]   \n\t"                \
> --  "lhu    %[temp4],  "#E"(%[w])              \n\t"                \
> --  "lhu    %[temp5],  "#F"(%[w])              \n\t"                \
> --  "lhu    %[temp6],  "#G"(%[w])              \n\t"                \
> --  "lhu    %[temp7],  "#H"(%[w])              \n\t"                \
> -+  "lhu    %[temp4],  " #E "(%[w])              \n\t"                \
> -+  "lhu    %[temp5],  " #F "(%[w])              \n\t"                \
> -+  "lhu    %[temp6],  " #G "(%[w])              \n\t"                \
> -+  "lhu    %[temp7],  " #H "(%[w])              \n\t"                \
> -   "madd   %[temp4],  %[temp3]                \n\t"                \
> -   "madd   %[temp5],  %[temp1]                \n\t"                \
> -   "madd   %[temp6],  %[temp0]                \n\t"                \
> -   "madd   %[temp7],  %[temp8]                \n\t"                \
> --  "lw     %[temp0],  "#A"(%[tmp])            \n\t"                \
> --  "lw     %[temp1],  "#C"(%[tmp])            \n\t"                \
> --  "lw     %[temp2],  "#B"(%[tmp])            \n\t"                \
> --  "lw     %[temp3],  "#D"(%[tmp])            \n\t"                \
> -+  "lw     %[temp0],  " #A "(%[tmp])            \n\t"                \
> -+  "lw     %[temp1],  " #C "(%[tmp])            \n\t"                \
> -+  "lw     %[temp2],  " #B "(%[tmp])            \n\t"                \
> -+  "lw     %[temp3],  " #D "(%[tmp])            \n\t"                \
> -   "addu   %[temp8],  %[temp0],    %[temp1]   \n\t"                \
> -   "subu   %[temp0],  %[temp0],    %[temp1]   \n\t"                \
> -   "addu   %[temp1],  %[temp2],    %[temp3]   \n\t"                \
> -@@ -413,70 +413,70 @@ static int Disto16x16(const uint8_t* const a, const uint8_t* const b,
> - // A - offset in bytes to load from src and ref buffers
> - // TEMP0..TEMP3 - registers for corresponding tmp elements
> - #define HORIZONTAL_PASS(A, TEMP0, TEMP1, TEMP2, TEMP3)            \
> --  "lw     %["#TEMP1"],  0(%[args])                       \n\t"    \
> --  "lw     %["#TEMP2"],  4(%[args])                       \n\t"    \
> --  "lbu    %[temp16],    0+"XSTR(BPS)"*"#A"(%["#TEMP1"])  \n\t"    \
> --  "lbu    %[temp17],    0+"XSTR(BPS)"*"#A"(%["#TEMP2"])  \n\t"    \
> --  "lbu    %[temp18],    1+"XSTR(BPS)"*"#A"(%["#TEMP1"])  \n\t"    \
> --  "lbu    %[temp19],    1+"XSTR(BPS)"*"#A"(%["#TEMP2"])  \n\t"    \
> -+  "lw     %[" #TEMP1 "],  0(%[args])                       \n\t"    \
> -+  "lw     %[" #TEMP2 "],  4(%[args])                       \n\t"    \
> -+  "lbu    %[temp16],    0+"XSTR(BPS)"*" #A "(%[" #TEMP1 "])  \n\t"    \
> -+  "lbu    %[temp17],    0+"XSTR(BPS)"*" #A "(%[" #TEMP2 "])  \n\t"    \
> -+  "lbu    %[temp18],    1+"XSTR(BPS)"*" #A "(%[" #TEMP1 "])  \n\t"    \
> -+  "lbu    %[temp19],    1+"XSTR(BPS)"*" #A "(%[" #TEMP2 "])  \n\t"    \
> -   "subu   %[temp20],    %[temp16],    %[temp17]          \n\t"    \
> --  "lbu    %[temp16],    2+"XSTR(BPS)"*"#A"(%["#TEMP1"])  \n\t"    \
> --  "lbu    %[temp17],    2+"XSTR(BPS)"*"#A"(%["#TEMP2"])  \n\t"    \
> --  "subu   %["#TEMP0"],  %[temp18],    %[temp19]          \n\t"    \
> --  "lbu    %[temp18],    3+"XSTR(BPS)"*"#A"(%["#TEMP1"])  \n\t"    \
> --  "lbu    %[temp19],    3+"XSTR(BPS)"*"#A"(%["#TEMP2"])  \n\t"    \
> --  "subu   %["#TEMP1"],  %[temp16],    %[temp17]          \n\t"    \
> --  "subu   %["#TEMP2"],  %[temp18],    %[temp19]          \n\t"    \
> --  "addu   %["#TEMP3"],  %[temp20],    %["#TEMP2"]        \n\t"    \
> --  "subu   %["#TEMP2"],  %[temp20],    %["#TEMP2"]        \n\t"    \
> --  "addu   %[temp20],    %["#TEMP0"],  %["#TEMP1"]        \n\t"    \
> --  "subu   %["#TEMP0"],  %["#TEMP0"],  %["#TEMP1"]        \n\t"    \
> --  "mul    %[temp16],    %["#TEMP2"],  %[c5352]           \n\t"    \
> --  "mul    %[temp17],    %["#TEMP2"],  %[c2217]           \n\t"    \
> --  "mul    %[temp18],    %["#TEMP0"],  %[c5352]           \n\t"    \
> --  "mul    %[temp19],    %["#TEMP0"],  %[c2217]           \n\t"    \
> --  "addu   %["#TEMP1"],  %["#TEMP3"],  %[temp20]          \n\t"    \
> --  "subu   %[temp20],    %["#TEMP3"],  %[temp20]          \n\t"    \
> --  "sll    %["#TEMP0"],  %["#TEMP1"],  3                  \n\t"    \
> --  "sll    %["#TEMP2"],  %[temp20],    3                  \n\t"    \
> -+  "lbu    %[temp16],    2+"XSTR(BPS)"*" #A "(%[" #TEMP1 "])  \n\t"    \
> -+  "lbu    %[temp17],    2+"XSTR(BPS)"*" #A "(%[" #TEMP2 "])  \n\t"    \
> -+  "subu   %[" #TEMP0 "],  %[temp18],    %[temp19]          \n\t"    \
> -+  "lbu    %[temp18],    3+"XSTR(BPS)"*" #A "(%[" #TEMP1 "])  \n\t"    \
> -+  "lbu    %[temp19],    3+"XSTR(BPS)"*" #A "(%[" #TEMP2 "])  \n\t"    \
> -+  "subu   %[" #TEMP1 "],  %[temp16],    %[temp17]          \n\t"    \
> -+  "subu   %[" #TEMP2 "],  %[temp18],    %[temp19]          \n\t"    \
> -+  "addu   %[" #TEMP3 "],  %[temp20],    %[" #TEMP2 "]        \n\t"    \
> -+  "subu   %[" #TEMP2 "],  %[temp20],    %[" #TEMP2 "]        \n\t"    \
> -+  "addu   %[temp20],    %[" #TEMP0 "],  %[" #TEMP1 "]        \n\t"    \
> -+  "subu   %[" #TEMP0 "],  %[" #TEMP0 "],  %[" #TEMP1 "]        \n\t"    \
> -+  "mul    %[temp16],    %[" #TEMP2 "],  %[c5352]           \n\t"    \
> -+  "mul    %[temp17],    %[" #TEMP2 "],  %[c2217]           \n\t"    \
> -+  "mul    %[temp18],    %[" #TEMP0 "],  %[c5352]           \n\t"    \
> -+  "mul    %[temp19],    %[" #TEMP0 "],  %[c2217]           \n\t"    \
> -+  "addu   %[" #TEMP1 "],  %[" #TEMP3 "],  %[temp20]          \n\t"    \
> -+  "subu   %[temp20],    %[" #TEMP3 "],  %[temp20]          \n\t"    \
> -+  "sll    %[" #TEMP0 "],  %[" #TEMP1 "],  3                  \n\t"    \
> -+  "sll    %[" #TEMP2 "],  %[temp20],    3                  \n\t"    \
> -   "addiu  %[temp16],    %[temp16],    1812               \n\t"    \
> -   "addiu  %[temp17],    %[temp17],    937                \n\t"    \
> -   "addu   %[temp16],    %[temp16],    %[temp19]          \n\t"    \
> -   "subu   %[temp17],    %[temp17],    %[temp18]          \n\t"    \
> --  "sra    %["#TEMP1"],  %[temp16],    9                  \n\t"    \
> --  "sra    %["#TEMP3"],  %[temp17],    9                  \n\t"
> -+  "sra    %[" #TEMP1 "],  %[temp16],    9                  \n\t"    \
> -+  "sra    %[" #TEMP3 "],  %[temp17],    9                  \n\t"
> - 
> - // macro for one vertical pass in FTransform
> - // temp0..temp15 holds tmp[0]..tmp[15]
> - // A..D - offsets in bytes to store to out buffer
> - // TEMP0, TEMP4, TEMP8 and TEMP12 - registers for corresponding tmp elements
> - #define VERTICAL_PASS(A, B, C, D, TEMP0, TEMP4, TEMP8, TEMP12)  \
> --  "addu   %[temp16],    %["#TEMP0"],  %["#TEMP12"]     \n\t"    \
> --  "subu   %[temp19],    %["#TEMP0"],  %["#TEMP12"]     \n\t"    \
> --  "addu   %[temp17],    %["#TEMP4"],  %["#TEMP8"]      \n\t"    \
> --  "subu   %[temp18],    %["#TEMP4"],  %["#TEMP8"]      \n\t"    \
> --  "mul    %["#TEMP8"],  %[temp19],    %[c2217]         \n\t"    \
> --  "mul    %["#TEMP12"], %[temp18],    %[c2217]         \n\t"    \
> --  "mul    %["#TEMP4"],  %[temp19],    %[c5352]         \n\t"    \
> -+  "addu   %[temp16],    %[" #TEMP0 "],  %[" #TEMP12 "]     \n\t"    \
> -+  "subu   %[temp19],    %[" #TEMP0 "],  %[" #TEMP12 "]     \n\t"    \
> -+  "addu   %[temp17],    %[" #TEMP4 "],  %[" #TEMP8 "]      \n\t"    \
> -+  "subu   %[temp18],    %[" #TEMP4 "],  %[" #TEMP8 "]      \n\t"    \
> -+  "mul    %[" #TEMP8 "],  %[temp19],    %[c2217]         \n\t"    \
> -+  "mul    %[" #TEMP12 "], %[temp18],    %[c2217]         \n\t"    \
> -+  "mul    %[" #TEMP4 "],  %[temp19],    %[c5352]         \n\t"    \
> -   "mul    %[temp18],    %[temp18],    %[c5352]         \n\t"    \
> -   "addiu  %[temp16],    %[temp16],    7                \n\t"    \
> --  "addu   %["#TEMP0"],  %[temp16],    %[temp17]        \n\t"    \
> --  "sra    %["#TEMP0"],  %["#TEMP0"],  4                \n\t"    \
> --  "addu   %["#TEMP12"], %["#TEMP12"], %["#TEMP4"]      \n\t"    \
> --  "subu   %["#TEMP4"],  %[temp16],    %[temp17]        \n\t"    \
> --  "sra    %["#TEMP4"],  %["#TEMP4"],  4                \n\t"    \
> --  "addiu  %["#TEMP8"],  %["#TEMP8"],  30000            \n\t"    \
> --  "addiu  %["#TEMP12"], %["#TEMP12"], 12000            \n\t"    \
> --  "addiu  %["#TEMP8"],  %["#TEMP8"],  21000            \n\t"    \
> --  "subu   %["#TEMP8"],  %["#TEMP8"],  %[temp18]        \n\t"    \
> --  "sra    %["#TEMP12"], %["#TEMP12"], 16               \n\t"    \
> --  "sra    %["#TEMP8"],  %["#TEMP8"],  16               \n\t"    \
> --  "addiu  %[temp16],    %["#TEMP12"], 1                \n\t"    \
> --  "movn   %["#TEMP12"], %[temp16],    %[temp19]        \n\t"    \
> --  "sh     %["#TEMP0"],  "#A"(%[temp20])                \n\t"    \
> --  "sh     %["#TEMP4"],  "#C"(%[temp20])                \n\t"    \
> --  "sh     %["#TEMP8"],  "#D"(%[temp20])                \n\t"    \
> --  "sh     %["#TEMP12"], "#B"(%[temp20])                \n\t"
> -+  "addu   %[" #TEMP0 "],  %[temp16],    %[temp17]        \n\t"    \
> -+  "sra    %[" #TEMP0 "],  %[" #TEMP0 "],  4                \n\t"    \
> -+  "addu   %[" #TEMP12 "], %[" #TEMP12 "], %[" #TEMP4 "]      \n\t"    \
> -+  "subu   %[" #TEMP4 "],  %[temp16],    %[temp17]        \n\t"    \
> -+  "sra    %[" #TEMP4 "],  %[" #TEMP4 "],  4                \n\t"    \
> -+  "addiu  %[" #TEMP8 "],  %[" #TEMP8 "],  30000            \n\t"    \
> -+  "addiu  %[" #TEMP12 "], %[" #TEMP12 "], 12000            \n\t"    \
> -+  "addiu  %[" #TEMP8 "],  %[" #TEMP8 "],  21000            \n\t"    \
> -+  "subu   %[" #TEMP8 "],  %[" #TEMP8 "],  %[temp18]        \n\t"    \
> -+  "sra    %[" #TEMP12 "], %[" #TEMP12 "], 16               \n\t"    \
> -+  "sra    %[" #TEMP8 "],  %[" #TEMP8 "],  16               \n\t"    \
> -+  "addiu  %[temp16],    %[" #TEMP12 "], 1                \n\t"    \
> -+  "movn   %[" #TEMP12 "], %[temp16],    %[temp19]        \n\t"    \
> -+  "sh     %[" #TEMP0 "],  " #A "(%[temp20])                \n\t"    \
> -+  "sh     %[" #TEMP4 "],  " #C "(%[temp20])                \n\t"    \
> -+  "sh     %[" #TEMP8 "],  " #D "(%[temp20])                \n\t"    \
> -+  "sh     %[" #TEMP12 "], " #B "(%[temp20])                \n\t"
> - 
> - static void FTransform(const uint8_t* src, const uint8_t* ref, int16_t* out) {
> -   int temp0, temp1, temp2, temp3, temp4, temp5, temp6, temp7, temp8;
> -@@ -516,14 +516,14 @@ static void FTransform(const uint8_t* src, const uint8_t* ref, int16_t* out) {
> - #if !defined(WORK_AROUND_GCC)
> - 
> - #define GET_SSE_INNER(A, B, C, D)                               \
> --  "lbu     %[temp0],    "#A"(%[a])                   \n\t"      \
> --  "lbu     %[temp1],    "#A"(%[b])                   \n\t"      \
> --  "lbu     %[temp2],    "#B"(%[a])                   \n\t"      \
> --  "lbu     %[temp3],    "#B"(%[b])                   \n\t"      \
> --  "lbu     %[temp4],    "#C"(%[a])                   \n\t"      \
> --  "lbu     %[temp5],    "#C"(%[b])                   \n\t"      \
> --  "lbu     %[temp6],    "#D"(%[a])                   \n\t"      \
> --  "lbu     %[temp7],    "#D"(%[b])                   \n\t"      \
> -+  "lbu     %[temp0],    " #A "(%[a])                   \n\t"      \
> -+  "lbu     %[temp1],    " #A "(%[b])                   \n\t"      \
> -+  "lbu     %[temp2],    " #B "(%[a])                   \n\t"      \
> -+  "lbu     %[temp3],    " #B "(%[b])                   \n\t"      \
> -+  "lbu     %[temp4],    " #C "(%[a])                   \n\t"      \
> -+  "lbu     %[temp5],    " #C "(%[b])                   \n\t"      \
> -+  "lbu     %[temp6],    " #D "(%[a])                   \n\t"      \
> -+  "lbu     %[temp7],    " #D "(%[b])                   \n\t"      \
> -   "subu    %[temp0],    %[temp0],     %[temp1]       \n\t"      \
> -   "subu    %[temp2],    %[temp2],     %[temp3]       \n\t"      \
> -   "subu    %[temp4],    %[temp4],     %[temp5]       \n\t"      \
> -diff --git a/Source/LibWebP/src/dsp/dsp.enc_mips_dsp_r2.c b/Source/LibWebP/src/dsp/dsp.enc_mips_dsp_r2.c
> -index ec58efe..1a3f968 100644
> ---- a/Source/LibWebP/src/dsp/dsp.enc_mips_dsp_r2.c
> -+++ b/Source/LibWebP/src/dsp/dsp.enc_mips_dsp_r2.c
> -@@ -27,25 +27,25 @@ static const int kC2 = 35468;
> - // I - input (macro doesn't change it)
> - #define ADD_SUB_HALVES_X4(O0, O1, O2, O3, O4, O5, O6, O7,                      \
> -                           I0, I1, I2, I3, I4, I5, I6, I7)                      \
> --  "addq.ph          %["#O0"],   %["#I0"],  %["#I1"]           \n\t"            \
> --  "subq.ph          %["#O1"],   %["#I0"],  %["#I1"]           \n\t"            \
> --  "addq.ph          %["#O2"],   %["#I2"],  %["#I3"]           \n\t"            \
> --  "subq.ph          %["#O3"],   %["#I2"],  %["#I3"]           \n\t"            \
> --  "addq.ph          %["#O4"],   %["#I4"],  %["#I5"]           \n\t"            \
> --  "subq.ph          %["#O5"],   %["#I4"],  %["#I5"]           \n\t"            \
> --  "addq.ph          %["#O6"],   %["#I6"],  %["#I7"]           \n\t"            \
> --  "subq.ph          %["#O7"],   %["#I6"],  %["#I7"]           \n\t"
> -+  "addq.ph          %[" #O0 "],   %[" #I0 "],  %[" #I1 "]           \n\t"            \
> -+  "subq.ph          %[" #O1 "],   %[" #I0 "],  %[" #I1 "]           \n\t"            \
> -+  "addq.ph          %[" #O2 "],   %[" #I2 "],  %[" #I3 "]           \n\t"            \
> -+  "subq.ph          %[" #O3 "],   %[" #I2 "],  %[" #I3 "]           \n\t"            \
> -+  "addq.ph          %[" #O4 "],   %[" #I4 "],  %[" #I5 "]           \n\t"            \
> -+  "subq.ph          %[" #O5 "],   %[" #I4 "],  %[" #I5 "]           \n\t"            \
> -+  "addq.ph          %[" #O6 "],   %[" #I6 "],  %[" #I7 "]           \n\t"            \
> -+  "subq.ph          %[" #O7 "],   %[" #I6 "],  %[" #I7 "]           \n\t"
> - 
> - // IO - input/output
> - #define ABS_X8(IO0, IO1, IO2, IO3, IO4, IO5, IO6, IO7)                         \
> --  "absq_s.ph        %["#IO0"],   %["#IO0"]                    \n\t"            \
> --  "absq_s.ph        %["#IO1"],   %["#IO1"]                    \n\t"            \
> --  "absq_s.ph        %["#IO2"],   %["#IO2"]                    \n\t"            \
> --  "absq_s.ph        %["#IO3"],   %["#IO3"]                    \n\t"            \
> --  "absq_s.ph        %["#IO4"],   %["#IO4"]                    \n\t"            \
> --  "absq_s.ph        %["#IO5"],   %["#IO5"]                    \n\t"            \
> --  "absq_s.ph        %["#IO6"],   %["#IO6"]                    \n\t"            \
> --  "absq_s.ph        %["#IO7"],   %["#IO7"]                    \n\t"
> -+  "absq_s.ph        %[" #IO0 "],   %[" #IO0 "]                    \n\t"            \
> -+  "absq_s.ph        %[" #IO1 "],   %[" #IO1 "]                    \n\t"            \
> -+  "absq_s.ph        %[" #IO2 "],   %[" #IO2 "]                    \n\t"            \
> -+  "absq_s.ph        %[" #IO3 "],   %[" #IO3 "]                    \n\t"            \
> -+  "absq_s.ph        %[" #IO4 "],   %[" #IO4 "]                    \n\t"            \
> -+  "absq_s.ph        %[" #IO5 "],   %[" #IO5 "]                    \n\t"            \
> -+  "absq_s.ph        %[" #IO6 "],   %[" #IO6 "]                    \n\t"            \
> -+  "absq_s.ph        %[" #IO7 "],   %[" #IO7 "]                    \n\t"
> - 
> - // dpa.w.ph $ac0 temp0 ,temp1
> - //  $ac += temp0[31..16] * temp1[31..16] + temp0[15..0] * temp1[15..0]
> -@@ -56,15 +56,15 @@ static const int kC2 = 35468;
> - #define MUL_HALF(O0, I0, I1, I2, I3, I4, I5, I6, I7,                           \
> -                  I8, I9, I10, I11, I12, I13, I14, I15)                         \
> -     "mult            $ac0,      $zero,     $zero              \n\t"            \
> --    "dpa.w.ph        $ac0,      %["#I2"],  %["#I0"]           \n\t"            \
> --    "dpax.w.ph       $ac0,      %["#I5"],  %["#I6"]           \n\t"            \
> --    "dpa.w.ph        $ac0,      %["#I8"],  %["#I9"]           \n\t"            \
> --    "dpax.w.ph       $ac0,      %["#I11"], %["#I4"]           \n\t"            \
> --    "dpa.w.ph        $ac0,      %["#I12"], %["#I7"]           \n\t"            \
> --    "dpax.w.ph       $ac0,      %["#I13"], %["#I1"]           \n\t"            \
> --    "dpa.w.ph        $ac0,      %["#I14"], %["#I3"]           \n\t"            \
> --    "dpax.w.ph       $ac0,      %["#I15"], %["#I10"]          \n\t"            \
> --    "mflo            %["#O0"],  $ac0                          \n\t"
> -+    "dpa.w.ph        $ac0,      %[" #I2 "],  %[" #I0 "]           \n\t"            \
> -+    "dpax.w.ph       $ac0,      %[" #I5 "],  %[" #I6 "]           \n\t"            \
> -+    "dpa.w.ph        $ac0,      %[" #I8 "],  %[" #I9 "]           \n\t"            \
> -+    "dpax.w.ph       $ac0,      %[" #I11 "], %[" #I4 "]           \n\t"            \
> -+    "dpa.w.ph        $ac0,      %[" #I12 "], %[" #I7 "]           \n\t"            \
> -+    "dpax.w.ph       $ac0,      %[" #I13 "], %[" #I1 "]           \n\t"            \
> -+    "dpa.w.ph        $ac0,      %[" #I14 "], %[" #I3 "]           \n\t"            \
> -+    "dpax.w.ph       $ac0,      %[" #I15 "], %[" #I10 "]          \n\t"            \
> -+    "mflo            %[" #O0 "],  $ac0                          \n\t"
> - 
> - #define OUTPUT_EARLY_CLOBBER_REGS_17()                                         \
> -   OUTPUT_EARLY_CLOBBER_REGS_10(),                                              \
> -@@ -77,69 +77,69 @@ static const int kC2 = 35468;
> - // A - offset in bytes to load from src and ref buffers
> - // TEMP0..TEMP3 - registers for corresponding tmp elements
> - #define HORIZONTAL_PASS(A, TEMP0, TEMP1, TEMP2, TEMP3)                         \
> --  "lw              %["#TEMP0"],   0(%[args])                        \n\t"      \
> --  "lw              %["#TEMP1"],   4(%[args])                        \n\t"      \
> --  "lw              %["#TEMP2"],   "XSTR(BPS)"*"#A"(%["#TEMP0"])     \n\t"      \
> --  "lw              %["#TEMP3"],   "XSTR(BPS)"*"#A"(%["#TEMP1"])     \n\t"      \
> --  "preceu.ph.qbl   %["#TEMP0"],   %["#TEMP2"]                       \n\t"      \
> --  "preceu.ph.qbl   %["#TEMP1"],   %["#TEMP3"]                       \n\t"      \
> --  "preceu.ph.qbr   %["#TEMP2"],   %["#TEMP2"]                       \n\t"      \
> --  "preceu.ph.qbr   %["#TEMP3"],   %["#TEMP3"]                       \n\t"      \
> --  "subq.ph         %["#TEMP0"],   %["#TEMP0"],   %["#TEMP1"]        \n\t"      \
> --  "subq.ph         %["#TEMP2"],   %["#TEMP2"],   %["#TEMP3"]        \n\t"      \
> --  "rotr            %["#TEMP0"],   %["#TEMP0"],   16                 \n\t"      \
> --  "addq.ph         %["#TEMP1"],   %["#TEMP2"],   %["#TEMP0"]        \n\t"      \
> --  "subq.ph         %["#TEMP3"],   %["#TEMP2"],   %["#TEMP0"]        \n\t"      \
> --  "seh             %["#TEMP0"],   %["#TEMP1"]                       \n\t"      \
> --  "sra             %[temp16],     %["#TEMP1"],   16                 \n\t"      \
> --  "seh             %[temp19],     %["#TEMP3"]                       \n\t"      \
> --  "sra             %["#TEMP3"],   %["#TEMP3"],   16                 \n\t"      \
> --  "subu            %["#TEMP2"],   %["#TEMP0"],   %[temp16]          \n\t"      \
> --  "addu            %["#TEMP0"],   %["#TEMP0"],   %[temp16]          \n\t"      \
> -+  "lw              %[" #TEMP0 "],   0(%[args])                        \n\t"      \
> -+  "lw              %[" #TEMP1 "],   4(%[args])                        \n\t"      \
> -+  "lw              %[" #TEMP2 "],   "XSTR(BPS)"*" #A "(%[" #TEMP0 "])     \n\t"      \
> -+  "lw              %[" #TEMP3 "],   "XSTR(BPS)"*" #A "(%[" #TEMP1 "])     \n\t"      \
> -+  "preceu.ph.qbl   %[" #TEMP0 "],   %[" #TEMP2 "]                       \n\t"      \
> -+  "preceu.ph.qbl   %[" #TEMP1 "],   %[" #TEMP3 "]                       \n\t"      \
> -+  "preceu.ph.qbr   %[" #TEMP2 "],   %[" #TEMP2 "]                       \n\t"      \
> -+  "preceu.ph.qbr   %[" #TEMP3 "],   %[" #TEMP3 "]                       \n\t"      \
> -+  "subq.ph         %[" #TEMP0 "],   %[" #TEMP0 "],   %[" #TEMP1 "]        \n\t"      \
> -+  "subq.ph         %[" #TEMP2 "],   %[" #TEMP2 "],   %[" #TEMP3 "]        \n\t"      \
> -+  "rotr            %[" #TEMP0 "],   %[" #TEMP0 "],   16                 \n\t"      \
> -+  "addq.ph         %[" #TEMP1 "],   %[" #TEMP2 "],   %[" #TEMP0 "]        \n\t"      \
> -+  "subq.ph         %[" #TEMP3 "],   %[" #TEMP2 "],   %[" #TEMP0 "]        \n\t"      \
> -+  "seh             %[" #TEMP0 "],   %[" #TEMP1 "]                       \n\t"      \
> -+  "sra             %[temp16],     %[" #TEMP1 "],   16                 \n\t"      \
> -+  "seh             %[temp19],     %[" #TEMP3 "]                       \n\t"      \
> -+  "sra             %[" #TEMP3 "],   %[" #TEMP3 "],   16                 \n\t"      \
> -+  "subu            %[" #TEMP2 "],   %[" #TEMP0 "],   %[temp16]          \n\t"      \
> -+  "addu            %[" #TEMP0 "],   %[" #TEMP0 "],   %[temp16]          \n\t"      \
> -   "mul             %[temp17],     %[temp19],     %[c2217]           \n\t"      \
> --  "mul             %[temp18],     %["#TEMP3"],   %[c5352]           \n\t"      \
> --  "mul             %["#TEMP1"],   %[temp19],     %[c5352]           \n\t"      \
> --  "mul             %[temp16],     %["#TEMP3"],   %[c2217]           \n\t"      \
> --  "sll             %["#TEMP2"],   %["#TEMP2"],   3                  \n\t"      \
> --  "sll             %["#TEMP0"],   %["#TEMP0"],   3                  \n\t"      \
> --  "subu            %["#TEMP3"],   %[temp17],     %[temp18]          \n\t"      \
> --  "addu            %["#TEMP1"],   %[temp16],     %["#TEMP1"]        \n\t"      \
> --  "addiu           %["#TEMP3"],   %["#TEMP3"],   937                \n\t"      \
> --  "addiu           %["#TEMP1"],   %["#TEMP1"],   1812               \n\t"      \
> --  "sra             %["#TEMP3"],   %["#TEMP3"],   9                  \n\t"      \
> --  "sra             %["#TEMP1"],   %["#TEMP1"],   9                  \n\t"
> -+  "mul             %[temp18],     %[" #TEMP3 "],   %[c5352]           \n\t"      \
> -+  "mul             %[" #TEMP1 "],   %[temp19],     %[c5352]           \n\t"      \
> -+  "mul             %[temp16],     %[" #TEMP3 "],   %[c2217]           \n\t"      \
> -+  "sll             %[" #TEMP2 "],   %[" #TEMP2 "],   3                  \n\t"      \
> -+  "sll             %[" #TEMP0 "],   %[" #TEMP0 "],   3                  \n\t"      \
> -+  "subu            %[" #TEMP3 "],   %[temp17],     %[temp18]          \n\t"      \
> -+  "addu            %[" #TEMP1 "],   %[temp16],     %[" #TEMP1 "]        \n\t"      \
> -+  "addiu           %[" #TEMP3 "],   %[" #TEMP3 "],   937                \n\t"      \
> -+  "addiu           %[" #TEMP1 "],   %[" #TEMP1 "],   1812               \n\t"      \
> -+  "sra             %[" #TEMP3 "],   %[" #TEMP3 "],   9                  \n\t"      \
> -+  "sra             %[" #TEMP1 "],   %[" #TEMP1 "],   9                  \n\t"
> - 
> - // macro for one vertical pass in FTransform
> - // temp0..temp15 holds tmp[0]..tmp[15]
> - // A..D - offsets in bytes to store to out buffer
> - // TEMP0, TEMP4, TEMP8 and TEMP12 - registers for corresponding tmp elements
> - #define VERTICAL_PASS(A, B, C, D, TEMP0, TEMP4, TEMP8, TEMP12)                 \
> --  "addu            %[temp16],     %["#TEMP0"],   %["#TEMP12"] \n\t"            \
> --  "subu            %[temp19],     %["#TEMP0"],   %["#TEMP12"] \n\t"            \
> --  "addu            %[temp17],     %["#TEMP4"],   %["#TEMP8"]  \n\t"            \
> --  "subu            %[temp18],     %["#TEMP4"],   %["#TEMP8"]  \n\t"            \
> --  "mul             %["#TEMP8"],   %[temp19],     %[c2217]     \n\t"            \
> --  "mul             %["#TEMP12"],  %[temp18],     %[c2217]     \n\t"            \
> --  "mul             %["#TEMP4"],   %[temp19],     %[c5352]     \n\t"            \
> -+  "addu            %[temp16],     %[" #TEMP0 "],   %[" #TEMP12 "] \n\t"            \
> -+  "subu            %[temp19],     %[" #TEMP0 "],   %[" #TEMP12 "] \n\t"            \
> -+  "addu            %[temp17],     %[" #TEMP4 "],   %[" #TEMP8 "]  \n\t"            \
> -+  "subu            %[temp18],     %[" #TEMP4 "],   %[" #TEMP8 "]  \n\t"            \
> -+  "mul             %[" #TEMP8 "],   %[temp19],     %[c2217]     \n\t"            \
> -+  "mul             %[" #TEMP12 "],  %[temp18],     %[c2217]     \n\t"            \
> -+  "mul             %[" #TEMP4 "],   %[temp19],     %[c5352]     \n\t"            \
> -   "mul             %[temp18],     %[temp18],     %[c5352]     \n\t"            \
> -   "addiu           %[temp16],     %[temp16],     7            \n\t"            \
> --  "addu            %["#TEMP0"],   %[temp16],     %[temp17]    \n\t"            \
> --  "sra             %["#TEMP0"],   %["#TEMP0"],   4            \n\t"            \
> --  "addu            %["#TEMP12"],  %["#TEMP12"],  %["#TEMP4"]  \n\t"            \
> --  "subu            %["#TEMP4"],   %[temp16],     %[temp17]    \n\t"            \
> --  "sra             %["#TEMP4"],   %["#TEMP4"],   4            \n\t"            \
> --  "addiu           %["#TEMP8"],   %["#TEMP8"],   30000        \n\t"            \
> --  "addiu           %["#TEMP12"],  %["#TEMP12"],  12000        \n\t"            \
> --  "addiu           %["#TEMP8"],   %["#TEMP8"],   21000        \n\t"            \
> --  "subu            %["#TEMP8"],   %["#TEMP8"],   %[temp18]    \n\t"            \
> --  "sra             %["#TEMP12"],  %["#TEMP12"],  16           \n\t"            \
> --  "sra             %["#TEMP8"],   %["#TEMP8"],   16           \n\t"            \
> --  "addiu           %[temp16],     %["#TEMP12"],  1            \n\t"            \
> --  "movn            %["#TEMP12"],  %[temp16],     %[temp19]    \n\t"            \
> --  "sh              %["#TEMP0"],   "#A"(%[temp20])             \n\t"            \
> --  "sh              %["#TEMP4"],   "#C"(%[temp20])             \n\t"            \
> --  "sh              %["#TEMP8"],   "#D"(%[temp20])             \n\t"            \
> --  "sh              %["#TEMP12"],  "#B"(%[temp20])             \n\t"
> -+  "addu            %[" #TEMP0 "],   %[temp16],     %[temp17]    \n\t"            \
> -+  "sra             %[" #TEMP0 "],   %[" #TEMP0 "],   4            \n\t"            \
> -+  "addu            %[" #TEMP12 "],  %[" #TEMP12 "],  %[" #TEMP4 "]  \n\t"            \
> -+  "subu            %[" #TEMP4 "],   %[temp16],     %[temp17]    \n\t"            \
> -+  "sra             %[" #TEMP4 "],   %[" #TEMP4 "],   4            \n\t"            \
> -+  "addiu           %[" #TEMP8 "],   %[" #TEMP8 "],   30000        \n\t"            \
> -+  "addiu           %[" #TEMP12 "],  %[" #TEMP12 "],  12000        \n\t"            \
> -+  "addiu           %[" #TEMP8 "],   %[" #TEMP8 "],   21000        \n\t"            \
> -+  "subu            %[" #TEMP8 "],   %[" #TEMP8 "],   %[temp18]    \n\t"            \
> -+  "sra             %[" #TEMP12 "],  %[" #TEMP12 "],  16           \n\t"            \
> -+  "sra             %[" #TEMP8 "],   %[" #TEMP8 "],   16           \n\t"            \
> -+  "addiu           %[temp16],     %[" #TEMP12 "],  1            \n\t"            \
> -+  "movn            %[" #TEMP12 "],  %[temp16],     %[temp19]    \n\t"            \
> -+  "sh              %[" #TEMP0 "],   " #A "(%[temp20])             \n\t"            \
> -+  "sh              %[" #TEMP4 "],   " #C "(%[temp20])             \n\t"            \
> -+  "sh              %[" #TEMP8 "],   " #D "(%[temp20])             \n\t"            \
> -+  "sh              %[" #TEMP12 "],  " #B "(%[temp20])             \n\t"
> - 
> - static void FTransform(const uint8_t* src, const uint8_t* ref, int16_t* out) {
> -   const int c2217 = 2217;
> -@@ -329,11 +329,11 @@ static int Disto16x16(const uint8_t* const a, const uint8_t* const b,
> - // Intra predictions
> - 
> - #define FILL_PART(J, SIZE)                                          \
> --    "usw        %[value],  0+"#J"*"XSTR(BPS)"(%[dst])    \n\t"      \
> --    "usw        %[value],  4+"#J"*"XSTR(BPS)"(%[dst])    \n\t"      \
> --  ".if "#SIZE" == 16                                     \n\t"      \
> --    "usw        %[value],  8+"#J"*"XSTR(BPS)"(%[dst])    \n\t"      \
> --    "usw        %[value], 12+"#J"*"XSTR(BPS)"(%[dst])    \n\t"      \
> -+    "usw        %[value],  0+" #J "*"XSTR(BPS)"(%[dst])    \n\t"      \
> -+    "usw        %[value],  4+" #J "*"XSTR(BPS)"(%[dst])    \n\t"      \
> -+  ".if " #SIZE " == 16                                     \n\t"      \
> -+    "usw        %[value],  8+" #J "*"XSTR(BPS)"(%[dst])    \n\t"      \
> -+    "usw        %[value], 12+" #J "*"XSTR(BPS)"(%[dst])    \n\t"      \
> -   ".endif                                                \n\t"
> - 
> - #define FILL_8_OR_16(DST, VALUE, SIZE) do {                         \
> -@@ -348,7 +348,7 @@ static int Disto16x16(const uint8_t* const a, const uint8_t* const b,
> -     FILL_PART( 5, SIZE)                                             \
> -     FILL_PART( 6, SIZE)                                             \
> -     FILL_PART( 7, SIZE)                                             \
> --  ".if "#SIZE" == 16                                     \n\t"      \
> -+  ".if " #SIZE " == 16                                     \n\t"      \
> -     FILL_PART( 8, 16)                                               \
> -     FILL_PART( 9, 16)                                               \
> -     FILL_PART(10, 16)                                               \
> -@@ -425,7 +425,7 @@ HORIZONTAL_PRED(dst, left, 16)
> -     CLIPPING()                                                                 \
> -     "usw             %[temp0],   0(%[dst])               \n\t"                 \
> -     "usw             %[temp1],   4(%[dst])               \n\t"                 \
> --  ".if "#SIZE" == 16                                     \n\t"                 \
> -+  ".if " #SIZE " == 16                                     \n\t"                 \
> -     "ulw             %[temp0],   8(%[top])               \n\t"                 \
> -     "ulw             %[temp1],   12(%[top])              \n\t"                 \
> -     CLIPPING()                                                                 \
> -@@ -1060,8 +1060,8 @@ static void Intra4Preds(uint8_t* dst, const uint8_t* top) {
> - #if !defined(WORK_AROUND_GCC)
> - 
> - #define GET_SSE_INNER(A)                                                  \
> --  "lw               %[temp0],    "#A"(%[a])                    \n\t"      \
> --  "lw               %[temp1],    "#A"(%[b])                    \n\t"      \
> -+  "lw               %[temp0],    " #A "(%[a])                    \n\t"      \
> -+  "lw               %[temp1],    " #A "(%[b])                    \n\t"      \
> -   "preceu.ph.qbr    %[temp2],    %[temp0]                      \n\t"      \
> -   "preceu.ph.qbl    %[temp0],    %[temp0]                      \n\t"      \
> -   "preceu.ph.qbr    %[temp3],    %[temp1]                      \n\t"      \
> -@@ -1185,28 +1185,28 @@ static int SSE4x4(const uint8_t* a, const uint8_t* b) {
> - // N - offset in bytes (n * 2)
> - // N1 - offset in bytes ((n + 1) * 2)
> - #define QUANTIZE_ONE(J, K, N, N1)                                         \
> --  "ulw         %[temp1],     "#J"(%[ppin])                   \n\t"        \
> --  "ulw         %[temp2],     "#J"(%[ppsharpen])              \n\t"        \
> --  "lhu         %[temp3],     "#K"(%[ppzthresh])              \n\t"        \
> --  "lhu         %[temp6],     "#K"+4(%[ppzthresh])            \n\t"        \
> -+  "ulw         %[temp1],     " #J "(%[ppin])                   \n\t"        \
> -+  "ulw         %[temp2],     " #J "(%[ppsharpen])              \n\t"        \
> -+  "lhu         %[temp3],     " #K "(%[ppzthresh])              \n\t"        \
> -+  "lhu         %[temp6],     " #K "+4(%[ppzthresh])            \n\t"        \
> -   "absq_s.ph   %[temp4],     %[temp1]                        \n\t"        \
> -   "ins         %[temp3],     %[temp6],         16,       16  \n\t"        \
> -   "addu.ph     %[coeff],     %[temp4],         %[temp2]      \n\t"        \
> -   "shra.ph     %[sign],      %[temp1],         15            \n\t"        \
> -   "li          %[level],     0x10001                         \n\t"        \
> -   "cmp.lt.ph   %[temp3],     %[coeff]                        \n\t"        \
> --  "lhu         %[temp1],     "#J"(%[ppiq])                   \n\t"        \
> -+  "lhu         %[temp1],     " #J "(%[ppiq])                   \n\t"        \
> -   "pick.ph     %[temp5],     %[level],         $0            \n\t"        \
> --  "lw          %[temp2],     "#K"(%[ppbias])                 \n\t"        \
> -+  "lw          %[temp2],     " #K "(%[ppbias])                 \n\t"        \
> -   "beqz        %[temp5],     0f                              \n\t"        \
> --  "lhu         %[temp3],     "#J"(%[ppq])                    \n\t"        \
> -+  "lhu         %[temp3],     " #J "(%[ppq])                    \n\t"        \
> -   "beq         %[temp5],     %[level],         1f            \n\t"        \
> -   "andi        %[temp5],     %[temp5],         0x1           \n\t"        \
> -   "andi        %[temp4],     %[coeff],         0xffff        \n\t"        \
> -   "beqz        %[temp5],     2f                              \n\t"        \
> -   "mul         %[level],     %[temp4],         %[temp1]      \n\t"        \
> --  "sh          $0,           "#J"+2(%[ppin])                 \n\t"        \
> --  "sh          $0,           "#N1"(%[pout])                  \n\t"        \
> -+  "sh          $0,           " #J "+2(%[ppin])                 \n\t"        \
> -+  "sh          $0,           " #N1 "(%[pout])                  \n\t"        \
> -   "addu        %[level],     %[level],         %[temp2]      \n\t"        \
> -   "sra         %[level],     %[level],         17            \n\t"        \
> -   "slt         %[temp4],     %[max_level],     %[level]      \n\t"        \
> -@@ -1216,15 +1216,15 @@ static int SSE4x4(const uint8_t* a, const uint8_t* b) {
> -   "subu        %[level],     %[level],         %[temp6]      \n\t"        \
> -   "mul         %[temp5],     %[level],         %[temp3]      \n\t"        \
> -   "or          %[ret],       %[ret],           %[level]      \n\t"        \
> --  "sh          %[level],     "#N"(%[pout])                   \n\t"        \
> --  "sh          %[temp5],     "#J"(%[ppin])                   \n\t"        \
> -+  "sh          %[level],     " #N "(%[pout])                   \n\t"        \
> -+  "sh          %[temp5],     " #J "(%[ppin])                   \n\t"        \
> -   "j           3f                                            \n\t"        \
> - "2:                                                          \n\t"        \
> --  "lhu         %[temp1],     "#J"+2(%[ppiq])                 \n\t"        \
> -+  "lhu         %[temp1],     " #J "+2(%[ppiq])                 \n\t"        \
> -   "srl         %[temp5],     %[coeff],         16            \n\t"        \
> -   "mul         %[level],     %[temp5],         %[temp1]      \n\t"        \
> --  "lw          %[temp2],     "#K"+4(%[ppbias])               \n\t"        \
> --  "lhu         %[temp3],     "#J"+2(%[ppq])                  \n\t"        \
> -+  "lw          %[temp2],     " #K "+4(%[ppbias])               \n\t"        \
> -+  "lhu         %[temp3],     " #J "+2(%[ppq])                  \n\t"        \
> -   "addu        %[level],     %[level],         %[temp2]      \n\t"        \
> -   "sra         %[level],     %[level],         17            \n\t"        \
> -   "srl         %[temp6],     %[sign],          16            \n\t"        \
> -@@ -1233,20 +1233,20 @@ static int SSE4x4(const uint8_t* a, const uint8_t* b) {
> -   "xor         %[level],     %[level],         %[temp6]      \n\t"        \
> -   "subu        %[level],     %[level],         %[temp6]      \n\t"        \
> -   "mul         %[temp5],     %[level],         %[temp3]      \n\t"        \
> --  "sh          $0,           "#J"(%[ppin])                   \n\t"        \
> --  "sh          $0,           "#N"(%[pout])                   \n\t"        \
> -+  "sh          $0,           " #J "(%[ppin])                   \n\t"        \
> -+  "sh          $0,           " #N "(%[pout])                   \n\t"        \
> -   "or          %[ret],       %[ret],           %[level]      \n\t"        \
> --  "sh          %[temp5],     "#J"+2(%[ppin])                 \n\t"        \
> --  "sh          %[level],     "#N1"(%[pout])                  \n\t"        \
> -+  "sh          %[temp5],     " #J "+2(%[ppin])                 \n\t"        \
> -+  "sh          %[level],     " #N1 "(%[pout])                  \n\t"        \
> -   "j           3f                                            \n\t"        \
> - "1:                                                          \n\t"        \
> --  "lhu         %[temp1],     "#J"(%[ppiq])                   \n\t"        \
> --  "lw          %[temp2],     "#K"(%[ppbias])                 \n\t"        \
> --  "ulw         %[temp3],     "#J"(%[ppq])                    \n\t"        \
> -+  "lhu         %[temp1],     " #J "(%[ppiq])                   \n\t"        \
> -+  "lw          %[temp2],     " #K "(%[ppbias])                 \n\t"        \
> -+  "ulw         %[temp3],     " #J "(%[ppq])                    \n\t"        \
> -   "andi        %[temp5],     %[coeff],         0xffff        \n\t"        \
> -   "srl         %[temp0],     %[coeff],         16            \n\t"        \
> --  "lhu         %[temp6],     "#J"+2(%[ppiq])                 \n\t"        \
> --  "lw          %[coeff],     "#K"+4(%[ppbias])               \n\t"        \
> -+  "lhu         %[temp6],     " #J "+2(%[ppiq])                 \n\t"        \
> -+  "lw          %[coeff],     " #K "+4(%[ppbias])               \n\t"        \
> -   "mul         %[level],     %[temp5],         %[temp1]      \n\t"        \
> -   "mul         %[temp4],     %[temp0],         %[temp6]      \n\t"        \
> -   "addu        %[level],     %[level],         %[temp2]      \n\t"        \
> -@@ -1259,15 +1259,15 @@ static int SSE4x4(const uint8_t* a, const uint8_t* b) {
> -   "subu.ph     %[level],     %[level],         %[sign]       \n\t"        \
> -   "mul.ph      %[temp3],     %[level],         %[temp3]      \n\t"        \
> -   "or          %[ret],       %[ret],           %[level]      \n\t"        \
> --  "sh          %[level],     "#N"(%[pout])                   \n\t"        \
> -+  "sh          %[level],     " #N "(%[pout])                   \n\t"        \
> -   "srl         %[level],     %[level],         16            \n\t"        \
> --  "sh          %[level],     "#N1"(%[pout])                  \n\t"        \
> --  "usw         %[temp3],     "#J"(%[ppin])                   \n\t"        \
> -+  "sh          %[level],     " #N1 "(%[pout])                  \n\t"        \
> -+  "usw         %[temp3],     " #J "(%[ppin])                   \n\t"        \
> -   "j           3f                                            \n\t"        \
> - "0:                                                          \n\t"        \
> --  "sh          $0,           "#N"(%[pout])                   \n\t"        \
> --  "sh          $0,           "#N1"(%[pout])                  \n\t"        \
> --  "usw         $0,           "#J"(%[ppin])                   \n\t"        \
> -+  "sh          $0,           " #N "(%[pout])                   \n\t"        \
> -+  "sh          $0,           " #N1 "(%[pout])                  \n\t"        \
> -+  "usw         $0,           " #J "(%[ppin])                   \n\t"        \
> - "3:                                                          \n\t"
> - 
> - static int QuantizeBlock(int16_t in[16], int16_t out[16],
> -@@ -1326,37 +1326,37 @@ static int Quantize2Blocks(int16_t in[32], int16_t out[32],
> - // A, B, C, D - offset in bytes to load from in buffer
> - // TEMP0, TEMP1 - registers for corresponding tmp elements
> - #define HORIZONTAL_PASS_WHT(A, B, C, D, TEMP0, TEMP1)                          \
> --  "lh              %["#TEMP0"],  "#A"(%[in])                \n\t"              \
> --  "lh              %["#TEMP1"],  "#B"(%[in])                \n\t"              \
> --  "lh              %[temp8],     "#C"(%[in])                \n\t"              \
> --  "lh              %[temp9],     "#D"(%[in])                \n\t"              \
> --  "ins             %["#TEMP1"],  %["#TEMP0"],  16,  16      \n\t"              \
> -+  "lh              %[" #TEMP0 "],  " #A "(%[in])                \n\t"              \
> -+  "lh              %[" #TEMP1 "],  " #B "(%[in])                \n\t"              \
> -+  "lh              %[temp8],     " #C "(%[in])                \n\t"              \
> -+  "lh              %[temp9],     " #D "(%[in])                \n\t"              \
> -+  "ins             %[" #TEMP1 "],  %[" #TEMP0 "],  16,  16      \n\t"              \
> -   "ins             %[temp9],     %[temp8],     16,  16      \n\t"              \
> --  "subq.ph         %[temp8],     %["#TEMP1"],  %[temp9]     \n\t"              \
> --  "addq.ph         %[temp9],     %["#TEMP1"],  %[temp9]     \n\t"              \
> --  "precrq.ph.w     %["#TEMP0"],  %[temp8],     %[temp9]     \n\t"              \
> -+  "subq.ph         %[temp8],     %[" #TEMP1 "],  %[temp9]     \n\t"              \
> -+  "addq.ph         %[temp9],     %[" #TEMP1 "],  %[temp9]     \n\t"              \
> -+  "precrq.ph.w     %[" #TEMP0 "],  %[temp8],     %[temp9]     \n\t"              \
> -   "append          %[temp8],     %[temp9],     16           \n\t"              \
> --  "subq.ph         %["#TEMP1"],  %["#TEMP0"],  %[temp8]     \n\t"              \
> --  "addq.ph         %["#TEMP0"],  %["#TEMP0"],  %[temp8]     \n\t"              \
> --  "rotr            %["#TEMP1"],  %["#TEMP1"],  16           \n\t"
> -+  "subq.ph         %[" #TEMP1 "],  %[" #TEMP0 "],  %[temp8]     \n\t"              \
> -+  "addq.ph         %[" #TEMP0 "],  %[" #TEMP0 "],  %[temp8]     \n\t"              \
> -+  "rotr            %[" #TEMP1 "],  %[" #TEMP1 "],  16           \n\t"
> - 
> - // macro for one vertical pass in FTransformWHT
> - // temp0..temp7 holds tmp[0]..tmp[15]
> - // A, B, C, D - offsets in bytes to store to out buffer
> - // TEMP0, TEMP2, TEMP4 and TEMP6 - registers for corresponding tmp elements
> - #define VERTICAL_PASS_WHT(A, B, C, D, TEMP0, TEMP2, TEMP4, TEMP6)              \
> --  "addq.ph         %[temp8],     %["#TEMP0"],  %["#TEMP4"]  \n\t"              \
> --  "addq.ph         %[temp9],     %["#TEMP2"],  %["#TEMP6"]  \n\t"              \
> --  "subq.ph         %["#TEMP2"],  %["#TEMP2"],  %["#TEMP6"]  \n\t"              \
> --  "subq.ph         %["#TEMP6"],  %["#TEMP0"],  %["#TEMP4"]  \n\t"              \
> --  "addqh.ph        %["#TEMP0"],  %[temp8],     %[temp9]     \n\t"              \
> --  "subqh.ph        %["#TEMP4"],  %["#TEMP6"],  %["#TEMP2"]  \n\t"              \
> --  "addqh.ph        %["#TEMP2"],  %["#TEMP2"],  %["#TEMP6"]  \n\t"              \
> --  "subqh.ph        %["#TEMP6"],  %[temp8],     %[temp9]     \n\t"              \
> --  "usw             %["#TEMP0"],  "#A"(%[out])               \n\t"              \
> --  "usw             %["#TEMP2"],  "#B"(%[out])               \n\t"              \
> --  "usw             %["#TEMP4"],  "#C"(%[out])               \n\t"              \
> --  "usw             %["#TEMP6"],  "#D"(%[out])               \n\t"
> -+  "addq.ph         %[temp8],     %[" #TEMP0 "],  %[" #TEMP4 "]  \n\t"              \
> -+  "addq.ph         %[temp9],     %[" #TEMP2 "],  %[" #TEMP6 "]  \n\t"              \
> -+  "subq.ph         %[" #TEMP2 "],  %[" #TEMP2 "],  %[" #TEMP6 "]  \n\t"              \
> -+  "subq.ph         %[" #TEMP6 "],  %[" #TEMP0 "],  %[" #TEMP4 "]  \n\t"              \
> -+  "addqh.ph        %[" #TEMP0 "],  %[temp8],     %[temp9]     \n\t"              \
> -+  "subqh.ph        %[" #TEMP4 "],  %[" #TEMP6 "],  %[" #TEMP2 "]  \n\t"              \
> -+  "addqh.ph        %[" #TEMP2 "],  %[" #TEMP2 "],  %[" #TEMP6 "]  \n\t"              \
> -+  "subqh.ph        %[" #TEMP6 "],  %[temp8],     %[temp9]     \n\t"              \
> -+  "usw             %[" #TEMP0 "],  " #A "(%[out])               \n\t"              \
> -+  "usw             %[" #TEMP2 "],  " #B "(%[out])               \n\t"              \
> -+  "usw             %[" #TEMP4 "],  " #C "(%[out])               \n\t"              \
> -+  "usw             %[" #TEMP6 "],  " #D "(%[out])               \n\t"
> - 
> - static void FTransformWHT(const int16_t* in, int16_t* out) {
> -   int temp0, temp1, temp2, temp3, temp4;
> -@@ -1385,10 +1385,10 @@ static void FTransformWHT(const int16_t* in, int16_t* out) {
> - // convert 8 coeffs at time
> - // A, B, C, D - offsets in bytes to load from out buffer
> - #define CONVERT_COEFFS_TO_BIN(A, B, C, D)                                      \
> --  "ulw        %[temp0],  "#A"(%[out])                  \n\t"                   \
> --  "ulw        %[temp1],  "#B"(%[out])                  \n\t"                   \
> --  "ulw        %[temp2],  "#C"(%[out])                  \n\t"                   \
> --  "ulw        %[temp3],  "#D"(%[out])                  \n\t"                   \
> -+  "ulw        %[temp0],  " #A "(%[out])                  \n\t"                   \
> -+  "ulw        %[temp1],  " #B "(%[out])                  \n\t"                   \
> -+  "ulw        %[temp2],  " #C "(%[out])                  \n\t"                   \
> -+  "ulw        %[temp3],  " #D "(%[out])                  \n\t"                   \
> -   "absq_s.ph  %[temp0],  %[temp0]                      \n\t"                   \
> -   "absq_s.ph  %[temp1],  %[temp1]                      \n\t"                   \
> -   "absq_s.ph  %[temp2],  %[temp2]                      \n\t"                   \
> -diff --git a/Source/LibWebP/src/dsp/dsp.filters_mips_dsp_r2.c b/Source/LibWebP/src/dsp/dsp.filters_mips_dsp_r2.c
> -index 6c34efb..6a1f8f4 100644
> ---- a/Source/LibWebP/src/dsp/dsp.filters_mips_dsp_r2.c
> -+++ b/Source/LibWebP/src/dsp/dsp.filters_mips_dsp_r2.c
> -@@ -48,7 +48,7 @@
> -       "srl       %[temp0],    %[length],    0x2         \n\t"                  \
> -       "beqz      %[temp0],    4f                        \n\t"                  \
> -       " andi     %[temp6],    %[length],    0x3         \n\t"                  \
> --    ".if "#INVERSE"                                     \n\t"                  \
> -+    ".if " #INVERSE "                                     \n\t"                  \
> -       "lbu       %[temp1],    -1(%[src])                \n\t"                  \
> -     "1:                                                 \n\t"                  \
> -       "lbu       %[temp2],    0(%[src])                 \n\t"                  \
> -@@ -84,7 +84,7 @@
> -       "lbu       %[temp1],    -1(%[src])                \n\t"                  \
> -       "lbu       %[temp2],    0(%[src])                 \n\t"                  \
> -       "addiu     %[src],      %[src],       1           \n\t"                  \
> --    ".if "#INVERSE"                                     \n\t"                  \
> -+    ".if " #INVERSE "                                     \n\t"                  \
> -       "addu      %[temp3],    %[temp1],     %[temp2]    \n\t"                  \
> -       "sb        %[temp3],    -1(%[src])                \n\t"                  \
> -     ".else                                              \n\t"                  \
> -@@ -131,7 +131,7 @@ static WEBP_INLINE void PredictLine(const uint8_t* src, uint8_t* dst,
> -       "ulw       %[temp3],    4(%[src])                 \n\t"                  \
> -       "ulw       %[temp4],    4(%[pred])                \n\t"                  \
> -       "addiu     %[src],      %[src],       8           \n\t"                  \
> --    ".if "#INVERSE"                                     \n\t"                  \
> -+    ".if " #INVERSE "                                     \n\t"                  \
> -       "addu.qb   %[temp5],    %[temp1],     %[temp2]    \n\t"                  \
> -       "addu.qb   %[temp6],    %[temp3],     %[temp4]    \n\t"                  \
> -     ".else                                              \n\t"                  \
> -@@ -152,7 +152,7 @@ static WEBP_INLINE void PredictLine(const uint8_t* src, uint8_t* dst,
> -       "lbu       %[temp2],    0(%[pred])                \n\t"                  \
> -       "addiu     %[src],      %[src],       1           \n\t"                  \
> -       "addiu     %[pred],     %[pred],      1           \n\t"                  \
> --    ".if "#INVERSE"                                     \n\t"                  \
> -+    ".if " #INVERSE "                                     \n\t"                  \
> -       "addu      %[temp3],    %[temp1],     %[temp2]    \n\t"                  \
> -     ".else                                              \n\t"                  \
> -       "subu      %[temp3],    %[temp1],     %[temp2]    \n\t"                  \
> -@@ -177,7 +177,7 @@ static WEBP_INLINE void PredictLine(const uint8_t* src, uint8_t* dst,
> -     __asm__ volatile (                                                         \
> -       "lbu       %[temp1],   0(%[src])               \n\t"                     \
> -       "lbu       %[temp2],   0(%[pred])              \n\t"                     \
> --    ".if "#INVERSE"                                  \n\t"                     \
> -+    ".if " #INVERSE "                                  \n\t"                     \
> -       "addu      %[temp3],   %[temp1],   %[temp2]    \n\t"                     \
> -     ".else                                           \n\t"                     \
> -       "subu      %[temp3],   %[temp1],   %[temp2]    \n\t"                     \
> -diff --git a/Source/LibWebP/src/dsp/dsp.lossless_mips32.c b/Source/LibWebP/src/dsp/dsp.lossless_mips32.c
> -index 68fbe85..abe97c1 100644
> ---- a/Source/LibWebP/src/dsp/dsp.lossless_mips32.c
> -+++ b/Source/LibWebP/src/dsp/dsp.lossless_mips32.c
> -@@ -285,28 +285,28 @@ static VP8LStreaks HuffmanCostCombinedCount(const uint32_t* X,
> - // literal_ and successive histograms could be unaligned
> - // so we must use ulw and usw
> - #define ADD_TO_OUT(A, B, C, D, E, P0, P1, P2)           \
> --    "ulw    %[temp0], "#A"(%["#P0"])        \n\t"       \
> --    "ulw    %[temp1], "#B"(%["#P0"])        \n\t"       \
> --    "ulw    %[temp2], "#C"(%["#P0"])        \n\t"       \
> --    "ulw    %[temp3], "#D"(%["#P0"])        \n\t"       \
> --    "ulw    %[temp4], "#A"(%["#P1"])        \n\t"       \
> --    "ulw    %[temp5], "#B"(%["#P1"])        \n\t"       \
> --    "ulw    %[temp6], "#C"(%["#P1"])        \n\t"       \
> --    "ulw    %[temp7], "#D"(%["#P1"])        \n\t"       \
> -+    "ulw    %[temp0], " #A "(%[" #P0 "])        \n\t"       \
> -+    "ulw    %[temp1], " #B "(%[" #P0 "])        \n\t"       \
> -+    "ulw    %[temp2], " #C "(%[" #P0 "])        \n\t"       \
> -+    "ulw    %[temp3], " #D "(%[" #P0 "])        \n\t"       \
> -+    "ulw    %[temp4], " #A "(%[" #P1 "])        \n\t"       \
> -+    "ulw    %[temp5], " #B "(%[" #P1 "])        \n\t"       \
> -+    "ulw    %[temp6], " #C "(%[" #P1 "])        \n\t"       \
> -+    "ulw    %[temp7], " #D "(%[" #P1 "])        \n\t"       \
> -     "addu   %[temp4], %[temp4],   %[temp0]  \n\t"       \
> -     "addu   %[temp5], %[temp5],   %[temp1]  \n\t"       \
> -     "addu   %[temp6], %[temp6],   %[temp2]  \n\t"       \
> -     "addu   %[temp7], %[temp7],   %[temp3]  \n\t"       \
> --    "addiu  %["#P0"],  %["#P0"],  16        \n\t"       \
> --  ".if "#E" == 1                            \n\t"       \
> --    "addiu  %["#P1"],  %["#P1"],  16        \n\t"       \
> -+    "addiu  %[" #P0 "],  %[" #P0 "],  16        \n\t"       \
> -+  ".if " #E " == 1                            \n\t"       \
> -+    "addiu  %[" #P1 "],  %[" #P1 "],  16        \n\t"       \
> -   ".endif                                   \n\t"       \
> --    "usw    %[temp4], "#A"(%["#P2"])        \n\t"       \
> --    "usw    %[temp5], "#B"(%["#P2"])        \n\t"       \
> --    "usw    %[temp6], "#C"(%["#P2"])        \n\t"       \
> --    "usw    %[temp7], "#D"(%["#P2"])        \n\t"       \
> --    "addiu  %["#P2"], %["#P2"],   16        \n\t"       \
> --    "bne    %["#P0"], %[LoopEnd], 1b        \n\t"       \
> -+    "usw    %[temp4], " #A "(%[" #P2 "])        \n\t"       \
> -+    "usw    %[temp5], " #B "(%[" #P2 "])        \n\t"       \
> -+    "usw    %[temp6], " #C "(%[" #P2 "])        \n\t"       \
> -+    "usw    %[temp7], " #D "(%[" #P2 "])        \n\t"       \
> -+    "addiu  %[" #P2 "], %[" #P2 "],   16        \n\t"       \
> -+    "bne    %[" #P0 "], %[LoopEnd], 1b        \n\t"       \
> -     ".set   pop                             \n\t"       \
> - 
> - #define ASM_END_COMMON_0                                \
> -diff --git a/Source/LibWebP/src/dsp/dsp.lossless_mips_dsp_r2.c b/Source/LibWebP/src/dsp/dsp.lossless_mips_dsp_r2.c
> -index 821cda9..31ac181 100644
> ---- a/Source/LibWebP/src/dsp/dsp.lossless_mips_dsp_r2.c
> -+++ b/Source/LibWebP/src/dsp/dsp.lossless_mips_dsp_r2.c
> -@@ -29,14 +29,14 @@ static void FUNC_NAME(const TYPE* src,                                         \
> -     for (x = 0; x < (width >> 2); ++x) {                                       \
> -       int tmp1, tmp2, tmp3, tmp4;                                              \
> -       __asm__ volatile (                                                       \
> --      ".ifc        "#TYPE",  uint8_t                    \n\t"                  \
> -+      ".ifc        " #TYPE ",  uint8_t                    \n\t"                  \
> -         "lbu       %[tmp1],  0(%[src])                  \n\t"                  \
> -         "lbu       %[tmp2],  1(%[src])                  \n\t"                  \
> -         "lbu       %[tmp3],  2(%[src])                  \n\t"                  \
> -         "lbu       %[tmp4],  3(%[src])                  \n\t"                  \
> -         "addiu     %[src],   %[src],      4             \n\t"                  \
> -       ".endif                                           \n\t"                  \
> --      ".ifc        "#TYPE",  uint32_t                   \n\t"                  \
> -+      ".ifc        " #TYPE ",  uint32_t                   \n\t"                  \
> -         "lw        %[tmp1],  0(%[src])                  \n\t"                  \
> -         "lw        %[tmp2],  4(%[src])                  \n\t"                  \
> -         "lw        %[tmp3],  8(%[src])                  \n\t"                  \
> -@@ -55,7 +55,7 @@ static void FUNC_NAME(const TYPE* src,                                         \
> -         "lwx       %[tmp2],  %[tmp2](%[color_map])      \n\t"                  \
> -         "lwx       %[tmp3],  %[tmp3](%[color_map])      \n\t"                  \
> -         "lwx       %[tmp4],  %[tmp4](%[color_map])      \n\t"                  \
> --      ".ifc        "#TYPE",  uint8_t                    \n\t"                  \
> -+      ".ifc        " #TYPE ",  uint8_t                    \n\t"                  \
> -         "ext       %[tmp1],  %[tmp1],     8,        8   \n\t"                  \
> -         "ext       %[tmp2],  %[tmp2],     8,        8   \n\t"                  \
> -         "ext       %[tmp3],  %[tmp3],     8,        8   \n\t"                  \
> -@@ -66,7 +66,7 @@ static void FUNC_NAME(const TYPE* src,                                         \
> -         "sb        %[tmp4],  3(%[dst])                  \n\t"                  \
> -         "addiu     %[dst],   %[dst],      4             \n\t"                  \
> -       ".endif                                           \n\t"                  \
> --      ".ifc        "#TYPE",  uint32_t                   \n\t"                  \
> -+      ".ifc        " #TYPE ",  uint32_t                   \n\t"                  \
> -         "sw        %[tmp1],  0(%[dst])                  \n\t"                  \
> -         "sw        %[tmp2],  4(%[dst])                  \n\t"                  \
> -         "sw        %[tmp3],  8(%[dst])                  \n\t"                  \
> -diff --git a/Source/LibWebP/src/dsp/dsp.upsampling_mips_dsp_r2.c b/Source/LibWebP/src/dsp/dsp.upsampling_mips_dsp_r2.c
> -index a7864a0..cb3adfe 100644
> ---- a/Source/LibWebP/src/dsp/dsp.upsampling_mips_dsp_r2.c
> -+++ b/Source/LibWebP/src/dsp/dsp.upsampling_mips_dsp_r2.c
> -@@ -34,15 +34,15 @@
> -     G = G - t2 + kGCst;                                                        \
> -     B = B + kBCst;                                                             \
> -     __asm__ volatile (                                                         \
> --      "shll_s.w         %["#R"],      %["#R"],        9              \n\t"     \
> --      "shll_s.w         %["#G"],      %["#G"],        9              \n\t"     \
> --      "shll_s.w         %["#B"],      %["#B"],        9              \n\t"     \
> --      "precrqu_s.qb.ph  %["#R"],      %["#R"],        $zero          \n\t"     \
> --      "precrqu_s.qb.ph  %["#G"],      %["#G"],        $zero          \n\t"     \
> --      "precrqu_s.qb.ph  %["#B"],      %["#B"],        $zero          \n\t"     \
> --      "srl              %["#R"],      %["#R"],        24             \n\t"     \
> --      "srl              %["#G"],      %["#G"],        24             \n\t"     \
> --      "srl              %["#B"],      %["#B"],        24             \n\t"     \
> -+      "shll_s.w         %[" #R "],      %[" #R "],        9              \n\t"     \
> -+      "shll_s.w         %[" #G "],      %[" #G "],        9              \n\t"     \
> -+      "shll_s.w         %[" #B "],      %[" #B "],        9              \n\t"     \
> -+      "precrqu_s.qb.ph  %[" #R "],      %[" #R "],        $zero          \n\t"     \
> -+      "precrqu_s.qb.ph  %[" #G "],      %[" #G "],        $zero          \n\t"     \
> -+      "precrqu_s.qb.ph  %[" #B "],      %[" #B "],        $zero          \n\t"     \
> -+      "srl              %[" #R "],      %[" #R "],        24             \n\t"     \
> -+      "srl              %[" #G "],      %[" #G "],        24             \n\t"     \
> -+      "srl              %[" #B "],      %[" #B "],        24             \n\t"     \
> -       : [R]"+r"(R), [G]"+r"(G), [B]"+r"(B)                                     \
> -       :                                                                        \
> -     );                                                                         \
> -diff --git a/Source/LibWebP/src/dsp/dsp.yuv_mips_dsp_r2.c b/Source/LibWebP/src/dsp/dsp.yuv_mips_dsp_r2.c
> -index 66adde5..51cbe9e 100644
> ---- a/Source/LibWebP/src/dsp/dsp.yuv_mips_dsp_r2.c
> -+++ b/Source/LibWebP/src/dsp/dsp.yuv_mips_dsp_r2.c
> -@@ -39,12 +39,12 @@
> -   "addu             %[temp5],   %[temp0],       %[temp1]        \n\t"          \
> -   "subu             %[temp6],   %[temp0],       %[temp2]        \n\t"          \
> -   "addu             %[temp7],   %[temp0],       %[temp4]        \n\t"          \
> --".if "#K"                                                       \n\t"          \
> -+".if " #K "                                                       \n\t"          \
> -   "lbu              %[temp0],   1(%[y])                         \n\t"          \
> - ".endif                                                         \n\t"          \
> -   "shll_s.w         %[temp5],   %[temp5],       9               \n\t"          \
> -   "shll_s.w         %[temp6],   %[temp6],       9               \n\t"          \
> --".if "#K"                                                       \n\t"          \
> -+".if " #K "                                                       \n\t"          \
> -   "mul              %[temp0],   %[t_con_5],     %[temp0]        \n\t"          \
> - ".endif                                                         \n\t"          \
> -   "shll_s.w         %[temp7],   %[temp7],       9               \n\t"          \
> -@@ -54,9 +54,9 @@
> -   "srl              %[temp5],   %[temp5],       24              \n\t"          \
> -   "srl              %[temp6],   %[temp6],       24              \n\t"          \
> -   "srl              %[temp7],   %[temp7],       24              \n\t"          \
> --  "sb               %[temp5],   "#R"(%[dst])                    \n\t"          \
> --  "sb               %[temp6],   "#G"(%[dst])                    \n\t"          \
> --  "sb               %[temp7],   "#B"(%[dst])                    \n\t"          \
> -+  "sb               %[temp5],   " #R "(%[dst])                    \n\t"          \
> -+  "sb               %[temp6],   " #G "(%[dst])                    \n\t"          \
> -+  "sb               %[temp7],   " #B "(%[dst])                    \n\t"          \
> - 
> - #define ASM_CLOBBER_LIST()                                                     \
> -   : [temp0]"=&r"(temp0), [temp1]"=&r"(temp1), [temp2]"=&r"(temp2),             \
> --- 
> -2.1.4
> -
> diff --git a/package/libfreeimage/0003-fix-big-endian-os.patch b/package/libfreeimage/0003-fix-big-endian-os.patch
> new file mode 100644
> index 0000000000..e0d4e921ca
> --- /dev/null
> +++ b/package/libfreeimage/0003-fix-big-endian-os.patch
> @@ -0,0 +1,64 @@
> +fixed PluginBMP, PluginDDS for compilation under Big Endian OS
> +
> +Downloaded from upstream commit:
> +https://sourceforge.net/p/freeimage/svn/1809/
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +
> +diff -uNr FreeImage.orig/Source/FreeImage/PluginBMP.cpp FreeImage/Source/FreeImage/PluginBMP.cpp
> +--- FreeImage.orig/Source/FreeImage/PluginBMP.cpp	2016-06-15 12:35:30.000000000 +0200
> ++++ FreeImage/Source/FreeImage/PluginBMP.cpp	2019-08-31 16:00:27.813378612 +0200
> +@@ -518,7 +518,7 @@
> + 				io->read_proc(FreeImage_GetPalette(dib), used_colors * sizeof(RGBQUAD), 1, handle);
> + #if FREEIMAGE_COLORORDER == FREEIMAGE_COLORORDER_RGB
> + 				RGBQUAD *pal = FreeImage_GetPalette(dib);
> +-				for(int i = 0; i < used_colors; i++) {
> ++				for(unsigned int i = 0; i < used_colors; i++) {
> + 					INPLACESWAP(pal[i].rgbRed, pal[i].rgbBlue);
> + 				}
> + #endif
> +@@ -1419,7 +1419,7 @@
> + 
> + 			free(buffer);
> + #ifdef FREEIMAGE_BIGENDIAN
> +-		} else if (bpp == 16) {
> ++		} else if (dst_bpp == 16) {
> + 			int padding = dst_pitch - dst_width * sizeof(WORD);
> + 			WORD pad = 0;
> + 			WORD pixel;
> +@@ -1440,7 +1440,7 @@
> + 			}
> + #endif
> + #if FREEIMAGE_COLORORDER == FREEIMAGE_COLORORDER_RGB
> +-		} else if (bpp == 24) {
> ++		} else if (dst_bpp == 24) {
> + 			int padding = dst_pitch - dst_width * sizeof(FILE_BGR);
> + 			DWORD pad = 0;
> + 			FILE_BGR bgr;
> +@@ -1461,7 +1461,7 @@
> + 					}
> + 				}
> + 			}
> +-		} else if (bpp == 32) {
> ++		} else if (dst_bpp == 32) {
> + 			FILE_BGRA bgra;
> + 			for(unsigned y = 0; y < dst_height; y++) {
> + 				BYTE *line = FreeImage_GetScanLine(dib, y);
> +diff -uNr FreeImage.orig/Source/FreeImage/PluginDDS.cpp FreeImage/Source/FreeImage/PluginDDS.cpp
> +--- FreeImage.orig/Source/FreeImage/PluginDDS.cpp	2018-07-31 17:04:58.000000000 +0200
> ++++ FreeImage/Source/FreeImage/PluginDDS.cpp	2019-08-31 16:00:39.213465120 +0200
> +@@ -356,14 +356,6 @@
> + 	for(int i=0; i<11; i++) {
> + 		SwapLong(&header->surfaceDesc.dwReserved1[i]);
> + 	}
> +-	SwapLong(&header->surfaceDesc.ddpfPixelFormat.dwSize);
> +-	SwapLong(&header->surfaceDesc.ddpfPixelFormat.dwFlags);
> +-	SwapLong(&header->surfaceDesc.ddpfPixelFormat.dwFourCC);
> +-	SwapLong(&header->surfaceDesc.ddpfPixelFormat.dwRGBBitCount);
> +-	SwapLong(&header->surfaceDesc.ddpfPixelFormat.dwRBitMask);
> +-	SwapLong(&header->surfaceDesc.ddpfPixelFormat.dwGBitMask);
> +-	SwapLong(&header->surfaceDesc.ddpfPixelFormat.dwBBitMask);
> +-	SwapLong(&header->surfaceDesc.ddpfPixelFormat.dwRGBAlphaBitMask);
> + 	SwapLong(&header->surfaceDesc.ddsCaps.dwCaps1);
> + 	SwapLong(&header->surfaceDesc.ddsCaps.dwCaps2);
> + 	SwapLong(&header->surfaceDesc.ddsCaps.dwReserved[0]);
> diff --git a/package/libfreeimage/0004-fix-gcc-6.patch b/package/libfreeimage/0004-fix-gcc-6.patch
> deleted file mode 100644
> index 0f10dec715..0000000000
> --- a/package/libfreeimage/0004-fix-gcc-6.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -libraw/dc_raw: fix gcc-6 failures
> -
> -With gcc-6, it is no longer allowed to narrow the type of constants in
> -a constant array declaration.
> -
> -Fixes:
> -    http://autobuild.buildroot.org/results/081/0811531872f69f9febbdc482dfbdd7fb5c35d1c8/build-end.log
> -
> -Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> -
> -diff -durN a/Source/LibRawLite/internal/dcraw_common.cpp b/Source/LibRawLite/internal/dcraw_common.cpp
> ---- a/Source/LibRawLite/internal/dcraw_common.cpp
> -+++ b/Source/LibRawLite/internal/dcraw_common.cpp
> -@@ -2479,7 +2479,7 @@
> - 
> - void CLASS kodak_radc_load_raw()
> - {
> --  static const char src[] = {
> -+  static const signed char src[] = {
> -     1,1, 2,3, 3,4, 4,2, 5,7, 6,5, 7,6, 7,8,
> -     1,0, 2,1, 3,3, 4,4, 5,2, 6,7, 7,6, 8,5, 8,8,
> -     2,1, 2,3, 3,0, 3,2, 3,4, 4,6, 5,5, 6,7, 6,8,
> -@@ -4519,7 +4519,7 @@
> -  */
> - void CLASS vng_interpolate()
> - {
> --  static const signed char *cp, terms[] = {
> -+  static const int *cp, terms[] = {
> -     -2,-2,+0,-1,0,0x01, -2,-2,+0,+0,1,0x01, -2,-1,-1,+0,0,0x01,
> -     -2,-1,+0,-1,0,0x02, -2,-1,+0,+0,0,0x03, -2,-1,+0,+1,1,0x01,
> -     -2,+0,+0,-1,0,0x06, -2,+0,+0,+0,1,0x02, -2,+0,+0,+1,0,0x03,
> diff --git a/package/libfreeimage/0005-Manage-powf64-with-glibc.patch b/package/libfreeimage/0005-Manage-powf64-with-glibc.patch
> deleted file mode 100644
> index 948ba06eb9..0000000000
> --- a/package/libfreeimage/0005-Manage-powf64-with-glibc.patch
> +++ /dev/null
> @@ -1,725 +0,0 @@
> -From d8f40eabb25953bff5d90017478dc59d586346d1 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Thu, 3 May 2018 15:44:14 +0200
> -Subject: [PATCH] Manage powf64 with glibc
> -
> -powf64 is now included in latest version of glibc so rename powf64 into
> -powf_64
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - Source/LibRawLite/dcraw/dcraw.c             | 108 ++++++++++++++--------------
> - Source/LibRawLite/internal/dcraw_common.cpp | 108 ++++++++++++++--------------
> - 2 files changed, 108 insertions(+), 108 deletions(-)
> -
> -diff --git a/Source/LibRawLite/dcraw/dcraw.c b/Source/LibRawLite/dcraw/dcraw.c
> -index 6bf607d..3e52cec 100644
> ---- a/Source/LibRawLite/dcraw/dcraw.c
> -+++ b/Source/LibRawLite/dcraw/dcraw.c
> -@@ -6727,7 +6727,7 @@ static float powf_lim(float a, float b, float limup)
> - {
> -   return (b>limup || b < -limup)?0.f:powf(a,b);
> - }
> --static float powf64(float a, float b)
> -+static float powf_64(float a, float b)
> - {
> -   return powf_lim(a,b,64.f);
> - }
> -@@ -6764,7 +6764,7 @@ static float _CanonConvert2EV(short in)
> - static float _CanonConvertAperture(short in)
> - {
> -   if (in == (short)0xffe0) return 0.0f;
> --  else return powf64(2.0f, _CanonConvert2EV(in) / 2.0f);
> -+  else return powf_64(2.0f, _CanonConvert2EV(in) / 2.0f);
> - }
> - 
> - void CLASS setCanonBodyFeatures (unsigned id)
> -@@ -7046,15 +7046,15 @@ void CLASS processNikonLensData (uchar *LensData, unsigned len)
> -     imgdata.lens.nikon.NikonLensIDNumber = LensData[i];
> -     imgdata.lens.nikon.NikonLensFStops = LensData[i + 1];
> -     imgdata.lens.makernotes.LensFStops = (float)imgdata.lens.nikon.NikonLensFStops /12.0f;
> --    imgdata.lens.makernotes.MinFocal = 5.0f * powf64(2.0f, (float)LensData[i + 2] / 24.0f);
> --    imgdata.lens.makernotes.MaxFocal = 5.0f * powf64(2.0f, (float)LensData[i + 3] / 24.0f);
> --    imgdata.lens.makernotes.MaxAp4MinFocal = powf64(2.0f, (float)LensData[i + 4] / 24.0f);
> --    imgdata.lens.makernotes.MaxAp4MaxFocal = powf64(2.0f, (float)LensData[i + 5] / 24.0f);
> -+    imgdata.lens.makernotes.MinFocal = 5.0f * powf_64(2.0f, (float)LensData[i + 2] / 24.0f);
> -+    imgdata.lens.makernotes.MaxFocal = 5.0f * powf_64(2.0f, (float)LensData[i + 3] / 24.0f);
> -+    imgdata.lens.makernotes.MaxAp4MinFocal = powf_64(2.0f, (float)LensData[i + 4] / 24.0f);
> -+    imgdata.lens.makernotes.MaxAp4MaxFocal = powf_64(2.0f, (float)LensData[i + 5] / 24.0f);
> -     imgdata.lens.nikon.NikonMCUVersion = LensData[i + 6];
> -     if (i != 2)
> -       {
> --        imgdata.lens.makernotes.CurFocal = 5.0f * powf64(2.0f, (float)LensData[i - 1] / 24.0f);
> --        imgdata.lens.nikon.NikonEffectiveMaxAp = powf64(2.0f, (float)LensData[i + 7] / 24.0f);
> -+        imgdata.lens.makernotes.CurFocal = 5.0f * powf_64(2.0f, (float)LensData[i - 1] / 24.0f);
> -+        imgdata.lens.nikon.NikonEffectiveMaxAp = powf_64(2.0f, (float)LensData[i + 7] / 24.0f);
> -       }
> -     imgdata.lens.makernotes.LensID =
> -       (unsigned long long) LensData[i] << 56 |
> -@@ -7563,11 +7563,11 @@ void CLASS process_Sony_0x9050 (uchar * buf, unsigned id)
> -     {
> -       if (buf[0])
> -         imgdata.lens.makernotes.MaxAp =
> --          my_roundf(powf64(2.0f, ((float)SonySubstitution[buf[0]] / 8.0 - 1.06f) / 2.0f)*10.0f) / 10.0f;
> -+          my_roundf(powf_64(2.0f, ((float)SonySubstitution[buf[0]] / 8.0 - 1.06f) / 2.0f)*10.0f) / 10.0f;
> - 
> -       if (buf[1])
> -         imgdata.lens.makernotes.MinAp =
> --          my_roundf(powf64(2.0f, ((float)SonySubstitution[buf[1]] / 8.0 - 1.06f) / 2.0f)*10.0f) / 10.0f;
> -+          my_roundf(powf_64(2.0f, ((float)SonySubstitution[buf[1]] / 8.0 - 1.06f) / 2.0f)*10.0f) / 10.0f;
> -     }
> - 
> -   if (imgdata.lens.makernotes.CameraMount != LIBRAW_MOUNT_FixedLens)
> -@@ -7577,7 +7577,7 @@ void CLASS process_Sony_0x9050 (uchar * buf, unsigned id)
> -           lid = SonySubstitution[buf[0x3d]] << 8 |
> -             SonySubstitution[buf[0x3c]];
> -           imgdata.lens.makernotes.CurAp =
> --            powf64(2.0f, ((float)lid/256.0f - 16.0f) / 2.0f);
> -+            powf_64(2.0f, ((float)lid/256.0f - 16.0f) / 2.0f);
> -         }
> -       if (buf[0x105] && (imgdata.lens.makernotes.LensMount != LIBRAW_MOUNT_Canon_EF))
> -         imgdata.lens.makernotes.LensMount =
> -@@ -7957,7 +7957,7 @@ void CLASS parse_makernote_0xc634(int base, int uptag, unsigned dng_writer)
> -           {
> -             unsigned char cc;
> -             fread(&cc, 1, 1, ifp);
> --            iso_speed = (int)(100.0 * powf64(2.0, (double)(cc) / 12.0 - 5.0));
> -+            iso_speed = (int)(100.0 * powf_64(2.0, (double)(cc) / 12.0 - 5.0));
> -             break;
> -           }
> -       }
> -@@ -7989,7 +7989,7 @@ void CLASS parse_makernote_0xc634(int base, int uptag, unsigned dng_writer)
> -           }
> -           break;
> -         case 0x1002:
> --          imgdata.lens.makernotes.CurAp = powf64(2.0f, getreal(type)/2);
> -+          imgdata.lens.makernotes.CurAp = powf_64(2.0f, getreal(type)/2);
> -           break;
> -         case 0x20100201:
> -           imgdata.lens.makernotes.LensID =
> -@@ -8009,10 +8009,10 @@ void CLASS parse_makernote_0xc634(int base, int uptag, unsigned dng_writer)
> -           fread(imgdata.lens.makernotes.Lens, len, 1, ifp);
> -           break;
> -         case 0x20100205:
> --          imgdata.lens.makernotes.MaxAp4MinFocal = powf64(sqrt(2.0f), get2() / 256.0f);
> -+          imgdata.lens.makernotes.MaxAp4MinFocal = powf_64(sqrt(2.0f), get2() / 256.0f);
> -           break;
> -         case 0x20100206:
> --          imgdata.lens.makernotes.MaxAp4MaxFocal = powf64(sqrt(2.0f), get2() / 256.0f);
> -+          imgdata.lens.makernotes.MaxAp4MaxFocal = powf_64(sqrt(2.0f), get2() / 256.0f);
> -           break;
> -         case 0x20100207:
> -           imgdata.lens.makernotes.MinFocal = (float)get2();
> -@@ -8023,7 +8023,7 @@ void CLASS parse_makernote_0xc634(int base, int uptag, unsigned dng_writer)
> -             imgdata.lens.makernotes.MaxFocal = imgdata.lens.makernotes.MinFocal;
> -           break;
> -         case 0x2010020a:
> --          imgdata.lens.makernotes.MaxAp4CurFocal = powf64(sqrt(2.0f), get2() / 256.0f);
> -+          imgdata.lens.makernotes.MaxAp4CurFocal = powf_64(sqrt(2.0f), get2() / 256.0f);
> -           break;
> -         case 0x20100301:
> -           imgdata.lens.makernotes.TeleconverterID = fgetc(ifp) << 8;
> -@@ -8121,13 +8121,13 @@ void CLASS parse_makernote_0xc634(int base, int uptag, unsigned dng_writer)
> -                 if (table_buf[iLensData+9] &&
> -                     (fabs(imgdata.lens.makernotes.CurFocal) < 0.1f))
> -                   imgdata.lens.makernotes.CurFocal =
> --                    10*(table_buf[iLensData+9]>>2) * powf64(4, (table_buf[iLensData+9] & 0x03)-2);
> -+                    10*(table_buf[iLensData+9]>>2) * powf_64(4, (table_buf[iLensData+9] & 0x03)-2);
> -                 if (table_buf[iLensData+10] & 0xf0)
> -                   imgdata.lens.makernotes.MaxAp4CurFocal =
> --                    powf64(2.0f, (float)((table_buf[iLensData+10] & 0xf0) >>4)/4.0f);
> -+                    powf_64(2.0f, (float)((table_buf[iLensData+10] & 0xf0) >>4)/4.0f);
> -                 if (table_buf[iLensData+10] & 0x0f)
> -                   imgdata.lens.makernotes.MinAp4CurFocal =
> --                    powf64(2.0f, (float)((table_buf[iLensData+10] & 0x0f) + 10)/4.0f);
> -+                    powf_64(2.0f, (float)((table_buf[iLensData+10] & 0x0f) + 10)/4.0f);
> -                 if (
> -                     (imgdata.lens.makernotes.CamID != 0x12e6c) &&	// K-r
> -                     (imgdata.lens.makernotes.CamID != 0x12e76) &&	// K-5
> -@@ -8148,14 +8148,14 @@ void CLASS parse_makernote_0xc634(int base, int uptag, unsigned dng_writer)
> -                     if ((table_buf[iLensData+14] > 1) &&
> -                         (fabs(imgdata.lens.makernotes.MaxAp4CurFocal) < 0.7f))
> -                       imgdata.lens.makernotes.MaxAp4CurFocal =
> --                        powf64(2.0f, (float)((table_buf[iLensData+14] & 0x7f) -1)/32.0f);
> -+                        powf_64(2.0f, (float)((table_buf[iLensData+14] & 0x7f) -1)/32.0f);
> -                   }
> -                 else if ((imgdata.lens.makernotes.CamID != 0x12e76) &&	// K-5
> -                          (table_buf[iLensData+15] > 1) &&
> -                          (fabs(imgdata.lens.makernotes.MaxAp4CurFocal) < 0.7f))
> -                   {
> -                     imgdata.lens.makernotes.MaxAp4CurFocal =
> --                      powf64(2.0f, (float)((table_buf[iLensData+15] & 0x7f) -1)/32.0f);
> -+                      powf_64(2.0f, (float)((table_buf[iLensData+15] & 0x7f) -1)/32.0f);
> -                   }
> -               }
> -             free(table_buf);
> -@@ -8321,7 +8321,7 @@ void CLASS parse_makernote_0xc634(int base, int uptag, unsigned dng_writer)
> -                   lid = (((ushort)table_buf[2])<<8) |
> -                     ((ushort)table_buf[3]);
> -                   imgdata.lens.makernotes.CurAp =
> --                    powf64(2.0f, ((float)lid/8.0f-1.0f)/2.0f);
> -+                    powf_64(2.0f, ((float)lid/8.0f-1.0f)/2.0f);
> -                 }
> -               break;
> -             case 1536:
> -@@ -8801,7 +8801,7 @@ void CLASS parse_makernote (int base, int uptag)
> -           }
> -           break;
> -         case 0x1002:
> --          imgdata.lens.makernotes.CurAp = powf64(2.0f, getreal(type)/2);
> -+          imgdata.lens.makernotes.CurAp = powf_64(2.0f, getreal(type)/2);
> -           break;
> -         case 0x20100201:
> -           imgdata.lens.makernotes.LensID =
> -@@ -8821,10 +8821,10 @@ void CLASS parse_makernote (int base, int uptag)
> -           fread(imgdata.lens.makernotes.Lens, len, 1, ifp);
> -           break;
> -         case 0x20100205:
> --          imgdata.lens.makernotes.MaxAp4MinFocal = powf64(sqrt(2.0f), get2() / 256.0f);
> -+          imgdata.lens.makernotes.MaxAp4MinFocal = powf_64(sqrt(2.0f), get2() / 256.0f);
> -           break;
> -         case 0x20100206:
> --          imgdata.lens.makernotes.MaxAp4MaxFocal = powf64(sqrt(2.0f), get2() / 256.0f);
> -+          imgdata.lens.makernotes.MaxAp4MaxFocal = powf_64(sqrt(2.0f), get2() / 256.0f);
> -           break;
> -         case 0x20100207:
> -           imgdata.lens.makernotes.MinFocal = (float)get2();
> -@@ -8835,7 +8835,7 @@ void CLASS parse_makernote (int base, int uptag)
> -             imgdata.lens.makernotes.MaxFocal = imgdata.lens.makernotes.MinFocal;
> -           break;
> -         case 0x2010020a:
> --          imgdata.lens.makernotes.MaxAp4CurFocal = powf64(sqrt(2.0f), get2() / 256.0f);
> -+          imgdata.lens.makernotes.MaxAp4CurFocal = powf_64(sqrt(2.0f), get2() / 256.0f);
> -           break;
> -         case 0x20100301:
> -           imgdata.lens.makernotes.TeleconverterID = fgetc(ifp) << 8;
> -@@ -8993,13 +8993,13 @@ void CLASS parse_makernote (int base, int uptag)
> -               {
> -                 if (table_buf[iLensData+9] && (fabs(imgdata.lens.makernotes.CurFocal) < 0.1f))
> -                   imgdata.lens.makernotes.CurFocal =
> --                    10*(table_buf[iLensData+9]>>2) * powf64(4, (table_buf[iLensData+9] & 0x03)-2);
> -+                    10*(table_buf[iLensData+9]>>2) * powf_64(4, (table_buf[iLensData+9] & 0x03)-2);
> -                 if (table_buf[iLensData+10] & 0xf0)
> -                   imgdata.lens.makernotes.MaxAp4CurFocal =
> --                    powf64(2.0f, (float)((table_buf[iLensData+10] & 0xf0) >>4)/4.0f);
> -+                    powf_64(2.0f, (float)((table_buf[iLensData+10] & 0xf0) >>4)/4.0f);
> -                 if (table_buf[iLensData+10] & 0x0f)
> -                   imgdata.lens.makernotes.MinAp4CurFocal =
> --                    powf64(2.0f, (float)((table_buf[iLensData+10] & 0x0f) + 10)/4.0f);
> -+                    powf_64(2.0f, (float)((table_buf[iLensData+10] & 0x0f) + 10)/4.0f);
> -                 if (
> -                     (imgdata.lens.makernotes.CamID != 0x12e6c) &&	// K-r
> -                     (imgdata.lens.makernotes.CamID != 0x12e76) &&	// K-5
> -@@ -9020,14 +9020,14 @@ void CLASS parse_makernote (int base, int uptag)
> -                     if ((table_buf[iLensData+14] > 1) &&
> -                         (fabs(imgdata.lens.makernotes.MaxAp4CurFocal) < 0.7f))
> -                       imgdata.lens.makernotes.MaxAp4CurFocal =
> --                        powf64(2.0f, (float)((table_buf[iLensData+14] & 0x7f) -1)/32.0f);
> -+                        powf_64(2.0f, (float)((table_buf[iLensData+14] & 0x7f) -1)/32.0f);
> -                   }
> -                 else if ((imgdata.lens.makernotes.CamID != 0x12e76) &&	// K-5
> -                          (table_buf[iLensData+15] > 1) &&
> -                          (fabs(imgdata.lens.makernotes.MaxAp4CurFocal) < 0.7f))
> -                   {
> -                     imgdata.lens.makernotes.MaxAp4CurFocal =
> --                      powf64(2.0f, (float)((table_buf[iLensData+15] & 0x7f) -1)/32.0f);
> -+                      powf_64(2.0f, (float)((table_buf[iLensData+15] & 0x7f) -1)/32.0f);
> -                   }
> -               }
> -             free(table_buf);
> -@@ -9188,7 +9188,7 @@ void CLASS parse_makernote (int base, int uptag)
> -                   lid = (((ushort)table_buf[2])<<8) |
> -                     ((ushort)table_buf[3]);
> -                   imgdata.lens.makernotes.CurAp =
> --                    powf64(2.0f, ((float)lid/8.0f-1.0f)/2.0f);
> -+                    powf_64(2.0f, ((float)lid/8.0f-1.0f)/2.0f);
> -                 }
> -               break;
> -             case 1536:
> -@@ -9273,15 +9273,15 @@ void CLASS parse_makernote (int base, int uptag)
> -       {
> -         unsigned char cc;
> -         fread(&cc,1,1,ifp);
> --        iso_speed = int(100.0 * powf64(2.0f,float(cc)/12.0-5.0));
> -+        iso_speed = int(100.0 * powf_64(2.0f,float(cc)/12.0-5.0));
> -       }
> -     if (tag == 4 && len > 26 && len < 35) {
> -       if ((i=(get4(),get2())) != 0x7fff && (!iso_speed || iso_speed == 65535))
> --	iso_speed = 50 * powf64(2.0, i/32.0 - 4);
> -+	iso_speed = 50 * powf_64(2.0, i/32.0 - 4);
> -       if ((i=(get2(),get2())) != 0x7fff && !aperture)
> --	aperture = powf64(2.0, i/64.0);
> -+	aperture = powf_64(2.0, i/64.0);
> -       if ((i=get2()) != 0xffff && !shutter)
> --	shutter = powf64(2.0, (short) i/-32.0);
> -+	shutter = powf_64(2.0, (short) i/-32.0);
> -       wbi = (get2(),get2());
> -       shot_order = (get2(),get2());
> -     }
> -@@ -9732,7 +9732,7 @@ void CLASS parse_exif (int base)
> -         imgdata.lens.Lens[0] = 0;
> -       break;
> -     case 0x9205:
> --      imgdata.lens.EXIF_MaxAp = powf64(2.0f, (getreal(type) / 2.0f));
> -+      imgdata.lens.EXIF_MaxAp = powf_64(2.0f, (getreal(type) / 2.0f));
> -       break;
> - #endif
> -       case 33434:  shutter = getreal(type);		break;
> -@@ -9745,10 +9745,10 @@ void CLASS parse_exif (int base)
> -       case 36867:
> -       case 36868:  get_timestamp(0);			break;
> -       case 37377:  if ((expo = -getreal(type)) < 128 && shutter == 0.)
> --          shutter = powf64(2.0, expo);		break;
> -+          shutter = powf_64(2.0, expo);		break;
> -       case 37378:
> -         if (fabs(ape = getreal(type))<256.0)
> --          aperture = powf64(2.0, ape/2);
> -+          aperture = powf_64(2.0, ape/2);
> -         break;
> -       case 37385:  flash_used = getreal(type);          break;
> -       case 37386:  focal_len = getreal(type);		break;
> -@@ -10361,7 +10361,7 @@ int CLASS parse_tiff_ifd (int base)
> -         imgdata.lens.Lens[0] = 0;
> -       break;
> -     case 0x9205:
> --				imgdata.lens.EXIF_MaxAp = powf64(2.0f, (getreal(type) / 2.0f));
> -+				imgdata.lens.EXIF_MaxAp = powf_64(2.0f, (getreal(type) / 2.0f));
> -       break;
> - // IB end
> - #endif
> -@@ -11130,22 +11130,22 @@ void CLASS parse_ciff (int offset, int length, int depth)
> -       thumb_length = len;
> -     }
> -     if (type == 0x1818) {
> --      shutter = powf64(2.0f, -int_to_float((get4(),get4())));
> --      aperture = powf64(2.0f, int_to_float(get4())/2);
> -+      shutter = powf_64(2.0f, -int_to_float((get4(),get4())));
> -+      aperture = powf_64(2.0f, int_to_float(get4())/2);
> - #ifdef LIBRAW_LIBRARY_BUILD
> - 			imgdata.lens.makernotes.CurAp = aperture;
> - #endif
> -     }
> -     if (type == 0x102a) {
> - 			//      iso_speed = pow (2.0, (get4(),get2())/32.0 - 4) * 50;
> --      iso_speed = powf64(2.0f, ((get2(),get2()) + get2())/32.0f - 5.0f) * 100.0f;
> -+      iso_speed = powf_64(2.0f, ((get2(),get2()) + get2())/32.0f - 5.0f) * 100.0f;
> - #ifdef LIBRAW_LIBRARY_BUILD
> -       aperture  = _CanonConvertAperture((get2(),get2()));
> -       imgdata.lens.makernotes.CurAp = aperture;
> - #else
> --      aperture  = powf64(2.0, (get2(),(short)get2())/64.0);
> -+      aperture  = powf_64(2.0, (get2(),(short)get2())/64.0);
> - #endif
> --      shutter   = powf64(2.0,-((short)get2())/32.0);
> -+      shutter   = powf_64(2.0,-((short)get2())/32.0);
> -       wbi = (get2(),get2());
> -       if (wbi > 17) wbi = 0;
> -       fseek (ifp, 32, SEEK_CUR);
> -@@ -11349,8 +11349,8 @@ void CLASS parse_phase_one (int base)
> -       setPhaseOneFeatures(unique_id);
> -       break;
> -     case 0x0401:
> --      if (type == 4) imgdata.lens.makernotes.CurAp =  powf64(2.0f, (int_to_float(data)/2.0f));
> --      else imgdata.lens.makernotes.CurAp = powf64(2.0f, (getreal(type)/2.0f));
> -+      if (type == 4) imgdata.lens.makernotes.CurAp =  powf_64(2.0f, (int_to_float(data)/2.0f));
> -+      else imgdata.lens.makernotes.CurAp = powf_64(2.0f, (getreal(type)/2.0f));
> -       break;
> -     case 0x0403:
> -       if (type == 4) imgdata.lens.makernotes.CurFocal =  int_to_float(data);
> -@@ -11364,16 +11364,16 @@ void CLASS parse_phase_one (int base)
> -       break;
> -     case 0x0414:
> -       if (type == 4) {
> --      	imgdata.lens.makernotes.MaxAp4CurFocal = powf64(2.0f, (int_to_float(data)/2.0f));
> -+      	imgdata.lens.makernotes.MaxAp4CurFocal = powf_64(2.0f, (int_to_float(data)/2.0f));
> -       } else {
> --        imgdata.lens.makernotes.MaxAp4CurFocal = powf64(2.0f, (getreal(type) / 2.0f));
> -+        imgdata.lens.makernotes.MaxAp4CurFocal = powf_64(2.0f, (getreal(type) / 2.0f));
> -       }
> -       break;
> -     case 0x0415:
> -       if (type == 4) {
> --      	imgdata.lens.makernotes.MinAp4CurFocal = powf64(2.0f, (int_to_float(data)/2.0f));
> -+      	imgdata.lens.makernotes.MinAp4CurFocal = powf_64(2.0f, (int_to_float(data)/2.0f));
> -       } else {
> --        imgdata.lens.makernotes.MinAp4CurFocal = powf64(2.0f, (getreal(type) / 2.0f));
> -+        imgdata.lens.makernotes.MinAp4CurFocal = powf_64(2.0f, (getreal(type) / 2.0f));
> -       }
> -       break;
> -     case 0x0416:
> -@@ -13324,15 +13324,15 @@ void CLASS identify()
> -       case 18: iso_speed = 320; break;
> -       case 19: iso_speed = 400; break;
> -     }
> --    shutter = powf64(2.0f, (((float)get4())/8.0f)) / 16000.0f;
> -+    shutter = powf_64(2.0f, (((float)get4())/8.0f)) / 16000.0f;
> -     FORC4 cam_mul[c ^ (c >> 1)] = get4();
> -     fseek (ifp, 88, SEEK_SET);
> --    aperture = powf64(2.0f, ((float)get4())/16.0f);
> -+    aperture = powf_64(2.0f, ((float)get4())/16.0f);
> -     fseek (ifp, 112, SEEK_SET);
> -     focal_len = get4();
> - #ifdef LIBRAW_LIBRARY_BUILD
> -     fseek (ifp, 104, SEEK_SET);
> --    imgdata.lens.makernotes.MaxAp4CurFocal = powf64(2.0f, ((float)get4())/16.0f);
> -+    imgdata.lens.makernotes.MaxAp4CurFocal = powf_64(2.0f, ((float)get4())/16.0f);
> -     fseek (ifp, 124, SEEK_SET);
> -     fread(imgdata.lens.makernotes.Lens, 32, 1, ifp);
> -     imgdata.lens.makernotes.CameraMount = LIBRAW_MOUNT_Contax_N;
> -diff --git a/Source/LibRawLite/internal/dcraw_common.cpp b/Source/LibRawLite/internal/dcraw_common.cpp
> -index a936a93..0fc4d81 100644
> ---- a/Source/LibRawLite/internal/dcraw_common.cpp
> -+++ b/Source/LibRawLite/internal/dcraw_common.cpp
> -@@ -5543,7 +5543,7 @@ static float powf_lim(float a, float b, float limup)
> - {
> -   return (b>limup || b < -limup)?0.f:powf(a,b);
> - }
> --static float powf64(float a, float b)
> -+static float powf_64(float a, float b)
> - {
> -   return powf_lim(a,b,64.f);
> - }
> -@@ -5580,7 +5580,7 @@ static float _CanonConvert2EV(short in)
> - static float _CanonConvertAperture(short in)
> - {
> -   if (in == (short)0xffe0) return 0.0f;
> --  else return powf64(2.0f, _CanonConvert2EV(in) / 2.0f);
> -+  else return powf_64(2.0f, _CanonConvert2EV(in) / 2.0f);
> - }
> - 
> - void CLASS setCanonBodyFeatures (unsigned id)
> -@@ -5862,15 +5862,15 @@ void CLASS processNikonLensData (uchar *LensData, unsigned len)
> -     imgdata.lens.nikon.NikonLensIDNumber = LensData[i];
> -     imgdata.lens.nikon.NikonLensFStops = LensData[i + 1];
> -     imgdata.lens.makernotes.LensFStops = (float)imgdata.lens.nikon.NikonLensFStops /12.0f;
> --    imgdata.lens.makernotes.MinFocal = 5.0f * powf64(2.0f, (float)LensData[i + 2] / 24.0f);
> --    imgdata.lens.makernotes.MaxFocal = 5.0f * powf64(2.0f, (float)LensData[i + 3] / 24.0f);
> --    imgdata.lens.makernotes.MaxAp4MinFocal = powf64(2.0f, (float)LensData[i + 4] / 24.0f);
> --    imgdata.lens.makernotes.MaxAp4MaxFocal = powf64(2.0f, (float)LensData[i + 5] / 24.0f);
> -+    imgdata.lens.makernotes.MinFocal = 5.0f * powf_64(2.0f, (float)LensData[i + 2] / 24.0f);
> -+    imgdata.lens.makernotes.MaxFocal = 5.0f * powf_64(2.0f, (float)LensData[i + 3] / 24.0f);
> -+    imgdata.lens.makernotes.MaxAp4MinFocal = powf_64(2.0f, (float)LensData[i + 4] / 24.0f);
> -+    imgdata.lens.makernotes.MaxAp4MaxFocal = powf_64(2.0f, (float)LensData[i + 5] / 24.0f);
> -     imgdata.lens.nikon.NikonMCUVersion = LensData[i + 6];
> -     if (i != 2)
> -       {
> --        imgdata.lens.makernotes.CurFocal = 5.0f * powf64(2.0f, (float)LensData[i - 1] / 24.0f);
> --        imgdata.lens.nikon.NikonEffectiveMaxAp = powf64(2.0f, (float)LensData[i + 7] / 24.0f);
> -+        imgdata.lens.makernotes.CurFocal = 5.0f * powf_64(2.0f, (float)LensData[i - 1] / 24.0f);
> -+        imgdata.lens.nikon.NikonEffectiveMaxAp = powf_64(2.0f, (float)LensData[i + 7] / 24.0f);
> -       }
> -     imgdata.lens.makernotes.LensID =
> -       (unsigned long long) LensData[i] << 56 |
> -@@ -6379,11 +6379,11 @@ void CLASS process_Sony_0x9050 (uchar * buf, unsigned id)
> -     {
> -       if (buf[0])
> -         imgdata.lens.makernotes.MaxAp =
> --          my_roundf(powf64(2.0f, ((float)SonySubstitution[buf[0]] / 8.0 - 1.06f) / 2.0f)*10.0f) / 10.0f;
> -+          my_roundf(powf_64(2.0f, ((float)SonySubstitution[buf[0]] / 8.0 - 1.06f) / 2.0f)*10.0f) / 10.0f;
> - 
> -       if (buf[1])
> -         imgdata.lens.makernotes.MinAp =
> --          my_roundf(powf64(2.0f, ((float)SonySubstitution[buf[1]] / 8.0 - 1.06f) / 2.0f)*10.0f) / 10.0f;
> -+          my_roundf(powf_64(2.0f, ((float)SonySubstitution[buf[1]] / 8.0 - 1.06f) / 2.0f)*10.0f) / 10.0f;
> -     }
> - 
> -   if (imgdata.lens.makernotes.CameraMount != LIBRAW_MOUNT_FixedLens)
> -@@ -6393,7 +6393,7 @@ void CLASS process_Sony_0x9050 (uchar * buf, unsigned id)
> -           lid = SonySubstitution[buf[0x3d]] << 8 |
> -             SonySubstitution[buf[0x3c]];
> -           imgdata.lens.makernotes.CurAp =
> --            powf64(2.0f, ((float)lid/256.0f - 16.0f) / 2.0f);
> -+            powf_64(2.0f, ((float)lid/256.0f - 16.0f) / 2.0f);
> -         }
> -       if (buf[0x105] && (imgdata.lens.makernotes.LensMount != LIBRAW_MOUNT_Canon_EF))
> -         imgdata.lens.makernotes.LensMount =
> -@@ -6773,7 +6773,7 @@ void CLASS parse_makernote_0xc634(int base, int uptag, unsigned dng_writer)
> -           {
> -             unsigned char cc;
> -             fread(&cc, 1, 1, ifp);
> --            iso_speed = (int)(100.0 * powf64(2.0, (double)(cc) / 12.0 - 5.0));
> -+            iso_speed = (int)(100.0 * powf_64(2.0, (double)(cc) / 12.0 - 5.0));
> -             break;
> -           }
> -       }
> -@@ -6805,7 +6805,7 @@ void CLASS parse_makernote_0xc634(int base, int uptag, unsigned dng_writer)
> -           }
> -           break;
> -         case 0x1002:
> --          imgdata.lens.makernotes.CurAp = powf64(2.0f, getreal(type)/2);
> -+          imgdata.lens.makernotes.CurAp = powf_64(2.0f, getreal(type)/2);
> -           break;
> -         case 0x20100201:
> -           imgdata.lens.makernotes.LensID =
> -@@ -6825,10 +6825,10 @@ void CLASS parse_makernote_0xc634(int base, int uptag, unsigned dng_writer)
> -           fread(imgdata.lens.makernotes.Lens, len, 1, ifp);
> -           break;
> -         case 0x20100205:
> --          imgdata.lens.makernotes.MaxAp4MinFocal = powf64(sqrt(2.0f), get2() / 256.0f);
> -+          imgdata.lens.makernotes.MaxAp4MinFocal = powf_64(sqrt(2.0f), get2() / 256.0f);
> -           break;
> -         case 0x20100206:
> --          imgdata.lens.makernotes.MaxAp4MaxFocal = powf64(sqrt(2.0f), get2() / 256.0f);
> -+          imgdata.lens.makernotes.MaxAp4MaxFocal = powf_64(sqrt(2.0f), get2() / 256.0f);
> -           break;
> -         case 0x20100207:
> -           imgdata.lens.makernotes.MinFocal = (float)get2();
> -@@ -6839,7 +6839,7 @@ void CLASS parse_makernote_0xc634(int base, int uptag, unsigned dng_writer)
> -             imgdata.lens.makernotes.MaxFocal = imgdata.lens.makernotes.MinFocal;
> -           break;
> -         case 0x2010020a:
> --          imgdata.lens.makernotes.MaxAp4CurFocal = powf64(sqrt(2.0f), get2() / 256.0f);
> -+          imgdata.lens.makernotes.MaxAp4CurFocal = powf_64(sqrt(2.0f), get2() / 256.0f);
> -           break;
> -         case 0x20100301:
> -           imgdata.lens.makernotes.TeleconverterID = fgetc(ifp) << 8;
> -@@ -6937,13 +6937,13 @@ void CLASS parse_makernote_0xc634(int base, int uptag, unsigned dng_writer)
> -                 if (table_buf[iLensData+9] &&
> -                     (fabs(imgdata.lens.makernotes.CurFocal) < 0.1f))
> -                   imgdata.lens.makernotes.CurFocal =
> --                    10*(table_buf[iLensData+9]>>2) * powf64(4, (table_buf[iLensData+9] & 0x03)-2);
> -+                    10*(table_buf[iLensData+9]>>2) * powf_64(4, (table_buf[iLensData+9] & 0x03)-2);
> -                 if (table_buf[iLensData+10] & 0xf0)
> -                   imgdata.lens.makernotes.MaxAp4CurFocal =
> --                    powf64(2.0f, (float)((table_buf[iLensData+10] & 0xf0) >>4)/4.0f);
> -+                    powf_64(2.0f, (float)((table_buf[iLensData+10] & 0xf0) >>4)/4.0f);
> -                 if (table_buf[iLensData+10] & 0x0f)
> -                   imgdata.lens.makernotes.MinAp4CurFocal =
> --                    powf64(2.0f, (float)((table_buf[iLensData+10] & 0x0f) + 10)/4.0f);
> -+                    powf_64(2.0f, (float)((table_buf[iLensData+10] & 0x0f) + 10)/4.0f);
> -                 if (
> -                     (imgdata.lens.makernotes.CamID != 0x12e6c) &&	// K-r
> -                     (imgdata.lens.makernotes.CamID != 0x12e76) &&	// K-5
> -@@ -6964,14 +6964,14 @@ void CLASS parse_makernote_0xc634(int base, int uptag, unsigned dng_writer)
> -                     if ((table_buf[iLensData+14] > 1) &&
> -                         (fabs(imgdata.lens.makernotes.MaxAp4CurFocal) < 0.7f))
> -                       imgdata.lens.makernotes.MaxAp4CurFocal =
> --                        powf64(2.0f, (float)((table_buf[iLensData+14] & 0x7f) -1)/32.0f);
> -+                        powf_64(2.0f, (float)((table_buf[iLensData+14] & 0x7f) -1)/32.0f);
> -                   }
> -                 else if ((imgdata.lens.makernotes.CamID != 0x12e76) &&	// K-5
> -                          (table_buf[iLensData+15] > 1) &&
> -                          (fabs(imgdata.lens.makernotes.MaxAp4CurFocal) < 0.7f))
> -                   {
> -                     imgdata.lens.makernotes.MaxAp4CurFocal =
> --                      powf64(2.0f, (float)((table_buf[iLensData+15] & 0x7f) -1)/32.0f);
> -+                      powf_64(2.0f, (float)((table_buf[iLensData+15] & 0x7f) -1)/32.0f);
> -                   }
> -               }
> -             free(table_buf);
> -@@ -7137,7 +7137,7 @@ void CLASS parse_makernote_0xc634(int base, int uptag, unsigned dng_writer)
> -                   lid = (((ushort)table_buf[2])<<8) |
> -                     ((ushort)table_buf[3]);
> -                   imgdata.lens.makernotes.CurAp =
> --                    powf64(2.0f, ((float)lid/8.0f-1.0f)/2.0f);
> -+                    powf_64(2.0f, ((float)lid/8.0f-1.0f)/2.0f);
> -                 }
> -               break;
> -             case 1536:
> -@@ -7617,7 +7617,7 @@ void CLASS parse_makernote (int base, int uptag)
> -           }
> -           break;
> -         case 0x1002:
> --          imgdata.lens.makernotes.CurAp = powf64(2.0f, getreal(type)/2);
> -+          imgdata.lens.makernotes.CurAp = powf_64(2.0f, getreal(type)/2);
> -           break;
> -         case 0x20100201:
> -           imgdata.lens.makernotes.LensID =
> -@@ -7637,10 +7637,10 @@ void CLASS parse_makernote (int base, int uptag)
> -           fread(imgdata.lens.makernotes.Lens, len, 1, ifp);
> -           break;
> -         case 0x20100205:
> --          imgdata.lens.makernotes.MaxAp4MinFocal = powf64(sqrt(2.0f), get2() / 256.0f);
> -+          imgdata.lens.makernotes.MaxAp4MinFocal = powf_64(sqrt(2.0f), get2() / 256.0f);
> -           break;
> -         case 0x20100206:
> --          imgdata.lens.makernotes.MaxAp4MaxFocal = powf64(sqrt(2.0f), get2() / 256.0f);
> -+          imgdata.lens.makernotes.MaxAp4MaxFocal = powf_64(sqrt(2.0f), get2() / 256.0f);
> -           break;
> -         case 0x20100207:
> -           imgdata.lens.makernotes.MinFocal = (float)get2();
> -@@ -7651,7 +7651,7 @@ void CLASS parse_makernote (int base, int uptag)
> -             imgdata.lens.makernotes.MaxFocal = imgdata.lens.makernotes.MinFocal;
> -           break;
> -         case 0x2010020a:
> --          imgdata.lens.makernotes.MaxAp4CurFocal = powf64(sqrt(2.0f), get2() / 256.0f);
> -+          imgdata.lens.makernotes.MaxAp4CurFocal = powf_64(sqrt(2.0f), get2() / 256.0f);
> -           break;
> -         case 0x20100301:
> -           imgdata.lens.makernotes.TeleconverterID = fgetc(ifp) << 8;
> -@@ -7809,13 +7809,13 @@ void CLASS parse_makernote (int base, int uptag)
> -               {
> -                 if (table_buf[iLensData+9] && (fabs(imgdata.lens.makernotes.CurFocal) < 0.1f))
> -                   imgdata.lens.makernotes.CurFocal =
> --                    10*(table_buf[iLensData+9]>>2) * powf64(4, (table_buf[iLensData+9] & 0x03)-2);
> -+                    10*(table_buf[iLensData+9]>>2) * powf_64(4, (table_buf[iLensData+9] & 0x03)-2);
> -                 if (table_buf[iLensData+10] & 0xf0)
> -                   imgdata.lens.makernotes.MaxAp4CurFocal =
> --                    powf64(2.0f, (float)((table_buf[iLensData+10] & 0xf0) >>4)/4.0f);
> -+                    powf_64(2.0f, (float)((table_buf[iLensData+10] & 0xf0) >>4)/4.0f);
> -                 if (table_buf[iLensData+10] & 0x0f)
> -                   imgdata.lens.makernotes.MinAp4CurFocal =
> --                    powf64(2.0f, (float)((table_buf[iLensData+10] & 0x0f) + 10)/4.0f);
> -+                    powf_64(2.0f, (float)((table_buf[iLensData+10] & 0x0f) + 10)/4.0f);
> -                 if (
> -                     (imgdata.lens.makernotes.CamID != 0x12e6c) &&	// K-r
> -                     (imgdata.lens.makernotes.CamID != 0x12e76) &&	// K-5
> -@@ -7836,14 +7836,14 @@ void CLASS parse_makernote (int base, int uptag)
> -                     if ((table_buf[iLensData+14] > 1) &&
> -                         (fabs(imgdata.lens.makernotes.MaxAp4CurFocal) < 0.7f))
> -                       imgdata.lens.makernotes.MaxAp4CurFocal =
> --                        powf64(2.0f, (float)((table_buf[iLensData+14] & 0x7f) -1)/32.0f);
> -+                        powf_64(2.0f, (float)((table_buf[iLensData+14] & 0x7f) -1)/32.0f);
> -                   }
> -                 else if ((imgdata.lens.makernotes.CamID != 0x12e76) &&	// K-5
> -                          (table_buf[iLensData+15] > 1) &&
> -                          (fabs(imgdata.lens.makernotes.MaxAp4CurFocal) < 0.7f))
> -                   {
> -                     imgdata.lens.makernotes.MaxAp4CurFocal =
> --                      powf64(2.0f, (float)((table_buf[iLensData+15] & 0x7f) -1)/32.0f);
> -+                      powf_64(2.0f, (float)((table_buf[iLensData+15] & 0x7f) -1)/32.0f);
> -                   }
> -               }
> -             free(table_buf);
> -@@ -8004,7 +8004,7 @@ void CLASS parse_makernote (int base, int uptag)
> -                   lid = (((ushort)table_buf[2])<<8) |
> -                     ((ushort)table_buf[3]);
> -                   imgdata.lens.makernotes.CurAp =
> --                    powf64(2.0f, ((float)lid/8.0f-1.0f)/2.0f);
> -+                    powf_64(2.0f, ((float)lid/8.0f-1.0f)/2.0f);
> -                 }
> -               break;
> -             case 1536:
> -@@ -8089,15 +8089,15 @@ void CLASS parse_makernote (int base, int uptag)
> -       {
> -         unsigned char cc;
> -         fread(&cc,1,1,ifp);
> --        iso_speed = int(100.0 * powf64(2.0f,float(cc)/12.0-5.0));
> -+        iso_speed = int(100.0 * powf_64(2.0f,float(cc)/12.0-5.0));
> -       }
> -     if (tag == 4 && len > 26 && len < 35) {
> -       if ((i=(get4(),get2())) != 0x7fff && (!iso_speed || iso_speed == 65535))
> --	iso_speed = 50 * powf64(2.0, i/32.0 - 4);
> -+	iso_speed = 50 * powf_64(2.0, i/32.0 - 4);
> -       if ((i=(get2(),get2())) != 0x7fff && !aperture)
> --	aperture = powf64(2.0, i/64.0);
> -+	aperture = powf_64(2.0, i/64.0);
> -       if ((i=get2()) != 0xffff && !shutter)
> --	shutter = powf64(2.0, (short) i/-32.0);
> -+	shutter = powf_64(2.0, (short) i/-32.0);
> -       wbi = (get2(),get2());
> -       shot_order = (get2(),get2());
> -     }
> -@@ -8548,7 +8548,7 @@ void CLASS parse_exif (int base)
> -         imgdata.lens.Lens[0] = 0;
> -       break;
> -     case 0x9205:
> --      imgdata.lens.EXIF_MaxAp = powf64(2.0f, (getreal(type) / 2.0f));
> -+      imgdata.lens.EXIF_MaxAp = powf_64(2.0f, (getreal(type) / 2.0f));
> -       break;
> - #endif
> -       case 33434:  shutter = getreal(type);		break;
> -@@ -8561,10 +8561,10 @@ void CLASS parse_exif (int base)
> -       case 36867:
> -       case 36868:  get_timestamp(0);			break;
> -       case 37377:  if ((expo = -getreal(type)) < 128 && shutter == 0.)
> --          shutter = powf64(2.0, expo);		break;
> -+          shutter = powf_64(2.0, expo);		break;
> -       case 37378:
> -         if (fabs(ape = getreal(type))<256.0)
> --          aperture = powf64(2.0, ape/2);
> -+          aperture = powf_64(2.0, ape/2);
> -         break;
> -       case 37385:  flash_used = getreal(type);          break;
> -       case 37386:  focal_len = getreal(type);		break;
> -@@ -9171,7 +9171,7 @@ int CLASS parse_tiff_ifd (int base)
> -         imgdata.lens.Lens[0] = 0;
> -       break;
> -     case 0x9205:
> --				imgdata.lens.EXIF_MaxAp = powf64(2.0f, (getreal(type) / 2.0f));
> -+				imgdata.lens.EXIF_MaxAp = powf_64(2.0f, (getreal(type) / 2.0f));
> -       break;
> - // IB end
> - #endif
> -@@ -9940,22 +9940,22 @@ void CLASS parse_ciff (int offset, int length, int depth)
> -       thumb_length = len;
> -     }
> -     if (type == 0x1818) {
> --      shutter = powf64(2.0f, -int_to_float((get4(),get4())));
> --      aperture = powf64(2.0f, int_to_float(get4())/2);
> -+      shutter = powf_64(2.0f, -int_to_float((get4(),get4())));
> -+      aperture = powf_64(2.0f, int_to_float(get4())/2);
> - #ifdef LIBRAW_LIBRARY_BUILD
> - 			imgdata.lens.makernotes.CurAp = aperture;
> - #endif
> -     }
> -     if (type == 0x102a) {
> - 			//      iso_speed = pow (2.0, (get4(),get2())/32.0 - 4) * 50;
> --      iso_speed = powf64(2.0f, ((get2(),get2()) + get2())/32.0f - 5.0f) * 100.0f;
> -+      iso_speed = powf_64(2.0f, ((get2(),get2()) + get2())/32.0f - 5.0f) * 100.0f;
> - #ifdef LIBRAW_LIBRARY_BUILD
> -       aperture  = _CanonConvertAperture((get2(),get2()));
> -       imgdata.lens.makernotes.CurAp = aperture;
> - #else
> --      aperture  = powf64(2.0, (get2(),(short)get2())/64.0);
> -+      aperture  = powf_64(2.0, (get2(),(short)get2())/64.0);
> - #endif
> --      shutter   = powf64(2.0,-((short)get2())/32.0);
> -+      shutter   = powf_64(2.0,-((short)get2())/32.0);
> -       wbi = (get2(),get2());
> -       if (wbi > 17) wbi = 0;
> -       fseek (ifp, 32, SEEK_CUR);
> -@@ -10159,8 +10159,8 @@ void CLASS parse_phase_one (int base)
> -       setPhaseOneFeatures(unique_id);
> -       break;
> -     case 0x0401:
> --      if (type == 4) imgdata.lens.makernotes.CurAp =  powf64(2.0f, (int_to_float(data)/2.0f));
> --      else imgdata.lens.makernotes.CurAp = powf64(2.0f, (getreal(type)/2.0f));
> -+      if (type == 4) imgdata.lens.makernotes.CurAp =  powf_64(2.0f, (int_to_float(data)/2.0f));
> -+      else imgdata.lens.makernotes.CurAp = powf_64(2.0f, (getreal(type)/2.0f));
> -       break;
> -     case 0x0403:
> -       if (type == 4) imgdata.lens.makernotes.CurFocal =  int_to_float(data);
> -@@ -10174,16 +10174,16 @@ void CLASS parse_phase_one (int base)
> -       break;
> -     case 0x0414:
> -       if (type == 4) {
> --      	imgdata.lens.makernotes.MaxAp4CurFocal = powf64(2.0f, (int_to_float(data)/2.0f));
> -+      	imgdata.lens.makernotes.MaxAp4CurFocal = powf_64(2.0f, (int_to_float(data)/2.0f));
> -       } else {
> --        imgdata.lens.makernotes.MaxAp4CurFocal = powf64(2.0f, (getreal(type) / 2.0f));
> -+        imgdata.lens.makernotes.MaxAp4CurFocal = powf_64(2.0f, (getreal(type) / 2.0f));
> -       }
> -       break;
> -     case 0x0415:
> -       if (type == 4) {
> --      	imgdata.lens.makernotes.MinAp4CurFocal = powf64(2.0f, (int_to_float(data)/2.0f));
> -+      	imgdata.lens.makernotes.MinAp4CurFocal = powf_64(2.0f, (int_to_float(data)/2.0f));
> -       } else {
> --        imgdata.lens.makernotes.MinAp4CurFocal = powf64(2.0f, (getreal(type) / 2.0f));
> -+        imgdata.lens.makernotes.MinAp4CurFocal = powf_64(2.0f, (getreal(type) / 2.0f));
> -       }
> -       break;
> -     case 0x0416:
> -@@ -11996,15 +11996,15 @@ void CLASS identify()
> -       case 18: iso_speed = 320; break;
> -       case 19: iso_speed = 400; break;
> -     }
> --    shutter = powf64(2.0f, (((float)get4())/8.0f)) / 16000.0f;
> -+    shutter = powf_64(2.0f, (((float)get4())/8.0f)) / 16000.0f;
> -     FORC4 cam_mul[c ^ (c >> 1)] = get4();
> -     fseek (ifp, 88, SEEK_SET);
> --    aperture = powf64(2.0f, ((float)get4())/16.0f);
> -+    aperture = powf_64(2.0f, ((float)get4())/16.0f);
> -     fseek (ifp, 112, SEEK_SET);
> -     focal_len = get4();
> - #ifdef LIBRAW_LIBRARY_BUILD
> -     fseek (ifp, 104, SEEK_SET);
> --    imgdata.lens.makernotes.MaxAp4CurFocal = powf64(2.0f, ((float)get4())/16.0f);
> -+    imgdata.lens.makernotes.MaxAp4CurFocal = powf_64(2.0f, ((float)get4())/16.0f);
> -     fseek (ifp, 124, SEEK_SET);
> -     fread(imgdata.lens.makernotes.Lens, 32, 1, ifp);
> -     imgdata.lens.makernotes.CameraMount = LIBRAW_MOUNT_Contax_N;
> --- 
> -2.14.1
> -
> diff --git a/package/libfreeimage/libfreeimage.hash b/package/libfreeimage/libfreeimage.hash
> index eded0297ec..6d8ba20409 100644
> --- a/package/libfreeimage/libfreeimage.hash
> +++ b/package/libfreeimage/libfreeimage.hash
> @@ -1,5 +1,9 @@
> +# From https://sourceforge.net/projects/freeimage/files/Source%20Distribution/3.18.0/
> +md5 f8ba138a3be233a3eed9c456e42e2578 FreeImage3180.zip
> +sha1 38daa9d8f1bca2330a2eaa42ec66fbe6ede7dce9 FreeImage3180.zip
> +
>  # Locally computed
> -sha256 fbfc65e39b3d4e2cb108c4ffa8c41fd02c07d4d436c594fff8dab1a6d5297f89 FreeImage3170.zip
> +sha256 f41379682f9ada94ea7b34fe86bf9ee00935a3147be41b6569c9605a53e438fd FreeImage3180.zip
>  sha256 d51615a1a47f1ddbb027920d60d3fc30a00e1284c795a47857883e641349fadf license-gplv2.txt
>  sha256 084be110e3e8757d8e6945cda1fbc7e5073bbe688dc19b92c0d8440155d8e282 license-gplv3.txt
>  sha256 0bb9a3123297c73ae6e19c70459fb0e58f313f67ca63176fd43f8e77668b8243 license-fi.txt
> diff --git a/package/libfreeimage/libfreeimage.mk b/package/libfreeimage/libfreeimage.mk
> index e0aa1f0ae8..b254fa8846 100644
> --- a/package/libfreeimage/libfreeimage.mk
> +++ b/package/libfreeimage/libfreeimage.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBFREEIMAGE_VERSION = 3.17.0
> +LIBFREEIMAGE_VERSION = 3.18.0
>  LIBFREEIMAGE_SITE = http://downloads.sourceforge.net/freeimage
>  LIBFREEIMAGE_SOURCE = FreeImage$(subst .,,$(LIBFREEIMAGE_VERSION)).zip
>  LIBFREEIMAGE_LICENSE = GPL-2.0 or GPL-3.0 or FreeImage Public License
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
