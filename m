From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Jan 2015 16:17:28 +0100
Subject: [Buildroot] [PATCH 2/5] package/fbv: Switch to giflib
In-Reply-To: <1422300260-5361-2-git-send-email-bernd.kuhls@t-online.de> (Bernd
 Kuhls's message of "Mon, 26 Jan 2015 20:24:17 +0100")
References: <1422300260-5361-1-git-send-email-bernd.kuhls@t-online.de>
 <1422300260-5361-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87a914z20n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  package/fbv/Config.in             |    4 +--
 >  package/fbv/fbv-1.0b-giflib.patch |   69 +++++++++++++++++++++++++++++++++++++
 >  package/fbv/fbv.mk                |   10 +++++-
 >  3 files changed, 80 insertions(+), 3 deletions(-)
 >  create mode 100644 package/fbv/fbv-1.0b-giflib.patch

 > diff --git a/package/fbv/fbv.mk b/package/fbv/fbv.mk
 > index fe24a6f..81881ff 100644
 > --- a/package/fbv/fbv.mk
 > +++ b/package/fbv/fbv.mk
 > @@ -30,7 +30,15 @@ else
 >  FBV_CONFIGURE_OPTS += --without-libjpeg
 >  endif
 >  ifeq ($(BR2_PACKAGE_FBV_GIF),y)
 > -FBV_DEPENDENCIES += libungif
 > +FBV_DEPENDENCIES += giflib
 > +define FBV_CONFIGURE_LIBUNGIF_IS_NOW_GIFLIB
 > +	$(SED) 's|-lungif|-lgif|' $(@D)/configure
 > +endef
 > +FBV_PRE_CONFIGURE_HOOKS += FBV_CONFIGURE_LIBUNGIF_IS_NOW_GIFLIB
 > +define FBV_MAKE_LIBUNGIF_IS_NOW_GIFLIB
 > +	$(SED) 's|-lungif|-lgif|' $(@D)/Make.conf
 > +endef

Why is it needed to patch Make.conf if you already patch configure
(which generates it)?

I would prefer to see the configure changes in the giflib patch
instead. How do the archlinux guys handle it?

-- 
Bye, Peter Korsgaard
