From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 25 Aug 2016 16:39:04 +0200
Subject: [Buildroot] [PATCH 2/2] package/iputils: link with -lintl
In-Reply-To: <20160825153748.5a8bbb7a@free-electrons.com>
References: <20160824231003.29262-1-arnout@mind.be>
 <20160824231003.29262-2-arnout@mind.be>
 <20160825101843.4d7740e0@free-electrons.com>
 <19ed123f-e837-e8a6-858e-639e6236f612@mind.be>
 <20160825150721.1158d7fc@free-electrons.com>
 <00309b95-ef5b-ba21-ecaa-7b62010718b5@mind.be>
 <20160825153748.5a8bbb7a@free-electrons.com>
Message-ID: <48725328-c5c3-526d-3748-40a147c13607@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-08-16 15:37, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 25 Aug 2016 15:17:37 +0200, Arnout Vandecappelle wrote:
[snip]
>>>>  Oh, and BR2_NEEDS_GETTEXT is still needed as well, because the gettext package
>>>> can also be built for glibc and musl, but in that case gpg-error doesn't link
>>>> with it (because the functionality is already available in libc).  
>>>
>>> Just use the optional dependency I mentioned above. When the gettext
>>> package is built with a musl or glibc toolchain, it doesn't build and
>>> install a libintl library, since the C library already provides the
>>> functionality. So adding gettext as an optional dependency is just fine.  
>>
>>  I mean it is needed (or rather, makes sense) for iputils. If
>> BR2_PACKAGE_GETTEXT && !BR2_NEEDS_GETTEXT, then libgpg-error doesn't link with
>> libintl, so iputils doesn't need -lintl. And since libintl doesn't even exist,
>> adding -lintl will give an error. No?
> 
> Hum, yes, I guess so. So, to sum up:
> 
>  * Your PATCH 1 needs to be adjusted to:
> 
>    ifeq ($(BR2_PACKAGE_GETTEXT),y)
>    LIBGPG_ERROR_DEPENDENCIES += gettext
>    endif
> 
>  * Your PATCH 2 needs to be adjusted to:
> 
>    # When gettext is enabled (BR2_PACKAGE_GETTEXT=y), and provides
>    # libintl (BR2_NEEDS_GETTEXT=y), we need to link with libintl
>    # explicitly when static linking, since our dependencies might use it.

 Small improvement:

# When gettext is enabled (BR2_PACKAGE_GETTEXT=y), and provides
# libintl (BR2_NEEDS_GETTEXT=y), libgpg-error will link with libintl,
# and libgpg-error is pulled in by libgcrypt. Since iputils doesn't use
# libtool, we have to link with libintl explicitly for static linking,

 And the whole thing should go under the libgcrypt condition.

 I'll fix up, test and resubmit this evening.

 Regards,
 Arnout

>    ifeq ($(BR2_NEEDS_GETTEXT)$(BR2_PACKAGE_GETTEXT)$(BR2_STATIC_LIBS),yyy)
>    IPUTILS_MAKE_OPTS += ADDLIB='-lintl'
>    endif
> 
> Is this correct?
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
