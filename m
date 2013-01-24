From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Jan 2013 07:26:38 +0100
Subject: [Buildroot] [Feature Request] script to run after build
	completion
In-Reply-To: <4145444.6F8bMSMLXM@sagittae>
References: <50F6DE49.4000600@relinux.de> <50FA7B6D.9040504@mind.be>
 <4145444.6F8bMSMLXM@sagittae>
Message-ID: <5100D41E.4030105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/21/13 06:27, J?r?me Pouiller wrote:
> Hello Arnout,
>
> On Saturday 19 January 2013 11:54:37 Arnout Vandecappelle wrote:
[snip]
>>    For example, here's a script that will automatically take a defconfig
>> and copy the images to the target:
>>
>> #! /bin/sh
>> # Wrapper around make
>>
>> # We allow running from a foreign directory
>> topdir="$(dirname $0)"
>> [ "$topdir" = . ]&&  output="output/" || outdir="O=$PWD"
>> MAKE="make -C $topdir $outdir"
>>
>> if [ ! -e .config ]; then
>>     $MAKE project_defconfig
>> fi
>>
>> echo $MAKE "$@"
>> $MAKE "$@" || exit $?
>>
>> imgfiles="${output}images/bzImage ${output}images/rootfs.cpio.bz2"
>>
>> # Terminate if image files were not generated
>> for f in $imgfiles; do
>>      [ -r "$f" ] || exit 1
>> done
>>
>> if [ "$TARGET_IP" ]; then
>>     scp $imgfiles root@$TARGET_IP:/mnt/boot
>>     ssh root@$TARGET_IP /sbin/reboot
>> fi
>>
>>
>>    There is really no need to change buildroot to support this kind of thing.
 >
> This script is not trivial in comparison to post-build.sh. Buildroot should
> deliver a template of it...

  Eh? First of all, the proposed change would not be enough to support a 
script like the above, because the first part (automatically setting O= 
and automatically running a defconfig) is missing. So the only thing that 
could be done by the post-build script is everything starting from the 
line "imgfiles=..." That leaves just two lines of script that become 
redundant with the post-build infrastructure:

echo $MAKE "$@"
$MAKE "$@" || exit $?



> In add, user can continue to run make without running this script (especially
> since this script does not appear in output/ directory).

  If you tell the user to use that script to do the build, he won't even 
know about 'make'.

> IMHO, external script is not right answer and feature asked by Stephan make
> sense.

  It does make sense. I just think that other, much more useful things 
have been rejected in the past (e.g. the rsync filesystem, the split 
Config.in that allows extra packages to be added)


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
