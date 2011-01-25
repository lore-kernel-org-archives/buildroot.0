From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 25 Jan 2011 11:50:23 +0100
Subject: [Buildroot] Turning of IPv6 ??
In-Reply-To: <CE158DD3C2714136AF864134DDAAA2EB@apexjs> (Sagaert Johan's
	message of "Mon, 24 Jan 2011 10:02:38 +0100")
References: <CE158DD3C2714136AF864134DDAAA2EB@apexjs>
Message-ID: <878vy9p89c.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

git grep IPV6 package/busybox/busybox.mk
package/busybox/busybox.mk:ifeq ($(BR2_INET_IPV6),y)
package/busybox/busybox.mk:define BUSYBOX_SET_IPV6
package/busybox/busybox.mk:     $(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_IPV6,$(
package/busybox/busybox.mk:     $(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_IFUPDOW
package/busybox/busybox.mk:define BUSYBOX_SET_IPV6
package/busybox/busybox.mk:     $(call KCONFIG_DISABLE_OPT,CONFIG_FEATURE_IPV6,$
package/busybox/busybox.mk:     $(call KCONFIG_DISABLE_OPT,CONFIG_FEATURE_IFUPDO
package/busybox/busybox.mk:     $(BUSYBOX_SET_IPV6)

 Sagaert> If everything is build, i change the busybox setting and do a
 Sagaert> rebuild of busybox to get it right.  So its anoying i can not
 Sagaert> use the config files in the first build pas.
 
 Sagaert> What can i do about it ?

Well, you could naturally remove the IPv6 handling in busybox.mk, but
why do you enable IPv6 support in uClibc if you don't want to use it?

-- 
Bye, Peter Korsgaard
