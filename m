From: Steve Calfee <stevecalfee@gmail.com>
Date: Mon, 11 Apr 2011 17:06:03 -0700
Subject: [Buildroot] which templates are used?
In-Reply-To: <4DA3709E.7070005@daccii.it>
References: <4DA36046.2040606@michaelburghart.de>	<4DA369FA.8050505@michaelburghart.de>
	<4DA3709E.7070005@daccii.it>
Message-ID: <4DA3976B.40807@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/11/11 14:20, Daniele Salvatore Albano wrote:
> Il 11/04/2011 22:52, Michael Burghart ha scritto:
>> I set this in .config:
>>
>> BR2_ROOTFS_SKELETON_CUSTOM=y
>> BR2_ROOTFS_SKELETON_CUSTOM_PATH="/Save/buildroot-2011.02/fs/skeleton"
>>
>>
>> but it's not used! I made special directories and files in the
>> fs/skeleton but they are nowhere to be seen. What do I have to do to
>> make them visible??
> 
> You need to do a full rebuild or just copy changed/updated files to the 
> target directory (target) and rebuild/regenerate filesystems
> 
Or you can use the
 BR2_ROOTFS_POST_BUILD_SCRIPT:
  ? Specify a script to be run after the build has finished and before
    ?
  ? the BR2 starts packing the files into selected packages.
    ?
    ? This gives users the oportunity to do board-specific cleanups,
      ?
  ? add-ons and the like, so the generated files can be used directly
    ?
  ? without further processing.
    ?
    ? The script is called with the target directory name as first and
      ?
  ? only argument. Make sure the exit code of that script is 0,
    ?
  ? otherwise make will stop after calling it.
    ?

  ? Symbol: BR2_ROOTFS_POST_BUILD_SCRIPT
[=$(TOPDIR)/target/device/beaglebo ?
  ? Type  : string
    ?
  ? Prompt: Custom script to run before packing files
    ?
  ?   Defined at fs/Config.in:3
    ?
  ?   Location:
    ?
  ?     -> Target filesystem options
    ?

Sorry about the mess in the cut and paste from buildroot's menuconfig.


Mine patchrootfs is:
#!/bin/bash
#
# skript which runs before creating rootfs
#
#
MAINDIR=${1}/../../
SRCDIR=${MAINDIR}"target/device/beagleboard/skeleton/*"
DESTDIR=${1}
echo "***************patching some stuff in " ${DESTDIR} from ${SRCDIR}
#echo "DESTDIR " ${DESTDIR}
#echo "SRCDIR " ${SRCDIR}
#ls -l ${SRCDIR} ${SRCDIR}"/etc"
cp -rvp ${SRCDIR} ${DESTDIR}
echo "end of userdefined script before packing rootfs"

So this copies the fs skeleton, recursively from the local directory
after every build. The trick is it just overlays the fs in the target,
so you only have to add files that are specific or changed in your
build. So if you tweak an existing file say in /etc, it will replace
that file. If you add a new file (maybe a script) say in /usr/bin it
will add that from your local tree into the build. The local skeleton
should stay very sparse.

There is no way to remove files that are not needed etc, just remove
them locally in your skeleton and when buildroot is remade with a clean
it will get all sorted out.

Regards, Steve
