From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 17 Nov 2011 23:36:18 +0000
Subject: [Buildroot] [PATCH 0/2] intro
In-Reply-To: <1321539489-19737-1-git-send-email-konrad@gaisler.com>
References: <1321539489-19737-1-git-send-email-konrad@gaisler.com>
Message-ID: <201111172336.18958.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hoi,

 I'm not very enthousiastic about either of these two features.

On Thursday 17 November 2011 14:18:07 Konrad Eisele wrote:
> The aim of patch-1 is to make it possible to have configuration subtrees.
> This makes it possible to have a structure like this:
> 
> buildroot-kconfigs
> + linux-kconfigs
> + busybox-kconfigs
> + uclibc-kconfigs
> + crosstools-kconfigs
> 
> Where all configuration appear in one xconfig screen. Currently I have focues on
> qconfig only, I think however adding support for gconfig and mconfig is possible
> easily. The subtree feature is enabled with the -s option to qconfig: "qconfig -s <kconf>"

- The subtree that has to be included depends on your buildroot configuration. 
So you have to include all possible linux, busybox, uclibc, ... configs and
protect them with IFs.  I can hardly imagine that Kconfig can deal with such 
huge configurations.

- I don't like the size explosion of the buildroot tree that we would see
if all these configs are included.

- The packages which have kconfigs are the ones that are most likely to need 
board-specific modifications, which may define additional config options.  This
means that copying the config tree into buildroot isn't going to cut it.

- Running configs for these things is a bit of an expert step.  In particular
because the configs have to be post-processed by buildroot and because
you have to save them explicitly afterwards in a place different from the 
output directory.  I think that part should be smoothed out first.  Until
then, I consider it a good thing that the normal user runs 'make xconfig' 
while the expert user runs 'make {,linux-,busybox-}menuconfig'.

- I don't know what it will look like visually because the patch failed to
compile for me (current_conf_level is undefined), but I wonder if there is a
significant advantage compared to just menus.  At least in menuconfig
it wouldn't really make a difference.


> The other feature that patch-1 adds is a config-entry type "execute: It is
> like a string, however when doubleclicking (trying to edit) in qconfig
> (only in qconfig currently) then the string is executed using "system(<str>)".
> The goal is to be able to execute "make" from inside the gui, without having
> to exit.

 Here I simply don't see the benefit.  Whatever needs to be executed there
can just be done with the normal make after the config finishes.  If people
want to push a button to run make, give them Eclipse with a buildroot
plugin :-)


 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
