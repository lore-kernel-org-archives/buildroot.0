From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Oct 2011 19:29:41 +0200
Subject: [Buildroot] [PATCH 2/2] New package: feh
In-Reply-To: <1318329151-9831-2-git-send-email-yegorslists@googlemail.com>
References: <1318329151-9831-1-git-send-email-yegorslists@googlemail.com>
 <1318329151-9831-2-git-send-email-yegorslists@googlemail.com>
Message-ID: <201110111929.42197.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Tuesday 11 October 2011 12:32:31, yegorslists at googlemail.com wrote:
> +config BR2_PACKAGE_FEH
> +       bool "feh"
> +       depends on BR2_PACKAGE_XLIB_LIBXINERAMA
> +       depends on BR2_PACKAGE_XLIB_LIBXT

 depends on BR2_PACKAGE_XORG7 and select these two?

> +       select BR2_PACKAGE_IMLIB2

 Redundant, giblib already selects imlib2.

> +       select BR2_PACKAGE_IMLIB2_PNG

 Here we have a problem that probably occurs in other places as well, and I 
don't see a good solution.

 The reason to select BR2_PACKAGE_IMLIB2_PNG is probably because ImLib2 is 
completely useless if you don't select any backend.  However, the choice for 
png is arbitrary.

 You could put a depends on instead of a select, but then the user has to go 
to two places to get it configured.

 You could repeat the backend options here, but then you get a lot of 
duplication.

 You could select all backends but then ImLib2 is overconfigured.

 You could make png default y for ImLib2, but then the user still has to go to 
two places if he needs gif instead of png.

 At least, the user should be directed to the configuration menu for ImLib2 so 
he can select the required backend there.

 One final option is to create a new top-level menu called 'Features' or 
something, which contains items like BR2_FEATURE_PNG, BR2_FEATURE_GIF.  
imlib2/Config.in could then set BR2_PACKAGE_IMLIB2_PNG default y if 
BR2_FEATURE_PNG.  But this feels a bit heavy-handed to me.


 Regards,
 Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111011/cd876558/attachment.html>
