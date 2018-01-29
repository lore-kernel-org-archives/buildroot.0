From: Chris Lesiak <chris.lesiak@licor.com>
Date: Mon, 29 Jan 2018 08:19:47 -0600
Subject: [Buildroot] [PATCH] package/avahi: Set the path to D-Bus
 system.d directory
In-Reply-To: <87r2q9adwa.fsf@dell.be.48ers.dk>
References: <20180123231723.5923-1-chris.lesiak@licor.com>
 <87r2q9adwa.fsf@dell.be.48ers.dk>
Message-ID: <48448259-8bac-7a19-5008-01829608bc01@licor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/28/2018 03:09 PM, Peter Korsgaard wrote:

>>>>>> "Chris" == Chris Lesiak <chris.lesiak@licor.com> writes:
>   > Add --with-dbus-sys=/usr/share/dbus-1/system.d to configure
>   > the path to D-Bus system.d directory.  Without this option,
>   > distribution provided configuration files were unnecessarily
>   > stored in /etc.
>
> Hmm, if we want this to happen then several other packages also look
> like they need to be fixed:
>
> git grep '/system\.d'
> package/dnsmasq/dnsmasq.mk:             $(TARGET_DIR)/etc/dbus-1/system.d/dnsmasq.conf
> package/miraclecast/miraclecast.mk:             $(TARGET_DIR)/etc/dbus-1/system.d/org.freedesktop.miracle.conf
> package/wpa_supplicant/wpa_supplicant.mk:               $(TARGET_DIR)/etc/dbus-1/system.d/wpa_supplicant.conf
>
> When did these files move from /etc/ to /usr/share? In D-Bus 1.8.x?
>

 From the D-Bus NEWS file:

D-Bus 1.9.18 (2015-07-21)
==

The ?Pirate Elite? release.

Configuration changes:

? The basic setup for the well-known system and session buses is now done
 ? in read-only files in ${datadir}, moving a step closer to systems
 ? that can operate with an empty /etc directory. In increasing order
 ? of precedence:

 ? ? ${datadir}/dbus-1/s*.conf now perform the basic setup such as setting
 ??? the default message policies.
 ? ? ${sysconfdir}/dbus-1/s*.conf are now optional. By default
 ??? dbus still installs a trivial version of each, for documentation
 ??? purposes; putting configuration directives in these files is 
deprecated.
 ? ? ${datadir}/dbus-1/s*.d/ are now available for third-party software
 ??? to install "drop-in" configuration snippets (any packages
 ??? using those directories should explicitly depend on at least this
 ??? version of dbus).
 ? ? ${sysconfdir}/dbus-1/s*.d/ are also still available for sysadmins
 ??? or third-party software to install "drop-in" configuration snippets
 ? ? ${sysconfdir}/dbus-1/s*-local.conf are still available for sysadmins'
 ??? overrides

 ? ${datadir} is normally /usr/share, ${sysconfdir} is normally /etc,
 ? and "s*" refers to either system or session as appropriate.


-- 
Chris Lesiak
Principal Design Engineer, Software
LI-COR Biosciences
chris.lesiak at licor.com

Any opinions expressed are those of the author and
do not necessarily represent those of his employer.
