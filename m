From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Mar 2017 23:26:31 +0100
Subject: [Buildroot] [PATCH] mkusers: create system users/groups below
 UID/GID 1000
In-Reply-To: <1486647783-6622-1-git-send-email-p.debruijn@unilogic.nl>
References: <1486647783-6622-1-git-send-email-p.debruijn@unilogic.nl>
Message-ID: <20170305222631.GL3671@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pascal, All,

On 2017-02-09 14:43 +0100, Pascal de Bruijn spake thusly:
> Try not to create users/groups past UID/GID 1000, as this space
> is usually reserved for proper user/group accounts.
> 
> Change buildroot behaviour to be similar to distros (like Debian)
> where UID/GID 101-999 are used for dynamic allocation to system
> service accounts.
> 
> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
> ---
>  support/scripts/mkusers | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/support/scripts/mkusers b/support/scripts/mkusers
> index d834578..c9f31fc 100755
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

Although I don't have any hard conviction for a specific range or
another, I don't like the rationale.

For one, why would we need to stick to similar numbering as standard
distros to begin with? as far as I know, nothing mandates any UID:GID
range for anything, except that 0:0 is for root:root.

Second, this script does not create only so-called "service accounts";
it is perfectly legit to use that script to create "normal" users.

If you need to guarantee a numbering for specific users, then you should
pass your own user tables with the uids and gids you care about;
Buildroot will happily use the UIDs/GIDs used therein, even outside the
range here.

However...

I would love to see that range being configurable in the menuconfig,
instead of having to edit the file to change the range.

I believe this would be much more user-friendly and would cover your
use-case as well. I believe. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
