From: Jerry Van Baren <gvb.buildroot@unssw.com>
Date: Thu, 6 Oct 2016 13:38:19 -0400
Subject: [Buildroot] [PATCH] Fix dhcp symlink in target/var/lib/dhcp
In-Reply-To: <25c03ce6-8771-cd39-32ef-b815ede292f6@mind.be>
References: <CAK-g76X-fwsZnfmQaDN8a90kLrJCRfduAgNYyXuYa-UytHSfpA@mail.gmail.com>
 <25c03ce6-8771-cd39-32ef-b815ede292f6@mind.be>
Message-ID: <CAK-g76Vp+TepJFwXN-RpFqWmr6nKUwVaHjUm0F8b5UDXXtE6Og@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Wed, Oct 5, 2016 at 7:20 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 28-09-16 18:07, Root, Build wrote:
>> The symlink was to /tmp causing an error on the target install step:
>> rsync: chgrp "/<path>/output/target/var/lib/dhcp" failed: Operation
>> not permitted
>
>  Could you explain this a little more? The install step of this package only
> calls $(INSTALL), not rsync or 'make install' or anything like that. So how does
> this happen?

I have not dug to the bottom of this, but the issue is the DHCP
(server, not client)
package is creates
   /var/lib/dhcp/dhcpd.leases
which ends up in /tmp/dhcpd.leases without the patch. With the patch it ends up
in .../output/target/tmp/dhcpd.leases.

(Informed guessing here) When buildroot creates the file system image, it does a
rsync with chgrp (and chown) to the proper owner (root.root), but that
is not allowed
as an unprivileged user running buildroot on the host's /tmp directory.

I'm running very stock Ubuntu 14.04.5 x86 "server" installation cross compiling
to an ARM target.

I did not have a problem with older versions of Buildroot, it was when we pulled
our baseline forward to 2016.08 that we had the problem (previously was 2014
timeframe).

>  Also note that we don't have such failures in the autobuilders. And anyway, I
> thought that a failing chgrp in rsync was non-fatal?

Not for me. :-/ I will look into it further. Total speculation: it may
be a double fault
where the chown root fails followed by a chgrp root which also fails,
aborting the script.

As you note, the autobuilders are not catching it, so it might be
something in how
my build machine is set up.

>> Changing the symlink to "../../tmp" rather than "/tmp" references the
>> target's /tmp directory rather than the build machine's /tmp directory.
>
>  The problem is that /var/lib itself may be a symlink to somewhere else. Some
> people need to have /var/lib in a writeable partition while /var itself is on
> the readonly rootfs. When /var/lib is a symlink, the ../.. will be interpreted
> relative to the target of that symlink, which may be a different number of
> levels down from root.
>
>  Also, since /tmp always exists on the build machine, symlinking to /tmp just works.

The symlink works fine, the chgrp to root on /tmp/dhcpd.leases doesn't. :-(

Thanks,
gvb

>>
>> Signed-off-by: Gerald Van Baren <jerry@vibrationresearch.com>
>> ---
>>  package/dhcp/dhcp.mk | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
>> index 5cb6043..80c984b 100644
>> --- a/package/dhcp/dhcp.mk
>> +++ b/package/dhcp/dhcp.mk
>> @@ -56,7 +56,7 @@ endif
>>  ifeq ($(BR2_PACKAGE_DHCP_SERVER),y)
>>  define DHCP_INSTALL_SERVER
>>         mkdir -p $(TARGET_DIR)/var/lib
>> -       (cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
>> +       (cd $(TARGET_DIR)/var/lib; ln -snf ../../tmp dhcp)
>>         $(INSTALL) -m 0755 -D $(@D)/server/dhcpd $(TARGET_DIR)/usr/sbin/dhcpd
>>         $(INSTALL) -m 0644 -D package/dhcp/dhcpd.conf \
>>                 $(TARGET_DIR)/etc/dhcp/dhcpd.conf
>> @@ -66,7 +66,7 @@ endif
>>  ifeq ($(BR2_PACKAGE_DHCP_RELAY),y)
>>  define DHCP_INSTALL_RELAY
>>         mkdir -p $(TARGET_DIR)/var/lib
>> -       (cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
>> +       (cd $(TARGET_DIR)/var/lib; ln -snf ../../tmp dhcp)
>>         $(INSTALL) -m 0755 -D $(DHCP_DIR)/relay/dhcrelay \
>>                 $(TARGET_DIR)/usr/sbin/dhcrelay
>>  endef
>> @@ -75,7 +75,7 @@ endif
>>  ifeq ($(BR2_PACKAGE_DHCP_CLIENT),y)
>>  define DHCP_INSTALL_CLIENT
>>         mkdir -p $(TARGET_DIR)/var/lib
>> -       (cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
>> +       (cd $(TARGET_DIR)/var/lib; ln -snf ../../tmp dhcp)
>>         $(INSTALL) -m 0755 -D $(DHCP_DIR)/client/dhclient \
>>                 $(TARGET_DIR)/sbin/dhclient
>>         $(INSTALL) -m 0644 -D package/dhcp/dhclient.conf \
>> --
>> 1.9.1
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>>
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
