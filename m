From: Ludovic Desroches <ludovic.desroches@atmel.com>
Date: Sun, 29 Jan 2012 17:28:25 +0100
Subject: [Buildroot] [RFC PATCH v4 1/2] apply-patches.sh: script changed
 to support archives in a proper way
In-Reply-To: <201201192321.43429.arnout@mind.be>
References: <CAAXf6LWYfg-JO0NnW-ng2XfyTr159aGDSsU9Ec6NZriXQHpvrA@mail.gmail.com>
 <1326218516-28062-1-git-send-email-ludovic.desroches@atmel.com>
 <a1a34b76b35ddb80d06ab96bca9fb13a01922aef.1326218007.git.ludovic.desroches@atmel.com>
 <201201192321.43429.arnout@mind.be>
Message-ID: <20120129162825.GE26295@ldesroches-Latitude-E6320>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

First sorry for some mistakes, I wanted to quickly send this patch for the
upstream version and I forgot to do some basic checks. I thought this file
was only moved from toolchain/patch-kernel.sh to 
support/scripts/apply-patches.sh. It explains some errors as dropping -g0
option.

I wanted to send a new version but I am facing some issues in relation
with your advices:

On Thu, Jan 19, 2012 at 11:21:43PM +0100, Arnout Vandecappelle wrote:
> On Tuesday 10 January 2012 19:01:55 ludovic.desroches at atmel.com wrote:
> > From: Ludovic Desroches <ludovic.desroches@atmel.com>
> > 
> > The previous script doesn't support patching order with archives since
> > it didn't extract archives but simply decompressed file and piped the
> > result to the patch command.
> > This new script extracts archives in a temporary folder and then applies
> > patches.
> 
>  You need to document the API changes clearly.
> 
> - Uncompressed patches must match *.diff* or *.patch*; else they are skipped.
> 
> - The defaults are removed; three or more arguments must be supplied.
> 
> - Behaviour of directories is changed: it is not considered an overlay, but
> rather a collection of patches.

Ok I will do it.
> 
>  Since these changes actually have nothing to do with supporting archives
> in a proper way, I suggest you make separate patches for them.

It is my main issue splitting the patch into archive management and the change
of the behaviour of directories.
I may have to split we apply_patch function: one part to compute type, uncomp,
etc. and one other for the command to apply the patch

> 
> > 
> > Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
> > 
> > Conflicts:
> > 
> > 	support/scripts/apply-patches.sh
> 
>  Please remove this piece from the comment.
> 
> > ---
> >  support/scripts/apply-patches.sh |  135 +++++++++++++++++++++++++-------------
> >  1 files changed, 89 insertions(+), 46 deletions(-)
> > 
> > diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
> > index 1aef47e..2a25606 100755
> > --- a/support/scripts/apply-patches.sh
> > +++ b/support/scripts/apply-patches.sh
> > @@ -5,62 +5,105 @@
> >  #
> >  # (c) 2002 Erik Andersen <andersen@codepoet.org>
> >  
> > -# Set directories from arguments, or use defaults.
> > -targetdir=${1-.}
> > -patchdir=${2-../kernel-patches}
> > -shift 2
> > -patchpattern=${@-*}
> > +# function apply_patch patch_file
> > +# This function no more deals with directory case since it is managed
> > +# in an upper layer
>  This comment isn't very helpful, since the reader can't see how it was before.
> Actually, no comment is needed here (it's pretty obvious that it applies a single
> patch).

Yes you're right.

> 
> > +function apply_patch {
>  Please indent the body of the function.  And preferably keep the same
> whitespace convention as the original (4 spaces).  That makes the diff 
> smaller.  Do feel free to get rid of the original's mixed tabs-and-spaces,
> though...
> 
> > +apply="patch -p1 -E -d"
>  Since apply is used only once it is no longer necessary to make it a variable.
> 
>  Why did the -g0 option get dropped?

As I told a mistake on my side...

> 
> > -if [ ! -d "${targetdir}" ] ; then
> > -    echo "Aborting.  '${targetdir}' is not a directory."
> > -    exit 1
> > +case "${1}" in
> > +*\.tar\.gz$|*\.tgz$|*\.tar\.bz$|*\.tar\.bz2$|*\.tbz$|*\.tbz2$)
> > +	echo "Error with ${1}";
> > +	echo "Archives into a directory or another archive is not supported";
> > +	return 1;
>  I think this piece is a bit redundant, but it doesn't hurt.

I don't see why. If we have an archive here we will have the old behavior
which can cause isssues when applying patches since the patch order may not be
kept.

> 
> > +	;;
> > +*\.gz$)
> > +	type="gzip"; uncomp="gunzip -dc"; ;;
> > +*\.bz$)
> > +	type="bzip"; uncomp="bunzip -dc"; ;;
> > +*\.bz2$)
> > +	type="bzip2"; uncomp="bunzip2 -dc"; ;;
> > +*\.zip$)
> > +	type="zip"; uncomp="unzip -d"; ;;
> > +*\.Z$)
> > +	type="compress"; uncomp="uncompress -c"; ;;
> > +*\.diff*)
> > +	type="diff"; uncomp="cat"; ;;
> > +*\.patch*)
> > +	type="patch"; uncomp="cat"; ;;
> > +*)
> > +	echo "Unsupported format file for ${1}, skip it";
> > +	return 0;
> > +	;;
> > +esac
> > +
> > +echo ""
> > +echo "Applying ${1} using ${type}: "
> > +echo ${1} | cat >> ${builddir}/.applied_patches_list
>  The 'cat' here is completely redundant AFAICS.  (I realize this was
> already present in the original.)

Yes I will remove it.

> 
> > +${uncomp} ${1} | ${apply} ${builddir}
>  If you use "$1" and "$builddir", you also support names with spaces and
> other shell-interpreted stuff.
> 
> > +if [ $? != 0 ] ; then
> > +	echo "Patch failed! Please fix ${1}!"
> > +	return 1
> >  fi
> > +}
> > +
> > +
> > +# Entry point
> > +builddir=${1}
> > +patchdir=${2}
>  Any particular reason why you renamed 'targetdir' to 'builddir'?  Also,
> keep this in the beginning of the file so the diff becomes clearer.

I thought builddir was a better name since targetdir is not output/target as
it can suggest. It can be a separated patch and maybe this change is not
useful.

> 
>  Again, quoting would be useful.

Ok.

> 
> > +shift 2
> > +patchlist=${@}
>  Note that $@ implies the quotes already, so they're not required here.
> 
> > +patchesdir="${builddir}/../$(basename $builddir)-patches"
>  I would make the patchesdir a subdirectory of the builddir, so it does
> get cleaned up with a -dirclean.  E.g. 
> $builddir/.patches-$(basename $tarfile)-unpacked
> 

Good idea, thanks.

> > +
> > +# Check directories
> >  if [ ! -d "${patchdir}" ] ; then
> > -    echo "Aborting.  '${patchdir}' is not a directory."
> > -    exit 1
> > +	echo "Aborting: ${patchdir} is not a directory."
> > +	exit 1
>  Preferably, don't modify things unnecessarily.
> 
> >  fi
> > -    
> > -for i in `cd ${patchdir}; ls -d ${patchpattern} 2> /dev/null` ; do 
> > -    apply="patch -g0 -p1 -E -d"
> > -    uncomp_parm=""
> > -    if [ -d "${patchdir}/$i" ] ; then
> > -	type="directory overlay"
> > -	uncomp="tar cf - --exclude=.svn --no-anchored -C"
> > -	uncomp_parm="."
> > -	apply="tar xvf - -C"
> > -    else case "$i" in
> > -	*.gz)
> > -	type="gzip"; uncomp="gunzip -dc"; ;; 
> > -	*.bz)
> > -	type="bzip"; uncomp="bunzip -dc"; ;; 
> > -	*.bz2)
> > -	type="bzip2"; uncomp="bunzip2 -dc"; ;; 
> > -	*.zip)
> > -	type="zip"; uncomp="unzip -d"; ;; 
> > -	*.Z)
> > -	type="compress"; uncomp="uncompress -c"; ;; 
> > -	*.tgz)
> > -	type="tar gzip"; uncomp="gunzip -dc"; apply="tar xvf - -C"; ;; 
> > -	*.tar)
> > -	type="tar"; uncomp="cat"; apply="tar xvf - -C"; ;; 
> > -	*)
> > -	type="plaintext"; uncomp="cat"; ;; 
> > -    esac fi
> > -    echo ""
> > -    echo "Applying ${i} using ${type}: " 
> > -	echo ${i} | cat >> ${targetdir}/.applied_patches_list
> > -    ${uncomp} ${patchdir}/${i} ${uncomp_parm} | ${apply} ${targetdir} 
> > -    if [ $? != 0 ] ; then
> > -        echo "Patch failed!  Please fix $i!"
> > +if [ ! -d "${builddir}" ] ; then
> > +	echo "Aborting: ${builddir} is not a directory."
> >  	exit 1
> > -    fi
> > +fi
> > +
> > +# Parse patch list, extract archives, apply patches
> > +for i in $patchlist ; do
> > +	patch_path="${patchdir}/${i}"
> > +	# three cases: directory, archive, file patch (compressed or not)
> > +	# directory
> > +	if [ -d "${patch_path}" ] ; then
> > +		for p in $(ls ${patch_path}) ; do
> > +			apply_patch "${patch_path}/${p}" || exit 1
> > +		done
> > +	# archive
> > +	elif echo $i | grep -q -E "tar\.bz$|tar\.bz2$|tbz$|tbz2$|tar\.gz$|tgz$" ; then
> > +		mkdir "${patchesdir}"
>  Remove the patchesdir first, in case it got left behind by an interrupted
> previous run.

Thanks I forgot this case.

> 
> > +		# extract archive
> > +		if echo $i | grep -q -E "tar\.bz$|tar\.bz2$|tbz$|tbz2$" ; then
> > +			tar_options="-xjf"
> > +		else
> > +			tar_options="-xzf"
> > +		fi
> > +		tar -C ${patchesdir} --strip-components=1 ${tar_options} ${patch_path}
>  This will give problems on CentOS 5 IIRC - the issue with host-tar, which 
> ThomasDS solved recently.

Ok I have to checked what is this issue and how it has been solved.

> 
>  Actually it is probably a better idea to handle the tar case in the 
> Makefiles...

Isn't better here? It will involve changing many files, isn't it?

> 
> > +		# apply patches from the archive
> > +		for p in $(find ${patchesdir} | sort) ; do
> > +			apply_patch "${p}" || { rm -rf "${patchesdir}" ; exit 1; }
> > +		done
> > +		rm -rf "${patchesdir}"
>  I would not remove the patchesdir; makes it easier for a developer to read
> and/or unapply the patches.

Ok, why not.

> 
> > +	# file which is not an archive
> > +	else
> > +		# we can have regex into patch name as package*.patch.arm that's
>  Actually, it's not a regex but a glob pattern.
> 
> > +		# why using ls
> > +		for p in $(ls -d ${patch_path} 2> /dev/null) ; do
> > +			apply_patch "${p}" || exit 1
> > +		done
> > +	fi
> >  done
> >  
> >  # Check for rejects...
> > -if [ "`find $targetdir/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ] ; then
> > +if [ "`find ${builddir}/ '(' -name '*.rej' -o -name '.*.rej' ')' -print`" ] ; then
> >      echo "Aborting.  Reject files found."
> >      exit 1
> >  fi
> >  
> >  # Remove backup files
> > -find $targetdir/ '(' -name '*.orig' -o -name '.*.orig' ')' -exec rm -f {} \;
> > +find ${builddir}/ '(' -name '*.orig' -o -name '.*.orig' ')' -exec rm -f {} \;
> > 
> 
>  Regards,
>  Arnout
> 
> -- 
> Arnout Vandecappelle                               arnout at mind be
> Senior Embedded Software Architect                 +32-16-286540
> Essensium/Mind                                     http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
> 

Thanks for your help.

Regards

Ludovic
