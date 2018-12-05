From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Dec 2018 22:55:42 +0100
Subject: [Buildroot] [PATCH 2/2] system cfg: remove passwd MD5 format
In-Reply-To: <1544027592-35204-2-git-send-email-matthew.weber@rockwellcollins.com>
References: <1544027592-35204-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1544027592-35204-2-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20181205215542.GB2561@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matt, All,

On 2018-12-05 10:33 -0600, Matt Weber spake thusly:
> As SHA256 is now default, removing weak MD5 option.  C libraries now
> all support the SHA methods.
>     glibc 2.7+
>     uclibc (bdd8362a88 package/uclibc: defconfig: enable sha-256...)
>     musl 1.1.14+
> 
> One issue this would prevent is a host tool issue with a FIPS enabled
> system where weak ciphers/methods are disabled. The crypt(3) call
> checks /proc/sys/crypto/fips_enabled and would result in mkpasswd
> returning "crypt failed."  Rather then create a host dependency check
> this patch removes the potential issue.
> 
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  Config.in.legacy |  8 ++++++++
>  system/Config.in | 10 ----------
>  2 files changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 02321c8..d70654c 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -143,6 +143,14 @@ comment "----------------------------------------------------"
>  endif
>  
>  ###############################################################################
> +
> +config BR2_TARGET_GENERIC_PASSWD_MD5
> +	bool "target passwd md5 format support has been removed"
> +	select BR2_LEGACY
> +	help
> +	  The default has been moved to SHA256 and all C libraries
> +	  now support that method by default
> +
>  comment "Legacy options removed in 2018.11"
>  
>  config BR2_TARGET_XLOADER
> diff --git a/system/Config.in b/system/Config.in
> index 2123d33..9a87b1b 100644
> --- a/system/Config.in
> +++ b/system/Config.in
> @@ -68,16 +68,6 @@ choice
>  
>  	  Note: this is used at build-time, and *not* at runtime.
>  
> -config BR2_TARGET_GENERIC_PASSWD_MD5
> -	bool "md5"
> -	help
> -	  Use MD5 to encode passwords.
> -
> -	  The default. Wildly available, and pretty good.
> -	  Although pretty strong, MD5 is now an old hash function, and
> -	  suffers from some weaknesses, which makes it susceptible to
> -	  brute-force attacks.
> -
>  config BR2_TARGET_GENERIC_PASSWD_SHA256
>  	bool "sha-256"
>  	help
> -- 
> 1.9.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
