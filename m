From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 13 Oct 2015 22:53:13 +0200
Subject: [Buildroot] [PATCH v2 2/2] axfs: add new filesystem type
In-Reply-To: <5612C712.6020209@mind.be>
References: <1444064102-13575-1-git-send-email-ariel@vanguardiasur.com.ar>
 <1444064102-13575-3-git-send-email-ariel@vanguardiasur.com.ar>
 <5612C712.6020209@mind.be>
Message-ID: <20151013205313.GB4161@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Ariel, All,

On 2015-10-05 19:53 +0100, Arnout Vandecappelle spake thusly:
> On 05-10-15 17:55, Ariel D'Alessandro wrote:
> > The Advanced XIP File System is a Linux kernel filesystem driver that enables
> > files to be executed directly from flash or ROM memory rather than being copied
> > into RAM.
[--SNIP--]
>  It would be nice to add the axfs kernel side as a kernel extension as well. But
> that looks heavily non-trivial.

I had a quick and cursory look at the axfs sources, and I think this
could be quite easily achievable. Non-trivial, granted, but not too
complex either.

Ariel, are you interested in adding this as a kernel extension?
(Hint: it would be really great! ;-) )

Kernel extensions are a way to "modify" the kernel source tree with
patches provided by another package:
    http://buildroot.org/downloads/manual/manual.html#linux-kernel-ext

Basically, here's what you'd have to do in the axfs extension:

  - get the 'raw' version of the kernel with (but see notes below):
        AXFSUTILS_KVER = $(MAKE) -C $(LINUX_DIR) kernelversion

  - check that there is a patch directory for that kernel version:
        kernel/patches/v$(AXFSUTILS_KVER)/
    => if not, bail out
    => if yes, continue

  - copy $(@D)/kernel/fs/axfs to $(LINUX_DIR)/fs/axfs

  - copy $(@D)/include/linux/* to $(LINUX_DIR)/include/linux/

  - modify $(LINUX_DIR)/fs/Kconfig with (before last line):
        source "fs/axfs/Kconfig"

  - modify $(LINUX_DIR)/fs/Makefile with (as last line):
        obj-$(CONFIG_AXFS) += axfs

Obviously, entirely untested; adapt to Real Life (TM). ;-)

Notes: ideally, the kernel 'raw' version should be provided by
linux/linux.mk but we currently do not have it yet; we only have
'kernelrelease', not 'kernelversion'. It would be interesting if you
provided an initial patch that adds this.

Currently, 'kernelrelease' is in $(LINUX_VERSION_PROBED), so maybe you
could introduce LINUX_VERSION_RAW filled with the output of
'kernelversion' (see how it's done for 'kernelrelease').

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
