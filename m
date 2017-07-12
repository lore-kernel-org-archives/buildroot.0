From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Jul 2017 09:49:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/transmission: fix gtk support
In-Reply-To: <a69e0db5-ae3c-fa51-7864-8fd8c98dd71c@mind.be>
References: <20170710175137.1402-1-bernd.kuhls@t-online.de>
 <87a84asr2s.fsf@dell.be.48ers.dk>
 <20170711231701.3850d479@windsurf.lan>
 <a69e0db5-ae3c-fa51-7864-8fd8c98dd71c@mind.be>
Message-ID: <20170712094924.435a5c54@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Jul 2017 23:42:24 +0200, Arnout Vandecappelle wrote:

> > configure: error: "The gtk client cannot be built without nls support.  Try adding either --enable-nls or --without-gtk" 
> > 
> > Until the recent gettext revamp we were passing --disable-nls only when
> > BR2_ENABLE_LOCALE was disabled. However, the transmission-gtk support has:
> > 
> > 	depends on BR2_PACKAGE_LIBGTK2 && BR2_ENABLE_LOCALE  
> 
>  So in fact this dependency on LOCALE is wrong now. Indeed, the commit message
> that added it (d6dfc2109c7149a795f7bda963a9a583685dec3f) says:

Agreed, the BR2_ENABLE_LOCALE dependency is now wrong.

> > Therefore, we were never building transmission with --disable-nls. With
> > the gettext revamp, we now pass --disable-nls to all packages, unless
> > BR2_SYSTEM_ENABLE_NLS is enabled (which it isn't by default).
> > 
> > So I am not sure the fix is complete. Indeed the error says that the
> > gtk client cannot be built without nls support. So I guess that if you
> > have BR2_PACKCAGE_TRANSMISSION_GTK=y, but BR2_SYSTEM_ENABLE_NLS
> > disabled it still fails to build.  
> 
>  But only because we pass --disable-nls. I expect that passing --enable-nls
> should be sufficient to fix the build again. Indeed, all libcs not have libintl

"not -> now" I guess, correct?

> stubs built in so there is no reason why it shouldn't just work when you pass
> --enable-nls.

Why should we randomly pass --enable-nls to some packages? Why should
this package depends on BR2_SYSTEM_ENABLE_NLS, if it needs NLS support?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
