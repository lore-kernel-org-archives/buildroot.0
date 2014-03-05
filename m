From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Mar 2014 17:59:53 +0100
Subject: [Buildroot] [PATCH 1/1] package: make package download from
 Mercurial repositories more robust
In-Reply-To: <CAAXf6LWZqqyfoCQf=-HxFpfE7=3yHG0vCQX8TCo81+GsZN4BxA@mail.gmail.com>
References: <1394002452-5114-1-git-send-email-mathias.demare@gmail.com>
 <CAAXf6LWZqqyfoCQf=-HxFpfE7=3yHG0vCQX8TCo81+GsZN4BxA@mail.gmail.com>
Message-ID: <20140305165953.GA5066@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mathias, Thomas,

On 2014-03-05 09:12 +0100, Thomas De Schampheleire spake thusly:
> On Wed, Mar 5, 2014 at 7:54 AM, Mathias De Mar?
> <mathias.demare@gmail.com> wrote:
> > Previously, after cloning a Mercurial repository,
> > an interrupted 'hg archive' operation would leave behind a partial
> > archive. This caused future archive operations to fail.
> >
> > Signed-off-by: Mathias De Mar? <mathias.demare@gmail.com>
> > ---
> >  package/pkg-download.mk | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> > index 85842de..6f53f53 100644
> > --- a/package/pkg-download.mk
> > +++ b/package/pkg-download.mk
> > @@ -176,13 +176,19 @@ define SHOW_EXTERNAL_DEPS_SCP
> >  endef
> >
> >
> > +# Download a file using Mercurial.
> > +# In case a previous clone failed, remove the directory.
> > +# To handle interrupted archive operations, use a temporary directory,
> > +# and remove this directory before archiving again.
> >  define DOWNLOAD_HG
> >         test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
> >         (pushd $(DL_DIR) > /dev/null && \
> >         rm -rf $($(PKG)_BASE_NAME) && \
> >         $(HG) clone --noupdate --rev $($(PKG)_DL_VERSION) $($(PKG)_SITE) $($(PKG)_BASE_NAME) && \
> > +       rm -rf $(DL_DIR)/$($(PKG)_SOURCE).tmp && \
> >         $(HG) archive --repository $($(PKG)_BASE_NAME) --type tgz --prefix $($(PKG)_BASE_NAME)/ \
> > -                     --rev $($(PKG)_DL_VERSION) $(DL_DIR)/$($(PKG)_SOURCE) && \
> > +                       --rev $($(PKG)_DL_VERSION) $(DL_DIR)/$($(PKG)_SOURCE).tmp && \
> > +       mv $(DL_DIR)/$($(PKG)_SOURCE).tmp $(DL_DIR)/$($(PKG)_SOURCE) && \
> >         rm -rf $($(PKG)_DL_DIR) && \
> >         popd > /dev/null)
> >  endef
> 
> When the operation is indeed interrupted, the tmp file will not be removed.
> For the wget helper, there is a line:
> ... ||  (rm -f $(DL_DIR)/$(2).tmp ; exit 1)
> 
> that I believe should do exactly that. Could you check this?
> 
> Also, Yann Morin has very recently sent some patches to move the
> download helpers to shell scripts (see
> http://patchwork.ozlabs.org/project/buildroot/list/?page=1 and search
> for pkg-infra)
> I suggested him to add similar robustness to all download helpers.
> In one way or another, we should line up: either by accepting your
> patch first and let Yann rebase, or alternatively by having Yann take
> in your patch and integrate it into his new shell script mechanism.
> 
> Yann: what is your preference?

I already have implemented that in my series. I was waiting for a bit
more reviews before re-posting (and letting some time pass after the
debacle of my last patchset...).

I guess I'll just re-post that series tonight, then.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
