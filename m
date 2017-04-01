From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Sat, 1 Apr 2017 17:37:16 -0400
Subject: [Buildroot] [v6] package: add qt5virtualkeyboard
In-Reply-To: <20170401150938.644ed92b@free-electrons.com>
References: <20170330171842.29179-1-gael.portay@savoirfairelinux.com>
 <20170401150938.644ed92b@free-electrons.com>
Message-ID: <20170401213716.hyde6vvpyoeubzp7@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sat, Apr 01, 2017 at 03:09:38PM +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 30 Mar 2017 13:18:42 -0400, Ga?l PORTAY wrote:
> > This patch adds the Qt virtualkeyboard package.
> > 
> > Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> > Reviewed-by: Peter Seiderer <ps.report@gmx.net>
> 
> I was about to apply this, but there's still one thing unclear to me.
> I'll be making some minor suggestions along the way (but those I would
> have fixed myself when applying if I didn't had the doubt I'm referring
> to). See below.
> 
> > +config BR2_PACKAGE_QT5VIRTUALKEYBOARD
> > +	bool "qt5virtualkeyboard"
> > +	depends on BR2_PACKAGE_QT5_VERSION_LATEST
> > +	depends on BR2_PACKAGE_QT5DECLARATIVE_QUICK
> > +	select BR2_PACKAGE_QT5SVG
> > +	help
> > +	  Qt Virtual Keyboard is a virtual keyboard framework that consists of a
> > +	  C++ backend supporting custom input methods as well as a UI frontend
> > +	  implemented in QML.
> > +
> > +	  This module is licensed under GPLv3.
> 
> You can remove this part, it is incorrect (can be a commercial
> license), and already documented in the package itself.

Done.

> 
> > +if BR2_PACKAGE_QT5VIRTUALKEYBOARD
> 
> One empty line should be added here.
> 

Done.

> > +config BR2_PACKAGE_QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS
> > +	string "language layouts"
> > +	default "en_GB"
> > +	help
> > +	  The Virtual Keyboard supports the following languages:
> > +	  - Arabic (ar_AR)
> > +	  - Danish (da_DK)
> > +	  - English (en_GB)
> > +	  - Finnish (fi_FI)
> > +	  - French (fr_FR)
> > +	  - German (de_DE)
> > +	  - Hindi (hi_IN)
> > +	  - Italian (it_IT)
> > +	  - Japanese (ja_JP)
> > +	  - Korean (ko_KR)
> > +	  - Norwegian (nb_NO)
> > +	  - Persian/Farsi (fa_FA)
> > +	  - Polish (pl_PL)
> > +	  - Portugese (pt_PT)
> > +	  - Romanian (ro_RO)
> > +	  - Russian (ru_RU)
> > +	  - Simplified Chinese (zh_CN)
> > +	  - Traditional Chinese (zh_TW)
> > +	  - Spanish (es_ES)
> > +	  - Swedish (sv_SE)
> > +
> > +	  Note: all is a flag for activating all languages.
> 
> I believe something like this would be clearer:
> 
> 	Note: the special value "all" can be used to install support
> 	for all supported languages.
> 

Done.

> > +
> > +config BR2_PACKAGE_QT5VIRTUALKEYBOARD_HANDWRITING
> > +	bool "handwriting"
> > +	help
> > +	  Handwriting support, with gestures for fullscreen input.
> > +
> > +	  Lipi Toolkit (LipiTk) is an open source toolkit for online Handwriting
> > +	  Recognition.
> 
> One empty line should be added here.
> 

Done.

> 
> > +QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS = $(call qstrip,$(BR2_PACKAGE_QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS))
> > +QT5VIRTUALKEYBOARD_ALL_LAYOUTS = $(findstring all,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS))
> > +ifneq ($(strip $(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
> > +QT5VIRTUALKEYBOARD_QMAKEFLAGS += CONFIG+="$(foreach lang,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS),lang-$(lang))"
> 
> I don't understand how this will behave when the "all" flag is used.
> You will have:
> 
> 	CONFIG+=lang-all
> 
> is this actually working?
> 

Yes.

The Makefile will call qmake with CONFIG+=lang-all.

I tested it and it works fine. CONFIG+=lang-all acts as an alias for all
languages. You can have a look to [1] & [2].

> > +QT5VIRTUALKEYBOARD_OPENWNN = $(findstring ja_JP,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS))
> > +ifneq ($(strip $(QT5VIRTUALKEYBOARD_OPENWNN)$(QT5VIRTUALKEYBOARD_ALL_LAYOUTS)),)
> 
> Is the strip really needed in this condition (and the similar ones
> below) ?
> 
> Perhaps we could do:
> 
> ifneq ($(findstring zh_CN,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
> QT5VIRTUALKEYBOARD_INSTALL_PINYIN = YES
> endif
> 
> ifneq ($(findstring ja_JP,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
> QT5VIRTUALKEYBOARD_INSTALL_OPENWNN = YES
> endif
> 
> ...
> 
> ifneq ($(findstring all,$(QT5VIRTUALKEYBOARD_LANGUAGE_LAYOUTS)),)
> QT5VIRTUALKEYBOARD_INSTALL_PINYIN = YES
> QT5VIRTUALKEYBOARD_INSTALL_OPENWNN = YES
> ...
> endif
> 
> And then use the QT5VIRTUALKEYBOARD_INSTALL_<foo> variables to know
> what should be installed.

It is another solution; which is much more nice.

Done.

> 
> > +ifneq ($(strip $(QT5VIRTUALKEYBOARD_3RDPARTY_PARTS)),)
> 
> strip really needed?

Indeed, the strip here is definelty not needed.

> 
> Thanks,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Thanks!

I will resend a new version.

Regards,
Gael

[1] https://github.com/qt/qtvirtualkeyboard/blob/5.8/src/config.pri#L23-L44
[2] https://doc.qt.io/qt-5/qtvirtualkeyboard-build.html
