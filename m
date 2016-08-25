From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 25 Aug 2016 15:17:37 +0200
Subject: [Buildroot] [PATCH 2/2] package/iputils: link with -lintl
In-Reply-To: <20160825150721.1158d7fc@free-electrons.com>
References: <20160824231003.29262-1-arnout@mind.be>
 <20160824231003.29262-2-arnout@mind.be>
 <20160825101843.4d7740e0@free-electrons.com>
 <19ed123f-e837-e8a6-858e-639e6236f612@mind.be>
 <20160825150721.1158d7fc@free-electrons.com>
Message-ID: <00309b95-ef5b-ba21-ecaa-7b62010718b5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-08-16 15:07, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 25 Aug 2016 10:56:12 +0200, Arnout Vandecappelle wrote:
[snip]
>>  Then I wrote patch 1/2 to fix that dependency. In that patch, I decided to use
>> BR2_NEEDS_GETTEXT to always force libgpg-error to link with libintl, because
>> that is what is done by all other packages. As you write in your other reply,
>> that's wrong though: a user who doesn't care about i18n would build libintl even
>> though it isn't needed in this case. I just followed the pattern that is used
>> everywhere else.
> 
> Not correct. There are several packages that optionally depend on
> gettext. For example, look at coreutils, it does exactly what I saying
> above: it depends on gettext if BR2_PACKAGE_GETTEXT=y and that's it.
> 
> Same for gdbm, gptfdisk, libconfuse, popt, etc, etc.
> 
> So no, you've not followed the pattern used everywhere else :-)

 Ahem. Looking back in my console logs: I grepped for BR2_NEEDS_GETTEXT and I
found the pattern I mentioned. Self-fulfilling prophecy :-)


>>  Oh, and BR2_NEEDS_GETTEXT is still needed as well, because the gettext package
>> can also be built for glibc and musl, but in that case gpg-error doesn't link
>> with it (because the functionality is already available in libc).
> 
> Just use the optional dependency I mentioned above. When the gettext
> package is built with a musl or glibc toolchain, it doesn't build and
> install a libintl library, since the C library already provides the
> functionality. So adding gettext as an optional dependency is just fine.

 I mean it is needed (or rather, makes sense) for iputils. If
BR2_PACKAGE_GETTEXT && !BR2_NEEDS_GETTEXT, then libgpg-error doesn't link with
libintl, so iputils doesn't need -lintl. And since libintl doesn't even exist,
adding -lintl will give an error. No?


> 
>>  TBH, the more I think about it, the more I am convinced that we need a more
>> fundamental solution:
> 
> Maybe, yes.

 But that's for post-2016.08 for sure :-)


 Regards,
 Arnout

> 
>> * Make gettext/iconv part of the toolchain; remove any explicit dependency on
>> gettext.
>>
>> * Add a Config.in option to the toolchain (e.g. BR2_USE_LIBINTL) to enable i18n.
>> This option just selects the gettext package. That's just to make it easier to
>> the user, otherwise they'd have to go and select gettext in the target packages
>> menus.
>>
>> * If a package really needs libintl, it will also select BR2_USE_LIBINTL if
>> BR2_NEEDS_GETTEXT(_IF_LOCALE).
>>
>> * Perhaps also make BR2_PACKAGE_GETTEXT a blind option, is there any use for it
>> in glibc/musl?
> 
> There is: when you need gettext programs on the target, which is the
> case of the ecryptfs-utils package.
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
