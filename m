From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Mar 2015 18:47:30 +0100
Subject: [Buildroot] [RFC/PATCH] linux: remove the zImage before rebuild
In-Reply-To: <1411773774-7712-1-git-send-email-guido@vanguardiasur.com.ar>
References: <1411773774-7712-1-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <20150308184730.5b821dfa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Guido Mart?nez,

On Fri, 26 Sep 2014 20:22:54 -0300, Guido Mart?nez wrote:
> Currently, if we run "make linux-rebuild", the device tree blob gets
> appended twice to the kernel image, rendering the latter append useless.
> 
> Fix this by removing the zImage before building, so the DTB append runs
> on a fresh kernel image. This is not optimal as the final Linux linking
> step is run again, but at least we get sensible results.
> 
> Signed-off-by: Guido Mart?nez <guido@vanguardiasur.com.ar>

First of all, sorry for the slow response. I could indeed reproduce the
problem.

However, I am not entirely happy with the solution you proposed. I'd
prefer to fix the real problem: the fact that we are overwriting the
kernel zImage file.

I believe we should rather concatenate zImage and the DTB into a file
named maybe zImage.appended-dtb or something like that, and install
this file to $(BINARIES_DIR) and $(TARGET_DIR)/boot/ (if requested).

Or, another possibility is to name the file zImage.<name-of-dtb>, which
would later on allow to generate multiple zImage with various appended
DTBs.

Doing this however requires reworking quite a bit the
LINUX_IMAGE_NAME / LINUX_TARGET_NAME logic. Would you be willing to
work on something like this?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
