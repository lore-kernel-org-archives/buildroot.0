From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 26 Jan 2015 07:33:38 -0300
Subject: [Buildroot] pppd makefile moves /etc/PPP/resolv.conf
In-Reply-To: <38D70EB2-AE5E-475D-865B-7225F7CD5E26@nowonline.co.uk>
References: <38D70EB2-AE5E-475D-865B-7225F7CD5E26@nowonline.co.uk>
Message-ID: <54C61802.4010602@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/26/2015 03:49 AM, Lee Essen wrote:

> Hi,
> 
> The current pppd package makefile has a post extract hook that changes the ppp generated resolv.conf from /etc/ppp/resolv.conf to /etc/resolv.conf with a comment suggesting that this is done because /etc/ppp might not be writable (and this location isn't useful because of where the c library looks.)
> 
> My assumption is that the original location provided you with flexibility to do clever things in the ppp-up script (and that's certainly what I want to do)
> 
> If you don't set usepeerdns then it looks like the server names don't get requested, so the creation of this file seems to be all or nothing - there is no way to work with just the env vars.
> 
> With the current buildroot setup your resolv.conf is overwritten with no option to do anything clever.
> 
> Wouldn't it be better to use /var/run/ppp.resolv.conf (or something similar) or even leave it as it was and include a symlink in /etc/ppp ??
> 
> Thanks,
> 
> Lee.

Hi.
I did that modification, let's see.
Actually the original location didn't provide anything useful if your
root filesystem is read-only, like in squashfs, so it's just as bad, so
it makes no sense in making it a symlink from /etc/ppp -> /var/run in
the way you say, because, well, what if you got multiple ppp instances
running?
The other problem with writing it to some other temporary file different
than /etc(tmp)/resolv.conf is that out of the box it's useless.
What if i said "i've got an advanced scenario and dhcpcd/udhcpc/other
dhcp client writes to /etc/resolv.conf unfairly"?
What dhcp clients currently do is no different than what pppd does (with
usepeerdns), and it's basically out-of-the-box simplicity, it just
works, though granted that it doesn't cater for advanced uses.
That pppd doesn't give DNS information to ip-up scripts, at least for
me, a bug, the information should be available. It's likely upstream
won't fix/change this since it would alter established behaviour and
hence breaks scripts.
So what's the solution to the sucky /etc/resolv.conf mess?
Well, openresolv (http://roy.marples.name/projects/openresolv/index).
I've mentioned it in IRC before but didn't have time to create the
package and glue it together seamlessly with the other packages (mostly
ppp, dhcp clients and so on).
Regards.
