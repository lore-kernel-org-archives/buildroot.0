From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 11 Jul 2016 18:46:39 +0200
Subject: [Buildroot] [PATCH 2/6] pkg-download: Allow packages to pass an
 URL referer to the wget method
In-Reply-To: <20160711112925.1fdb9e93@free-electrons.com>
References: <1468226925-21264-1-git-send-email-romain.perier@free-electrons.com>
 <1468226925-21264-3-git-send-email-romain.perier@free-electrons.com>
 <20160711112925.1fdb9e93@free-electrons.com>
Message-ID: <20160711164639.GC3734@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Romain, All,

On 2016-07-11 11:29 +0200, Thomas Petazzoni spake thusly:
> On Mon, 11 Jul 2016 10:48:41 +0200, Romain Perier wrote:
> > Introduce a new package variable $(PKG)_DL_REFERER. When this variable
> > is defined, its value is passed to the wget downloader. Packages can now
> > retrieve archives from servers that assume that the HTTP client is
> > always connected to the website.
> > 
> > Signed-off-by: Romain Perier <romain.perier@free-electrons.com>
> > ---
> >  package/pkg-download.mk | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> > index a0f694d..7e82ae9 100644
> > --- a/package/pkg-download.mk
> > +++ b/package/pkg-download.mk
> > @@ -171,7 +171,8 @@ define DOWNLOAD_WGET
> >  		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
> >  		$(QUIET) \
> >  		-- \
> > -		'$(call qstrip,$(1))'
> > +		'$(call qstrip,$(1))' \
> > +		$($(PKG)_DL_REFERER)
> >  endef
> 
> This is a question for Yann (who wrote the download helpers): do we
> want a <pkg>_DL_REFERER variable, or should we introduce something more
> generic such as <pkg>_DL_OPTS or <pkg>_DL_CUSTOM_OPTS that would allow
> packages to pass arbitrary custom options to the tool responsible of
> their download?

Yes, I think this should be an arbitrary set of options, that one can
set according to the downloader. Examples:

    FOO_SITE = http://example.net/some/path
    FOO_SITE_METHOD = wget  # The default for http, but here as example
    FOO_DL_OPTS = --referer 'http://example.net/some/other/path/' \
                  --proxy-user=me --proxy-password=secret

Or:

    FOO_SITE = http://example.net/some/tree.git
    FOO_SITE_METHOD = git
    FOO_DL_OPTS = --config core.gitproxy=my-proxy-script

This is much more flexible, as it would not require any additional
option to be added for other corner cases in the future, as Thomas said.

It would also cover the case for those enterprisy weirdos with
proprietary packages to specify uch things such as authentication or
some such.

> That's obviously a big endeavor than adding just the
> <pkg>_DL_REFERER option,

Well, it does not seem like too complex either. The bulk of it would be
in each of the dl backends, plus springling a few more lines in
pkg-downl.doad.mk (like was done for referer anyway) and we do not have
that much backends...

Regards,
Yann E. MORIN.

> but it would also be more flexible, and
> potentially avoid the need to add more variables in the future to solve
> other types of problems.
> 
> What do you think?
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
