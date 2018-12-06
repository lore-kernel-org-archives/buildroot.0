From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 5 Dec 2018 19:08:28 -0600
Subject: [Buildroot] [PATCH 2/2] system cfg: remove passwd MD5 format
In-Reply-To: <1544027592-35204-2-git-send-email-matthew.weber@rockwellcollins.com>
References: <1544027592-35204-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1544027592-35204-2-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <CANQCQpbtpsZ-0bwzb7LE0wDKLuRF24wZJ4M+6LpHaNN3AP+1hg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 5, 2018 at 10:33 AM Matt Weber
<matthew.weber@rockwellcollins.com> wrote:
>
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

A little more research has me changing the reasoning a bit.  This
actually makes more sense.  Our host/bin/mkpasswd uses the host
systems PAM "sufficient algorithm" rules when creating the password.
(https://www.stigviewer.com/stig/red_hat_enterprise_linux_6/2016-06-05/finding/V-38574)
 It just so happens the system we were looking at this issue on was
also configured for other FIPS related desired cipher/hashes.

>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
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
> +       bool "target passwd md5 format support has been removed"
> +       select BR2_LEGACY
> +       help
> +         The default has been moved to SHA256 and all C libraries
> +         now support that method by default
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
>           Note: this is used at build-time, and *not* at runtime.
>
> -config BR2_TARGET_GENERIC_PASSWD_MD5
> -       bool "md5"
> -       help
> -         Use MD5 to encode passwords.
> -
> -         The default. Wildly available, and pretty good.
> -         Although pretty strong, MD5 is now an old hash function, and
> -         suffers from some weaknesses, which makes it susceptible to
> -         brute-force attacks.
> -
>  config BR2_TARGET_GENERIC_PASSWD_SHA256
>         bool "sha-256"
>         help
> --
> 1.9.1
>


-- 

Matthew Weber | Pr. Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.
