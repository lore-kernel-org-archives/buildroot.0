From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 25 Jun 2020 22:27:18 +0200
Subject: [Buildroot] [PATCH] packages/pkg-download.mk: fix file locking
 over NFS
In-Reply-To: <1993147260.30143.1593108698133.JavaMail.zimbra@savoirfairelinux.com>
References: <1993147260.30143.1593108698133.JavaMail.zimbra@savoirfairelinux.com>
Message-ID: <20200625202718.GO20645@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxim, All,

On 2020-06-25 14:11 -0400, Maxim Cournoyer spake thusly:
> The attached patch fixes the NFS lock mechanism not working.

You should talk to your Savoir-faire Linux colleagues: they manage to
send patches to the list.

> Tested using NFS 4.2 and multiple build machines caching the same source artifacts in parallel to an empty NFS directory.
> 
> Thank you,
> 
> Maxim

> From 0f2dcace04d7c386b25888a4c851feddd187588f Mon Sep 17 00:00:00 2001
> From: Maxim Cournoyer <maxim.cournoyer@savoirfairelinux.com>
> Date: Thu, 4 Jun 2020 16:14:26 -0400
> Subject: [PATCH] packages/pkg-download.mk: fix file locking over NFS
> 
> BSD style locks such as implemented by flock are translated to POSIX
> advisory file locks (implemented by the fcntl system call on Linux).  It
> is not possible to lock a directory using POSIX advisory file locks.
> Hence, the lock strategy used by Buildroot doesn't work when used over
> NFS.
> 
> Using flock on a simple file works correctly though, so use a '.lock'
> file inside the download directory instead.
> 
> Tested using NFS v4.2 and Linux 5.4.43.
> 
> Signed-off-by: Maxim Cournoyer <maxim.cournoyer@savoirfairelinux.com>

I've added a blurb about the creation of the lock file when it is
missing, and applied to master. Thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pkg-download.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-download.mk b/package/pkg-download.mk
> index de619ba90a..951d2fb554 100644
> --- a/package/pkg-download.mk
> +++ b/package/pkg-download.mk
> @@ -99,7 +99,7 @@ endif
>  
>  define DOWNLOAD
>  	$(Q)mkdir -p $($(2)_DL_DIR)
> -	$(Q)$(EXTRA_ENV) flock $($(2)_DL_DIR)/ $(DL_WRAPPER) \
> +	$(Q)$(EXTRA_ENV) flock $($(2)_DL_DIR)/.lock $(DL_WRAPPER) \
>  		-c '$($(2)_DL_VERSION)' \
>  		-d '$($(2)_DL_DIR)' \
>  		-D '$(DL_DIR)' \
> -- 
> 2.26.2
> 

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
