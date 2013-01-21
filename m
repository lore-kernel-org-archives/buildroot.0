From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Mon, 21 Jan 2013 06:27:35 +0100
Subject: [Buildroot] [Feature Request] script to run after build
	completion
In-Reply-To: <50FA7B6D.9040504@mind.be>
References: <50F6DE49.4000600@relinux.de> <50FA7B6D.9040504@mind.be>
Message-ID: <4145444.6F8bMSMLXM@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

On Saturday 19 January 2013 11:54:37 Arnout Vandecappelle wrote:
> On 16/01/13 18:07, Stephan Hoffmann wrote:
> > Hello all,
> > 
> > I am picking up a feature request from 2011, because I am currently in a
> > situation where I could use the proposed feature.
> > 
> > Alper Y?ld?r?m wrote on 8 Jun 2011 22:40
> > 
> >> Hello,
> >> 
> >> A feature i want to see in buildroot is to have a post build script to
> >> run after image creation process, in other words just before "make"
> >> returns to console. This way i can put my post build commands inside
> >> this script. It will definitely ease my buildroot usage.
[...]
> > 
> > I would rather think of a hook that only gets called after successful
> > image completion.
> 
>   I think this very much falls into the category of featuritis.
> 
>   In many situations, you'll want a script around 'make' to automate
> things beyond what buildroot does. As long as this script only does
> things _before_ and _after_ the 'make' invocation, there is no need for a
> change in buildroot infrastructure. And these top-level scripts are so
> different from project to project that it doesn't make sense to include
> them in buildroot either.
Stephan does not suggest to include these scripts in Buildroot, but just add 
needed framework.

>   For example, here's a script that will automatically take a defconfig
> and copy the images to the target:
> 
> #! /bin/sh
> # Wrapper around make
> 
> # We allow running from a foreign directory
> topdir="$(dirname $0)"
> [ "$topdir" = . ] && output="output/" || outdir="O=$PWD"
> MAKE="make -C $topdir $outdir"
> 
> if [ ! -e .config ]; then
>    $MAKE project_defconfig
> fi
> 
> echo $MAKE "$@"
> $MAKE "$@" || exit $?
> 
> imgfiles="${output}images/bzImage ${output}images/rootfs.cpio.bz2"
> 
> # Terminate if image files were not generated
> for f in $imgfiles; do
>     [ -r "$f" ] || exit 1
> done
> 
> if [ "$TARGET_IP" ]; then
>    scp $imgfiles root@$TARGET_IP:/mnt/boot
>    ssh root@$TARGET_IP /sbin/reboot
> fi
> 
> 
>   There is really no need to change buildroot to support this kind of thing.
This script is not trivial in comparison to post-build.sh. Buildroot should 
deliver a template of it... 

In add, user can continue to run make without running this script (especially 
since this script does not appear in output/ directory). 

IMHO, external script is not right answer and feature asked by Stephan make 
sense.

-- 
J?r?me Pouiller
