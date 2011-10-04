From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Oct 2011 08:10:42 +0200
Subject: [Buildroot] [PATCH 9/9] toolchain: speed up sysroot lib copying
In-Reply-To: <201110030055.41126.yann.morin.1998@anciens.enib.fr>
References: <cover.1317583191.git.thomas.petazzoni@free-electrons.com>
 <2627a069c9566d25191f4cb179cb66af1526d0bc.1317583191.git.thomas.petazzoni@free-electrons.com>
 <201110030055.41126.yann.morin.1998@anciens.enib.fr>
Message-ID: <201110040810.42654.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Monday 03 October 2011 00:55:40, Yann E. MORIN wrote:
> Thomas, Mike, All,
> 
> On Sunday 02 October 2011 21:20:17 Thomas Petazzoni wrote:
> > From: Mike Frysinger <vapier@gentoo.org>
> > 
> > The copy_toolchain_lib_root helper searches the entire sysroot, but is
> > only interested in files in certain subdirs.  So rather than waste time
> > in walking the entire tree, walk the few subdirs at the depth level we
> > are actually going to be poaching files from.
> > 
> > Signed-off-by: Mike Frysinger <vapier@gentoo.org>
> > ---
> > 
> >  toolchain/helpers.mk |    6 +++---
> >  1 files changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> > index 7f3efaa..1a72ae5 100644
> > --- a/toolchain/helpers.mk
> > +++ b/toolchain/helpers.mk
> > @@ -22,9 +22,9 @@ copy_toolchain_lib_root = \
> > 
> >  	DESTDIR="$(strip $3)" ; \
> >  	
> >   \
> >   
> >  	LIBS=`(cd $${ARCH_SYSROOT_DIR}; \
> > 
> > -		find -L . -path "./lib/$${LIB}.*"     -o \
> > -			  -path "./usr/lib/$${LIB}.*" -o \
> > -			  -path "./usr/$(TOOLCHAIN_EXTERNAL_PREFIX)/lib*/$${LIB}.*" \
> > +		find -L \
> > +			$(for d in lib* usr/lib* 
usr/$(TOOLCHAIN_EXTERNAL_PREFIX)/lib*; do
> > test -e "$d" && echo $d) \
> 
> Just by reading the above line:
> 
> 1) You need to double the '$' here, as it must be interpreted by the shell,
>    not by make.
> 
> 2) Also, the 'for' construct is missing the final 'done':
>   for ...; do ...; done
> 
> 3) You should test for a directory, not for mere existence: test -d "$$d"
> 
> 4) And you also need to quote the second '$$d', as you do when testing for
>    its existence (granteed, not really needed, it's not gonna have a space
>    in it, ever, but for consistency, either you quote both, or you quote
>    none; I prefer quoting).
> 
> So (sorry if the line gets wrapped):
>   $$(for d in lib* usr/lib* usr/$(TOOLCHAIN_EXTERNAL_PREFIX)/lib*; do test
> -e "$$d" && echo "$$d"; done) \

 But in fact, all of the above is unnecessary.  lib, usr/lib and 
usr/<prefix>/lib should exist anyway, and the shell will only expand the * to 
existing files or directories.  If you want to limit to directories you can 
simply say

find -L lib* usr/lib* usr/$(TOOLCHAIN_EXTERNAL_PREFIX)/lib* \

> 
> > +			-maxdepth 1 -name "$${LIB}.*" \

 But just to be safe, you can add a 2>/dev/null

 Oh and the exit code of find is fortunately ignored, else you'd have to add a 
|| true as well.

 So, my proposal is one line less:

+               find -L lib* usr/lib* usr/$(TOOLCHAIN_EXTERNAL_PREFIX)/lib* \
+                       -maxdepth 1 -name "$${LIB}.*" 2>/dev/null || true \

 Note: completely untested

> > 
> >  		)` ; \
> >  	
> >  	for FILE in $${LIBS} ; do \
> >  	
> >  		LIB=`basename $${FILE}`; \
> 
> Regards,
> Yann E. MORIN.


 Regards,
 Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
