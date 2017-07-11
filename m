From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Jul 2017 23:42:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/transmission: fix gtk support
In-Reply-To: <20170711231701.3850d479@windsurf.lan>
References: <20170710175137.1402-1-bernd.kuhls@t-online.de>
 <87a84asr2s.fsf@dell.be.48ers.dk> <20170711231701.3850d479@windsurf.lan>
Message-ID: <a69e0db5-ae3c-fa51-7864-8fd8c98dd71c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-07-17 23:17, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 11 Jul 2017 21:37:15 +0200, Peter Korsgaard wrote:
> 
>>  > Gtk support is controlled by ARG_WITH since
>>  > https://github.com/transmission/transmission/commit/2ccc2bbbfe2e4a26dfeaa13b56c412ea0af4ebe4  
>>
>>  > Fixes a build error if libgtk2/3 was built before transmission:
>>  > http://autobuild.buildroot.net/results/6b6/6b6ce352a9edfe3aaba82be143092a878e7715ed/  
>>
>>  > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>  
>>
>> So this has been broken since (atleast) the version bump in early 2016?
>> Wow.
> 
> Maybe not:
> 
> configure: error: "The gtk client cannot be built without nls support.  Try adding either --enable-nls or --without-gtk" 
> 
> Until the recent gettext revamp we were passing --disable-nls only when
> BR2_ENABLE_LOCALE was disabled. However, the transmission-gtk support has:
> 
> 	depends on BR2_PACKAGE_LIBGTK2 && BR2_ENABLE_LOCALE

 So in fact this dependency on LOCALE is wrong now. Indeed, the commit message
that added it (d6dfc2109c7149a795f7bda963a9a583685dec3f) says:

    Otherwise configure errors out with:

    configure: error: "The gtk client cannot be built without nls support.
    Try adding either --enable-nls or --disable-gtk"

> Therefore, we were never building transmission with --disable-nls. With
> the gettext revamp, we now pass --disable-nls to all packages, unless
> BR2_SYSTEM_ENABLE_NLS is enabled (which it isn't by default).
> 
> So I am not sure the fix is complete. Indeed the error says that the
> gtk client cannot be built without nls support. So I guess that if you
> have BR2_PACKCAGE_TRANSMISSION_GTK=y, but BR2_SYSTEM_ENABLE_NLS
> disabled it still fails to build.

 But only because we pass --disable-nls. I expect that passing --enable-nls
should be sufficient to fix the build again. Indeed, all libcs not have libintl
stubs built in so there is no reason why it shouldn't just work when you pass
--enable-nls.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
