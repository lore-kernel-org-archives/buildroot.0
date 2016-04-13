From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Apr 2016 22:42:10 +0200
Subject: [Buildroot] [PATCH] package/racehound: fix comment
In-Reply-To: <20160413201835.GA24782@free.fr>
References: <1460481650-19136-1-git-send-email-yann.morin.1998@free.fr>
 <570D6840.8080800@mind.be> <20160413201835.GA24782@free.fr>
Message-ID: <570EAF22.3010800@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/13/16 22:18, Yann E. MORIN wrote:
> Arnout, All,
>
> On 2016-04-12 23:27 +0200, Arnout Vandecappelle spake thusly:
>> On 04/12/16 19:20, Yann E. MORIN wrote:
[snip]
>>> this comment is shown:
>>>      racehound needs an Linux kernel >= 3.14 to be built
>>
>>   But I would keep this comment if !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14, to
>> make sure the user realizes that he needs a >= 3.14 kernel. He can still
>> select the package if the headers ar < 3.14, so if he knows what he's doing
>> it will be fine.
>
> I respectfully disagree. There is no corelation between the headers and
> the running kernel (except running kernel mnust be more recent than
> headers).

  Exactly: the running kernel must be more recent than the headers. So if the 
headers are too old, there is a chance that the kernel is too old. So I think 
it's useful in that case to present a warning to the user, when he selects the 
package, that he must make sure his kernel is sufficiently recent. That's what 
the dependency I proposed would do.

>
> Besides, this would be misleading in the other way: if headers are 3.14+
> but kernel is 3.13-, the comment wouild not be shown.

  Er, what did you just say about running kernel must be more recent than headers?

>
>>   Even better would be
>> 	depends on !BR2_LINUX_KERNEL || \
>> 		(BR2_PACKAGE_RACEHOUND && !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14)
>> i.e. only show the >= 3.14 warning in case you actually selected racehound.
>
> Again, headers_atl_least_X_Y does not represent the running kernel, so I
> find it a bit misleading that we use that option to show/hide the
> comment.
>
>>> So, this is incorrect, because:
>>>   1- a kernel >= 3.14 is indeed to be built
>>>   2- the headers version mismatch is not reported
>>>
>>> Fix that by moving the dependency on the kernel headers to the
>>> appropriate comment and enhance it.
>>>
>>> Since there is no way we can know the kernel version to be built, we can
>>> not add such a condition; still, we leave the kernel message as-is.
>>
>>   It can be tested in a pre-configure hook. But the cmake rules already check
>> for that, so there's no need to do it again in buildroot.
>
> No, it does not check for it since we pass it -DKERNEL_VERSION_OK=YES

  Why do we do that?

  Regards,
  Arnout


[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
