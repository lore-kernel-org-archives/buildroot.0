From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 5 Jun 2014 19:20:24 +0200
Subject: [Buildroot] [PATCH] Remove user "default"
In-Reply-To: <1401957050-24705-1-git-send-email-sho@relinux.de>
References: <1401957050-24705-1-git-send-email-sho@relinux.de>
Message-ID: <20140605172024.GA3553@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Stephan, All,

On 2014-06-05 10:30 +0200, Stephan Hoffmann spake thusly:
> User "default" with no password has been around for long time, but not
> used within buildroot. Since we now have BR2_ROOTFS_USERS_TABLES it is
> no longer needed.
> 
> Signed-off-by: Stephan Hoffmann <sho@relinux.de>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Note a comment below...

Regards,
Yann E. MORIN.

> ---
>  system/device_table.txt    | 1 -
>  system/skeleton/etc/group  | 1 -
>  system/skeleton/etc/passwd | 1 -
>  system/skeleton/etc/shadow | 1 -
>  4 files changed, 4 deletions(-)
> 
> diff --git a/system/device_table.txt b/system/device_table.txt
> index 7ae4b07..e15412d 100644
> --- a/system/device_table.txt
> +++ b/system/device_table.txt
> @@ -10,7 +10,6 @@
>  /tmp					d	1777	0	0	-	-	-	-	-
>  /etc					d	755	0	0	-	-	-	-	-
>  /root					d	700	0	0	-	-	-	-	-
> -/home/default				d	755	1000	1000	-	-	-	-	-
>  /var/www				d	755	33	33	-	-	-	-	-
>  /etc/shadow				f	600	0	0	-	-	-	-	-
>  /etc/passwd				f	644	0	0	-	-	-	-	-
> diff --git a/system/skeleton/etc/group b/system/skeleton/etc/group
> index 85a1fa2..11d58ac 100644
> --- a/system/skeleton/etc/group
> +++ b/system/skeleton/etc/group
> @@ -27,4 +27,3 @@ ftp:x:83
>  nobody:x:99:
>  nogroup:x:99:
>  users:x:100:
> -default:x:1000:
> diff --git a/system/skeleton/etc/passwd b/system/skeleton/etc/passwd
> index ed7006a..8696954 100644
> --- a/system/skeleton/etc/passwd
> +++ b/system/skeleton/etc/passwd
> @@ -13,4 +13,3 @@ dbus:x:81:81:dbus:/var/run/dbus:/bin/sh
>  ftp:x:83:83:ftp:/home/ftp:/bin/sh
>  nobody:x:99:99:nobody:/home:/bin/sh
>  sshd:x:103:99:Operator:/var:/bin/sh

Should we make these system accounts no-login accounts, and set the set
their shells to /bin/false to prevent any latent issue?

For example, my distro's passwd has:
    sshd:x:115:65534::/var/run/sshd:/usr/sbin/nologin
    nobody:x:65534:65534:nobody:/nonexistent:/bin/sh

and shadow has:
    sshd:*:15767:0:99999:7:::
    nobody:*:15630:0:99999:7:::

So, setting at least the shell to /bin/false would be better.

Also, why do we have an sshd user to begin with? We already had this
discussion about the 'mail' user, but 'mail' is in the low-digits, and
very traditional to UNIX. 'sshd' on the other hand is above 100, and
is not really needed: the ssh server should run as root to allow logins
anyway.

And since packages can now create users... ;-)

Should we prepare to claen up etc/passwd (and associated files)?

Regards,
Yann E. MORIN.

> -default:x:1000:1000:Default non-root user:/home/default:/bin/sh
> diff --git a/system/skeleton/etc/shadow b/system/skeleton/etc/shadow
> index 67b67c1..d5734d7 100644
> --- a/system/skeleton/etc/shadow
> +++ b/system/skeleton/etc/shadow
> @@ -10,4 +10,3 @@ uucp:*:10933:0:99999:7:::
>  operator:*:10933:0:99999:7:::
>  ftp:*:10933:0:99999:7:::
>  nobody:*:10933:0:99999:7:::
> -default::10933:0:99999:7:::
> -- 
> 2.0.0.rc2
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
