From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Aug 2014 19:05:52 +0200
Subject: [Buildroot] [PATCH 2/9 v3] support/download: convert bzr to use
 the wrapper
In-Reply-To: <CAAXf6LWX+hn94=2Po9kBhQpdQg=j==9Rya_dw_cmnhgc9cdOeA@mail.gmail.com>
References: <cover.1405895896.git.yann.morin.1998@free.fr>
 <ce8ca130016f8932d332539f40f909fad0fdad4c.1405895896.git.yann.morin.1998@free.fr>
 <CAAXf6LWX+hn94=2Po9kBhQpdQg=j==9Rya_dw_cmnhgc9cdOeA@mail.gmail.com>
Message-ID: <20140803170552.GG4052@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-08-03 09:52 +0200, Thomas De Schampheleire spake thusly:
> On Mon, Jul 21, 2014 at 12:42 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > This drastically simplifies the bzr helper, as it no longer has to
> > deal with atomically saving the downloaded archive.
> >
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  package/pkg-download.mk |  2 +-
> >  support/download/bzr    | 36 ++++++++----------------------------
> >  2 files changed, 9 insertions(+), 29 deletions(-)
> >
> > diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> > index 118591c..6320338 100644
> > --- a/package/pkg-download.mk
> > +++ b/package/pkg-download.mk
> > @@ -112,7 +112,7 @@ endef
> >
> >  define DOWNLOAD_BZR
> >         test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
> > -       $(EXTRA_ENV) support/download/bzr $($(PKG)_SITE) $($(PKG)_DL_VERSION) $(DL_DIR)/$($(PKG)_SOURCE)
> > +       $(EXTRA_ENV) support/download/wrapper bzr $(DL_DIR)/$($(PKG)_SOURCE) $($(PKG)_SITE) $($(PKG)_DL_VERSION)
> >  endef
> >
> >  define SOURCE_CHECK_BZR
> > diff --git a/support/download/bzr b/support/download/bzr
> > index 19d837d..24bb1d0 100755
> > --- a/support/download/bzr
> > +++ b/support/download/bzr
> > @@ -1,38 +1,18 @@
> >  #!/bin/bash
> >
> > -# We want to catch any command failure, and exit immediately
> > +# We want to catch any unexpected failure, and exit immediately
> >  set -e
> >
> >  # Download helper for bzr
> >  # Call it with:
> 
> Maybe we should mention somewhere here that this script is supposed to
> be called through the wrapper, not directly. Currently, the 'Call it
> with' seems to indicate that you should call it directly.
> If you agree to this, then of course it applies to all helpers.

Yep, I'm changing all of them with:

    # Download helper for XXX, to be called from the download wrapper script
    # Expected arguments:

[--SNIP--]
> > +${BZR} export --format=tgz "${output}" "${repo}" -r "${rev}"
> 
> I like the fact that the helpers are now so much easier, and the
> duplication is removed!

Yep.

I also fixed the root dir of the archive, so it now has the basename of
the package as root dir (as discussed on IRC.)

Regards,
Yann E. MORIN.


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
