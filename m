From: Ismael Luceno <ismael.luceno@gmail.com>
Date: Thu, 1 Mar 2012 15:32:01 -0200
Subject: [Buildroot] [PATCH 1/2] openssl: Fix build on ARM with GCC 4.6.x
In-Reply-To: <20120301053726.GA4978@sapphire.tkos.co.il>
References: <1330558078-3978-1-git-send-email-ismael.luceno@gmail.com>
 <20120301053726.GA4978@sapphire.tkos.co.il>
Message-ID: <20120301153201.58f81290@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 1 Mar 2012 07:37:27 +0200
Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Ismael,
> 
> On Wed, Feb 29, 2012 at 09:27:57PM -0200, Ismael Luceno wrote:
> > 
> > Signed-off-by: Ismael Luceno <ismael.luceno@gmail.com>
> > ---
> >  package/openssl/openssl.mk |    7 +++++++
> >  1 files changed, 7 insertions(+), 0 deletions(-)
> > 
> > diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
> > index cb29fe4..fda935a 100644
> > --- a/package/openssl/openssl.mk
> > +++ b/package/openssl/openssl.mk
> > @@ -9,7 +9,14 @@ OPENSSL_SITE = http://www.openssl.org/source
> >  OPENSSL_INSTALL_STAGING = YES
> >  OPENSSL_DEPENDENCIES = zlib
> >  OPENSSL_TARGET_ARCH = generic32
> > +
> > +ifeq ($(BR2_GCC_VERSION_4_6_X)-$(ARCH),y-arm)
> > +# workaround for gcc issue
> > +# http://gcc.gnu.org/bugzilla/show_bug.cgi?id=48308
> > +OPENSSL_CFLAGS = $(subst -Os,-O2,$(TARGET_CFLAGS))
> > +else
> >  OPENSSL_CFLAGS = $(TARGET_CFLAGS)
> > +endif
> 
> Will this work for external and ct-ng toolchains?
> 
> baruch
> 

As long as you set BR2_GCC_VERSION_4_6_X manually...
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 490 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120301/c8b6a728/attachment.asc>
