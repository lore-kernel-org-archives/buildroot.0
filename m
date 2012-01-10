From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 10 Jan 2012 12:46:14 +0100
Subject: [Buildroot] [RFC PATCH v3 1/2] apply-patches.sh: script changed
 to support archives in a proper way
In-Reply-To: <20120110103122.GK2890@ldesroches-Latitude-E6320>
References: <201106290542.26383.minimod@morethan.org>
 <1325854022-32258-1-git-send-email-ludovic.desroches@atmel.com>
 <2d2359b7b656cfa35c85ccef3ef5654e9141e889.1325851860.git.ludovic.desroches@atmel.com>
 <CAAXf6LVNMNGcZNYhcboydR5YFqmuoV3zpzecXCAucN+a6o5qkg@mail.gmail.com>
 <20120110103122.GK2890@ldesroches-Latitude-E6320>
Message-ID: <CAAXf6LWYfg-JO0NnW-ng2XfyTr159aGDSsU9Ec6NZriXQHpvrA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jan 10, 2012 at 11:31 AM, Ludovic Desroches
<ludovic.desroches@atmel.com> wrote:
> On Mon, Jan 09, 2012 at 10:45:51AM +0100, Thomas De Schampheleire wrote:
>> On Fri, Jan 6, 2012 at 1:47 PM, ?<ludovic.desroches@atmel.com> wrote:
>> > From: Ludovic Desroches <ludovic.desroches@atmel.com>
>> >
>> > The previous script doesn't support patching order with archives since
>> > it didn't extract archives but simply decompressed file and piped the
>> > result to the patch command.
>> > This new script extracts archives in a temporary folder and then applies
>> > patches.
>> >
>> > Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
>> >
>> > Conflicts:
>> >
>> > ? ? ? ?support/scripts/apply-patches.sh
>> > ---
>> > ?support/scripts/apply-patches.sh | ?159 +++++++++++++++++++++++++-------------
>> > ?1 files changed, 105 insertions(+), 54 deletions(-)
>> >
>> > diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
>> > index 1aef47e..0492e01 100755
>> > --- a/support/scripts/apply-patches.sh
>> > +++ b/support/scripts/apply-patches.sh
>> > @@ -1,66 +1,117 @@
>> > -#! /bin/bash
>> > -# A little script I whipped up to make it easy to
>> > -# patch source trees and have sane error handling
>> > -# -Erik
>> > -#
>> > -# (c) 2002 Erik Andersen <andersen@codepoet.org>
>> > +#!/bin/bash
>>
>> I wonder why you removed the original copyright. I'd say you should
>> keep it, possibly together with a description of the changes and your
>> name.
>> Although it may not be the convention of adding explicit copyrights to
>> scripts in buildroot, removing an existing one seems wrong IMO.
>>
>
> I removed it because I see it as a new script. The major part of the script
> has changed, I mainly kept the switch case but with some changes too.

If I compare the original and the adapted script, I feel that the
original code continues to live in the new one. As you say, the switch
statement, but also the code that applies the patches below the
switch, the checking for rejects, and the removal of backup files.

So, the way I see it, you improved and extended the script, but did
not rewrite it from scratch.

>
> Anyway it's not a problem for me to keep this copyright if needed.
>
>> >
>> > -# Set directories from arguments, or use defaults.
>> > -targetdir=${1-.}
>> > -patchdir=${2-../kernel-patches}
>> > -shift 2
>> > -patchpattern=${@-*}
>> > +# function apply_patch patch_file
>> > +# this function no more deal with directory case since it is managed
>> > +# in an upper layer
>> > +function apply_patch {
>> > +apply="patch -p1 -E -d"
>> > +#if [ ! -e "${1}" ] ; then
>> > +# ? ? ?echo "${1} is not a file"
>> > +# ? ? ?exit 1
>> > +#fi
>> >
>> > -if [ ! -d "${targetdir}" ] ; then
>> > - ? ?echo "Aborting. ?'${targetdir}' is not a directory."
>> > - ? ?exit 1
>> > +case "${1}" in
>> > +*\.tar\.gz$|*\.tgz$|*\.tar\.bz$|*\.tar\.bz2$|*\.tbz$|*\.tbz2$)
>> > + ? ? ? echo "Error with ${1}";
>> > + ? ? ? echo "Archives into a directory or another archive is not supported";
>> > + ? ? ? return 1;
>> > + ? ? ? ;;
>> > +*\.gz$)
>> > + ? ? ? type="gzip"; uncomp="gunzip -dc"; ;;
>> > +*\.bz$)
>> > + ? ? ? type="bzip"; uncomp="bunzip -dc"; ;;
>> > +*\.bz2$)
>> > + ? ? ? type="bzip2"; uncomp="bunzip2 -dc"; ;;
>> > +*\.zip$)
>> > + ? ? ? type="zip"; uncomp="unzip -d"; ;;
>> > +*\.Z$)
>> > + ? ? ? type="compress"; uncomp="uncompress -c"; ;;
>> > +*\.diff*)
>> > + ? ? ? type="diff"; uncomp="cat"; ;;
>> > +*\.patch*)
>> > + ? ? ? type="patch"; uncomp="cat"; ;;
>> > +*)
>> > + ? ? ? echo "Unsupported format file for ${1}, skip it";
>> > + ? ? ? return 0;
>> > + ? ? ? ;;
>> > +esac
>> > +
>> > +echo ""
>> > +echo "Applying ${1} using ${type}: "
>> > +echo ${1} | cat >> ${builddir}/.applied_patches_list
>> > +${uncomp} ${1} | ${apply} ${builddir}
>> > +if [ $? != 0 ] ; then
>> > + ? ? ? echo "Patch failed! Please fix ${1}!"
>> > + ? ? ? return 1
>> > ?fi
>> > +}
>> > +
>> > +
>> > +# entry point
>> > +builddir=${1}
>> > +patchdir=${2}
>> > +shift 2
>> > +patchlist=${@}
>> > +patchesdir="${builddir}/../$(basename $builddir)-patches"
>> > +
>> > +# check directories
>> > ?if [ ! -d "${patchdir}" ] ; then
>> > - ? ?echo "Aborting. ?'${patchdir}' is not a directory."
>> > - ? ?exit 1
>> > + ? ? ? echo "Aborting: ${patchdir} is not a directory."
>> > + ? ? ? exit 1
>> > ?fi
>> > -
>> > -for i in `cd ${patchdir}; ls -d ${patchpattern} 2> /dev/null` ; do
>> > - ? ?apply="patch -g0 -p1 -E -d"
>> > - ? ?uncomp_parm=""
>> > - ? ?if [ -d "${patchdir}/$i" ] ; then
>> > - ? ? ? type="directory overlay"
>> > - ? ? ? uncomp="tar cf - --exclude=.svn --no-anchored -C"
>> > - ? ? ? uncomp_parm="."
>> > - ? ? ? apply="tar xvf - -C"
>> > - ? ?else case "$i" in
>> > - ? ? ? *.gz)
>> > - ? ? ? type="gzip"; uncomp="gunzip -dc"; ;;
>> > - ? ? ? *.bz)
>> > - ? ? ? type="bzip"; uncomp="bunzip -dc"; ;;
>> > - ? ? ? *.bz2)
>> > - ? ? ? type="bzip2"; uncomp="bunzip2 -dc"; ;;
>> > - ? ? ? *.zip)
>> > - ? ? ? type="zip"; uncomp="unzip -d"; ;;
>> > - ? ? ? *.Z)
>> > - ? ? ? type="compress"; uncomp="uncompress -c"; ;;
>> > - ? ? ? *.tgz)
>> > - ? ? ? type="tar gzip"; uncomp="gunzip -dc"; apply="tar xvf - -C"; ;;
>> > - ? ? ? *.tar)
>> > - ? ? ? type="tar"; uncomp="cat"; apply="tar xvf - -C"; ;;
>> > - ? ? ? *)
>> > - ? ? ? type="plaintext"; uncomp="cat"; ;;
>> > - ? ?esac fi
>> > - ? ?echo ""
>> > - ? ?echo "Applying ${i} using ${type}: "
>> > - ? ? ? echo ${i} | cat >> ${targetdir}/.applied_patches_list
>> > - ? ?${uncomp} ${patchdir}/${i} ${uncomp_parm} | ${apply} ${targetdir}
>> > - ? ?if [ $? != 0 ] ; then
>> > - ? ? ? ?echo "Patch failed! ?Please fix $i!"
>> > +if [ ! -d "${builddir}" ] ; then
>> > + ? ? ? echo "Aborting: ${builddir} is not a directory."
>> > ? ? ? ?exit 1
>> > - ? ?fi
>> > +fi
>> > +
>> > +# parse patch list, extract archives, apply patches
>> > +for i in $patchlist ; do
>> > + ? ? ? # for remote files, directory is buildroot dl dir
>> > + ? ? ? #if echo $i | grep -q -E "^http://|^ftp://" ; then
>> > + ? ? ? # ? ? ? patchdir=$patchdir
>> > + ? ? ? #else
>> > + ? ? ? # ? ? ? patchdir=$(dirname $i)
>> > + ? ? ? #fi
>> > + ? ? ? patch_path="${patchdir}/${i}"
>> > + ? ? ? # three cases: directory, archive, file patch (compressed or not)
>> > + ? ? ? # directory
>> > + ? ? ? if [ -d "${patch_path}" ] ; then
>> > + ? ? ? ? ? ? ? for p in $(ls ${patch_path}) ; do
>> > + ? ? ? ? ? ? ? ? ? ? ? apply_patch "${patch_path}/${p}" || exit 1
>> > + ? ? ? ? ? ? ? done
>> > + ? ? ? # archive
>> > + ? ? ? elif echo $i | grep -q -E "tar\.bz$|tar\.bz2$|tbz$|tbz2$|tar\.gz$|tgz$" ; then
>> > + ? ? ? ? ? ? ? mkdir "${patchesdir}"
>> > + ? ? ? ? ? ? ? # extract archive
>> > + ? ? ? ? ? ? ? if echo $i | grep -q -E "tar\.bz$|tar\.bz2$|tbz$|tbz2$" ; then
>> > + ? ? ? ? ? ? ? ? ? ? ? tar_options="-xjf"
>> > + ? ? ? ? ? ? ? else
>> > + ? ? ? ? ? ? ? ? ? ? ? tar_options="-xzf"
>> > + ? ? ? ? ? ? ? fi
>> > + ? ? ? ? ? ? ? tar -C ${patchesdir} --strip-components=1 ${tar_options} ${patch_path}
>> > + ? ? ? ? ? ? ? # apply patches from the archive
>> > + ? ? ? ? ? ? ? #echo ${patchesdir}
>> > + ? ? ? ? ? ? ? #find ${patchesdir} | sort
>> > + ? ? ? ? ? ? ? for p in $(find ${patchesdir} | sort) ; do
>> > + ? ? ? ? ? ? ? ? ? ? ? apply_patch "${p}" || { rm -rf "${patchesdir}" ; exit 1; }
>> > + ? ? ? ? ? ? ? done
>> > + ? ? ? ? ? ? ? rm -rf "${patchesdir}"
>> > + ? ? ? # file which is not an archive
>> > + ? ? ? else
>> > + ? ? ? ? ? ? ? # we can have regex into patch name as package*.patch.arm that's
>> > + ? ? ? ? ? ? ? # why using ls
>> > + ? ? ? ? ? ? ? for p in $(ls -d ${patch_path} 2> /dev/null) ; do
>> > + ? ? ? ? ? ? ? ? ? ? ? apply_patch "${p}" || exit 1
>> > + ? ? ? ? ? ? ? done
>> > + ? ? ? fi
>> > ?done
>> >
>> > -# Check for rejects...
>> > -if [ "`find $targetdir/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ] ; then
>> > +# check for rejects...
>> > +if [ "`find ${builddir}/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ] ; then
>> > ? ? echo "Aborting. ?Reject files found."
>> > ? ? exit 1
>> > ?fi
>> >
>> > -# Remove backup files
>> > -find $targetdir/ '(' -name '*.orig' -o -name '.*.orig' ')' -exec rm -f {} \;
>> > +# remove backup files
>> > +find ${builddir}/ '(' -name '*.orig' -o -name '.*.orig' ')' -exec rm -f {} \;
>> > +
>> > --
>> > 1.7.5.4
>> >

Best regards,
Thomas
