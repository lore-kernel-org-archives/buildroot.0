From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 2 Dec 2015 19:21:24 -0300
Subject: [Buildroot] [PATCH 3/9] wireshark: enable GUI options
In-Reply-To: <20151202215508.GI5773@free.fr>
References: <1449089301-29762-1-git-send-email-gustavo@zacarias.com.ar>
 <1449089301-29762-3-git-send-email-gustavo@zacarias.com.ar>
 <20151202215508.GI5773@free.fr>
Message-ID: <565F6EE4.4020201@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/12/15 18:55, Yann E. MORIN wrote:


> And add this variable, too:
>
>      WIRESHARK_HAS_GUI = NO
...
>> +# Qt4 needs accessibility, we don't support it
>> +ifeq ($(BR2_PACKAGE_QT5BASE_WIDGETS),y)
>> +WIRESHARK_CONF_OPTS += --with-qt=5
>> +WIRESHARK_DEPENDENCIES += qt5base
>> +# Seems it expects wrappers and passes a -qt=X parameter for version
>> +WIRESHARK_MAKE_OPTS += \
>> +	MOC="$(HOST_DIR)/usr/bin/moc" \
>> +	RCC="$(HOST_DIR)/usr/bin/rcc" \
>> +	UIC="$(HOST_DIR)/usr/bin/uic"
>> +else
>> +WIRESHARK_CONF_OPTS += --with-qt=no
>
> Ditto.
>
>> +endif
>> +
>> +# No GUI at all
>> +ifeq ($(BR2_PACKAGE_LIBGTK2)$(BR2_PACKAGE_LIBGTK3)$(BR2_PACKAGE_QT5BASE_WIDGETS),)
>
> And then change that condition to:
>
>      ifeq ($(WIRESHARK_HAS_GUI),NO)
>
> which is simpler to manage should there be other toolkit we can use in
> the future.

Hi.
Well, only one gtk and/or qt variant can be built at the same time, and 
i don't expect any other major toolkit to show up in the near future.
I think it can be adjusted in the future if that's the case, but right 
now that's only cosmetic.
If someone fails to specify --disable-wireshark the wireshark 
buildsystem will balk anyway since it's default on and won't detect any 
usable toolkit.
Regards.
