From: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
Date: Fri, 30 Dec 2016 12:02:31 -0200
Subject: [Buildroot] [PATCH] efl: remove 'upower' ecore module.
In-Reply-To: <8e2891c5-0cc6-0234-3e87-b6693a9c2669@gmail.com>
References: <20161229145650.4013-1-barbieri@profusion.mobi>
 <76354a97-29d4-9e69-d36f-bc66e79d923c@gmail.com>
 <CAPdpN3A0KOvvWgr54xnG+CZqrGPTC-jmRwYT2TjL4cm9LydcbQ@mail.gmail.com>
 <8e2891c5-0cc6-0234-3e87-b6693a9c2669@gmail.com>
Message-ID: <CAPdpN3BnRBvciT2GjvVDWa5gvWXFNyVxkA9b1X1VOrE2-hBPrg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 30, 2016 at 10:27 AM, Romain Naour <romain.naour@gmail.com> wrote:
> Hi Gustavo,
>
> Le 30/12/2016 ? 03:57, Gustavo Sverzut Barbieri a ?crit :
>> On Thu, Dec 29, 2016 at 2:20 PM, Romain Naour <romain.naour@gmail.com> wrote:
>>> Hi Gustavo,
>>>
>>> Le 29/12/2016 ? 15:56, Gustavo Sverzut Barbieri a ?crit :
>>>> Ecore will reach 'upower' using D-Bus in order to detect if the system
>>>> state changes. This is optional, but done by default and if D-Bus
>>>> itself fails, then an error message will be presented.
>>>
>>> What's the error message ?
>>> I don't see any dbus message related to upower.
>>
>> It's something along these lines:
>>
>> ERR<pid>:eina_safety lib/eldbus/eldbus_core.c:1392
>> eldbus_name_owner_changed_callback_del() safety check failed: conn  ==
>> NULL
>>
>> ERR<pid>:eldbus lib/eldbus/eldbus_core.c:1021 _connection_get() Error
>> connecting to bus of type 2. error name:
>> org.freedesktop.DBus.Error.FileNotFound error message: Failed to
>> connect to socket
>> /path/to/buildroot/output/host/var/run/dbus/system_bus_socket
>>
>> that is, some apps will try to use eldbus to reach *host* system DBus,
>> but it can't as it's trying to reach the socket inside the
>> /path/to/buildroot/output/host/, not outside.
>>
>> At first I was thinking this was related to edje_cc and would add
>> ecore_app_no_system_modules() to it in order to skip such modules as
>> upower... but it's already there. So maybe it's another binary used
>> during my build.
>
> Yes, I know these noisy one...
>
> Indeed, there is no error messages after removing
> $(HOST_DIR)/usr/lib/ecore/system/upower :)
> It would be great to add these explanation in the commit log.

ok, will rework the message.


> I don't use E on my build machine so no other efl binary can be used.

what you mean with "no other efl can be used"?  EFL can be used
regardless of the window manager. I suppose you meant "needs to be
used"?



> I don't think we want to remove $(TARGET_DIR)/usr/lib/ecore/system/upower if
> upower is selected. Maybe add a condition on upower package ?

fair enough now that we have the upower package. will add that to the new patch.


-- 
Gustavo Sverzut Barbieri
http://profusion.mobi embedded systems
--------------------------------------
MSN, GTalk, FaceTime: barbieri at gmail.com
Skype: gsbarbieri
Mobile: +55 (16) 99354-9890
