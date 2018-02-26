From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Feb 2018 23:45:59 +0100
Subject: [Buildroot] [PATCH 2/2] php: disable on configurations using
 BR2_BINFMT_FLAT
In-Reply-To: <20180226203429.25294-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 26 Feb 2018 21:34:29 +0100")
References: <20180226203429.25294-1-thomas.petazzoni@bootlin.com>
 <20180226203429.25294-2-thomas.petazzoni@bootlin.com>
Message-ID: <874lm3qsig.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > BR2_BINFMT_FLAT configurations require the use of elf2flt. However,
 > PHP uses -export-dynamic which breaks badly with elf2flt. Even a
 > simple program fails to build:

 > $ ./output/host/bin/arm-linux-gcc -Wl,-export-dynamic -o toto toto.c
 > /home/thomas/projets/buildroot/output/host/opt/ext-toolchain/arm-buildroot-uclinux-uclibcgnueabi/bin/ld.real: section .junk LMA [0000000000000000,0000000000000027] overlaps section .text LMA [0000000000000000,0000000000006d07]

 > -export-dynamic is clearly not useful for FLAT configurations, which
 > are always statically linked, but it's quite a bit of work to change
 > the PHP build system to use it only conditionall.

 > It looks more like an interaction bug between gcc (which wants to put
 > the .text section at address 0x0 in its linker script) and elf2flt,
 > which wants to put its .junk section (containing the .rel.text stuff)
 > also at address 0x0.

 > Fixes (works around) the "section overlap" part of:

 >   http://autobuild.buildroot.net/results/35cbed8927bb10500ecf2816aa728ea240a0be21/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Waldemar Brodkorb <wbx@openadk.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
