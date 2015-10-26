From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 26 Oct 2015 22:04:47 +0100
Subject: [Buildroot] [git commit] package/initscripts: S40network: wait
 for network interfaces to appear
In-Reply-To: <CADZ9A7pN8Tq8NzDbnNDjjSP0Y7Edvo7TbngcFNhttO+v+ybMXg@mail.gmail.com>
References: <20151016111136.50FA381F8A@busybox.osuosl.org>
 <CAMQcK5K7pKFBoN9N2hv4oLscew6qTWvj9RhfiCviLako0VzdRg@mail.gmail.com>
 <87io5tcraw.fsf@dell.be.48ers.dk>
 <CADZ9A7pN8Tq8NzDbnNDjjSP0Y7Edvo7TbngcFNhttO+v+ybMXg@mail.gmail.com>
Message-ID: <20151026210447.GC3788@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maury, Ryan, Peter, All,

On 2015-10-26 15:53 -0500, Maury Anderson spake thusly:
> I believe both suggestions should be added.
> 
> Thank you for the awk magic.  The modified awk magic creates duplicates,
> for instance if you had "lo eth3 eth3:1 eth3:2" you end up with "lo eth3
> eth3 eth3".  The duplicates don't hurt anything, just waste time in the
> loop.  Can we pipe it through uniq?  (Provided uniq is in the default
> busybox.)

Or still in awk:

    ifaces=$(awk '/^auto/ { split($2, iface, ":"); ifaces[iface[1]]=1; }
                  END { for(i in ifaces) { printf( "%s\n", i); } }
                 ' \
                 /etc/network/interfaces
            )

Regards,
Yann E. MORIN.

> Thank you,
> Maury Anderson
> 
> On Mon, Oct 26, 2015 at 3:23 PM, Peter Korsgaard <peter@korsgaard.com>
> wrote:
> 
> > >>>>> "Ryan" == Ryan Barnett <ryan.barnett@rockwellcollins.com> writes:
> >
> >  > Peter, Yann, All,
> >  > On Fri, Oct 16, 2015 at 2:16 AM, Peter Korsgaard <peter@korsgaard.com>
> > wrote:
> >
> >  > [...]
> >
> >  >>
> >  >> diff --git a/package/initscripts/init.d/S40network
> > b/package/initscripts/init.d/S40network
> >  >> index 7b11d8b..a8d7c5d 100755
> >  >> --- a/package/initscripts/init.d/S40network
> >  >> +++ b/package/initscripts/init.d/S40network
> >  >> @@ -6,8 +6,37 @@
> >  >> # Debian ifupdown needs the /run/network lock directory
> >  >> mkdir -p /run/network
> >  >>
> >  >> +# In case we have a slow-to-appear interface (e.g. eth-over-USB),
> >  >> +# and we need to configure it, wait until it appears, but not too
> >  >> +# long either. WAIT_DELAY is in seconds.
> >  >> +WAIT_DELAY=15
> >  >> +
> >  >> +wait_for_interfaces() {
> >  >> +       IFACES=$(awk '/^auto/ { print $2 }' /etc/network/interfaces)
> >
> >  > This new way to handle bringing up interfaces doesn't work well if you
> >  > have defined virtual interfaces in your /etc/network/interfaces.
> >  > Having virtual interfaces in your /etc/network/interfaces file I
> >  > believe is a valid use case that I think buildroot's default
> >  > S40network should handle. The specific use case that will fail is
> >  > outlined below:
> >
> >  > In the actual use case demonstrated below, the network interfaces file
> >  > contains 2 virtual interfaces on eth3.  Virtual interfaces do not get
> >  > a unique entry in /sys/class/net.  The function "wait_for_interfaces"
> >  > added to /package/initscripts/init.d/S40network makes an assumption
> >  > that all interfaces that may be "auto" will have a /sys/class/net
> >  > entry.  In the case of a virtual interface, the function will always
> >  > timeout, and "ifup -a" is never called.
> >
> > Ok, I suggest we do two things:
> >
> > We change to awk statement to only consider interface names up to ':':
> >
> > awk '/^auto/ { split($2, iface, ":"); print iface[1] }'
> > /etc/network/interfaces
> >
> > And we still continue with ifup -a even if we time out by changing the
> > exit 1 to a return 1 in wait_for_interfaces().
> >
> > Would that work for you?
> >
> > --
> > Venlig hilsen,
> > Peter Korsgaard
> >
> 
> 
> 
> -- 
> Maury Anderson
> Sr Software Engineer
> AIS Platform Security - Rockwell Collins

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
