From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 20 Dec 2012 00:37:30 +0100
Subject: [Buildroot] [PATCH RFC 0/6] Freescale i.MX multimedia libraries
Message-ID: <1355960256-10786-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 This patch series adds Freescale's proprietary multimedia libraries for
the i.MX platform.

 I only tested it on mx6q (SabreLite). I'm sending it now even though there
are still a few major shortcomings, so Peter (and others) have the chance
to test it on different platforms while I'm on vacation.

 These are the things I'd like to see improved - feedback is very welcome!

* The platform stuff. A separate choice in imx-lib and gst-fsl-plugins
really doesn't work, because they are not kept consistent (the 'select'
doesn't always work).

* The binary libraries are linked against glibc, so there probably
should be a dependency on glibc/eglibc as well. However, for
gst-fsl-plugins, not everything depends on the binary libraries.
For instance, the VPU encoder/decoder only requires a firmware blob.
Unfortunately, it still didn't work with uClibc (didn't spend much time
on it though).

* All the binary libraries are installed, even though they are for
other platforms. The whole thing is about 10MB.

* I couldn't find an official upstream download site, so I used a mirror,
but it risks disappearing unexpectedly.

* More stuff should be selectable (e.g. which gst plugins to build).

 The extraction of the .bin self-extractors if fortunately just slightly
messy :-) The legal-info on the other hand is horrible - as usual,
the proprietary projects are much less conscientious about legal stuff
and the typical open source project...


 For the platform stuff, one idea I had was to create a new menu for
platform-specific packages. In that menu, you'd have a menuconfig per
platform, and this menu could give a SoC choice. The platform-specific
menus can collect all the platform-specific packages which are now
"polluting" the rest of the menus. For example:

menu "Platform-specific packages"

menuconfig "Freescale i.MX"

choice "i.MX SoC"
config "i.MX 51"
config "i.MX 6"
endchoice

menuconfig "Freescale QorIQ"

menuconfig "Raspberry Pi"

menuconfig "Snowball"
source "package/snowball-hdmiservice"
source "package/snowball-init"

menuconfig "TI Davinci"


 How does this sound?

 Regards,
 Arnout
