From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Feb 2013 05:13:43 +0100
Subject: [Buildroot] sdkdir in xorg-server.pc
In-Reply-To: <511D7A62.1040004@mind.be>
References: <511D7A62.1040004@mind.be>
Message-ID: <20130224051343.7a4a691f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Fri, 15 Feb 2013 00:59:30 +0100, Arnout Vandecappelle wrote:

>   By the way, Peter, Thomas, do the autobuilders ever compile the full 
> Xorg server? I don't see how xdriver_xf86-input-synaptics can ever build 
> with this issue...

No, they don't. I did some experiments, and there is a bug in kconfig
that prevents the modular X.org build from ever being chosen.

After conducting a few experiments, it turns out that randpackageconfig
does not make a random selection for choice...enchoice constructs: it
always uses the default choice.

Rather than the slightly more complicated X.org server example, let's
take the libjpeg/jpeg-turbo example (see package/jpeg/Config.in).

If we use "make randconfig" itself, then we properly have both
choices:

$ while true ; do echo "==" ; make randconfig > /dev/null 2>&1 ; grep -E "BR2_PACKAGE_(LIBJPEG|JPEG_TURBO)(=y| is not set)" .config ; done
==
# BR2_PACKAGE_LIBJPEG is not set
BR2_PACKAGE_JPEG_TURBO=y
==
BR2_PACKAGE_LIBJPEG=y
# BR2_PACKAGE_JPEG_TURBO is not set
==
# BR2_PACKAGE_LIBJPEG is not set
BR2_PACKAGE_JPEG_TURBO=y
==
BR2_PACKAGE_LIBJPEG=y
# BR2_PACKAGE_JPEG_TURBO is not set
==
^CBR2_PACKAGE_LIBJPEG=y
# BR2_PACKAGE_JPEG_TURBO is not set
==
# BR2_PACKAGE_LIBJPEG is not set
BR2_PACKAGE_JPEG_TURBO=y
==

However, if you use "make randpackageconfig", libjpeg will always be
selected (unless of course your CPU has NEON or MMX, in which case it
will always select jpeg-turbo):

$ while true ; do echo "==" ; make randpackageconfig > /dev/null 2>&1 ; grep -E "BR2_PACKAGE_(LIBJPEG|JPEG_TURBO)(=y| is not set)" .config ; done
==
BR2_PACKAGE_LIBJPEG=y
# BR2_PACKAGE_JPEG_TURBO is not set
==
BR2_PACKAGE_LIBJPEG=y
# BR2_PACKAGE_JPEG_TURBO is not set
==
BR2_PACKAGE_LIBJPEG=y
# BR2_PACKAGE_JPEG_TURBO is not set
==
BR2_PACKAGE_LIBJPEG=y
# BR2_PACKAGE_JPEG_TURBO is not set
==
BR2_PACKAGE_LIBJPEG=y
# BR2_PACKAGE_JPEG_TURBO is not set
==

Looking deeper into the kconfig code, it appears that in the following
code in confdata.c:

	for_all_symbols(i, csym) {
		if (sym_has_value(csym) || !sym_is_choice(csym))
			continue;

		sym_calc_value(csym);
		if (mode == def_random)
			randomize_choice_values(csym);
		else
			set_all_choice_values(csym);
	}

which handles the randomization of choices, all choices have
"sym_has_value(csym)" true, even the ones that had no value defined in
.config.nopkg. If we remove this test, then the choices are properly
randomized, but then of course even the choices that had a value set
in .config.nopkg (such as target architecture variant, strip tool,
etc.) are randomized, which is not what we want.

So, the problem is that when a partial configuration file
(.config.nopkg) is loaded using KCONFIG_ALLCONFIG, all the choices are
marked as having a value even if it's not the case.

In order to track down the issue, I've produced a minimal test case,
which allows to reproduce the problem even on the kernel's latest
kconfig code (as of 3.8-rc7).

Take the following Config.test.in:

-----8<----------8<------------8<----------
config OPTIONA
       bool "Option A"

choice
	prompt "This is a choice"

config CHOICE_OPTIONA
	bool "Choice Option A"

config CHOICE_OPTIONB
	bool "Choice Option B"

endchoice

config OPTIONB
       bool "Option B"
-----8<----------8<------------8<----------

If you do (using the kernel's kconfig):

 ./scripts/kconfig/conf --randconfig Config.test.in

you will see that the generated .config file properly randomizes all
options, including CHOICE_OPTIONA and CHOICE_OPTIONB.

Now, if we create a partial .config (named orig.config) file to set
the value of some options:

-----8<----------8<------------8<----------
CONFIG_OPTIONA=y
-----8<----------8<------------8<----------

If you do:

 KCONFIG_ALLCONFIG=orig.config ./scripts/kconfig/conf --randconfig Config.test.in

and look@the resulting .config, you will see that:

 * CONFIG_OPTIONA is always set to y, which is OK.

 * CONFIG_OPTIONB is properly randomized

 * But in the choice, it's always CONFIG_CHOICE_OPTIONA that will be
   selected, and never CONFIG_CHOICE_OPTIONB. The randomization for
   choices doesn't work as soon as a file is passed as
   KCONFIG_ALLCONFIG.

I've tried to dive again into kconfig code, but sigh, it is quite
hard to understand. I will report this bug together with its minimal
test case to the linux-kbuild@ mailing list.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
