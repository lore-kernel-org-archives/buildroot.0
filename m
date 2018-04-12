From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Apr 2018 13:54:28 +0200
Subject: [Buildroot] [PATCH] Added Qualcomm video accelerator and GPU
 firmware option.
In-Reply-To: <20180411213938.5888-1-andre@ignavus.net>
References: <20180411213938.5888-1-andre@ignavus.net>
Message-ID: <20180412135428.6c4cdf50@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Andre,

On Thu, 12 Apr 2018 09:39:38 +1200, Andre Renaud wrote:
> From: Andre Renaud <arenaud@designa-electronics.com>
> 
> Signed-off-by: Andre Renaud <andre@ignavus.net>

I fixed up the title to be:

	linux-firmware: add Qualcomm video accelerator and GPU firmware options

but then I tested it, and your patch triggers an issue in our fix-rpath
script: the patchelf program doesn't like the ELF files that act as
firmware files for the Qualcomm VPU:

/home/thomas/projets/buildroot/support/scripts/fix-rpath target
/home/thomas/projets/buildroot/support/scripts/fix-rpath: line 60:  5156 Aborted                 (core dumped) ${PATCHELF} --print-rpath "${file}" > /dev/null 2>&1
/home/thomas/projets/buildroot/support/scripts/fix-rpath: line 60:  5163 Aborted                 (core dumped) ${PATCHELF} --print-rpath "${file}" > /dev/null 2>&1
/home/thomas/projets/buildroot/support/scripts/fix-rpath: line 60:  5174 Aborted                 (core dumped) ${PATCHELF} --print-rpath "${file}" > /dev/null 2>&1
/home/thomas/projets/buildroot/support/scripts/fix-rpath: line 60:  5209 Aborted                 (core dumped) ${PATCHELF} --print-rpath "${file}" > /dev/null 2>&1
/home/thomas/projets/buildroot/support/scripts/fix-rpath: line 60:  5229 Aborted                 (core dumped) ${PATCHELF} --print-rpath "${file}" > /dev/null 2>&1
/home/thomas/projets/buildroot/support/scripts/fix-rpath: line 60:  5258 Aborted                 (core dumped) ${PATCHELF} --print-rpath "${file}" > /dev/null 2>&1

So, I've submitted a patch that adjusts our fix-rpath script to
ignore /lib/firmware: http://patchwork.ozlabs.org/patch/897624/

I'll wait a bit to see if anyone has some comments about this patch
(and potentially give some Acked-by), as I need to apply such a fix
before applying your patch.

I'm surprised that you haven't see the issue, though.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
