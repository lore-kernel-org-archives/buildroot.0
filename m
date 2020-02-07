From: Norbert Lange <nolange79@gmail.com>
Date: Fri, 7 Feb 2020 14:07:24 +0100
Subject: [Buildroot] [PATCH 03/10] package/systemd: remove unused user
 accounts
In-Reply-To: <CAFvCimVGJSw24dK05FPscvu2-x1QhcFVaTzZB4sjiPoWGRRtrQ@mail.gmail.com>
References: <20200206093633.251413-1-nolange79@gmail.com>
 <20200206093633.251413-4-nolange79@gmail.com>
 <CAFvCimVgTb8XcC4fnR3NQLHa6dhv0b=9JyU_CVjHB_n=9ryAwQ@mail.gmail.com>
 <CADYdroPy+s9pAoSbB_oqMprHJhzKqnF-0iu-sxuLCXsRM--yog@mail.gmail.com>
 <CAFvCimUAQeBr57ZKc+_+fX+NbPf_WeS_8mA0Fzxiu2tFr5GZ9Q@mail.gmail.com>
 <CADYdroMwD2vkmkDXUn-GFLZssGLjieHxMmiQ=NFpW_zbe-S3CA@mail.gmail.com>
 <CAFvCimVGJSw24dK05FPscvu2-x1QhcFVaTzZB4sjiPoWGRRtrQ@mail.gmail.com>
Message-ID: <CADYdroNHekWrfp2wQ_zSrwUoK=yB0PWdPF3R20idkinh-xY1Qg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fr., 7. Feb. 2020 um 13:58 Uhr schrieb J?r?my ROSEN <
jeremy.rosen@smile.fr>:

>
>
> Le ven. 7 f?vr. 2020 ? 13:52, Norbert Lange <nolange79@gmail.com> a
> ?crit :
>
>>
>> I mean if you dont enable host target sysuser, systemd and other packages
>> might not install the config files (these are after all just used for
>> preparing a system).
>>
>
> hmm... interesting point.
> How can a package detect if sysuser is enabled ? is there a pkg-config
> option for that ?
>

No idea, its a recent addition so that's a hypothetical, its however
already true for systemd.
You could for ex. write checks for folders or the sysuser utility.


>
>
>
>> if you for example enable journal-remote and not sysuser on the target,
>> you would need to enable  journal-remote and sysuser on the host, then grab
>> the config files from the host.
>>
>> yes, I see your point
> maybe it would be simpler to configure with sysuser both for target and
> host and remove the binary from the target ?
>
> Thinking out-lout at this point. I'm not sure if that's a good idea.
>

I think that's actually the best way. run the tool, then remove the folders
and the tool from the target.
Think of an overlayfs that defines users with sysuser configs and the
folders/files/permissions with tmpfiles configs.


>
>
>
>> Sure, everything can be solved somehow, but it would be easier to figure
>> out the correct way *before* someone begins hacking ( see
>> https://github.com/systemd/systemd/issues/14806 ).
>>
>> For ex. you could always enable sysuser on the target and just offer an
>> option to remove those files in the rootfs image afterwards.
>>
>>
> Right.... Those files never make sense on the target anyway.
> Buildroot philosophy is that you can't install software after the fact on
> the target and it's ok to remove tools that are only used to install stuff
> after the fact
> (that's why the rules files for hwdb are never on the target)
>
> so in a way... we always need sysuser on the host and we never use it on
> the target.
> This all needs more thinking. but there is no emergency. that's for a
> future patch.
>

The guy in the bug report supposedly (plans to) work on it. From
experience, iterations on this list can take a long time.

>
>
> Norbert
>>
>> Am Fr., 7. Feb. 2020 um 13:44 Uhr schrieb J?r?my ROSEN <
>> jeremy.rosen at smile.fr>:
>>
>>> That's already in place. We already build host-systemd whenever we build
>>> systemd (host-sysuser is currently disabled but that's trivial to enable)
>>>
>>> It's just a question of doing it, really... and teaching mkusers a few
>>> trick to go with it
>>>
>>> Le ven. 7 f?vr. 2020 ? 13:41, Norbert Lange <nolange79@gmail.com> a
>>> ?crit :
>>>
>>>> Sure, but that could get tricky is you dont enable sysuser.d on the
>>>> target,
>>>> then you would need to grab the files from the host installation and
>>>> use similar build-options as the target.
>>>>
>>>> Some smart infrastructure work would be needed to not complicate things
>>>> between non-system, systemd with option x disabled,
>>>> and full systemd.
>>>>
>>>> Am Fr., 7. Feb. 2020 um 10:11 Uhr schrieb J?r?my ROSEN <
>>>> jeremy.rosen at smile.fr>:
>>>>
>>>>> Yes...
>>>>> Long term we should use systems-sysuser for that, so upstream trickles
>>>>> down automatically
>>>>>
>>>>> in the mean time,
>>>>>
>>>>> Reviewed-by: J?r?my Rosen <jeremy.rosen@smile.fr>
>>>>>
>>>>>
>>>>> Le jeu. 6 f?vr. 2020 ? 10:37, Norbert Lange <nolange79@gmail.com> a
>>>>> ?crit :
>>>>>
>>>>>> Since V235 the "gateway" and "upload" services use DynamicUsers,
>>>>>> requiring no entries in /etc/passwd.
>>>>>> This functionality requires option nss-systemd, which is always
>>>>>> enabled in buildroot.
>>>>>>
>>>>>> The "bus-proxy" user was removed in V230
>>>>>>
>>>>>> Signed-off-by: Norbert Lange <nolange79@gmail.com>
>>>>>> ---
>>>>>>  package/systemd/systemd.mk | 3 ---
>>>>>>  1 file changed, 3 deletions(-)
>>>>>>
>>>>>> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
>>>>>> index a390cdd1a9..b46c4fd540 100644
>>>>>> --- a/package/systemd/systemd.mk
>>>>>> +++ b/package/systemd/systemd.mk
>>>>>> @@ -431,10 +431,7 @@ define SYSTEMD_USERS
>>>>>>         - - systemd-journal -1 * - - - Journal
>>>>>>         - - render -1 * - - - DRI rendering nodes
>>>>>>         - - kvm -1 * - - - kvm nodes
>>>>>> -       systemd-bus-proxy -1 systemd-bus-proxy -1 * - - - Proxy D-Bus
>>>>>> messages to/from a bus
>>>>>> -       systemd-journal-gateway -1 systemd-journal-gateway -1 *
>>>>>> /var/log/journal - - Journal Gateway
>>>>>>         systemd-journal-remote -1 systemd-journal-remote -1 *
>>>>>> /var/log/journal/remote - - Journal Remote
>>>>>> -       systemd-journal-upload -1 systemd-journal-upload -1 * - - -
>>>>>> Journal Upload
>>>>>>         $(SYSTEMD_COREDUMP_USER)
>>>>>>         $(SYSTEMD_NETWORKD_USER)
>>>>>>         $(SYSTEMD_RESOLVED_USER)
>>>>>> --
>>>>>> 2.24.1
>>>>>>
>>>>>> _______________________________________________
>>>>>> buildroot mailing list
>>>>>> buildroot at busybox.net
>>>>>> http://lists.busybox.net/mailman/listinfo/buildroot
>>>>>>
>>>>>
>>>>>
>>>>> --
>>>>> [image: SMILE]  <http://www.smile.eu/>
>>>>>
>>>>> 20 rue des Jardins
>>>>> 92600 Asni?res-sur-Seine
>>>>> *J?r?my ROSEN*
>>>>> Architecte technique
>>>>>
>>>>> [image: email] jeremy.rosen at smile.fr
>>>>> [image: phone]  +33 6 88 25 87 42
>>>>> [image: url] http://www.smile.eu
>>>>>
>>>>> [image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
>>>>> <https://www.facebook.com/smileopensource> [image: LinkedIn]
>>>>> <https://www.linkedin.com/company/smile> [image: Github]
>>>>> <https://github.com/Smile-SA>
>>>>>
>>>>> [image: D?couvrez l?univers Smile, rendez-vous sur smile.eu]
>>>>> <https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature>
>>>>>
>>>>
>>>
>>> --
>>> [image: SMILE]  <http://www.smile.eu/>
>>>
>>> 20 rue des Jardins
>>> 92600 Asni?res-sur-Seine
>>> *J?r?my ROSEN*
>>> Architecte technique
>>>
>>> [image: email] jeremy.rosen at smile.fr
>>> [image: phone]  +33 6 88 25 87 42
>>> [image: url] http://www.smile.eu
>>>
>>> [image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
>>> <https://www.facebook.com/smileopensource> [image: LinkedIn]
>>> <https://www.linkedin.com/company/smile> [image: Github]
>>> <https://github.com/Smile-SA>
>>>
>>> [image: D?couvrez l?univers Smile, rendez-vous sur smile.eu]
>>> <https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature>
>>>
>>
>
> --
> [image: SMILE]  <http://www.smile.eu/>
>
> 20 rue des Jardins
> 92600 Asni?res-sur-Seine
> *J?r?my ROSEN*
> Architecte technique
>
> [image: email] jeremy.rosen at smile.fr
> [image: phone]  +33 6 88 25 87 42
> [image: url] http://www.smile.eu
>
> [image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
> <https://www.facebook.com/smileopensource> [image: LinkedIn]
> <https://www.linkedin.com/company/smile> [image: Github]
> <https://github.com/Smile-SA>
>
> [image: D?couvrez l?univers Smile, rendez-vous sur smile.eu]
> <https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200207/218cc83a/attachment.html>
