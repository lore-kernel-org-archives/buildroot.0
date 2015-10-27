From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Tue, 27 Oct 2015 10:22:52 +0100
Subject: [Buildroot] [git commit] package/initscripts: S40network: wait
 for network interfaces to appear
In-Reply-To: <CAMQcK5K7pKFBoN9N2hv4oLscew6qTWvj9RhfiCviLako0VzdRg@mail.gmail.com>
References: <20151016111136.50FA381F8A@busybox.osuosl.org>
 <CAMQcK5K7pKFBoN9N2hv4oLscew6qTWvj9RhfiCviLako0VzdRg@mail.gmail.com>
Message-ID: <562F426C.4010500@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/10/2015 21:07, Ryan Barnett wrote:
> Peter, Yann, All,
> 
> On Fri, Oct 16, 2015 at 2:16 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
> 
> [...]
> 
>>
>> diff --git a/package/initscripts/init.d/S40network b/package/initscripts/init.d/S40network
>> index 7b11d8b..a8d7c5d 100755
>> --- a/package/initscripts/init.d/S40network
>> +++ b/package/initscripts/init.d/S40network
>> @@ -6,8 +6,37 @@
>>  # Debian ifupdown needs the /run/network lock directory
>>  mkdir -p /run/network
>>
>> +# In case we have a slow-to-appear interface (e.g. eth-over-USB),
>> +# and we need to configure it, wait until it appears, but not too
>> +# long either. WAIT_DELAY is in seconds.
>> +WAIT_DELAY=15
>> +
>> +wait_for_interfaces() {
>> +       IFACES=$(awk '/^auto/ { print $2 }' /etc/network/interfaces)
> 
> This new way to handle bringing up interfaces doesn't work well if you
> have defined virtual interfaces in your /etc/network/interfaces.
> Having virtual interfaces in your /etc/network/interfaces file I
> believe is a valid use case that I think buildroot's default
> S40network should handle. The specific use case that will fail is
> outlined below:
> 
> In the actual use case demonstrated below, the network interfaces file
> contains 2 virtual interfaces on eth3.  Virtual interfaces do not get
> a unique entry in /sys/class/net.  The function "wait_for_interfaces"
> added to /package/initscripts/init.d/S40network makes an assumption
> that all interfaces that may be "auto" will have a /sys/class/net
> entry.  In the case of a virtual interface, the function will always
> timeout, and "ifup -a" is never called.
> 
> # awk '/^auto/ { print $2 }' /etc/network/interfaces
> lo
> eth3
> eth3:1
> eth3:2

These are not virtual interfaces in any way.  These aren't even
interfaces.  Actually, they are address labels.

Debian's ifupdown still support them, but never supported it correctly
in the first place. Nowadays, it has more or less the same effect as
just adding multiple eth3 definitions, something that busybox
unfortunately does not support (i just looked at the code, and
supporting it could be possibly done only by removing code, i should
submit a patch).

Anyway, one simple fix would be to just test
/sys/class/net/${IFACE%:*} instead.

However, true virtual interfaces may also be defined in
/etc/network/interfaces and created via a pre-up stanza:

auto br0
iface br0 inet static
    pre-up ip link add br0 type bridge
    post-down ip link del br0
    address 203.0.113.42
    netmask 255.255.255.0

In this case, S40network will wait forever.  However, if the feature
was implemented via ifupdown pre-up hooks, then this use-case could
actually work, since hooks are executed after pre-up stanzas. But that
is maybe too complex for buildroot.
