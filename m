From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Jan 2013 11:54:37 +0100
Subject: [Buildroot] [Feature Request] script to run after build
	completion
In-Reply-To: <50F6DE49.4000600@relinux.de>
References: <50F6DE49.4000600@relinux.de>
Message-ID: <50FA7B6D.9040504@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/01/13 18:07, Stephan Hoffmann wrote:
> Hello all,
>
> I am picking up a feature request from 2011, because I am currently in a
> situation where I could use the proposed feature.
>
> Alper Y?ld?r?m wrote on 8 Jun 2011 22:40
>> Hello,
>>
>> A feature i want to see in buildroot is to have a post build script to
>> run after image creation process, in other words just before "make"
>> returns to console. This way i can put my post build commands inside
>> this script. It will definitely ease my buildroot usage.
>>
>> Some examples to put in this script are:
>>
>> - Printing some king of a "build completed" message,
>> - Printing build time,
>> - Nfs directory creation from rootfs.tar file,
>> - Copying necessary images to some other locations,
> - any other kind of project/board specific post processing
>> - Playing some sound when build is completed.
>>
>> Also, it will be nice to pass a build failed/completed parameter to
>> this script, so different actions could be taken, (i.e. different
>> sounds could be played)
> I would rather think of a hook that only gets called after successful
> image completion.

  I think this very much falls into the category of featuritis.

  In many situations, you'll want a script around 'make' to automate 
things beyond what buildroot does. As long as this script only does 
things _before_ and _after_ the 'make' invocation, there is no need for a 
change in buildroot infrastructure. And these top-level scripts are so 
different from project to project that it doesn't make sense to include 
them in buildroot either.

  For example, here's a script that will automatically take a defconfig 
and copy the images to the target:

#! /bin/sh
# Wrapper around make

# We allow running from a foreign directory
topdir="$(dirname $0)"
[ "$topdir" = . ] && output="output/" || outdir="O=$PWD"
MAKE="make -C $topdir $outdir"

if [ ! -e .config ]; then
   $MAKE project_defconfig
fi

echo $MAKE "$@"
$MAKE "$@" || exit $?

imgfiles="${output}images/bzImage ${output}images/rootfs.cpio.bz2"

# Terminate if image files were not generated
for f in $imgfiles; do
    [ -r "$f" ] || exit 1
done

if [ "$TARGET_IP" ]; then
   scp $imgfiles root@$TARGET_IP:/mnt/boot
   ssh root@$TARGET_IP /sbin/reboot
fi


  There is really no need to change buildroot to support this kind of thing.

  Regards,
  Arnout


[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
