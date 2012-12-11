From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Dec 2012 14:07:30 +0100
Subject: [Buildroot] [PATCH 50/52] package/dtc: new package
In-Reply-To: <CAAXf6LW9EHjFzE9fkhHtdizS36p7cthfmbeVr6F3_EjSWCO1Tg@mail.gmail.com>
References: <1355183112-10735-1-git-send-email-yann.morin.1998@free.fr>
 <1355183112-10735-51-git-send-email-yann.morin.1998@free.fr>
 <CAAXf6LW9EHjFzE9fkhHtdizS36p7cthfmbeVr6F3_EjSWCO1Tg@mail.gmail.com>
Message-ID: <201212111407.30429.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Tuesday 11 December 2012 13:38:03 Thomas De Schampheleire wrote:
> On Tue, Dec 11, 2012 at 12:45 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > dtc is the Device Tree Compiler, and manipulates device trees.
> >
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> Are you aware of the following code in linux/linux.mk ?
> 
> define LINUX_INSTALL_HOST_TOOLS
> # Installing dtc (device tree compiler) as host tool, if selected
> if grep -q "CONFIG_DTC=y" $(@D)/.config; then \
> $(INSTALL) -D -m 0755 $(@D)/scripts/dtc/dtc $(HOST_DIR)/usr/bin/dtc ; \
> fi
> endef

I was vaguely aware of it, yes, although I did not look at it, for a
few reasons:

  - the DTC in the kernel is not at par with the DTC in the package
    (they diverge a bit, and the DTC in the kernel was recently
    resynce, cset #cd29672).

  - for QEMU, I really needed the libfdt library, not the tools; but
    the dtc in the Linux kernel does not build the libfdt library.

  - as Arnout suggested adding the tools on the target too, I deemed
    preferable to use the tools coming with the library rather than
    risk ABI incompatibility between the ones from dtc and the .ones
    from the kernel

  - the one from the kernel is a host tool, used to build the kernel
    itself, while the ones from dtc are target tools, that are supposed
    to be used to build DTCs for use by QEMU. Thus they serve two
    different purposes, and there is no strong requirement that they
    be compatible.

It's also a reason why I did not add $(eval $(host-generic-package))
in the dtc package.

And a fifth reason (the most important one, to me!):
  - I have had a patch accepted in dtc! ;-)

> In this case, the dtc shipped with the linux kernel is simply used.
> This was considered to be sufficient for most cases.

Probably, yes.

> If this is not true and there really is a need for the separate dtc
> package, I think we should link both together in some way, either by a
> comment, or by a mutually exclusive configuration, or ...

OK for a comment for now.

What could probbably be done, later, is to make the dtc package a host
package too, and have the Linux kernel depends on, and use it, instead
of its internal copy (that can be lagging behind).

Does that sound reasonable to you?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
