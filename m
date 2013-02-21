From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Fri, 22 Feb 2013 00:28:41 +0200
Subject: [Buildroot] [PATCH] new package: network-manager-applet
In-Reply-To: <201302212311.21768.yann.morin.1998@free.fr>
References: <1361474534-6070-1-git-send-email-stefan.froberg@petroprogram.com>
 <201302212311.21768.yann.morin.1998@free.fr>
Message-ID: <51269F99.7000502@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

22.2.2013 0:11, Yann E. MORIN kirjoitti:
> Stefan, All,
>
> On Thursday 21 February 2013 Stefan Fr?berg wrote:
>> GTK+ applet for NetworkManager
> Oh, nice! Did you finally managed to make it work?

Well, sort of ... I think I know what's the problem now. It's that damn
consolekit.

When I do ck-list-session in terminal under Xorg it list "active =
FALSE" and  "is local = FALSE".

Found out just now that kernel config needs to have CONFIG_AUDIT=y and
CONFIG_AUDITSYSCALL=y
enabled which, of course, I was missing ....
Maybe just enough time to recompile kernel and try it one more time
before dropping to bed.


>> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
> [--SNIP--]
>> diff --git a/package/network-manager-applet/Config.in b/package/network-manager-applet/Config.in
>> new file mode 100644
>> index 0000000..03cf0e7
>> --- /dev/null
>> +++ b/package/network-manager-applet/Config.in
>> @@ -0,0 +1,13 @@
>> +config BR2_PACKAGE_NETWORK_MANAGER_APPLET
>> +	bool "network-manager-applet"
>> +	depends on BR2_PACKAGE_NETWORK_MANAGER
>> +	depends on BR2_PACKAGE_ISO_CODES
>> +	select BR2_PACKAGE_LIBTASN1
> We do not currently have libtasn1 in the packages (although I've seen
> a patch to add it float by recently, maybe your patch? If so, say that
> it needs to be applied before this one).
>
>> +	select BR2_PACKAGE_GNOME_KEYRING
>> +	select BR2_PACKAGE_NOTIFICATION_DAEMON
>> +	select BR2_PACKAGE_CONSOLEKIT
> Be careful to properly inherit dependencies from packages you 'select'.
>
>> diff --git a/package/network-manager-applet/network-manager-applet.mk b/package/network-manager-applet/network-manager-applet.mk
>> new file mode 100644
>> index 0000000..51834b5
>> --- /dev/null
>> +++ b/package/network-manager-applet/network-manager-applet.mk
>> @@ -0,0 +1,28 @@
>> +#############################################################
>> +#
>> +# network-manager-applet
>> +#
>> +#############################################################
>> +
>> +NETWORK_MANAGER_APPLET_VERSION = 0.9.2.0
>> +NETWORK_MANAGER_APPLET_SOURCE = network-manager-applet-$(NETWORK_MANAGER_APPLET_VERSION).tar.xz
>> +NETWORK_MANAGER_APPLET_SITE = http://ftp.gnome.org/pub/GNOME/sources/network-manager-applet/0.9/
>> +NETWORK_MANAGER_APPLET_INSTALL_STAGING = YES
>> +NETWORK_MANAGER_APPLET_DEPENDENCIES = network-manager iso-codes libtasn1 \
>> +				     gnome-keyring notification-daemon \
>> +				     consolekit
>> +NETWORK_MANAGER_APPLET_CONF_OPT += --disable-more-warnings \
>> +				   --localstatedir=/var --enable-migration \
>> +				   --with-gtkver=2
>> +NETWORK_MANAGER_APPLET_AUTORECONF = YES
> Why autoreconf?

Umm, I not sure anymore (too dizzy).
Maybe it was because that  compiler_warnings.m4 thing below or something
else
Will sort it out tomorrow...

>> +define	NETWORK_MANAGER_APPLET_FIXUP
>> +	# This file adds that annoying -Werror even if told *no*. Kick it out
>> +	rm -f $(@D)/m4/compiler_warnings.m4
>> +endef
>> +
>> +NETWORK_MANAGER_APPLET_PRE_CONFIGURE_HOOKS += NETWORK_MANAGER_APPLET_FIXUP
> Make this a post-extract hook, not a pre-configure hook.
> (Unless it is added by autoreconf?)

Ill try and see

> Regards,
> Yann E. MORIN.
>


Thanks

Stefan
