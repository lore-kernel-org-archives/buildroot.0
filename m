From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 21 Jul 2011 09:53:49 +0200
Subject: [Buildroot] asking for advice on improving our buildroot setup
Message-ID: <201107210953.49838.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 [Late reply, but probably still relevant]

On Thursday 07 July 2011 12:09:20, Sven Neumann wrote:
> As you can imagine this build consumes a lot of time and disk space.
> Currently I can think of two ways to improve this:
> 
> (1) Add an initial step that builds a toolchain and then use that
>     toolchain from the following steps. This would save the time
>     to rebuild the toolchain for each of the steps.
> 
> (2) Combine all steps and build different rootfs from within the
>     same buildroot tree. I read that this would be supported. But
>     I would like to get advice from you first. Is there a chance
>     that this will work for the described setup?


 If your build host can be upgraded to a recent kernel with btrfs, you could 
do the following:

 * Create a basic buildroot configuration with the stuff that is relevant for 
all builds.

 * cp --reflink -a output output-specific-target

 * make specific-target-config O=output-specific-target
   => this will add the additional stuff to output-specific-target and (re) 
create the images.

 Because of the --reflink, no additional disk space will be used for the copy 
of the toolchain etc.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                        Senior Embedded Software Architect
arnout dot vandecappelle at essensium com   +32-16-286540       +32-478-010353
Essensium/Mind                              http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium         BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
