From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 6 Oct 2016 01:20:56 +0200
Subject: [Buildroot] [PATCH] Fix dhcp symlink in target/var/lib/dhcp
In-Reply-To: <CAK-g76X-fwsZnfmQaDN8a90kLrJCRfduAgNYyXuYa-UytHSfpA@mail.gmail.com>
References: <CAK-g76X-fwsZnfmQaDN8a90kLrJCRfduAgNYyXuYa-UytHSfpA@mail.gmail.com>
Message-ID: <25c03ce6-8771-cd39-32ef-b815ede292f6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28-09-16 18:07, Root, Build wrote:
> The symlink was to /tmp causing an error on the target install step:
> rsync: chgrp "/<path>/output/target/var/lib/dhcp" failed: Operation
> not permitted

 Could you explain this a little more? The install step of this package only
calls $(INSTALL), not rsync or 'make install' or anything like that. So how does
this happen?

 Also note that we don't have such failures in the autobuilders. And anyway, I
thought that a failing chgrp in rsync was non-fatal?


> Changing the symlink to "../../tmp" rather than "/tmp" references the
> target's /tmp directory rather than the build machine's /tmp directory.

 The problem is that /var/lib itself may be a symlink to somewhere else. Some
people need to have /var/lib in a writeable partition while /var itself is on
the readonly rootfs. When /var/lib is a symlink, the ../.. will be interpreted
relative to the target of that symlink, which may be a different number of
levels down from root.

 Also, since /tmp always exists on the build machine, symlinking to /tmp just works.


 Regards,
 Arnout

> 
> Signed-off-by: Gerald Van Baren <jerry@vibrationresearch.com>
> ---
>  package/dhcp/dhcp.mk | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
> index 5cb6043..80c984b 100644
> --- a/package/dhcp/dhcp.mk
> +++ b/package/dhcp/dhcp.mk
> @@ -56,7 +56,7 @@ endif
>  ifeq ($(BR2_PACKAGE_DHCP_SERVER),y)
>  define DHCP_INSTALL_SERVER
>         mkdir -p $(TARGET_DIR)/var/lib
> -       (cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
> +       (cd $(TARGET_DIR)/var/lib; ln -snf ../../tmp dhcp)
>         $(INSTALL) -m 0755 -D $(@D)/server/dhcpd $(TARGET_DIR)/usr/sbin/dhcpd
>         $(INSTALL) -m 0644 -D package/dhcp/dhcpd.conf \
>                 $(TARGET_DIR)/etc/dhcp/dhcpd.conf
> @@ -66,7 +66,7 @@ endif
>  ifeq ($(BR2_PACKAGE_DHCP_RELAY),y)
>  define DHCP_INSTALL_RELAY
>         mkdir -p $(TARGET_DIR)/var/lib
> -       (cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
> +       (cd $(TARGET_DIR)/var/lib; ln -snf ../../tmp dhcp)
>         $(INSTALL) -m 0755 -D $(DHCP_DIR)/relay/dhcrelay \
>                 $(TARGET_DIR)/usr/sbin/dhcrelay
>  endef
> @@ -75,7 +75,7 @@ endif
>  ifeq ($(BR2_PACKAGE_DHCP_CLIENT),y)
>  define DHCP_INSTALL_CLIENT
>         mkdir -p $(TARGET_DIR)/var/lib
> -       (cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
> +       (cd $(TARGET_DIR)/var/lib; ln -snf ../../tmp dhcp)
>         $(INSTALL) -m 0755 -D $(DHCP_DIR)/client/dhclient \
>                 $(TARGET_DIR)/sbin/dhclient
>         $(INSTALL) -m 0644 -D package/dhcp/dhclient.conf \
> --
> 1.9.1
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
