From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 23 Oct 2012 15:03:54 +0200
Subject: [Buildroot] [PATCH 01/10] manual: add section about storing the
 configuration.
In-Reply-To: <CAHXCMM+qPKy0qUefqnr3V5jiy7ffR1AO_aNnKiW7LBT_YfV01Q@mail.gmail.com>
References: <1350776731-8467-1-git-send-email-arnout@mind.be>
 <1350776731-8467-2-git-send-email-arnout@mind.be>
 <CAHXCMM+qPKy0qUefqnr3V5jiy7ffR1AO_aNnKiW7LBT_YfV01Q@mail.gmail.com>
Message-ID: <508695BA.9070908@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/10/12 17:05, Samuel Martin wrote:
> Arnout, all,
>
> 2012/10/21 Arnout Vandecappelle (Essensium/Mind)<arnout@mind.be>:
[snip]
>> +1. +make menuconfig+ to configure toolchain, packages and kernel.

> I think you don't need to use explicit numbering here and everywhere
> below, which should force to "1. ..."  each item.

  I find the 1. notation clearer than the plain . notation (they do exactly
the same AFAICS).


>> +1. +make linux-menuconfig+ to update the kernel config, similar for
>> +   other configuration.
>> +1. +mkdir -p board/<manufacturer>/<boardname>+
>> +1. Set the following options to +board/<manufacturer>/<boardname>/<package>.config+
>> +   (as far as they are relevant):
>> +   * +BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE+
>> +   * +BR2_PACKAGE_BUSYBOX_CONFIG+
>> +   * +BR2_TOOLCHAIN_CTNG_CONFIG+
>> +   * +BR2_UCLIBC_CONFIG+
>> +   * +BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_CONFIG_FILE+
> I think that we could/should/have to add such option for barebox too.
> I've cooked a patch for that and I'll post it shortly.

  I intentionally made the documentation patch first, and the others later,
so it's easier to see how the other patches affect the documentation.  And
I didn't make a barebox patch because Maxime is making one.

>
>> +1. Write the configuration files:
>> +   * +make linux-update-defconfig+
>> +   * +make busybox-update-config+
>> +   * +cp<output>/build/build-toolchain/.config board/<manufacturer>/<boardname>/ctng.config+
>> +   * +make uclibc-update-config+
>> +   * +cp<output>/build/at91bootstrap3-*/.config board/<manufacturer>/<boardname>/at91bootstrap3.config+
> humm... I may be a bit nit, but I would prefer fill the
> board/<manufacturer>/<boardname>  directory with all these config.
> files _before_ setting the corresponding options, so I would swap this
> step with the previous one.

  But then you can't use 'make xxx-update-defconfig'...


[snip]
>> +1. Create a script or Makefile in the board directory that calls
>> +   buildroot:
>> ++
>> +------------
>> +make -C<path-to-buildroot>  O=<path-to-board-directory>/output BR2_DEFCONFIG=<path-to-board-directory>/buildroot.config defconfig
>> +make -C<path-to-buildroot>  O=<path-to-board-directory>/output BOARDDIR=<path-to-board-directory>
>> +------------
> Rather a (rhetoric) question or a feature request ;-) than a comment:
> since this script/makefile is located at the root of the board
> directory, how about automatically resolve the
> <path-to-board-directory>?

  Yes, but since that feature seemed to be too controversial in my first
patch series, I left it out here.

[snip]
>> +1. To add patches to the linux build, set +BR2_LINUX_KERNEL_PATCH+ to
>> +   +$(BOARDDIR)/patches/linux+ and add your patches in that directory.
>> +   Similar for U-Boot, barebox, at91bootstrap and at91bootstrap3.
> This point is also true for board supported in BR, except that all
> patches belong to the board/<manufacturer>/<boardname>  directory.
> So, either move this point up in the "Creating your own board support"
> section and/or add the corresponding point to the "Step-by-step
> instructions for storing configuration inside the buildroot tree"
> section.

  True, will do.

  Thanks,
  Regards,
  Arnout

[snip]

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
