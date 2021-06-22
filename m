From: Herve Codina <herve.codina@bootlin.com>
Date: Tue, 22 Jun 2021 09:40:52 +0200
Subject: [Buildroot] [PATCH 01/15] package/pkg-generic.mk: detect files
 overwritten in TARGET_DIR and HOST_DIR
In-Reply-To: <20210621213140.GA44262@scaer>
References: <20210621141130.48654-1-herve.codina@bootlin.com>
 <20210621141130.48654-2-herve.codina@bootlin.com>
 <20210621213140.GA44262@scaer>
Message-ID: <20210622094052.01c0a074@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,

On Mon, 21 Jun 2021 23:31:40 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

[...]
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>  
> 
> From here...
> 
> > This commit is retreived from Thomas's work.
> > The first version was discussed
> > https://patchwork.ozlabs.org/project/buildroot/patch/20200430095249.782597-9-thomas.petazzoni at bootlin.com/
> > This new version was not already submitted by Thomas or I missed it.  
> 
> ... to here: this should have been a post-commit note, after the ---
> line...
> 
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > ---  
> 
> ... here.
> 
> Additionally, it would have been nice to summarise the changes made
> between the original submission and htis new one, and how the previous
> review was handled.

I moved the note after a '---' line and added:

   Compared to the first version, this patch has an improved commit message and
   generates the md5sum snapshot using
     'find -L $(1) -type f -print0 | xargs -0 -r md5sum > $($(PKG)_DIR)/.files$(2).md5;'
   instead of
     'cd $(1); LC_ALL=C find . -type f -exec md5sum {} \; > $($(PKG)_DIR)/.files$(2).md5'

> 
> >  package/pkg-generic.mk | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> > 
> > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> > index 45589bcbb4..bb9ff4150a 100644
> > --- a/package/pkg-generic.mk
> > +++ b/package/pkg-generic.mk
> > @@ -102,6 +102,25 @@ define fixup-libtool-files
> >  endef
> >  endif
> >  
> > +# Functions to detect overwritten files
> > +
> > +ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
> > +# $(1): base directory to search in
> > +# $(2): suffix of file (optional)
> > +define pkg_detect_overwrite_before
> > +	LC_ALL=C find $(1) -type f -print0 | xargs -0 -r md5sum > $($(PKG)_DIR)/.files$(2).md5;
> > +endef
> > +
> > +# $(1): base directory to search in
> > +# $(2): suffix of file (optional)
> > +define pkg_detect_overwrite_after
> > +	if test -s $($(PKG)_DIR)/.files$(2).md5 ; then \
> > +		LC_ALL=C md5sum --quiet -c $($(PKG)_DIR)/.files$(2).md5 || \
> > +		{ echo "ERROR: package $($(PKG)_NAME) has overwritten files installed by a previous package, aborting."; exit 1; } ; \
> > +	fi
> > +endef
> > +endif  
> 
> And now I see that only part of the problem is handled; it only tries
> and detect files which content changes; it does not account for files
> which type did change. I.e. a symlink that was onverted over to a file,
> or the other way around.
> 
> So I think we could change the pkg_detect_overwrite_before macro thusly;
> 
>     LC_ALL=C find -L $(1) -type f -print0 |...

I added '-L' option.

> 
> That should cover both cases, with just the esception that a symlink is
> replaced with a file of the same content (or the other way around).
> There's just a little quirk, though:
> 
>     find: File system loop detected; ?host/usr? is part of the same file
>     system loop as ?host?.
> 
> Meh, that's starting to be a bit hairy... We can just ignore it
> explicitly, maybe? For merged-usr in target, we should not have that
> problem, but there is still the option for a custom skeleton, where
> people could provide it as well...
> 
> So, to summarise: this patch does not cover all cases, but it is still
> acceptable, and brings in the necessary infra that we can later extend
> should the need arises.
> 

Ok, v2 with the changes I mentioned will be sent.

Thanks for the review,
Herv? Codina

-- 
Herv? Codina, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
