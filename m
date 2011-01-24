From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Mon, 24 Jan 2011 15:26:02 +0100
Subject: [Buildroot] Turning of IPv6 ??
In-Reply-To: <878vy9p89c.fsf@macbook.be.48ers.dk>
Message-ID: <37BA117B9C7D42EEB1F3BBCE586B5513@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi

Ok, i can live with it as it is now ( doing bb rebuild )

If i would know another way to disable ipv6 i would be happy.
I tried to build the kernel without IPv6 , but that does not solve it.(or
pass ipv6.disable=1 on the kernel cmd line)
I browsed some of the bb sources to see if there was a way to disable ipv6
through some /etc/? config file but not find anything related.


It seems to be a known problem one some distros too,
(http://faq.aslab.com/index.php?sid=63600&lang=en&action=artikel&cat=58&id=1
24&artlang=en)

The resolv.conf is updated by dhcpc with the router addr (192.168.1.1) if i
change it to 195.238.2.21 manually i don't see a delay with a nslookup (this
is no option) 
Some routers pass the external dns server addresses (would not be a problem)
,some act as a dns is in my case...

Meanwhile i am still open for a solution...,as i would like to keep ipv6 for
future requirements.

Johan


-----Oorspronkelijk bericht-----
Van: Peter Korsgaard [mailto:jacmet at gmail.com] Namens Peter Korsgaard
Verzonden: dinsdag 25 januari 2011 11:50
Aan: Sagaert Johan
CC: buildroot at busybox.net
Onderwerp: Re: Turning of IPv6 ??

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> Hi

 Sagaert> I have a problem with ipV6 (nslookup takes 10..20 seconds) if
Sagaert> i disable ipv6 in busybox only it is solved, so i leave ipv6
Sagaert> in the kernel and uclibc enabled.  The toplevel setting for
Sagaert> ipv6 is also still enabled.
 
 Sagaert> When i do a clean build with the config files i saved before
Sagaert> the cleaning, i noticed that the ipv6 is back on in busybox
Sagaert> ...  I suspect the toplevel ipv6 setting is causing this and
Sagaert> seems to modifie the busybox setting for ipv6..

Yes, so we can use the same defconfigs for both ipv6 and !ipv6:

git grep IPV6 package/busybox/busybox.mk package/busybox/busybox.mk:ifeq
($(BR2_INET_IPV6),y) package/busybox/busybox.mk:define BUSYBOX_SET_IPV6
package/busybox/busybox.mk:     $(call
KCONFIG_ENABLE_OPT,CONFIG_FEATURE_IPV6,$(
package/busybox/busybox.mk:     $(call
KCONFIG_ENABLE_OPT,CONFIG_FEATURE_IFUPDOW
package/busybox/busybox.mk:define BUSYBOX_SET_IPV6
package/busybox/busybox.mk:     $(call
KCONFIG_DISABLE_OPT,CONFIG_FEATURE_IPV6,$
package/busybox/busybox.mk:     $(call
KCONFIG_DISABLE_OPT,CONFIG_FEATURE_IFUPDO
package/busybox/busybox.mk:     $(BUSYBOX_SET_IPV6)

 Sagaert> If everything is build, i change the busybox setting and do a
Sagaert> rebuild of busybox to get it right.  So its anoying i can not
Sagaert> use the config files in the first build pas.
 
 Sagaert> What can i do about it ?

Well, you could naturally remove the IPv6 handling in busybox.mk, but why do
you enable IPv6 support in uClibc if you don't want to use it?

--
Bye, Peter Korsgaard
