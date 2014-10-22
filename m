From: =?UTF-8?B?QW5kcsOpIEVyZG1hbm4=?= <dywi@mailerd.de>
Date: Wed, 22 Oct 2014 21:39:37 +0200
Subject: [Buildroot] [PATCH v2] set simple network setup via the system
 configuration submenu
In-Reply-To: <1387207516.26811620.1413879836223.JavaMail.root@openwide.fr>
References: <1387207516.26811620.1413879836223.JavaMail.root@openwide.fr>
Message-ID: <544807F9.8070300@mailerd.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014/10/22 Jeremy Rosen <jeremy.rosen@openwide.fr>:
> 
> 
> Hey, thanks for the review, Bash and Makefile are the two programming
> languages I was never able to really master
> 
> ----- Mail original -----
>> Hi,
>>
>> 2014-10-20 16:14 GMT+02:00 J?r?my Rosen <jeremy.rosen@openwide.fr>:
>>> This patch allows the setup of simple /etc/network/interfaces via
>>> the
>>> configuration menus instead of using an overlay
>>>
>>> * supports manual ipv4 configuration
>>> * supports dhcp configuration
>>>
>>> Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
>>>
>>> ---
>>>
>>> This patch is here to avoid having to do an overlay for the most
>>> common
>>> cases (ipv4 with fixed IP or DHCP)
>>>
>>> It can be made more complex (second network if, support ipv6)
>>> depending on
>>> what people want/need, but I want to keep it simple. The point is
>>> to avoid
>>> having to tweak overlays to change stuff that everybody needs to
>>> change for
>>> prototyping
>>>
>>> When networkd is enabled, this option will be deactivated. Networkd
>>> support
>>> is tricky to get right on first approximation. It can be added
>>> later if it
>>> is deemed usefull
>>
>> I'm willing to add networkd support once your work has been merged ;)
>>
> 
> I've already been working on it, it's indeed quite easy but there is 
> a tricky question that needs resolving, so I didn't include it in this
> patch. Basically I have a problem with dealing with default values with
> static IP settings
> 
> * The script need to fail if no value is provided for address
> * The script needs to build correctly with default values (autobuilder)
> * There is no "correct" default values to use
> * We should not let an unconfigured Adress on the network.
> 
> Right now, ADDRESS defaults to 0.0.0.0 which is interpreted by net-utils
> as "incorrect address, don't configure the interface" (so it ends up
> enabled but with no IP address) I'm happy with that, it's ok with my 
> requirement
> 
> But I could not find an equivalent setting for networkd.

In the .network file, omit the "[Address]" section / "Address=" line.
The interface gets upped, but no ip address gets assigned.
I've attached some ".network" file examples below.

> 0.0.0.0 is 
> interpreted as "automatically find an IP address" and I couldn't find
> any documentation on how it does that (does it check the network for
> collision ? It seems to use the netmask to choose the base address and
> it makes sure there is no conflict with other interfaces on the same
> machine, but that's all I could find)
> 

That's all it does: ensure that each automatic address is unique on a single
system, i.e. doesn't clash with any configured addr or any addr that has
already been assigned.

It might be useful for virtual ethernet setups (veth and whatnot), but IMO
that's out of scope for simple network setup, so my suggestion would be to
handle "0.0.0.0" as <not configured> => no "Address=" in the .network file.
It also makes BR2_SIMPLE_NETWORK_IPV4_IPV4_ADDRESS semantically equivalent
for both output formats.

Alternatives, all with the disadvantage of adding unnecessary complexity:
* introduce a dummy value, e.g. "-"
* add another choice to the "Configuration type" prompt,
  BR2_SIMPLE_NETWORK_IPV4_NONE (or similar)


> So right now I'm open to suggestions on that particular problem, generating
> the actual .network file shouldn't be very hard (I temptatively call it
> busybox.networks rather than <name>.network to be sure to overwrite it 
> on the next iteration of the script)
> 

Not sure if it's a binding convention, but these files are usually prefixed
with a number 01..99, e.g. "50-buildroot.network".

> 
>> Just for reference, my notes on what needs to be done:
>> * no loopback setup, systemd does it on its own
> 
> yes, I found that out, it's simple to deal with since loopback is not a config
> option for net-utils anymore
> 
>> * creation of a ".network" file - .ini file (equivalent to
>> /etc/network/interfaces), requires conversion of the netmask to cidr
>> format (255.255.255.0 => 24 a.s.o.)
> 
> I found how to do that in shell script somewher on stackoverflow, so
> not a problem
> 
>> * -optionally- disable "predictable" network interface renaming
>> ("eth0"=>"enp2s0") [0] so that one can actually rely on eth0's
>> existence
>>
> 
> that's a good idea, but predicatable interface names seems to already
> be disabled on buildroot builds. I wasn't able to find out why and I
> didn't dig since I was dropping networkd support at that point. It
> seems that there is something weird there...
> 

It's not disabled, but under certain circumstances it's not "active", for example
if the kernel-provided name is deemed to be stable, e.g. qemu/kvm with virtio netdev. 
You can provoke it by plugging in an usb wlan adapter, which appears as "wlp0s20u10"/...
in 'ip link'/'ifconfig'.
On x86 consumer-grade hardware, the wired interfaces get always renamed, too.

There are several ways to disable it, but the best solution -for me- is
"ln -s /dev/null $(TARGET_DIR)/etc/systemd/network/99-default.link", which still allows
custom interface renaming in /etc/systemd/network/ while disabling the default policy.

---
.network file examples:

# "0.0.0.0"
[Match]
Name=eth0

[Network]
Description=buildroot-configured interface
(EOF)

# any other manual ip addr
[Match]
Name=eth0

[Network]
Description=buildroot-configured interface

[Address]
Address=192.168.1.2/24
Broadcast=192.168.1.255 ## if configured

[Route]
Gateway=192.168.1.1 ## if configured
(EOF)

# dhcp
[Match]
Name=eth0

[Network]
Description=buildroot-configured interface
DHCP=v4
(EOF)

Notes:
* the "Gateway=" line can also be moved to the "[Network]" section
  (+ drop the "[Route]" section)

* "Address=" should have its own section because of "Broadcast="

-- 
Andr?
