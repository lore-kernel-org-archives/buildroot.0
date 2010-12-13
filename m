From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 13 Dec 2010 17:10:14 -0500
Subject: [Buildroot] [PATCH] toolchain: speed up sysroot lib copying
In-Reply-To: <20101213222639.5455b0aa@surf>
References: <1292171120-32512-1-git-send-email-vapier@gentoo.org>
	<20101213222639.5455b0aa@surf>
Message-ID: <201012131710.15480.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday, December 13, 2010 16:26:39 Thomas Petazzoni wrote:
> On Sun, 12 Dec 2010 11:25:20 -0500 Mike Frysinger wrote:
> > The copy_toolchain_lib_root helper searches the entire sysroot, but is
> > only interested in files in certain subdirs.  So rather than waste time
> > in walking the entire tree, walk the few subdirs at the depth level we
> > are actually going to be poaching files from.
> > 
> > diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> > index 05d43e7..674e7b4 100644
> > --- a/toolchain/helpers.mk
> > +++ b/toolchain/helpers.mk
> > @@ -24,7 +24,10 @@ copy_toolchain_lib_root = \
> > 
> >  	LIBS=`(cd $${ARCH_SYSROOT_DIR}; \
> > -		find -L . -path "./lib/$${LIB}.*"     -o \
> > +		find -L \
> > +			  ./lib/ ./usr/lib/ 
./usr/$(TOOLCHAIN_EXTERNAL_PREFIX)/lib*/ \
> > +			  -maxdepth 1 \
> > +			  -path "./lib/$${LIB}.*"     -o \
> > 
> >  			  -path "./usr/lib/$${LIB}.*" -o \
> >  			  -path 
"./usr/$(TOOLCHAIN_EXTERNAL_PREFIX)/lib*/$${LIB}.*" \
> >  		)` ; \
> 
> Can't we replace the 3 -path conditions with a single -name "$${LIB}.*"
> condition ?

sure, i can send an updated patch that does that
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101213/082589b2/attachment-0001.pgp>
