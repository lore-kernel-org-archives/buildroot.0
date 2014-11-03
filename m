From: =?ISO-8859-1?Q?J=F6rg?= Krause <jkrause@posteo.de>
Date: Mon, 03 Nov 2014 12:31:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/avahi: enable libavahi-client
	support
In-Reply-To: <87ioix43oc.fsf@dell.be.48ers.dk>
References: <1414800623-7721-1-git-send-email-jkrause@posteo.de>
 <87ioix43oc.fsf@dell.be.48ers.dk>
Message-ID: <1415014314.2065.4.camel@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On So, 2014-11-02 at 23:51 +0100, Peter Korsgaard wrote:
> >>>>> "J?rg" == J?rg Krause <jkrause@posteo.de> writes:
> 
>  > Some packages needs libavahi-client support which is autobuild by avahi if
>  > avahi-daemon and dbus is selected. To select libavahi-client explicitly makes
>  > this dependency more obvious for dependent packages.
> 
>  > libdns_sd is only build by avahi if libavahi-client is present (and 
>  > `--enable-compat-libdns_sd` is set as configure option). So it's safe to 
>  > depend on libavahi-client instead of avahi-daemon.
> 
> Having a user visible option for this is a bit odd as it cannot be used
> to DISABLE the library.
> 
> Perhaps it should just be a hidden helper option for other packages
> instead? (so drop the bool and help text)

I agree with you.

I want to check for libavahi-client in shairport-sync.mk without adding
a user prompt in Config.in:
        ifeq ($(BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT),y)
        SHAIRPORT_SYNC_DEPENDENCIES += avahi
        SHAIRPORT_SYNC_CONF_OPTS += --with-avahi
        else
        SHAIRPORT_SYNC_CONF_OPTS += --with-tinysvcmdns
        endif

Does it make sense to have a hidden config symbol which is both
selectable and checkable. This is what I have in mind:
        config BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT
               bool
               default y if (BR2_PACKAGE_AVAHI_DAEMON &&
        BR2_PACKAGE_DBUS)
               depends on BR2_PACKAGE_AVAHI_DAEMON
               select BR2_PACKAGE_DBUS
        
        # selected in package A
        select BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT
        
        # checked in package B
        ifeq ($(BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT),y)

Best regards
J?rg
