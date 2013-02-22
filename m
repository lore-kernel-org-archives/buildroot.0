From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Fri, 22 Feb 2013 14:23:06 +0200
Subject: [Buildroot] network-manager-applet for buildroot almost ready
In-Reply-To: <51264996.5060404@petroprogram.com>
References: <51263203.4070709@petroprogram.com>
 <51264996.5060404@petroprogram.com>
Message-ID: <5127632A.4040507@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

21.2.2013 18:21, Stefan Fr?berg kirjoitti:
> 21.2.2013 16:41, Stefan Fr?berg kirjoitti:
>> Hello all!
>>
>> I have network-manager-applet running and it appears into fluxbox system
>> tray but
>> it does not detect any networks.
>>
>> When starting it from terminal it spits the following:
>>
>> ** Message: applet now removed from the notification area
>> ** Message: applet now embedded in the notification area
>>
>> ** (nm-applet:766): WARNING **: Failed to register as an agent: (32) No
>> session found for uid 0
>>
>> Does that "No session found for uid 0" mean that there is something
>> wrong with dbus ????
>>
>> Or is that error related to consolekit ?
>>
>> I have it here running too (and soon will submit to buildroot)
>> Also running are NetworkManager and dbus.
>>
>> I start fluxbox with normal startx command and I have just "exec
>> /usr/bin/startfluxbox" in my .xinitrc file.
>>
>>
>> Regards
>> Stefan
>>
>>
> I added ConsoleKits ck-launch-session to my .xinitrc as instructed here
> http://fluxbox-wiki.org/index.php?title=Start_fluxbox_from_the_command_line
>
> Now it does not anymore nag about missing session.
> However, still no networks detected and when I try to click and view
> properties of nm-applet it spits this:
>
> ** Message: applet now removed from the notification area
> ** Message: applet now embedded in the notification area
>
> ** (nm-applet:905): WARNING **: async_got_type: could not read
> properties for /org/freedesktop/NetworkManager/ActiveConnection/10:
> Method "Get" with signature "ss" on interface
> "org.freedesktop.DBus.Properties" doesn't exist
>
>
> ** (nm-applet:905): WARNING **: async_got_type: could not read
> properties for /org/freedesktop/NetworkManager/ActiveConnection/10:
> Method "Get" with signature "ss" on interface
> "org.freedesktop.DBus.Properties" doesn't exist
>
>
> ** (nm-applet:905): WARNING **: Connection activation failed: Creating
> object for path '/org/freedesktop/NetworkManager/ActiveConnection/10'
> failed in libnm-glib.
>
> ** (nm-applet:905): WARNING **: async_got_type: could not read
> properties for /org/freedesktop/NetworkManager/ActiveConnection/10:
> Method "Get" with signature "ss" on interface
> "org.freedesktop.DBus.Properties" doesn't exist
>
>
> So this is definetely either dbus or networkmanager (or both) problem
>
> Regards
> Stefan
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

God dammit Im stupid! 
I was trying to use NetworkManger with busybox udhcpc .....

Fixed NetworkManger with adding dhcp as dependency and adding
--with-dhclient in configuration (and few other fixes).
Also fixed little bit dhcp package (added symlink to /usr/sbin/dhclient
-> /sbin/dhclient because that's
what NetworkManager seems to expect in it's configuration summary, just
before starting compiling)

Works like a charm now! :-)

Fowever, there is still left's unanswered questions:

-  Did NetworkManager package work for anyone before ?
Did you use just static IP or try DHCP and with what client & configuration?

- ConsoleKits's ck-list-session still spits "active=FALSE" and "is
local=FALSE" for Seat2. Where is Seat1 and why does it not show it ?
(doing ck-history --log shows that Seat1 had been created)
Adding CONFIG_AUDIT=y and CONFIG_SYSCALLAUDIT=y did nothing more than
add  login id number to ck-list-session output. Yay....

Regards
Stefan
