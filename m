From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 14 Jan 2013 16:22:43 +0100
Subject: [Buildroot] [PATCH RFC 0/6] Freescale i.MX multimedia libraries
In-Reply-To: <1355960256-10786-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Thu, 20 Dec 2012 00:37:30 +0100")
References: <1355960256-10786-1-git-send-email-arnout@mind.be>
Message-ID: <87sj63ssak.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout>  This patch series adds Freescale's proprietary multimedia libraries for
 Arnout> the i.MX platform.

 Arnout>  I only tested it on mx6q (SabreLite). I'm sending it now even
 Arnout> though there are still a few major shortcomings, so Peter (and
 Arnout> others) have the chance to test it on different platforms while
 Arnout> I'm on vacation.

Thanks. Nobody commented on these patches, and it's obviously useful for
some people even if it isn't perfect, so I've committed them, thanks.

I haven't gotten to runtime test it yet, just done a tets build based on
nitrogen6x_defconfig.

I will try to find time to runtime test stuff as well soonish.


 Arnout>  These are the things I'd like to see improved - feedback is
 Arnout>  very welcome!

 Arnout> * The platform stuff. A separate choice in imx-lib and
 Arnout> gst-fsl-plugins really doesn't work, because they are not kept
 Arnout> consistent (the 'select' doesn't always work).

Agreed. My build first failed because I had just enabled gst-fsl-plugins
but forgotten to track down the imx-lib option to build for mx6.

I wonder where we should put such a "global" option though. Together
with the arch settings?


 Arnout> * All the binary libraries are installed, even though they are
 Arnout> for other platforms. The whole thing is about 10MB.

Yeah, that could presumably be trimmed fairly easily if we had a global
imx variant setting.

 Arnout> * I couldn't find an official upstream download site, so I used
 Arnout> a mirror, but it risks disappearing unexpectedly.

Yeah :/ It should get mirrored on sources.buildroot.net soon
though. It's not completely clear to me if we are strictly allowed to
mirror these though.

 Arnout>  For the platform stuff, one idea I had was to create a new menu for
 Arnout> platform-specific packages. In that menu, you'd have a menuconfig per
 Arnout> platform, and this menu could give a SoC choice. The platform-specific
 Arnout> menus can collect all the platform-specific packages which are now
 Arnout> "polluting" the rest of the menus. For example:

 Arnout> menu "Platform-specific packages"

 Arnout> menuconfig "Freescale i.MX"

 Arnout> choice "i.MX SoC"
 Arnout> config "i.MX 51"
 Arnout> config "i.MX 6"
 Arnout> endchoice

 Arnout> menuconfig "Freescale QorIQ"

 Arnout> menuconfig "Raspberry Pi"

 Arnout> menuconfig "Snowball"
 Arnout> source "package/snowball-hdmiservice"
 Arnout> source "package/snowball-init"

 Arnout> menuconfig "TI Davinci"

Yes, I guess that's what we need to move towards. It gets complicated
when things either don't fit nicely within a single family though.

-- 
Bye, Peter Korsgaard
