From: Ralph Siemsen <ralphs@netwinder.org>
Date: Wed, 18 Jul 2007 07:45:50 -0400
Subject: [Buildroot] linux26 compile error
In-Reply-To: <52010.75.129.164.68.1184752475.squirrel@kujawski.org>
References: <52010.75.129.164.68.1184752475.squirrel@kujawski.org>
Message-ID: <20070718114550.GA22077@marvin.netwinder.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 18, 2007 at 04:54:35AM -0500, Frank Kujawski wrote:
> 
> I am getting a compile error on:
> linux26: cross-depmod26
> $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep
> $(TARGET_DIR)/boot/$(LINUX26_FORMAT)

This is caused by a conditional check in target/linux/Makefile.in:
ifneq ($(strip $(LINUX26_VERSION)),$(strip $(LINUX_HEADERS_VERSION)))
surrounding the part that defindes the $(LINUX26_DIR)/.patched
target.  You have LINUX26_VERSION matching LINUX_HEADERS_VERSION
and therefore all the code inside the "ifneq" is skipped.  This
results in the make error: "no rule to make target"

If you do not need to build a kernel, the simplest fix would be
to disable the linux26 target entirely (turn off BR2_PACKAGE_LINUX).

I'm not sure why the ifneq is there in the first place.  It may
have made sense prior to the BSP patch that was recently added.

-R
