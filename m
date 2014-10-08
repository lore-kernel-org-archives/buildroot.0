From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 8 Oct 2014 23:08:56 +0200
Subject: [Buildroot] [PATCH 6/7 v2] package/freerdp: install server key
 and certificate
In-Reply-To: <CAHXCMMKMdCtW0-yOun432nn-A8D_VikANig5tkhPhEcW5K-5SQ@mail.gmail.com>
References: <cover.1412634775.git.yann.morin.1998@free.fr>
 <2936c6dcc73bf7c96cf67e04b488c7ab4dcb5680.1412634775.git.yann.morin.1998@free.fr>
 <CAHXCMMKMdCtW0-yOun432nn-A8D_VikANig5tkhPhEcW5K-5SQ@mail.gmail.com>
Message-ID: <20141008210856.GF4718@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-10-08 22:58 +0200, Samuel Martin spake thusly:
> On Tue, Oct 7, 2014 at 12:35 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > This is mandatory for an RDP server to have a key and a certificate,
> > otherwise clients will refuse to connect to that server.
> >
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  package/freerdp/freerdp.mk | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
> > index ea590d1..e643e57 100644
> > --- a/package/freerdp/freerdp.mk
> > +++ b/package/freerdp/freerdp.mk
> > @@ -86,4 +86,14 @@ else
> >  FREERDP_CONF_OPTS += -DWITH_XV=OFF
> >  endif
> >
> > +# Install the server key and certificate, so that a client can connect.
> > +# A user can override them with its opwn in a post-build script, if needed.
> 
> s/opwn/own/

Yup.

> > +define FREERDP_INSTALL_KEYS
> > +       $(INSTALL) -D $(@D)/server/X11/server.key \
> > +                     $(TARGET_DIR)/etc/freerdp/keys/server.key
> > +       $(INSTALL) -D $(@D)/server/X11/server.crt \
> > +                     $(TARGET_DIR)/etc/freerdp/keys/server.crt
> > +endef
> > +FREERDP_POST_INSTALL_TARGET_HOOKS += FREERDP_INSTALL_KEYS
> 
> It is useful for the client only? or the server? or both?
> If it is only useful for one or the other, maybe it should be nested
> in a if-block using the BR2_PACKAGE_FREERDP_CLIENT (or
> BR2_PACKAGE_FREERDP_SERVER)?

It;s for the server only. Will fix. Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
