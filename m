From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 13 Jul 2015 18:55:16 +0200
Subject: [Buildroot] [PATCH 06/38] ejabberd: systemd support
In-Reply-To: <CAGduivxt30vZickYtTqFwLvac42D=sa9-Wm2TG2qUuDre95ihQ@mail.gmail.com>
References: <cover.1432332802.git.alex.suykov@gmail.com>
 <06a1c8291627eaa04e8454148a478a758c5464a6.1432332802.git.alex.suykov@gmail.com>
 <CAGduivxt30vZickYtTqFwLvac42D=sa9-Wm2TG2qUuDre95ihQ@mail.gmail.com>
Message-ID: <CAGduivzcYhqemnfbw2MH0hqajvatYkPtChLkXno493dYCi49nQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alex, all


By the way, your patch are marked as "ChangedRequested" it means that
we expect from you that you fix your patch and resend them (or reply
because you believe me to be wrong).

As soon as it's fine by us, we will apply your patch.

Thanks for your contributions !

On Mon, Jul 13, 2015 at 6:49 PM, Maxime Hadjinlian
<maxime.hadjinlian@gmail.com> wrote:
> Hi Alex, all
>
> On Sat, May 23, 2015 at 12:03 PM, Alex Suykov <alex.suykov@gmail.com> wrote:
>> Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
>> ---
>>  package/ejabberd/ejabberd.mk      |  8 ++++++++
>>  package/ejabberd/ejabberd.service | 10 ++++++++++
>>  2 files changed, 18 insertions(+)
>>  create mode 100644 package/ejabberd/ejabberd.service
>>
>> diff --git a/package/ejabberd/ejabberd.mk b/package/ejabberd/ejabberd.mk
>> index 07ce78e..d8a931f 100644
>> --- a/package/ejabberd/ejabberd.mk
>> +++ b/package/ejabberd/ejabberd.mk
>> @@ -48,4 +48,12 @@ define EJABBERD_INSTALL_INIT_SYSV
>>                 $(TARGET_DIR)/etc/init.d/S50ejabberd
>>  endef
>>
>> +define EJABBERD_INSTALL_INIT_SYSTEMD
>> +       $(INSTALL) -D -m 644 package/ejabberd/ejabberd.service \
>> +               $(TARGET_DIR)/usr/lib/systemd/system/ejabberd.service
>> +       mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
>> +       ln -sf /usr/lib/systemd/system/ejabberd.service \
>> +               $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/ejabberd.service
>> +endef
>> +
>>  $(eval $(rebar-package))
>> diff --git a/package/ejabberd/ejabberd.service b/package/ejabberd/ejabberd.service
>> new file mode 100644
>> index 0000000..830fdd6
>> --- /dev/null
>> +++ b/package/ejabberd/ejabberd.service
>> @@ -0,0 +1,10 @@
>> +[Unit]
>> +Description=Erlang Jabber daemon
>> +After=network.target
>> +
>> +[Service]
>> +ExecStart=/usr/bin/ejabberd
>> +Restart=always
> We install a ejabberd user with the package, may as well use it.
> This is the startup scripts taken from Arch Linux:
>
> [Service]
> Type=forking
> User=ejabberd
> LimitNOFILE=16000
> RestartSec=5
> ExecStart=/usr/bin/ejabberdctl start
> ExecStop=/usr/bin/ejabberdctl stop
>
> After reading the readme of ejabberd, it seems best to use ejaberdctl
> since it's the "administration script"
>> +
>> +[Install]
>> +WantedBy=multi-user.target
>> --
>> 2.0.3
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
