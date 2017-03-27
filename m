From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 27 Mar 2017 23:29:44 +0200
Subject: [Buildroot] [PATCH 2/2] e2fsprogs: keep util-linux's fsck if
 chosen
In-Reply-To: <621304273.6901494.1479740590995.JavaMail.zimbra@datacom.ind.br>
References: <20161118152427.16515-1-maxime.hadjinlian@gmail.com>
 <20161118152427.16515-2-maxime.hadjinlian@gmail.com>
 <1043203342.6813512.1479733854854.JavaMail.zimbra@datacom.ind.br>
 <CAGduivxBL8=fZafQG3odT_2_UUDruUgB1ioozn9tJvX6OPe_Zw@mail.gmail.com>
 <621304273.6901494.1479740590995.JavaMail.zimbra@datacom.ind.br>
Message-ID: <72350614-2d6d-69ff-a2f7-03b97c41d9c9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Coming back to this old issue (trigger by the patchwork cleanup initiated by
Thomas)

On 21-11-16 16:03, Carlos Santos wrote:
>> From: "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>
>> To: "Carlos Santos" <casantos@datacom.ind.br>
>> Cc: "buildroot" <buildroot@buildroot.org>
>> Sent: Monday, November 21, 2016 12:24:07 PM
>> Subject: Re: [Buildroot] [PATCH 2/2] e2fsprogs: keep util-linux's fsck if chosen
> 
>> Hi there,
>>
>> On Mon, Nov 21, 2016 at 2:10 PM, Carlos Santos <casantos@datacom.ind.br> wrote:
>>>> From: "Maxime Hadjinlian" <maxime.hadjinlian@gmail.com>
>>>> To: buildroot at buildroot.org
>>>> Sent: Friday, November 18, 2016 1:24:27 PM
>>>> Subject: [Buildroot] [PATCH 2/2] e2fsprogs: keep util-linux's fsck if chosen
>>>
>>>> Since e2fsprogs depends on util-linux, it's build after it. It means
>>>> that if you want the fsck wrapper from util-linux (which is better
>>>> maintained and you are sure that it's compatible with systemd) and you
>>>> want e2fsck, it won't work.
>>>>
>>>> Because of the merge of /usr/bin and /bin, we end up deleting the fsck
>>>> from util-linux.

 First of all, I think we should change set --prefix=/ for e2fsprogs. That way,
they are installed in the same location as where busybox and util-linux put
them. That removes the need for the E2FSPROGS_REMOVE_BUSYBOX_APPLETS hack.

 But then we have the problem that e2fsprogs.mk currently removes all the
programs that it doesn't install. A simple solution would be to remove all the
options from Config.in so that the removals are not needed anymore.

 Of course, that will do exactly the opposite of what you want to achieve here,
since e2fsprogs will override everything from util-linux... But for that, there
happens to be a simple solution: --disable-fsck doesn't build and install fsck
(without affecting e2fsck). (Of course, I didn't actually test this, just looked
at configure.ac and Makefile.in.)

>>>>
>>>> This makes an attempt at fixing the issues.
>>>>
>>>> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>>>> ---
>>>> I am cleary not satisfied by the way I handled that, I am not even sure
>>>> it works in all cases. I can't spend much more time on this right now,
>>>> so I need advice/help from the community to fix that in a proper/generic
>>>> manner.
>>> What about using something like this, instead?
>> It's indeed better, but you have to keep the bit about the busybox
>> applet due to the merge of /sbin and /usr/sbin
> 
> Right. Looks like combining the changes in Config.in and e2fsprogs.mk is the best approach.
> 
>>>
>>> diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
>>> index 4db11e1..c0b48e1 100644
>>> --- a/package/e2fsprogs/Config.in
>>> +++ b/package/e2fsprogs/Config.in
>>> @@ -60,8 +60,12 @@ config BR2_PACKAGE_E2FSPROGS_FILEFRAG
>>>
>>>  config BR2_PACKAGE_E2FSPROGS_FSCK
>>>         bool "fsck"
>>> +       depends on !BR2_PACKAGE_UTIL_LINUX_FSCK

 This looks like a good idea.

>>>         default y
>>>
>>> +comment "the fsck from util-linux has preference over this one"
>>> +       depends on BR2_PACKAGE_UTIL_LINUX_FSCK
>>> +

 I don't think the comment is needed.

 Regards,
 Arnout

>>>  config BR2_PACKAGE_E2FSPROGS_FUSE2FS
>>>         bool "fuse2fs"
>>>         depends on !BR2_STATIC_LIBS # libfuse
>>>
>>>
>>> Carlos Santos (Casantos)
>>> DATACOM, P&D
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
