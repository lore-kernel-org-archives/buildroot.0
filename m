From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 3 Aug 2014 19:06:16 +0200
Subject: [Buildroot] [PATCH 3/9 v3] support/download: convert localfiles
 to use the wrapper
In-Reply-To: <CAAXf6LXCOahmhBuYk7O=AMzDD_+JkmFVv73V1SaeGw6ESOPu4w@mail.gmail.com>
References: <cover.1405895896.git.yann.morin.1998@free.fr>
 <05b08895dc36985d013b09ce3e05f67c1bfd1396.1405895896.git.yann.morin.1998@free.fr>
 <CAAXf6LXCOahmhBuYk7O=AMzDD_+JkmFVv73V1SaeGw6ESOPu4w@mail.gmail.com>
Message-ID: <20140803170616.GH4052@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-08-03 09:56 +0200, Thomas De Schampheleire spake thusly:
> On Mon, Jul 21, 2014 at 12:42 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > This drastically simplifies the localfiles helper, as it no longer has
> > to deal with atomically saving the downloaded archive.
> >
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  package/pkg-download.mk |  4 ++--
> >  support/download/cp     | 20 +++++---------------
> >  2 files changed, 7 insertions(+), 17 deletions(-)
> >
> > diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> > index 6320338..94febab 100644
> > --- a/package/pkg-download.mk
> > +++ b/package/pkg-download.mk
> > @@ -205,8 +205,8 @@ endef
> >
> >  define DOWNLOAD_LOCALFILES
> >         test -e $(DL_DIR)/$(2) || \
> > -       $(EXTRA_ENV) support/download/cp $(call stripurischeme,$(call qstrip,$(1))) \
> > -                                        $(DL_DIR)/$(2) && \
> > +       $(EXTRA_ENV) support/download/wrapper cp $(DL_DIR)/$(2) \
> > +                                                $(call stripurischeme,$(call qstrip,$(1))) && \
> >         $(call VERIFY_HASH,$(PKGDIR)/$($(PKG)_NAME).hash,$(DL_DIR)/$(2))
> >  endef
> >
> > diff --git a/support/download/cp b/support/download/cp
> > index 8f6bc06..4945c56 100755
> > --- a/support/download/cp
> > +++ b/support/download/cp
> > @@ -5,22 +5,12 @@ set -e
> 
> Here you didn't make the comment change command->unexpected before set -e.

Yep, will do.

Regards,
Yann E. MORIN.


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
