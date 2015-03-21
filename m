From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Mar 2015 21:41:22 +0100
Subject: [Buildroot] [RFC 00/11] common init infrastructure
In-Reply-To: <cover.1426960081.git.alex.suykov@gmail.com>
References: <cover.1426960081.git.alex.suykov@gmail.com>
Message-ID: <550DD772.1010009@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/03/15 19:26, Alex Suykov wrote:
> This series is intended to clean up buildroot init system somewhat,
> removing the need for extensive sysv and systemd handling code
> in every package that installs init bits, and allowing alternative
> init systems to be implemented with reasonable amount of effort.

 Wow, impressive. I hadn't imagined it would be possible to get this far.

 I have a couple of overall remarks before I dive into the individual patches.

- Although we have a dependency on python, we don't currently use python for any
of the core functionality (i.e., just building). Personally I like python a lot,
but now you already have to know make and shell pretty well in order to touch
the buildroot core. Adding python to the mix is making the threshold even higher.

- The generation script looks a bit complicated, while on the other hand the
.run files are really terse. I'd prefer a bit more verbosity in the .run files,
especially if that can make the generation script a bit simpler.

- The changes for .users and .files are pretty much independent from this series
so they could be put in a separate series. And I'm anyway not convinced that
they're worthwhile.


 Regards,
 Arnout


> Overview of the changes:
> 
> * drop per-package sysv and systemd files, introduce common format
>   used to generate files for both of them, use a script to do
>   the conversion from common format to sysv or systemd.
> 
> * remove sysv and systemd installation code from package .mk files,
>   let pkg-generic handle it.
> 
> * remove sysv-specific files from skeleton, and sysv-specific hacks
>   from system/system.mk. Use a dedicated script to write inittab,
>   handling global conditionals (root rw/ro, serial getty and so on)
> 
> * remove user definitions from package .mk files, and mkdirs from
>   per-package sysv initscript, use per-package .users and .files
>   instead in a way similar to .hash files.
> 
> Expected benefits:
> 
> * (almost) all packages get both sysv and systemd files at the same
>   time and without the need to support them separately.
> 
> * init-related changes can be introduced without patching
>   all 70+ individual packages that install startup files.
> 
> * new init systems can be introduced with only minor effort,
>   including lightweight ones with controlled (foreground) daemons.
> 
> This series includes the infrastructure changes, and a couple of
> package patches to show how it looks like. Complete set of package
> patches uploaded here: https://github.com/arsv/br/
> 
> 
> This series is for reviewing, not for merging.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
