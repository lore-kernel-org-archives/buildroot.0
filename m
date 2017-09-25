From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 25 Sep 2017 22:41:39 +0200
Subject: [Buildroot] [PATCH 35/49 v2] package/libpjsip: add option to
 enable GSM codec
In-Reply-To: <20170925161955.GA2985@scaer>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
 <577822438ab319654ee5eaa73ec0b4f96b3a8434.1504993178.git.yann.morin.1998@free.fr>
 <cec794ed-8219-4289-7d28-22649734f7bc@mind.be> <20170925161955.GA2985@scaer>
Message-ID: <dddc4a7c-a44d-cf9e-7b2b-379d5d28902b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-09-17 18:19, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2017-09-23 19:05 +0200, Arnout Vandecappelle spake thusly:
>> On 09-09-17 23:39, Yann E. MORIN wrote:
>>> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>> ---
>>>  package/libpjsip/Config.in   | 12 ++++++++++++
>>>  package/libpjsip/libpjsip.mk | 14 +++++++++++++-
>>>  2 files changed, 25 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/package/libpjsip/Config.in b/package/libpjsip/Config.in
>>> index 727d2ec3d0..ce15a20567 100644
>>> --- a/package/libpjsip/Config.in
>>> +++ b/package/libpjsip/Config.in
>>> @@ -10,5 +10,17 @@ config BR2_PACKAGE_LIBPJSIP
>>>  
>>>  	  http://www.pjsip.org
>>>  
>>> +if BR2_PACKAGE_LIBPJSIP
>>> +
>>> +config BR2_PACKAGE_LIBPJSIP_CODEC_GSM
>>> +    bool "GSM codec"
>>> +    depends on !BR2_STATIC_LIBS # libgsm
>>> +    select BR2_PACKAGE_LIBGSM
>>  Is there a good reason to make this an explicit suboption rather than an
>> automatic one like we usually do?
> The issue I see is that the handling of codecs is not orthogonal
> (accounting for your reply to the G711 codec):
> 
>   - codecs without external dependency will always be built, 
> 
>   - codecs with external dependencies need those dependencies to be
>     manually selected.
> 
> By adding a config for each codec, the behaviour is then the same for
> all codecs, so the user experiences a _consistent_ behaviour.

 So how does this differ with e.g. freeswitch, where e.g. speex is enabled if it
is enabled, while zrtp (with no external dependencies) is always enabled? I'm
taking this example because it is one I could fine where we explicitly pass
--enable-zrtp from Buildroot, but there are many others where we don't pass
anything explicitly.

 The general guideline is: enable everything if it doesn't increase the size
much, automatically enable things with external dependencies if it doesn't
increase the size much, and only add explicit options if there is a good reason,
like it would increase the size too much, or the external dependency is not
obvious, or something exceptional.

 Clearly, we have (many) exceptions to these principles. I just want to make
sure that we spend conscious thought on such exceptions and don't do it randomly.

 Note that personally I have nothing against adding config options all over the
place. I just want to make sure we follow consistent principles.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
