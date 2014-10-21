From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Oct 2014 20:00:14 +0200
Subject: [Buildroot] [PATCH v2] set simple network setup via the system
 configuration submenu
In-Reply-To: <1111084647.26814618.1413881401004.JavaMail.root@openwide.fr>
References: <20141021103611.7e43d2b4@free-electrons.com>
 <1111084647.26814618.1413881401004.JavaMail.root@openwide.fr>
Message-ID: <20141021180014.GE30778@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jeremy, All,

On 2014-10-21 10:50 +0200, Jeremy Rosen spake thusly:
> [<snip>]
> > I certainly don't like to push back stuff, but I'm wondering if this
> > isn't too much complexity compared to just having people use an
> > overlay
> > containing their own /etc/network/interfaces. We will never be able
> > to
> > handle all the possible cases, with multiple network interfaces, hook
> > scripts called before/after bringing up/down interfaces, etc.
> > 
> > What is the opinion of other Buildroot developers?
> 
> just to clarify...
> 
> the point of the patch is not to allow all possible configurations that
> network/interfaces can handle, but just allow to easily set an IP address
> or enable DHCP without having to add an overlay. For anything more
> complex an overlay is the way to go.
> 
> I originally thought that putting more stuff in would be a good
> idea but I have revised my position on that and now I think it
> should be limited to the minimal required subset
> 
> * static ipv4
> * ipv4 dhcp
> * networkd support
> 
> if ipv6 becomes popular enough it could trivially be added but 
> let's keep this for a followup

I've meant to review this earlier, but then I always backed off because
I'm not too happy with this kind of stuff, without being able to
pinpoint the exact underlying reason. Call it gut feelings if you
want...

Although I like it when we present user-friendly configuration options,
and this certainly is to some extent, I worry about the option-creep we
are going to have with this kind of options.

I too am also responsible for this option-creep, so I'm noone to really
blame any one trying for such a change... ;-)

Still, I would like to see where we going with that kind of setup, and
how far we should go (or rather, where we should stop).

Certainly, this IPv4-only options are not too intrusive, yet they only
cover a basic setup.

Now, for some actual, high-level review (mostly about cosmetics):

  - multiple spearation lines, or spaces; this breaks the current flow of
    the "code", and is not in-line with the rest of the file. Please use
    only one line to separate /sections/, and do not double spaces,
    especially in the help texts.

  - I would make all into a single choice, with three entries:
    - don't generate network settings
    - use DHCP
    - use static

  - Also, we already have a /etc/network/interfaces file in the skeleton,
    with lo in it; I'd prefer you keep it that way, and not generate the
    lo entry, and just append the 'eth0' entry.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
