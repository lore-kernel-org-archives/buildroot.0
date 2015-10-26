From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Oct 2015 21:23:35 +0100
Subject: [Buildroot] [git commit] package/initscripts: S40network: wait
	for network interfaces to appear
In-Reply-To: <CAMQcK5K7pKFBoN9N2hv4oLscew6qTWvj9RhfiCviLako0VzdRg@mail.gmail.com>
 (Ryan Barnett's message of "Mon, 26 Oct 2015 15:07:14 -0500")
References: <20151016111136.50FA381F8A@busybox.osuosl.org>
 <CAMQcK5K7pKFBoN9N2hv4oLscew6qTWvj9RhfiCviLako0VzdRg@mail.gmail.com>
Message-ID: <87io5tcraw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Barnett <ryan.barnett@rockwellcollins.com> writes:

 > Peter, Yann, All,
 > On Fri, Oct 16, 2015 at 2:16 AM, Peter Korsgaard <peter@korsgaard.com> wrote:

 > [...]

 >> 
 >> diff --git a/package/initscripts/init.d/S40network b/package/initscripts/init.d/S40network
 >> index 7b11d8b..a8d7c5d 100755
 >> --- a/package/initscripts/init.d/S40network
 >> +++ b/package/initscripts/init.d/S40network
 >> @@ -6,8 +6,37 @@
 >> # Debian ifupdown needs the /run/network lock directory
 >> mkdir -p /run/network
 >> 
 >> +# In case we have a slow-to-appear interface (e.g. eth-over-USB),
 >> +# and we need to configure it, wait until it appears, but not too
 >> +# long either. WAIT_DELAY is in seconds.
 >> +WAIT_DELAY=15
 >> +
 >> +wait_for_interfaces() {
 >> +       IFACES=$(awk '/^auto/ { print $2 }' /etc/network/interfaces)

 > This new way to handle bringing up interfaces doesn't work well if you
 > have defined virtual interfaces in your /etc/network/interfaces.
 > Having virtual interfaces in your /etc/network/interfaces file I
 > believe is a valid use case that I think buildroot's default
 > S40network should handle. The specific use case that will fail is
 > outlined below:

 > In the actual use case demonstrated below, the network interfaces file
 > contains 2 virtual interfaces on eth3.  Virtual interfaces do not get
 > a unique entry in /sys/class/net.  The function "wait_for_interfaces"
 > added to /package/initscripts/init.d/S40network makes an assumption
 > that all interfaces that may be "auto" will have a /sys/class/net
 > entry.  In the case of a virtual interface, the function will always
 > timeout, and "ifup -a" is never called.

Ok, I suggest we do two things:

We change to awk statement to only consider interface names up to ':':

awk '/^auto/ { split($2, iface, ":"); print iface[1] }' /etc/network/interfaces

And we still continue with ifup -a even if we time out by changing the
exit 1 to a return 1 in wait_for_interfaces().

Would that work for you?

-- 
Venlig hilsen,
Peter Korsgaard 
