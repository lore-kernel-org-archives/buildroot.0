From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 31 Jan 2012 07:59:14 +0100
Subject: [Buildroot] [RFC PATCH v4 1/2] apply-patches.sh: script changed
	to support archives in a proper way
In-Reply-To: <20120129162825.GE26295@ldesroches-Latitude-E6320>
References: <CAAXf6LWYfg-JO0NnW-ng2XfyTr159aGDSsU9Ec6NZriXQHpvrA@mail.gmail.com>
 <201201192321.43429.arnout@mind.be>
 <20120129162825.GE26295@ldesroches-Latitude-E6320>
Message-ID: <201201310759.14801.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 29 January 2012 17:28:25 Ludovic Desroches wrote:
> Hello Arnout,
> 
> First sorry for some mistakes, I wanted to quickly send this patch for the
> upstream version and I forgot to do some basic checks. I thought this file
> was only moved from toolchain/patch-kernel.sh to 
> support/scripts/apply-patches.sh. It explains some errors as dropping -g0
> option.
> 
> I wanted to send a new version but I am facing some issues in relation
> with your advices:
> 
> On Thu, Jan 19, 2012 at 11:21:43PM +0100, Arnout Vandecappelle wrote:
> > On Tuesday 10 January 2012 19:01:55 ludovic.desroches at atmel.com wrote:
> > > From: Ludovic Desroches <ludovic.desroches@atmel.com>
> > > 
> > > The previous script doesn't support patching order with archives since
> > > it didn't extract archives but simply decompressed file and piped the
> > > result to the patch command.
> > > This new script extracts archives in a temporary folder and then applies
> > > patches.
> > 
> >  You need to document the API changes clearly.
> > 
> > - Uncompressed patches must match *.diff* or *.patch*; else they are skipped.
> > 
> > - The defaults are removed; three or more arguments must be supplied.
> > 
> > - Behaviour of directories is changed: it is not considered an overlay, but
> > rather a collection of patches.
> 
> Ok I will do it.
> > 
> >  Since these changes actually have nothing to do with supporting archives
> > in a proper way, I suggest you make separate patches for them.
> 
> It is my main issue splitting the patch into archive management and the change
> of the behaviour of directories.
> I may have to split we apply_patch function: one part to compute type, uncomp,
> etc. and one other for the command to apply the patch

 You misunderstand my point.  You now have one patch (i.e. one git commit)
that fixes the support for patch archives.  This patch also changes the API
of apply-patches.sh.  There may be good reasons for that - AFAICS currently
the only way apply-patches.sh is used in existing buildroot packages, is
for *.patch files.  So it makes sense to simplify the script and remove the
redundant features.  However, such a thing should be done in a separate patch,
with a separate git commit, so it is easier to trace back afterwards when the
feature got removed.  So you'd have a first patch that removes redundant features,
and a second patch that fixes the support for archives.

[snip]
> > > -if [ ! -d "${targetdir}" ] ; then
> > > -    echo "Aborting.  '${targetdir}' is not a directory."
> > > -    exit 1
> > > +case "${1}" in
> > > +*\.tar\.gz$|*\.tgz$|*\.tar\.bz$|*\.tar\.bz2$|*\.tbz$|*\.tbz2$)
> > > +	echo "Error with ${1}";
> > > +	echo "Archives into a directory or another archive is not supported";
> > > +	return 1;
> >  I think this piece is a bit redundant, but it doesn't hurt.
> 
> I don't see why. If we have an archive here we will have the old behavior
> which can cause isssues when applying patches since the patch order may not be
> kept.
 You're right, my mistake, I had just considered the .tgz case, which 
doesn't match any of the case branches and will fall into the default
"Unsupported file format..." branch.

 BTW, just noticed now: the \. is redundant.  The case branches match
glob patterns, not regular expressions, so . isn't anything special.
Same for the $.

[snip]
> > > +# Entry point
> > > +builddir=${1}
> > > +patchdir=${2}
> >  Any particular reason why you renamed 'targetdir' to 'builddir'?  Also,
> > keep this in the beginning of the file so the diff becomes clearer.
> 
> I thought builddir was a better name since targetdir is not output/target as
> it can suggest. It can be a separated patch and maybe this change is not
> useful.
 This could be part of that first cleanup patch.

[snip]
> > > +		# extract archive
> > > +		if echo $i | grep -q -E "tar\.bz$|tar\.bz2$|tbz$|tbz2$" ; then
> > > +			tar_options="-xjf"
> > > +		else
> > > +			tar_options="-xzf"
> > > +		fi
> > > +		tar -C ${patchesdir} --strip-components=1 ${tar_options} ${patch_path}
> >  This will give problems on CentOS 5 IIRC - the issue with host-tar, which 
> > ThomasDS solved recently.

 Actually, it's probably a good idea to export HOST_PATH from the Makefile.
This issue probably occurs in other places as well.  But that's not for you
to take care of, Ludovic.

> 
> Ok I have to checked what is this issue and how it has been solved.
> 
> > 
> >  Actually it is probably a better idea to handle the tar case in the 
> > Makefiles...
> 
> Isn't better here? It will involve changing many files, isn't it?
 You're right, I wasn't thinking.

[snip]

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
