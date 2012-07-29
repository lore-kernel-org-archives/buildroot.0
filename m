From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 29 Jul 2012 17:56:34 +0200
Subject: [Buildroot] [PATCH] Added local package support.
In-Reply-To: <CAMkyJgD7JqwLaOV46YHqjOBOf4yZWBa9OkOeOqGZkktuYmOQHA@mail.gmail.com>
References: <20120724042408.GA11558@sapphire.tkos.co.il>
 <1343247448-19993-1-git-send-email-avishorp@gmail.com>
 <50107EAF.3030302@mind.be>
 <CAMkyJgA3+icHUKQ6AS==QQG--RuuptTjgy3KSdJvcwiAPxF3Rg@mail.gmail.com>
 <50124C6D.8050608@mind.be> <20120727101253.15d1af71@skate>
 <20120727085350.GA8573@mail.sceen.net>
 <CAMkyJgD7JqwLaOV46YHqjOBOf4yZWBa9OkOeOqGZkktuYmOQHA@mail.gmail.com>
Message-ID: <50155D32.9030702@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/29/12 09:02, Avishay Orpaz wrote:
> Let me try to make my point with an example. Let's say I'm designing a linux based digital camera. The software stack
> will probably include a bunch of standard software component (kernel, busybox, flash utils etc.), but there would also
> be at least one software component that is unique to the design, and not intended to be shared with other designs - for
> example, the GUI implementation of that specific model. This is the kind of software I expect to see in the "local"
> directory. Of course this software component can be put in the "package" directory, but I would think of buildroot as a
> tool, which should not be modified and can be easily upgraded.

  But putting it in a subdirectory 'local' within the buildroot directory still
has the same problem...

  As for ease of upgrading buildroot when there is a package/<company name>
directory: Peter Korsgaard (the main buildroot maintainer) does exactly that
at his work, and I don't think he has any issue with it.  You just need one
additional line at the top of package/Config.in to include
package/<company name>/Config.in


  That said, I would also like the possibility to extend buildroot with "local"
packages, board-specific files, rootfs skeletons, etc.  That gives my customers
the possibility to fully separate the open source stuff from the custom stuff.
(I know I'm changing my opinion here, but only idiots never change their mind :-)
But then, the local directory should be completely outside the buildroot directory.
And I still don't really like the automatic creation of the Config.in file.
I'm not sure what could be the alternative, though, because as you mention
the source-ing of a Config.in can't be done conditionally or using a variable
name.  Perhaps Kconfig itself should be extended to support that?


> Regarding to the comment that other files in other directories may need to be customized - it's very easy to put those
> files in any directory using make variables according to one's project organization preference.

  Or better yet, define a default project directory layout that sets
paths like BR2_LINUX_KERNEL_PATCH automatically.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
