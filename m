From: Aleksander Morgado <aleksander@aleksander.es>
Date: Sun, 27 Aug 2017 09:05:15 +0200
Subject: [Buildroot] [PATCH v2] modem-manager: update dependencies
In-Reply-To: <20170825224135.6b053399@windsurf>
References: <20170825123015.10667-1-aleksander@aleksander.es>
 <20170825142120.26160-1-aleksander@aleksander.es>
 <20170825224135.6b053399@windsurf>
Message-ID: <CAAP7uc+iakpbUqhHcrczfvEjdXDTwEvq3+yoOxcAzR4eYtR7ww@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> On Fri, 25 Aug 2017 16:21:20 +0200, Aleksander Morgado wrote:
>> The dbus-glib package isn't a dependency since ModemManager 1.0, which
>> is based on libglib2's GDBus implementation.
>>
>> Also, explicitly set libglib2 as dependency, which currently was being
>> implicitly included by libgudev. The next major ModemManager release
>> will have udev/libgudev as optional packages, while libglib2 is
>> definitely not going to be ever optional.
>>
>> Finally, also set dbus as a dependency, as ModemManager won't work
>> without a system DBus available.
>
> I was about to apply this, but this last part seems wrong: if DBus is
> only needed at runtime (and not build time), then having the select
> BR2_PACKAGE_DBUS in Config.in is enough: it ensures DBus will be built,
> it's just that you don't have the guarantee it will be built before
> modem-manager.
>
> So:
>
>  - If DBus is only a runtime dependency, don't add dbus do
>    MODEM_MANAGER_DEPENDENCIES, and instead add a comment above select
>    BR2_PACKAGE_DBUS that says "# runtime dependency"
>
>  - If DBus is a build-time dependency, then your change is correct, but
>    your commit log is unclear.
>

Understood; yes DBus is only runtime dependency, so the Config.in
change would be enough. I guess the same happens with udev then? MM
doesn't build-depend on udev, only on gudev (although it seems that
gudev itself depends on udev).

-- 
Aleksander
https://aleksander.es
