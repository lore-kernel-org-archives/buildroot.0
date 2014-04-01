From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Tue, 1 Apr 2014 19:20:36 -0400
Subject: [Buildroot] Problem with multi interface support in udhcpc
	script?
In-Reply-To: <87iotdgv4h.fsf@dell.be.48ers.dk>
References: <CANxTyt44suVoSpVTivmKde77P7fUYRa04a_fQfb=ceA-Yym9sQ@mail.gmail.com>
 <87fvohimha.fsf@dell.be.48ers.dk>
 <CANxTyt6sZiRD7SgdnYeshPG4gma_m21gyiYOUP9=MP1dLOL7Sg@mail.gmail.com>
 <87iotdgv4h.fsf@dell.be.48ers.dk>
Message-ID: <CANxTyt5PMCt=RXdzFPcWJw4SOvK3nzAXojfYGTqfdHpMGGa3kQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

On Tue, Jan 21, 2014 at 11:25 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:
>
> Hi,
>
>  > Rather than relying on the last search line winning for the future, I
>  > was thinking that the per-interface search lines should be comments,
>  > something like:
>
>  > nameserver ... # eth0
>  > #search foo # eth0
>  > nameserver ... # eth1
>  > #search bar # eth1
>  > search foo bar
>
>  > (Of course, you can replace "#search" with whatever you want.)
>
> Sure, that's also fine.
>
>
>  > Also, if you run the little libresolv program that I sent earlier,
>  > then you'll see that the "#" and "COMBINED" show up as search domains
>  > - at least, I do, with both my Ubuntu 12.04 machine and with my
>  > embedded target compiled with CodeSourcery 2009q1-203.  So I do not
>  > think that it is safe to have a comment on the aggregated search line.
>
> Ok, as far as I can see uClibc atleast stops parsing on '#', but yeah,
> not having it is safer.
>
>  >  Therefore, if you must identify the combined search line then you
>  > might want to to grep for '^search '.  I was thinking that perhaps it
>  > would be better to just regenerate the whole thing each time - for
>  > example:
>
> Yes, with a combined search line you alway need to regenerate the file.
>
>
>  > However, there is still a problem with this strategy - the order of
>  > the name servers and the search domains affect how DNS queries are
>  > made.  Catting lines to the end of a file will make server and search
>  > domain priority a function of when DHCP info is acquired, not
>  > planning.  So I ended up funneling all DNS info to our project's
>  > network app rather than relying on this script to do it for us, to
>  > roll my own "resolvconf".  But then, incremental improvement is still
>  > improvement, so changing the way this scipt is now may still be a good
>  > thing.
>
> Yes, you always have the option of using a custom udhcpc script, but it
> makes sense to atleast try to do it correctly by default.
>
> Thanks, I'll take a look at implementing it.
>
> --
> Bye, Peter Korsgaard

On an only slightly tangential topic - if the multiple interfaces
being serviced by the udhcpc script are on different networks, don't
we need to separate the routing with, say, ip routing tables?
Otherwise, I think we run into multiple default gateways, which "ip
route" won't allow - though the older "route" method doesn't seem to
complain.

I've been reading about such things lately for work ... for example:

http://www.techpository.com/?page_id=965

and

http://www.thomas-krenn.com/en/wiki/Two_Default_Gateways_on_One_System

I think that specifying "table" for "ip route" might force use of the
full-blown iproute2 ip command ...

Danomi -
