From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 30 Mar 2014 15:36:55 +0200
Subject: [Buildroot] [PATCH 1/2] system/skeleton: add mail group
In-Reply-To: <1A5AFEB0E8764087A9611131F3410AE3@JohanW7>
References: <1394124890-29254-1-git-send-email-luca@lucaceresoli.net>
 <1394124890-29254-2-git-send-email-luca@lucaceresoli.net>
 <20140306171331.GC3625@free.fr> <5319DFED.9030706@lucaceresoli.net>
 <20140329162132.GL3227@free.fr> <1A5AFEB0E8764087A9611131F3410AE3@JohanW7>
Message-ID: <53381DF7.4000205@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sagaert,

Sagaert Johan wrote:
>
> Hi
>
> Just put them in the rootfs overlay, keeping the skeleton to the bare minimum.

Sorry, I don't agree with this approach.

Buildroot packages should work as far as possible out of the box. They
should not rely on rootfs additions or other modifications by the user.
And the exim package uses the mail group, so it would not work unless
the user manually overrides /etc/group in the rootfs overlay.

Moreover, overriding a file in the Buildroot standard skeleton with
a modified version in a user's rootfs overlay opens to problems when
upgrading to later Buildroot versions.

So the mail group should really must be created by Buildroot, either
statically in system/skeleton or via EXIM_USER.

>
> -----Oorspronkelijk bericht-----
> Van: buildroot-bounces at busybox.net [mailto:buildroot-bounces at busybox.net] Namens Yann E. MORIN
> Verzonden: zaterdag 29 maart 2014 17:22
> Aan: Luca Ceresoli
> CC: Thomas Petazzoni; berndkuhls at hotmail.com; buildroot at uclibc.org
> Onderwerp: Re: [Buildroot] [PATCH 1/2] system/skeleton: add mail group
>
> Luca, All,
>
> On 2014-03-07 16:04 +0100, Luca Ceresoli spake thusly:
>> Yann E. MORIN wrote:
>>> On 2014-03-06 17:54 +0100, Luca Ceresoli spake thusly:
>>>> ---
>>>>   system/skeleton/etc/group | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/system/skeleton/etc/group b/system/skeleton/etc/group
>>>> index 864d1db..85a1fa2 100644
>>>> --- a/system/skeleton/etc/group
>>>> +++ b/system/skeleton/etc/group
>>>> @@ -6,6 +6,7 @@ adm:x:4:
>>>>   tty:x:5:
>>>>   disk:x:6:
>>>>   lp:x:7:
>>>> +mail:x:8:
>>>>   kmem:x:9:
>>>>   wheel:x:10:root
>>>>   cdrom:x:11:
>>>
>>> There is no reason to add the 'mail' group to the default skeleton.
>>> If it is missing, 'mkuser' is expected to create it (if not, that's a
>>> bug.)
>>>
>>> So the EXIM_USER in your second patch should be enough.
>>
>> Technically speaking you're perfectly right.
>>
>> I just felt the mail group is one of those groups that are supposed to
>> be used by multiple packages. At least an MTA and a mail server, maybe
>> a spam filter, a virus scanner... and we might have multiple
>> alternatives for each of them.
>>
>> So it looks bad to me to refer to the same group in (potentially) many
>> packages and not having the group well-defined in "the" group list.
>>
>> Of course this is my POV, and it's not very strong now that we have
>> such a small number of mail-related packages in Buildroot...
>
> 'mail' is not a strictly-required group, so I think it does not really belong to the skeleton, especially since most systems
> Buildroot is aimed at won't have an MDA. OTOH, it is a pretty prevalent group in Unix systems.
>
> So I don't mind much about adding the 'mail' group.
>
>> Oh, following my idea I could as well change:
>>
>>   define EXIM_USERS
>> -exim 88 mail 8 * - - - exim
>> +exim 88 mail -1 * - - - exim
>>   endef
>>
>> and your script would get the group ID, right?
>
> Yes.
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> | conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Luca
