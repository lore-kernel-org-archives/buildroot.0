From: Adam Duskett <aduskett@gmail.com>
Date: Fri, 29 Nov 2019 12:34:46 -0800
Subject: [Buildroot] [PATCH v4 3/6] package/polkit: add systemd service
 file.
In-Reply-To: <CAFvCimV2Ap2tQwredYZQ-Za7vhRzbKL-qT49hEo8_Z8+5wrG=A@mail.gmail.com>
References: <20191128012609.3632661-1-aduskett@gmail.com>
 <20191128012609.3632661-4-aduskett@gmail.com>
 <CAFvCimV2Ap2tQwredYZQ-Za7vhRzbKL-qT49hEo8_Z8+5wrG=A@mail.gmail.com>
Message-ID: <CAFSsvmo+6As3imKtg3+HjSexNsW98TECvi2HYtUiRo7e8-JHqw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm not sure what you mean by this, could you explain?

Thanks!

Adam

On Fri, Nov 29, 2019 at 1:11 AM J?r?my ROSEN <jeremy.rosen@smile.fr> wrote:

> Please add an [Install] section matching your initialisation routine...
> This will simplify our migration to host-systemd
> and is also more correct.
>
> Thx
>
> Le jeu. 28 nov. 2019 ? 02:26, <aduskett@gmail.com> a ?crit :
>
>> From: Adam Duskett <Aduskett@gmail.com>
>>
>> - Add polkit.service for systemd based systems.
>> - Add a polkitd user upon which /usr/lib/polkit-1/polkitd relies.
>> - Set appropriate directory permissions to allow the polkitd user to
>>   access rules and actions.
>> - Set appropriate default attributes for the pkexec binary.
>>
>> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
>> ---
>>  package/polkit/polkit.mk      | 17 +++++++++++++++++
>>  package/polkit/polkit.service |  7 +++++++
>>  2 files changed, 24 insertions(+)
>>  create mode 100644 package/polkit/polkit.service
>>
>> diff --git a/package/polkit/polkit.mk b/package/polkit/polkit.mk
>> index 0c17e9bc27..b440cd2f1c 100644
>> --- a/package/polkit/polkit.mk
>> +++ b/package/polkit/polkit.mk
>> @@ -26,5 +26,22 @@ else
>>  POLKIT_CONF_OPTS += --with-authfw=shadow
>>  endif
>>
>> +define POLKIT_USERS
>> +       polkitd -1 polkitd -1 * - - - Polkit Daemon
>> +endef
>> +
>> +define POLKIT_PERMISSIONS
>> +       /etc/polkit-1 r 750 root polkitd - - - - -
>> +       /usr/share/polkit-1 r 750 root polkitd - - - - -
>> +       /usr/bin/pkexec f 4755 root root - - - - -
>> +endef
>> +
>> +define POLKIT_INSTALL_INIT_SYSTEMD
>> +       $(INSTALL) -D -m 644 package/polkit/polkit.service \
>> +               $(TARGET_DIR)/usr/lib/systemd/system/polkit.service
>> +       mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
>> +       ln -sf ../../../../usr/lib/systemd/system/polkit.service \
>> +
>>  $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/polkit.service
>> +endef
>>
>>  $(eval $(autotools-package))
>> diff --git a/package/polkit/polkit.service b/package/polkit/polkit.service
>> new file mode 100644
>> index 0000000000..013e3684c5
>> --- /dev/null
>> +++ b/package/polkit/polkit.service
>> @@ -0,0 +1,7 @@
>> +[Unit]
>> +Description=Authorization Manager
>> +
>> +[Service]
>> +Type=dbus
>> +BusName=org.freedesktop.PolicyKit1
>> +ExecStart=/usr/lib/polkit-1/polkitd --no-debug
>> --
>> 2.23.0
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191129/bc2663c4/attachment.html>
