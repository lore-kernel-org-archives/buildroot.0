From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Jan 2011 15:42:50 +0100
Subject: [Buildroot] freetype: fix for multilib toolchain
In-Reply-To: <201101140731.30909.minimod@morethan.org>
References: <BAY145-w16379D55CDD8378B320C74C2F30@phx.gbl>
	<20110114091129.13d810c8@surf>
	<AANLkTi=4rF27ON=McqUWPnM3g7JrjBtGto2q3rMrNKbG@mail.gmail.com>
	<201101140731.30909.minimod@morethan.org>
Message-ID: <20110114154250.11a5542c@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 14 Jan 2011 07:31:28 -0600
"Michael S. Zick" <minimod@morethan.org> wrote:

> I see a: 
> -A ARCH to set the architecture

This option is architecture-specific:

      -A architecture
       --architecture=architecture
           In the current release of ld, this option is useful only for
      the Intel 960 family of architectures.  In that ld configuration,
      the architecture argument identifies the particular architecture
      in the 960 family, enabling some safeguards and modifying the
      archive- library search path.

           Future releases of ld may support similar functionality for
           other architecture families.

> and a:
> -m EMULATION to set the emulation

Here is the list of emulations for a multilib CodeSourcery toolchain
that supports armv4t, armv5t and thumb2 as multilib variants:

$ arm-none-linux-gnueabi-ld -V
GNU ld (Sourcery G++ Lite 2009q1-203) 2.19.51.20090205
  Supported emulations:
   armelf_linux_eabi
   armelfb_linux_eabi

So clearly, the -m option does not allow to choose between the
different multilib variants.

In fact, I don't even see anything in ld that allows to select a
multilib variant. So the link should be using gcc, which then drives ld
(or more precisely collect2) by telling it to use this or that library.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
