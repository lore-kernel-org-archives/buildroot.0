From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 May 2019 08:57:20 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-05-05
In-Reply-To: <20190506063546.hp5272fyzyt2zshw@sapphire.tkos.co.il>
References: <20190506060044.CE8CA85CCF@whitealder.osuosl.org>
 <20190506063546.hp5272fyzyt2zshw@sapphire.tkos.co.il>
Message-ID: <20190506085720.6db369b2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

On Mon, 6 May 2019 09:35:46 +0300
Baruch Siach <baruch@tkos.co.il> wrote:

> Hi Thomas,
> 
> On Mon, May 06, 2019 at 06:00:39AM -0000, Thomas Petazzoni wrote:
> > Detail of failures
> > ------------------
> > 
> >      nds32le |         18xx-ti-utils-R8.7_SP3 | NOK | http://autobuild.buildroot.net/results/3c93cfac81f15f4c18eb7ad578ad86bb7bcf1c12 |       
> 
> glibc does not work well with BR2_STATIC_LIBS. The combination of 
> BR2_STATIC_LIBS with glibc configuration seems to only happen in builds for 
> nds32le. Why is that?

Because:

diff --git a/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in b/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
index e2fe63677d..2596fc3c8b 100644
--- a/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
@@ -1,6 +1,7 @@
 config BR2_TOOLCHAIN_EXTERNAL_ANDES_NDS32
        bool "Andes nds32"
        depends on BR2_nds32
+       depends on !BR2_STATIC_LIBS
        select BR2_TOOLCHAIN_GCC_AT_LEAST_8
        select BR2_TOOLCHAIN_EXTERNAL_GLIBC
        select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17

is missing.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
