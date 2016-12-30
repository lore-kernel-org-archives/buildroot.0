From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 30 Dec 2016 15:31:42 +0100
Subject: [Buildroot] [PATCH] efl: remove 'upower' ecore module.
In-Reply-To: <CAPdpN3BnRBvciT2GjvVDWa5gvWXFNyVxkA9b1X1VOrE2-hBPrg@mail.gmail.com>
References: <20161229145650.4013-1-barbieri@profusion.mobi>
 <76354a97-29d4-9e69-d36f-bc66e79d923c@gmail.com>
 <CAPdpN3A0KOvvWgr54xnG+CZqrGPTC-jmRwYT2TjL4cm9LydcbQ@mail.gmail.com>
 <8e2891c5-0cc6-0234-3e87-b6693a9c2669@gmail.com>
 <CAPdpN3BnRBvciT2GjvVDWa5gvWXFNyVxkA9b1X1VOrE2-hBPrg@mail.gmail.com>
Message-ID: <1580649a-1012-fdd7-34bb-62351738fe0c@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 30/12/2016 ? 15:02, Gustavo Sverzut Barbieri a ?crit :
> On Fri, Dec 30, 2016 at 10:27 AM, Romain Naour <romain.naour@gmail.com> wrote:
>> Hi Gustavo,
>>
>> Le 30/12/2016 ? 03:57, Gustavo Sverzut Barbieri a ?crit :
>>> On Thu, Dec 29, 2016 at 2:20 PM, Romain Naour <romain.naour@gmail.com> wrote:
>>>> Hi Gustavo,
>>>>
>>>> Le 29/12/2016 ? 15:56, Gustavo Sverzut Barbieri a ?crit :
>>>>> Ecore will reach 'upower' using D-Bus in order to detect if the system
>>>>> state changes. This is optional, but done by default and if D-Bus
>>>>> itself fails, then an error message will be presented.
>>>>
>>>> What's the error message ?
>>>> I don't see any dbus message related to upower.
>>>
>>> It's something along these lines:
>>>
>>> ERR<pid>:eina_safety lib/eldbus/eldbus_core.c:1392
>>> eldbus_name_owner_changed_callback_del() safety check failed: conn  ==
>>> NULL
>>>
>>> ERR<pid>:eldbus lib/eldbus/eldbus_core.c:1021 _connection_get() Error
>>> connecting to bus of type 2. error name:
>>> org.freedesktop.DBus.Error.FileNotFound error message: Failed to
>>> connect to socket
>>> /path/to/buildroot/output/host/var/run/dbus/system_bus_socket
>>>
>>> that is, some apps will try to use eldbus to reach *host* system DBus,
>>> but it can't as it's trying to reach the socket inside the
>>> /path/to/buildroot/output/host/, not outside.
>>>
>>> At first I was thinking this was related to edje_cc and would add
>>> ecore_app_no_system_modules() to it in order to skip such modules as
>>> upower... but it's already there. So maybe it's another binary used
>>> during my build.
>>
>> Yes, I know these noisy one...
>>
>> Indeed, there is no error messages after removing
>> $(HOST_DIR)/usr/lib/ecore/system/upower :)
>> It would be great to add these explanation in the commit log.
> 
> ok, will rework the message.
> 
> 
>> I don't use E on my build machine so no other efl binary can be used.
> 
> what you mean with "no other efl can be used"?  EFL can be used
> regardless of the window manager. I suppose you meant "needs to be
> used"?

I mean, no efl binary installed on the build machine can "leak" (be used) during
the build.
But it shouldn't happen since we use these options in EFL_CONF_OPTS:
	--with-edje-cc=$(HOST_DIR)/usr/bin/edje_cc \
	--with-eet-eet=$(HOST_DIR)/usr/bin/eet \
	--with-eldbus_codegen=$(HOST_DIR)/usr/bin/eldbus-codegen \
	--with-elementary-codegen=$(HOST_DIR)/usr/bin/elementary_codegen \
	--with-elm-prefs-cc=$(HOST_DIR)/usr/bin/elm_prefs_cc \
	--with-elua=$(HOST_DIR)/usr/bin/elua \
	--with-eolian-gen=$(HOST_DIR)/usr/bin/eolian_gen \

> 
> 
>> I don't think we want to remove $(TARGET_DIR)/usr/lib/ecore/system/upower if
>> upower is selected. Maybe add a condition on upower package ?
> 
> fair enough now that we have the upower package. will add that to the new patch.
> 

Ok thanks.

Best regards,
Romain
