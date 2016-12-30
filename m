From: Romain Naour <romain.naour@gmail.com>
Date: Fri, 30 Dec 2016 13:27:20 +0100
Subject: [Buildroot] [PATCH] efl: remove 'upower' ecore module.
In-Reply-To: <CAPdpN3A0KOvvWgr54xnG+CZqrGPTC-jmRwYT2TjL4cm9LydcbQ@mail.gmail.com>
References: <20161229145650.4013-1-barbieri@profusion.mobi>
 <76354a97-29d4-9e69-d36f-bc66e79d923c@gmail.com>
 <CAPdpN3A0KOvvWgr54xnG+CZqrGPTC-jmRwYT2TjL4cm9LydcbQ@mail.gmail.com>
Message-ID: <8e2891c5-0cc6-0234-3e87-b6693a9c2669@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

Le 30/12/2016 ? 03:57, Gustavo Sverzut Barbieri a ?crit :
> On Thu, Dec 29, 2016 at 2:20 PM, Romain Naour <romain.naour@gmail.com> wrote:
>> Hi Gustavo,
>>
>> Le 29/12/2016 ? 15:56, Gustavo Sverzut Barbieri a ?crit :
>>> Ecore will reach 'upower' using D-Bus in order to detect if the system
>>> state changes. This is optional, but done by default and if D-Bus
>>> itself fails, then an error message will be presented.
>>
>> What's the error message ?
>> I don't see any dbus message related to upower.
> 
> It's something along these lines:
> 
> ERR<pid>:eina_safety lib/eldbus/eldbus_core.c:1392
> eldbus_name_owner_changed_callback_del() safety check failed: conn  ==
> NULL
> 
> ERR<pid>:eldbus lib/eldbus/eldbus_core.c:1021 _connection_get() Error
> connecting to bus of type 2. error name:
> org.freedesktop.DBus.Error.FileNotFound error message: Failed to
> connect to socket
> /path/to/buildroot/output/host/var/run/dbus/system_bus_socket
> 
> that is, some apps will try to use eldbus to reach *host* system DBus,
> but it can't as it's trying to reach the socket inside the
> /path/to/buildroot/output/host/, not outside.
> 
> At first I was thinking this was related to edje_cc and would add
> ecore_app_no_system_modules() to it in order to skip such modules as
> upower... but it's already there. So maybe it's another binary used
> during my build.

Yes, I know these noisy one...

Indeed, there is no error messages after removing
$(HOST_DIR)/usr/lib/ecore/system/upower :)
It would be great to add these explanation in the commit log.

I don't use E on my build machine so no other efl binary can be used.

Tested with efl, terminology and enlightenment package.

> 
>>> Since we do not ship upower target package, just remove that from
>>> target. Since it's useless for host, remove it as well.
>>
>> The efl upower module is used by the enlightenment battery module.
>> It's started here but I'm not sure it's really working (100% Battery).
> 
> well, enlightenment + upower works on my desktop :-)
> 
> but E ships with alternative method to check battery if there's no upower.
> 
> also, that ecore module is not used by Enlightenment as the WM needs
> more information. That ecore module will only emit main loop events
> such as "battery low" so apps can save their state and start to save
> power (that was my intent when I added it, not sure any app uses that
> for real).
> 
> 
>> Also, the efl package install several build tools and files on the target.
>> It would be difficult to update all of these hooks between release.
> 
> But the list of modules is pretty small. Usually they would reflect
> --enable-XXX, but since dbus is mandatory we always generate the
> upower module.
> 
> 
>> I recommend to use a post-build script in this case.
> 
> that's what I'm doing atm.
> 
> 
>> I admit, I didn't noticed this module until now :p
> 
> ;-)
> 
> 
>> Maybe it easier to package upower and add it to efl dependencies ?
> 
> I saw that patch and IMO it's a nice addition. However the error I'm
> noticing also happens on my build system as per above log.
> 

I don't think we want to remove $(TARGET_DIR)/usr/lib/ecore/system/upower if
upower is selected. Maybe add a condition on upower package ?

Best regards,
Romain
