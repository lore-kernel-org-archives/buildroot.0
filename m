From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Fri, 22 May 2020 19:00:42 +0200
Subject: [Buildroot] [PATCH v5 03/13] package/systemd: fix tty handling
In-Reply-To: <CAFvCimXKne707sruCmo_ULxxuw16C_-5v5wKKpNUYQp7eu12ow@mail.gmail.com>
References: <20191216103052.35220-1-jeremy.rosen@smile.fr>
 <20191216103052.35220-4-jeremy.rosen@smile.fr>
 <20200516162849.5df96b0d@windsurf.home>
 <CAFvCimXKne707sruCmo_ULxxuw16C_-5v5wKKpNUYQp7eu12ow@mail.gmail.com>
Message-ID: <CAFvCimUson6UkQOr27iqjNxQxEpv2WhZ4CEkk=ygSvS6Zy_1kw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok, I found the cause and sent a patch (separate email thread)

I tried to clarify the comment too, while I was at it

Regards
J?r?my

Le lun. 18 mai 2020 ? 09:12, J?r?my ROSEN <jeremy.rosen@smile.fr> a ?crit :

> Hey Thomas
> This seems definitely related to my patch, I'll try to have a look at it
> ASAP, but I can't really promise when ASAP will be...
>
> Sorry about that
> Jeremy
>
>
> Le sam. 16 mai 2020 ? 16:28, Thomas Petazzoni <
> thomas.petazzoni at bootlin.com> a ?crit :
>
>> Hello J?r?my,
>>
>> On Mon, 16 Dec 2019 11:30:42 +0100
>> J?r?my Rosen <jeremy.rosen@smile.fr> wrote:
>>
>> > +# systemd defaults to only have getty at tty.service enabled
>> > +# * DefaultInstance=tty1 in getty at service
>> > +# * no DefaultInstance in serial-getty at .service
>> > +# * WantedBy=getty.target in console-getty.service
>> > +# * console-getty is not enabled because of 90-systemd.preset
>> > +# We want "systemctl preset-all" to do the right thing, even when run
>> on the target after boot
>> > +# * remove the default instance of getty at .service via a drop-in in
>> /usr/lib
>> > +# * set a new DefaultInstance for getty at .service instead, if needed
>> > +# * set a new DefaultInstance for serial-getty at .service, if needed
>> > +# * override the systemd-provided preset for console-getty.service if
>> needed
>> >  define SYSTEMD_INSTALL_SERVICE_TTY
>> > +     mkdir $(TARGET_DIR)/usr/lib/systemd/system/getty at .service.d;\
>> > +     printf '[Install]\nDefaultInstance=\n' >
>> $(TARGET_DIR)/usr/lib/systemd/system/getty@
>> .service.d/buildroot-console.conf;\
>> >       if [ $(BR2_TARGET_GENERIC_GETTY_PORT) = "console" ]; \
>> >       then \
>> >               TARGET="console-getty.service"; \
>> > -             LINK_NAME="console-getty.service"; \
>> > +             printf 'enable console-getty.service\n' >
>> $(TARGET_DIR)/usr/lib/systemd/system-preset/81-buildroot-tty.preset;\
>> >       elif echo $(BR2_TARGET_GENERIC_GETTY_PORT) | egrep -q
>> 'tty[0-9]*$$'; \
>> >       then \
>> >               TARGET="getty at .service"; \
>> > -             LINK_NAME="getty@$(call
>> qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)).service"; \
>> > +             printf '[Install]\nDefaultInstance=%s\n' $(call
>> qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)) >
>> $(TARGET_DIR)/usr/lib/systemd/system/getty@
>> .service.d/buildroot-console.conf;\
>> >       else \
>> >               TARGET="serial-getty at .service"; \
>> > -             LINK_NAME="serial-getty@$(call
>> qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)).service"; \
>> > +             mkdir $(TARGET_DIR)/usr/lib/systemd/system/serial-getty@
>> .service.d;\
>> > +             printf '[Install]\nDefaultInstance=%s\n' $(call
>> qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)) >
>> $(TARGET_DIR)/usr/lib/systemd/system/serial-getty@
>> .service.d/buildroot-console.conf;\
>> >       fi; \
>> > -     mkdir -p $(TARGET_DIR)/etc/systemd/system/getty.target.wants/; \
>> > -     ln -fs ../../../../lib/systemd/system/$${TARGET} \
>> > -
>>  $(TARGET_DIR)/etc/systemd/system/getty.target.wants/$${LINK_NAME}; \
>>
>> I am not sure exactly if it is this change causing the issue, but there
>> is an issue in this code. See the bug report at:
>>
>>   https://bugs.busybox.net/show_bug.cgi?id=12786
>>
>> I must say now that I read the comment on top of this code, I don't
>> understand at all what is being explained. Could you give a bit more
>> details about what we are trying to do here, and hopefully help resolve
>> bug 12786 ?
>>
>> Thanks!
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
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


-- 
[image: SMILE]  <http://www.smile.eu/>

20 rue des Jardins
92600 Asni?res-sur-Seine
*J?r?my ROSEN*
Architecte technique

[image: email] jeremy.rosen at smile.fr
[image: phone]  +33 6 88 25 87 42
[image: url] http://www.smile.eu

[image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
<https://www.facebook.com/smileopensource> [image: LinkedIn]
<https://www.linkedin.com/company/smile> [image: Github]
<https://github.com/Smile-SA>

[image: D?couvrez l?univers Smile, rendez-vous sur smile.eu]
<https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200522/d30167e8/attachment.html>
