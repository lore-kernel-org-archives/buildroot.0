From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 29 May 2019 15:57:22 +0200
Subject: [Buildroot] [PATCH] linux: enable UEVENT_HELPER when mdev is
 used
In-Reply-To: <f887e49a-0327-9bcb-f524-2a9aa2527edb@railnova.eu>
References: <20190525130755.25678-1-peter@korsgaard.com>
 <54a85c9f-1e14-de0d-c6cf-8201dea50e1d@mind.be>
 <f887e49a-0327-9bcb-f524-2a9aa2527edb@railnova.eu>
Message-ID: <38daf6b1-3749-66f4-93b9-7f1222c7da16@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/05/2019 15:13, Titouan Christophe wrote:
> Hello Arnout, Peter, Andy and all,
> 
> On 5/25/19 5:24 PM, Arnout Vandecappelle wrote:
>>
>>
>> On 25/05/2019 15:07, Peter Korsgaard wrote:
>>> S10mdev uses /proc/sys/kernel/hotplug, which is only available if
>>> CONFIG_UEVENT_HELPER is enabled in the kernel, so ensure it is.
>>
>> ? So, I take a look at it, and it's a little bit more complicated...
>>
>> ? Busybox *does* have support for the "new" netlink-based uevent interface, but
>> that interface needs a daemon that keeps running and they separated that daemon
>> into a separate process, called uevent. So, in the "new" way, you should do
>> something like (not tried, just based on source code):
>>
>> start-stop-daemon -S -b -x /sbin/uevent -- mdev
>>
>> ? But of course, that means that we have to be sure that the uevent executable is
>> in fact built for busybox. So we'd need to extend BUSYBOX_SET_MDEV to enable
>> uevent.
>>
>> ? Also, we can only use the uevent approach if netlink uevents are available.
>> They exist since 2.6.12, so I guess on that side we're safe. However, they also
>> depend on CONFIG_NET (because netlink does).
>>
>> ? So, these are our options:
>>
>> 1. Bloat the kernel with legacy uevent helper support (this patch).
>>
>> 2. Bloat the kernel with networking even if it is not used for anything else,
>> and bloat busybox with uevent (3.1 kb), and always use uevent.
>>
>> 3. Use uevent in the init script but don't enforce anything (with potential
>> silent failures), and explain stuff in the mdev help text.
>>
>> 4. Try out all possibilities in the init script - which still fails silently in
>> case neither CONFIG_UEVENT_HELPER nor CONFIG_NET is enabled in the kernel.
>>
>>
>> ? In my opinion, we definitely should *not* go for option 1. I don't want to be
>> the one that forces the kernel to maintain legacy stuff. I would definitely use
>> uevent. On the other hand, I really don't like it when we force changes into
>> busybox or kernel configs. Since it's really likely that CONFIG_NET is enabled
>> in the kernel, and since our default busybox config (but not the minimal one)
>> does enable uevent, I think that option 3 is the way to go.
> 
> Couldn't we implement the following in S10mdev ?
> 
> - If both /proc/net/netlink and /sbin/uevent are present -> uevent daemon + mdev
> - If /proc/sys/kernel/hotplug is present -> go for mdev as hotplug (and init
> mdev.seq)
> - Otherwise -> print an error message.
> 
> 
> I have a patch for this, would I submit ?

 If you anyway have it, submit it, and we can discuss based on that.

 It would be nice if you could also do a preparatory patch that converts the
file to the "canonical init script format" (cfr. e.g.
package/rsyslog/S01rsyslogd). mdev doesn't have arguments or a default, so that
simplifies things a little.

 Regards,
 Arnout
