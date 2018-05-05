From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 May 2018 17:21:20 +0200
Subject: [Buildroot] [PATCH] Makefile: check rootfs overlays with
 BR2_ROOTFS_MERGED_USR enabled
In-Reply-To: <87h8nmuoya.fsf@dell.be.48ers.dk>
References: <20180503121958.9462-1-casantos@datacom.ind.br>
 <20180505100100.GA2481@scaer>
 <898911315.1288101.1525528062390.JavaMail.zimbra@datacom.ind.br>
 <20180505144527.GA14524@scaer> <87h8nmuoya.fsf@dell.be.48ers.dk>
Message-ID: <20180505152120.GC14524@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2018-05-05 17:01 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  >> > So, I am pretty much reluctant to see this patch go in.
>  > But I'd prefer we keep things simple in Buildroot, and since there is
>  > already a way to do it, I don't mind that overlays do not provide this
>  > solution. A post-build script is way more versatile when it comes to
>  > changing the layout.
> 
> Yes, with a post-build script you have full flexibility, but we have
> quite a lot of helper functionality to handle "common" fixups in a
> simpler way than though a post-build script, E.G. stripping, removing
> .py files, overlays, ..
> 
> This restriction for overlays isn't obvious and wasn't originally there
> (before the merged /usr support), so it is arguably a regression (but
> for an edge case as this afaik is the first report of it).

I still believe that such *modifications* to the layout be actually not
supported with overlays.

Today, someone wants to be able to overrids /var/log from a symlink to a
directory to be able to store remanent data there. But then, that will
require a modification in fstab to mount an actual filesystem there. And
such a modification would be done by a post-build script (if it comes
from an overlay, there is no way this will work as-is between buildroot
versions, becasue buildroot may add/remove stuff in there as well).

So, a post-build script is really needed anyway...

And then, someone will want to change something else, e.g. a file to a
symlink or a directory to a symlink or whatever...

Also, overlays are not copied under fakeroot (but OK, post-build script
neither, but we have fakeroot-scripts). So, if one wants special rights,
it's not possible with overlays either...

So, really, overlays are not as nice as one may think...

As I said, in the long run, they are more a liability than anything
else.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
