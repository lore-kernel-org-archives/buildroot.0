From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Feb 2013 21:20:02 +0100
Subject: [Buildroot] uboot-tools and uboot being separate
In-Reply-To: <511BCBEE.5040704@siganos.org>
References: <511BCBEE.5040704@siganos.org>
Message-ID: <20130213212002.25c976ca@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Dimitrios Siganos,

On Wed, 13 Feb 2013 17:22:54 +0000, Dimitrios Siganos wrote:

> I have a query regarding uboot and uboot-tools. Currently they are
> separate packages.
> 
> However, if I am building both the uboot bootloader and the uboot tools
> would it not be reasonable to expect to use the same sources for
> compiling both? At the moment, I am in a situation where I am building
> uboot with one set of files and uboot-tools (e.g. fw_printenv) with another.
> 
> Is the recommended solution to point both uboot and uboot-tools to the
> same package version and apply the same patches to both? And have two
> parallel builds (uboot, uboot-tools) that should be identical?

No. You don't have to have identical uboot-tools and uboot. Basically
uboot-tools provide one tool to create U-Boot images (mkimage) and
tools to manipulate the U-Boot environment from Linux (fw_printenv,
fw_setenv). Those tools are backward compatible, and so you can
perfectly use the tools from U-Boot 2010.x with a running U-Boot 2012.x
or 2013.x.

There is really no need to have the same source code base for both
uboot and uboot-tools.

> I have also being thinking along these lines:
> 
> 1) Edit the uboot-tools makefile to not use its own build directory but
> use uboot's build instead (silly idea idea I admit, but you never know...).
> 
> 2) Edit the uboot package to optionally compile and install the
> uboot-tools as well (this seems to me to be the most logical way).
> 
> Can I have your feedback?

Basically, no, there's a good reason why we wanted two separate
packages: we wanted to be able to build the U-Boot tools sometimes for
the host (mkimage), sometimes for the target (fw_printenv, fw_setenv).
The host-uboot-tools package is also used as a dependency of the Linux
kernel package, and it is much simpler to depend on host-uboot-tools
that to depend on the uboot package itself.

So really, the current way things are done for uboot vs. uboot-tools
has proven to work really well, and for now I don't see a compelling
reason to change that.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
