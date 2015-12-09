From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 9 Dec 2015 17:30:24 +0000
Subject: [Buildroot] [PATCH] libass: allow compilation without a system
 font provider
In-Reply-To: <20151209172813.GA3743@free.fr>
References: <1449505148-9046-1-git-send-email-Vincent.Riera@imgtec.com>
 <20151208171627.GO4188@free.fr> <5668002F.90802@imgtec.com>
 <20151209172813.GA3743@free.fr>
Message-ID: <56686530.3060209@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On 09/12/15 17:28, Yann E. MORIN wrote:
> Vicente, All,
> 
> On 2015-12-09 10:19 +0000, Vicente Olivert Riera spake thusly:
>> On 08/12/15 17:16, Yann E. MORIN wrote:
>>> On 2015-12-07 16:19 +0000, Vicente Olivert Riera spake thusly:
>>>> If no system font provider is provided, then libass will fail to build
>>>> because it requires one by default. The error looks like this:
>>>>
>>>> configure: error: Either DirectWrite (on Windows), CoreText (on OSX), or
>>>> Fontconfig(Linux, other) is required. If you really want to compile
>>>> withouta system font provider, add
>>>> --disable-require-system-font-provider
>>>>
>>>> But, as the error messages says, we can allow the compilation without a
>>>> system font provider if we use the above configure option, so let's do
>>>> it.
>>>>
>>>> Fixes:
>>>>
>>>>   http://autobuild.buildroot.net/results/3a4/3a4c07a0a54d5497fa8a4be2191856e286729637/
>>>>
>>>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>>>> ---
>>>>  package/libass/libass.mk | 3 +++
>>>>  1 file changed, 3 insertions(+)
>>>>
>>>> diff --git a/package/libass/libass.mk b/package/libass/libass.mk
>>>> index 83939e2..f1ec503 100644
>>>> --- a/package/libass/libass.mk
>>>> +++ b/package/libass/libass.mk
>>>> @@ -24,6 +24,9 @@ ifeq ($(BR2_i386)$(BR2_x86_64),y)
>>>>  LIBASS_DEPENDENCIES += host-yasm
>>>>  endif
>>>>  
>>>> +# Allow compilation without a system font provider
>>>> +LIBASS_CONF_OPTS = --disable-require-system-font-provider
>>>
>>> It is my understanding that fontconfig *is* a "system font provider", so
>>> maybe that should go n the else-case for fontconfig, below?
>>>
>>>>  ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
>>>>  LIBASS_DEPENDENCIES += fontconfig
>>>>  LIBASS_CONF_OPTS += --enable-fontconfig
>>> Here:
>>>
>>>     else
>>>     LIBASS_CONF_OPTS += \
>>>         --disable-fontconfig \
>>>         --disable-require-system-font-provider
>>>     endif
>>
>> That was my first approach, but then I thought a bit more about it, and
>> I realized that there could be more system font providers in the future
>> (not only fontconfig). So, by using that option we enable the
>> possibility to build libass without a system font provider. That doesn't
>> mean necessarily that libass will be built without one. If the
>> fontconfig package is selected, it will be built with support for it.
> 
> But since that is currently not the case (i.e. we have a single font
> provider), I think we should do as I suggest. When/if we have another
> font provider, then we can revisit that at that time.

With my approach we won't need to revisit it :P

> And I don't know what other font provider we'd have on Linux, beside
> fontconfig. Arguably, I'm not a font expert either! ;-)

Me neither.

Anyway, let's the maintainer decide.

Regards,

Vincent.

> Regards,
> Yann E. MORIN.
> 
