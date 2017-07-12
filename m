From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Jul 2017 12:04:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/transmission: fix gtk support
In-Reply-To: <20170712094924.435a5c54@windsurf.lan>
References: <20170710175137.1402-1-bernd.kuhls@t-online.de>
 <87a84asr2s.fsf@dell.be.48ers.dk> <20170711231701.3850d479@windsurf.lan>
 <a69e0db5-ae3c-fa51-7864-8fd8c98dd71c@mind.be>
 <20170712094924.435a5c54@windsurf.lan>
Message-ID: <5fe9c108-7a04-ca7c-9bd8-aed7ac639026@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12-07-17 09:49, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 11 Jul 2017 23:42:24 +0200, Arnout Vandecappelle wrote:
> 
>>> configure: error: "The gtk client cannot be built without nls support.  Try adding either --enable-nls or --without-gtk" 
>>>
>>> Until the recent gettext revamp we were passing --disable-nls only when
>>> BR2_ENABLE_LOCALE was disabled. However, the transmission-gtk support has:
>>>
>>> 	depends on BR2_PACKAGE_LIBGTK2 && BR2_ENABLE_LOCALE  
>>
>>  So in fact this dependency on LOCALE is wrong now. Indeed, the commit message
>> that added it (d6dfc2109c7149a795f7bda963a9a583685dec3f) says:
> 
> Agreed, the BR2_ENABLE_LOCALE dependency is now wrong.
> 
>>> Therefore, we were never building transmission with --disable-nls. With
>>> the gettext revamp, we now pass --disable-nls to all packages, unless
>>> BR2_SYSTEM_ENABLE_NLS is enabled (which it isn't by default).
>>>
>>> So I am not sure the fix is complete. Indeed the error says that the
>>> gtk client cannot be built without nls support. So I guess that if you
>>> have BR2_PACKCAGE_TRANSMISSION_GTK=y, but BR2_SYSTEM_ENABLE_NLS
>>> disabled it still fails to build.  
>>
>>  But only because we pass --disable-nls. I expect that passing --enable-nls
>> should be sufficient to fix the build again. Indeed, all libcs not have libintl
> 
> "not -> now" I guess, correct?

 Yes of course.

> 
>> stubs built in so there is no reason why it shouldn't just work when you pass
>> --enable-nls.
> 
> Why should we randomly pass --enable-nls to some packages? Why should
> this package depends on BR2_SYSTEM_ENABLE_NLS, if it needs NLS support?

 Because BR2_SYSTEM_ENABLE_NLS does not really say that NLS *support* is
enabled, it says that NLS *installation* is enabled. NLS support is always
"enabled" through the stubs in musl/uClibc.

 As far as I understand, the configure error is just there because the
transmission guys are too lazy to have conditional use of the intl functions. I
don't see how there could be a hard requirement on non-stub implementations of
the intl functions - except if they start calling internals. So the better
solution, actually, would be to patch out this check in configure and instead
check for intl and error out if that is not available, independent on the
--enable-nls option - just like most packages do, I think.

 If you're not actually interested in translations, there is no reason really
why you should pull them in just because this package is calling gettext stuff
unconditionally.

 That said, probably nobody really cares, we're just fixing build failures here.
So in the end I don't really mind if we depend on BR2_SYSTEM_ENABLE_NLS as the
easy way out. Though then the commit message should at least provide the full
story, as a hint for future contributors who want to fix it properly.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
