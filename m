From: John Keeping <john@metanate.com>
Date: Mon, 30 Apr 2018 17:56:30 +0100
Subject: [Buildroot] [PATCH] core/pkg-generic: only save latest package
 list
In-Reply-To: <20180430164728.GB2470@scaer>
References: <20180429130714.14312-1-john@metanate.com>
 <20180430164728.GB2470@scaer>
Message-ID: <20180430175630.32e3ae24.john@metanate.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 30 Apr 2018 18:47:28 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> John, All,
> 
> On 2018-04-29 14:07 +0100, John Keeping spake thusly:
> > When rebuilding a package, simply appending the package's file list
> > to the global list means that the package list grows for every
> > rebuild, as does the time taken to check for files installed by
> > multiple packages. Furthermore, we get false positives where a file
> > is reported as being installed by multiple copies of the same
> > package.
> > 
> > With this approach we may end up with orphaned files in the target
> > filesystem if a package that has been updated and rebuilt no longer
> > installs the same set of files, but we know that only a clean build
> > will produce reliable results.  In fact it may be helpful to
> > identify these orphaned files as evidence that the build is not
> > clean.
> > 
> > Signed-off-by: John Keeping <john@metanate.com>
> > ---
> >  package/pkg-generic.mk | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> > index 1c9dd1d734..edc2c9349c 100644
> > --- a/package/pkg-generic.mk
> > +++ b/package/pkg-generic.mk
> > @@ -64,6 +64,7 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
> >  # $(3): suffix of file  (optional)
> >  define step_pkg_size_inner
> >  	cd $(2); \
> > +	$(SED) '/^$(1),/d'
> > $(BUILD_DIR)/packages-file-list$(3).txt; \  
> 
> Since BUILD_DIR is a fully-qualified path, I would have put it as the
> first line of the macros, and thus it would not have required the
> trailing '\':
> 
>     $(SED) '/^$(1),/d' $(BUILD_DIR)/packages-file-list$(3).txt
>     cd $(2); \
>     find [...]

This will cause a build error if packages-file-list$(3).txt doesn't
exist, which will be the case for the first package built.

We could use:

      -$(SED) '/^$(1),/d' $(BUILD_DIR)/packages-file-list$(3).txt

but then make will log that it is ignoring an error.


Regards,
John
