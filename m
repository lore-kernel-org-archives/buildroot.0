From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 19 Jul 2016 14:33:34 +0200
Subject: [Buildroot] mkusers: create system users/groups below UID/GID
 1000
In-Reply-To: <CANqV4tWfazqOvG6HCiruvi3dwAKT6bobnCgWsn=tBqMFFNGR5w@mail.gmail.com>
References: <CANqV4tWfazqOvG6HCiruvi3dwAKT6bobnCgWsn=tBqMFFNGR5w@mail.gmail.com>
Message-ID: <20160719123334.GB5628@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pascal, All,

On 2016-07-19 14:19 +0200, Pascal de Bruijn spake thusly:
> For your consideration, see attached patch.

Please, do not send patches as attachement. Send them in the body of the
mail.

Also, use "git send-email" which we will conveniently prepare the mails
and send them for you, all properly formatted.

> Regards,
> Pascal de Bruijn

> From 5e05b94edc2d7cacddd0b65810a583062f8c18e2 Mon Sep 17 00:00:00 2001
> From: Pascal de Bruijn <pmjdebruijn@pcode.nl>
> Date: Tue, 19 Jul 2016 14:07:17 +0200
> Subject: [PATCH] mkusers: create system users/groups below UID/GID 1000
> 
> Try not to create users/groups past UID/GID 1000, as this space
> is usually reserved for proper user/group accounts.
> 
> Change buildroot behaviour to be similar to distros (like Debian)
> where UID/GID 101-999 are used for dynamic allocation to system
> service accounts.
> 
> diff --git a/support/scripts/mkusers b/support/scripts/mkusers
> index e2c24c7..a6557d4 100755
> --- a/support/scripts/mkusers
> +++ b/support/scripts/mkusers
> @@ -4,10 +4,10 @@ myname="${0##*/}"
>  
>  #----------------------------------------------------------------------------
>  # Configurable items
> -MIN_UID=1000
> -MAX_UID=1999
> -MIN_GID=1000
> -MAX_GID=1999
> +MIN_UID=101
> +MAX_UID=999
> +MIN_GID=101
> +MAX_GID=999

Otherwise, OK for me.

Note that this has the potential to break upgrades of existing systems,
since the range allocated to generated users has changed, and thus may
no longer match the UIDs/GIDs of files created on the device.

But we never ever made the promise that this would work anyway, so I am
totally OK with changing this range.

Regards,
Yann E. MORIN.

>  # No more is configurable below this point
>  #----------------------------------------------------------------------------
>  
> -- 
> 2.7.4
> 

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
