From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 6 Oct 2016 21:22:50 +0200
Subject: [Buildroot] [PATCH] Fix dhcp symlink in target/var/lib/dhcp
In-Reply-To: <CAK-g76Vp+TepJFwXN-RpFqWmr6nKUwVaHjUm0F8b5UDXXtE6Og@mail.gmail.com>
References: <CAK-g76X-fwsZnfmQaDN8a90kLrJCRfduAgNYyXuYa-UytHSfpA@mail.gmail.com>
 <25c03ce6-8771-cd39-32ef-b815ede292f6@mind.be>
 <CAK-g76Vp+TepJFwXN-RpFqWmr6nKUwVaHjUm0F8b5UDXXtE6Og@mail.gmail.com>
Message-ID: <b0e5ec54-e6e5-d088-ffbb-954ee738fea3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 06-10-16 19:38, Jerry Van Baren wrote:
> Hi Arnout,
> 
> On Wed, Oct 5, 2016 at 7:20 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>>
>> On 28-09-16 18:07, Root, Build wrote:
>>> The symlink was to /tmp causing an error on the target install step:
>>> rsync: chgrp "/<path>/output/target/var/lib/dhcp" failed: Operation
>>> not permitted
>>
>>  Could you explain this a little more? The install step of this package only
>> calls $(INSTALL), not rsync or 'make install' or anything like that. So how does
>> this happen?
> 
> I have not dug to the bottom of this, but the issue is the DHCP
> (server, not client)
> package is creates
>    /var/lib/dhcp/dhcpd.leases
> which ends up in /tmp/dhcpd.leases without the patch. With the patch it ends up
> in .../output/target/tmp/dhcpd.leases.

 I forgot to explain this in my original mail: it doesn't (or shouldn't) matter
if the dhcpd.leases file is lost, because (in many situations) a tmpfs will be
mounted on /tmp at runtime so the pre-installed dhcpd.leases is lost anyway.

 Moreover, the dhcp package doesn't even install this leases file. I just tested
it here: with any combination of DHCP sub-options, no leases file is installed
in output/target/tmp or output/target/var/lib/* or anywhere else.

> 
> (Informed guessing here) When buildroot creates the file system image, it does a
> rsync with chgrp (and chown) to the proper owner (root.root), but that
> is not allowed
> as an unprivileged user running buildroot on the host's /tmp directory.

 Actually, no, buildroot doesn't do any rsyncing. It only rsyncs the skeleton
from package/skeleton to the target directory, but that is at the beginning of
the build before anything else is done.

 There is also an rsync of the BR2_ROOTFS_OVERLAY directories at the end of the
build. Aha, that is probably what happens: you have a var/lib/dhcp/dhcpd.leases
in you overlay!


> 
> I'm running very stock Ubuntu 14.04.5 x86 "server" installation cross compiling
> to an ARM target.
> 
> I did not have a problem with older versions of Buildroot, it was when we pulled
> our baseline forward to 2016.08 that we had the problem (previously was 2014
> timeframe).

 Aha bis: the symlink logic for the dhcp package has been there since 2005, but
the --keep-dirlinks argument of the rootfs overlay's rsync command was added
this year.

> 
>>  Also note that we don't have such failures in the autobuilders. And anyway, I
>> thought that a failing chgrp in rsync was non-fatal?
> 
> Not for me. :-/ I will look into it further. Total speculation: it may
> be a double fault
> where the chown root fails followed by a chgrp root which also fails,
> aborting the script.

 My rsync 3.1.1 doesn't complain when I use the -a option and it can't preserve
owner or group.

> 
> As you note, the autobuilders are not catching it, so it might be
> something in how
> my build machine is set up.
> 
>>> Changing the symlink to "../../tmp" rather than "/tmp" references the
>>> target's /tmp directory rather than the build machine's /tmp directory.
>>
>>  The problem is that /var/lib itself may be a symlink to somewhere else. Some
>> people need to have /var/lib in a writeable partition while /var itself is on
>> the readonly rootfs. When /var/lib is a symlink, the ../.. will be interpreted
>> relative to the target of that symlink, which may be a different number of
>> levels down from root.
>>
>>  Also, since /tmp always exists on the build machine, symlinking to /tmp just works.
> 
> The symlink works fine, the chgrp to root on /tmp/dhcpd.leases doesn't. :-(

 So, easy solution: in your overlay, put the dhcpd.leases in /tmp where it belongs.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
