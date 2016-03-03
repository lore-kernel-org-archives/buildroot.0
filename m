From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 03 Mar 2016 21:43:14 +0000
Subject: [Buildroot] [Bug 8736] IPV6 forced on in busybox
In-Reply-To: <bug-8736-163@https.bugs.busybox.net/>
References: <bug-8736-163@https.bugs.busybox.net/>
Message-ID: <bug-8736-163-VBMcPD5M3h@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8736

--- Comment #6 from Peter Korsgaard <jacmet@uclibc.org> ---
(In reply to Kenric Smith from comment #4)

So I tried again, this time with IPv6 support disabled in the kernel but
enabled in the toolchain (external codesourcery/glibc):

buildroot login: root
# ifconfig 
eth0      Link encap:Ethernet  HWaddr 52:54:00:12:34:56  
          inet addr:10.0.2.15  Bcast:10.0.2.255  Mask:255.255.255.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:2 errors:0 dropped:0 overruns:0 frame:0
          TX packets:2 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:1152 (1.1 KiB)  TX bytes:684 (684.0 B)

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

# date
Thu Jan  1 00:00:13 UTC 1970

# ntpd -w -p ntp.vt.edu
ntpd: reply from 198.82.247.51: offset:+1457040206.437536 delay:0.123510
status:0x24 strat:2 refid:0xa4f752c6 rootdelay:0.000351 reach:0x01
ntpd: reply from 198.82.247.51: offset:+1457040206.437670 delay:0.109456
status:0x24 strat:2 refid:0xa4f752c6 rootdelay:0.000351 reach:0x03
ntpd: reply from 198.82.247.51: offset:+1457040206.438839 delay:0.109959
status:0x24 strat:2 refid:0xa4f752c6 rootdelay:0.000351 reach:0x07
ntpd: reply from 198.82.247.51: offset:+1457040206.437485 delay:0.107279
status:0x24 strat:2 refid:0xa4f752c6 rootdelay:0.000351 reach:0x0f
random: nonblocking pool is initialized

So that works. If I instead try ntp-1.ipv6.vt.edu (which only has an AAAA
record) it indeed fails:

# ntpd -w -p ntp-1.ipv6.vt.edu
ntpd: socket: Address family not supported by protocol

Which makes sense as it cannot create an IPv6 socket:
socket(PF_INET6, SOCK_DGRAM, IPPROTO_IP) = -1 EAFNOSUPPORT (Address family not
supported by protocol)
write(2, "ntpd: socket: Address family not"..., 55ntpd: socket: Address family
not supported by protocol
) = 55

Looking at the ntpd code, it ends up calling xhost2sockaddr() on the peer name,
which ends up doing a getnameinfo() with AF_UNSPEC, and using the first result
without checking that it can create a socket - So if your C library prefers
IPv6 over IPv4 this explains it.

The function does contain a workaround though: If you enable
ENABLE_FEATURE_PREFER_IPV4_ADDRESS then it will use the first AF_INET result if
available.

What C library do you use?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
