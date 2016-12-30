From: Gustavo Sverzut Barbieri <barbieri@profusion.mobi>
Date: Fri, 30 Dec 2016 00:57:17 -0200
Subject: [Buildroot] [PATCH] efl: remove 'upower' ecore module.
In-Reply-To: <76354a97-29d4-9e69-d36f-bc66e79d923c@gmail.com>
References: <20161229145650.4013-1-barbieri@profusion.mobi>
 <76354a97-29d4-9e69-d36f-bc66e79d923c@gmail.com>
Message-ID: <CAPdpN3A0KOvvWgr54xnG+CZqrGPTC-jmRwYT2TjL4cm9LydcbQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Dec 29, 2016 at 2:20 PM, Romain Naour <romain.naour@gmail.com> wrote:
> Hi Gustavo,
>
> Le 29/12/2016 ? 15:56, Gustavo Sverzut Barbieri a ?crit :
>> Ecore will reach 'upower' using D-Bus in order to detect if the system
>> state changes. This is optional, but done by default and if D-Bus
>> itself fails, then an error message will be presented.
>
> What's the error message ?
> I don't see any dbus message related to upower.

It's something along these lines:

ERR<pid>:eina_safety lib/eldbus/eldbus_core.c:1392
eldbus_name_owner_changed_callback_del() safety check failed: conn  ==
NULL

ERR<pid>:eldbus lib/eldbus/eldbus_core.c:1021 _connection_get() Error
connecting to bus of type 2. error name:
org.freedesktop.DBus.Error.FileNotFound error message: Failed to
connect to socket
/path/to/buildroot/output/host/var/run/dbus/system_bus_socket

that is, some apps will try to use eldbus to reach *host* system DBus,
but it can't as it's trying to reach the socket inside the
/path/to/buildroot/output/host/, not outside.

At first I was thinking this was related to edje_cc and would add
ecore_app_no_system_modules() to it in order to skip such modules as
upower... but it's already there. So maybe it's another binary used
during my build.



>> Since we do not ship upower target package, just remove that from
>> target. Since it's useless for host, remove it as well.
>
> The efl upower module is used by the enlightenment battery module.
> It's started here but I'm not sure it's really working (100% Battery).

well, enlightenment + upower works on my desktop :-)

but E ships with alternative method to check battery if there's no upower.

also, that ecore module is not used by Enlightenment as the WM needs
more information. That ecore module will only emit main loop events
such as "battery low" so apps can save their state and start to save
power (that was my intent when I added it, not sure any app uses that
for real).


> Also, the efl package install several build tools and files on the target.
> It would be difficult to update all of these hooks between release.

But the list of modules is pretty small. Usually they would reflect
--enable-XXX, but since dbus is mandatory we always generate the
upower module.


> I recommend to use a post-build script in this case.

that's what I'm doing atm.


> I admit, I didn't noticed this module until now :p

;-)


> Maybe it easier to package upower and add it to efl dependencies ?

I saw that patch and IMO it's a nice addition. However the error I'm
noticing also happens on my build system as per above log.

-- 
Gustavo Sverzut Barbieri
http://profusion.mobi embedded systems
--------------------------------------
MSN, GTalk, FaceTime: barbieri at gmail.com
Skype: gsbarbieri
Mobile: +55 (16) 99354-9890
