From: Vadim Kochan <vadim4j@gmail.com>
Date: Tue, 9 Apr 2019 00:54:10 +0300
Subject: [Buildroot] [PATCH] gettext-tiny: Make libiconv only target
 dependency
In-Reply-To: <20190408230530.0a8a67be@windsurf.home>
References: <20190408140442.29566-1-abrodkin@synopsys.com>
 <20190408230530.0a8a67be@windsurf.home>
Message-ID: <20190408215410.e3mxykdxrm23y3ml@vkochan-ThinkPad-T470p>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Alexey, All

On Mon, Apr 08, 2019 at 11:05:30PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon,  8 Apr 2019 17:04:42 +0300
> Alexey Brodkin <alexey.brodkin@synopsys.com> wrote:
> 
> > diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
> > index 4fa014e8dd..f07903d203 100644
> > --- a/package/gettext-tiny/gettext-tiny.mk
> > +++ b/package/gettext-tiny/gettext-tiny.mk
> > @@ -50,7 +50,7 @@ endef
> >  HOST_GETTEXT_TINY_POST_PATCH_HOOKS += HOST_GETTEXT_TINY_COPY_EXTRA_FILES
> >  
> >  ifeq ($(BR2_ENABLE_LOCALE),)
> > -HOST_GETTEXT_TINY_DEPENDENCIES = libiconv
> > +GETTEXT_TINY_DEPENDENCIES = libiconv
> >  endif
> 
> Hm, the issue I see is that gettext-tiny/Config.in does not select
> BR2_PACKAGE_LIBICONV, so we would run into the error that libiconv is
> used as a dependency but not selected.
> 
> While looking at this, I realize that gettext-gnu does have the
> conditional dependency on libiconv, but does not select it. libiconv
> seems to no longer be needed since commit
> 187b4d68e0ad9e92492345c5863da40e32863eda, but we forgot to remove the
> libiconv conditional dependency in gettext-gnu.mk.
> 
> Vadim, do you confirm ?
> 

libiconv is needed by msgfmt and msgmerge during "translation" on the
host so I think host-gettext-tiny should depend on host-libiconv.

Sorry for this issue!

Regards,
Vadim Kochan
