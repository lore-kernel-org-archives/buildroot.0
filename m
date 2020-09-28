From: Adam Duskett <aduskett@gmail.com>
Date: Mon, 28 Sep 2020 11:42:15 -0700
Subject: [Buildroot] [PATCH v2 10/14] package/systemd: invoke
 systemd-tmpfilesd on final image
In-Reply-To: <CADYdroNfW0eO3NV0eJgWQtwBndqDmHDoE7-YF6gnHQYViqE8eQ@mail.gmail.com>
References: <20200615072055.2083-1-nolange79@gmail.com>
 <20200615072055.2083-11-nolange79@gmail.com>
 <CAFvCimWYc_MpYbpvi3rB+uwWpK4EB5Er7DUG7U=eF0bQfK5pXA@mail.gmail.com>
 <CADYdroNfW0eO3NV0eJgWQtwBndqDmHDoE7-YF6gnHQYViqE8eQ@mail.gmail.com>
Message-ID: <CAFSsvmqN0oe4+KvZ1sCCHmGSM_WV7nQPeUjBdhN19craLMU=6A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 15, 2020 at 7:59 AM Norbert Lange <nolange79@gmail.com> wrote:

>
>
> Am Mo., 15. Juni 2020 um 16:32 Uhr schrieb J?r?my ROSEN <
> jeremy.rosen at smile.fr>:
>
>> I wonder how that would work with lines that contain %b (boot id)
>> and %m (machine-id)
>> my educated guest would be that it would create files with the host's
>> boot-id/machine-id. Thus leaking the host's information. This is not
>> good, especially the machine-id of the host which is confidential
>> information (not crypto-grade, but still shouldn't be leaked)
>>
>
>> if systemd-tmpile supports that correctly (maybe skipping all %b %m
>> when --root is used) it's all fine. But I don't remember seeing that.
>>
>> does it ?
>>
>
> The default config files don't create files with machine-id, and %b is not
> replaced at all AFAIR.
> But I believe you are right that systemd-tmpfiles picks up the host
> machine-id and would replace it.
> Good catch, need to check.
>


>  FYI, this issue is being worked on:
> https://github.com/systemd/systemd/pull/16187
>


>
>> Cheers
>> Jeremy
>>
>>
>> Le lun. 15 juin 2020 ? 09:21, Norbert Lange <nolange79@gmail.com> a
>> ?crit :
>>
>>> Especially for read-only filesystems it is helpfull to
>>> pre-create all folders for non-volatile paths.
>>>
>>> This needs to run under fakeroot to allow setting
>>> uids/gids/perms for the target fs.
>>>
>>> Signed-off-by: Norbert Lange <nolange79@gmail.com>
>>> ---
>>>  package/systemd/systemd.mk | 8 +++++++-
>>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
>>> index e117e3a082..cb0278f3b7 100644
>>> --- a/package/systemd/systemd.mk
>>> +++ b/package/systemd/systemd.mk
>>> @@ -599,6 +599,12 @@ SYSTEMD_TARGET_FINALIZE_HOOKS += PURGE_LOCALES
>>>  endif
>>>  SYSTEMD_TARGET_FINALIZE_HOOKS += SYSTEMD_UPDATE_CATALOGS
>>>
>>> +define SYSTEMD_CREATE_TMPFILES_HOOK
>>> +       $(HOST_DIR)/bin/systemd-tmpfiles --root=$(TARGET_DIR) --create
>>> --boot \
>>> +               $(addprefix --exclude-prefix=/,dev mnt proc run sys tmp)
>>> || :
>>> +endef
>>> +SYSTEMD_ROOTFS_PRE_CMD_HOOKS += SYSTEMD_CREATE_TMPFILES_HOOK
>>> +
>>>  SYSTEMD_CONF_ENV = $(HOST_UTF8_LOCALE_ENV)
>>>  SYSTEMD_NINJA_ENV = $(HOST_UTF8_LOCALE_ENV)
>>>
>>> @@ -652,7 +658,7 @@ HOST_SYSTEMD_CONF_OPTS = \
>>>         -Dvconsole=false \
>>>         -Dquotacheck=false \
>>>         -Dsysusers=false \
>>> -       -Dtmpfiles=false \
>>> +       -Dtmpfiles=true \
>>>         -Dimportd=false \
>>>         -Dhwdb=false \
>>>         -Drfkill=false \
>>> --
>>> 2.27.0
>>>
>>>
>>
>> --
>> [image: SMILE]  <http://www.smile.eu/>
>>
>> 20 rue des Jardins
>> 92600 Asni?res-sur-Seine
>> *J?r?my ROSEN*
>> Architecte technique
>>
>> [image: email] jeremy.rosen at smile.fr
>> [image: phone]  +33 6 88 25 87 42
>> [image: url] http://www.smile.eu
>>
>> [image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
>> <https://www.facebook.com/smileopensource> [image: LinkedIn]
>> <https://www.linkedin.com/company/smile> [image: Github]
>> <https://github.com/Smile-SA>
>>
>> [image: D?couvrez l?univers Smile, rendez-vous sur smile.eu]
>> <https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature>
>>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200928/3e28f12b/attachment.html>
