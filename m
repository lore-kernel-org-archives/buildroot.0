From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Mon, 27 Aug 2012 21:13:03 -0400
Subject: [Buildroot] [PATCH] Replace DL_DIR refs in the GIT/SVN/HG
	download
In-Reply-To: <CAHXCMMKs4GxWiKbi8dnjezAK5z9s0srDh6u6TFD+BVOG5bWSLA@mail.gmail.com>
References: <1346026375-15339-1-git-send-email-danomimanchego123@gmail.com>
 <CAHXCMMKs4GxWiKbi8dnjezAK5z9s0srDh6u6TFD+BVOG5bWSLA@mail.gmail.com>
Message-ID: <CANxTyt4a9qs1uspp6RUQq5Mm8sALLStdOfJdTsbky_PsCQWdNA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

> If pushd/popd does not do the job, rather than these cd calls, I'd prefer:
> ( cd somewhere ;  do something )

No, I can restore the pushd/popd.  I just didn't think they were necessary,
since the relationship between DL_DIR and $(PKG)_DL_DIR is fixed.

> +DL_DIR:=$(shell readlink -f $(DL_DIR))
> or
> +DL_DIR:=$(shell cd $(DL_DIR); pwd)

I like the "readlink -f" trick.  But I'm not sure either of these will
work.  The readlink
option requires all but the last component to already exist, and the cd/pwd
requires
the whole path to exist.  The top-level Makefile can create DL_DIR (with
mkdir -p),
to support directory creation if needed, so I think we need to avoid
assuming that
the directory pre-exists.  Tell me if I've misunderstood.

Basically, Arnout's reminder that the default DL_DIR value is "$(TOPDIR)/dl"
was enough to convince me to recommend adding $(TOPDIR) to all our
defconfigs - fixing my particular situation.  So I'm not 100% invested in
this
patch, if people would rather leave the download helpers as-is ...

Danomi -


On Mon, Aug 27, 2012 at 12:54 AM, Samuel Martin <s.martin49@gmail.com>wrote:

> Hi Danomi, all,
>
> 2012/8/27 Danomi Manchego <danomimanchego123@gmail.com>:
> > If DL_DIR is set to a relative path, then the download helpers
> > for GIT, SVN, and HG fail, because they reference DL_DIR or
> > $(PKG)_DL_DIR from within the DL_DIR directory.  (But the
> > relative path is relative to TOPDIR.)  All of these cases can
> > be avoided, since the location of the cloned repo is always
> > $(DL_DIR)/$($(PKG)_BASE_NAME), which can be used to make
> > the helpers simpler, as well as more friendly to the relative
> > DL_DIR definition.
> >
> > Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> > ---
> >  package/pkg-download.mk |   16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> > index 9e98581..a7cef0e 100644
> > --- a/package/pkg-download.mk
> > +++ b/package/pkg-download.mk
> > @@ -68,11 +68,11 @@ define DOWNLOAD_GIT
> >         test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
> >         (pushd $(DL_DIR) > /dev/null && \
> >         $(GIT) clone --bare $($(PKG)_SITE) $($(PKG)_BASE_NAME) && \
> > -       pushd $($(PKG)_BASE_NAME) > /dev/null && \
> > +       cd $($(PKG)_BASE_NAME) && \
> >         $(GIT) archive --format=tar --prefix=$($(PKG)_BASE_NAME)/
> $($(PKG)_DL_VERSION) | \
> > -               gzip -c > $(DL_DIR)/$($(PKG)_SOURCE) && \
> > -       popd > /dev/null && \
> > -       rm -rf $($(PKG)_DL_DIR) && \
> > +               gzip -c > ../$($(PKG)_SOURCE) && \
>
> > +       cd $($(PKG)_BASE_NAME) && \
> [...]
> > +       cd .. && \
> If pushd/popd does not do the job, rather than these cd calls, I'd prefer:
> ( cd somewhere ;  do something )
>
>
> > +       rm -rf $($(PKG)_BASE_NAME) && \
> >         popd > /dev/null)
> >  endef
> >
> > @@ -104,9 +104,9 @@ endef
> >  define DOWNLOAD_SVN
> >         test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
> >         (pushd $(DL_DIR) > /dev/null && \
> > -       $(SVN) export -r $($(PKG)_DL_VERSION) $($(PKG)_SITE)
> $($(PKG)_DL_DIR) && \
> > +       $(SVN) export -r $($(PKG)_DL_VERSION) $($(PKG)_SITE)
> $($(PKG)_BASE_NAME) && \
> >         $(TAR) czf $($(PKG)_SOURCE) $($(PKG)_BASE_NAME)/ && \
> > -       rm -rf $($(PKG)_DL_DIR) && \
> > +       rm -rf $($(PKG)_BASE_NAME) && \
> >         popd > /dev/null)
> >  endef
> >
> > @@ -140,8 +140,8 @@ define DOWNLOAD_HG
> >         (pushd $(DL_DIR) > /dev/null && \
> >         $(HG) clone --noupdate --rev $($(PKG)_DL_VERSION) $($(PKG)_SITE)
> $($(PKG)_BASE_NAME) && \
> >         $(HG) archive --repository $($(PKG)_BASE_NAME) --type tgz
> --prefix $($(PKG)_BASE_NAME)/ \
> > -                     --rev $($(PKG)_DL_VERSION)
> $(DL_DIR)/$($(PKG)_SOURCE) && \
> > -       rm -rf $($(PKG)_DL_DIR) && \
> > +                     --rev $($(PKG)_DL_VERSION) ./$($(PKG)_SOURCE) && \
> > +       rm -rf $($(PKG)_BASE_NAME) && \
> >         popd > /dev/null)
> >  endef
> >
>
>
> Overall, I'd prefer a patch like the following, resolving a absolute
> path for DL_DIR, than a patch fixing everywhere DL_DIR is used.
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -26,6 +26,7 @@ DL_DIR=$(call qstrip,$(BR2_DL_DIR))
>  ifeq ($(DL_DIR),)
>  DL_DIR:=$(TOPDIR)/dl
>  endif
> +DL_DIR:=$(shell readlink -f $(DL_DIR))
> or
> +DL_DIR:=$(shell cd $(DL_DIR); pwd)
>
>
> Regards,
>
> --
> Sam
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120827/38dc48a8/attachment-0001.html>
