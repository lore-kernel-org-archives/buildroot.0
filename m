From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 7 Feb 2014 23:29:38 +0100
Subject: [Buildroot] [PATCH 4/4] samba4: new package
In-Reply-To: <1391806354-32698-5-git-send-email-gustavo@zacarias.com.ar>
References: <1391806354-32698-1-git-send-email-gustavo@zacarias.com.ar>
 <1391806354-32698-5-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <CAHXCMM+20-NKLye=6rhg1p2toLjSsY-KkOWu+fQTUVucwJ8UPw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

It would be great if you could repeat here some of the explanations about samba4
given in the cover letter, so they will appear in the commit log.

On Fri, Feb 7, 2014 at 9:52 PM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/samba/Config.in                            |  19 ++++
>  package/samba/samba4/S91smb                        |  56 +++++++++++
>  package/samba/samba4/arm-cache.txt                 |  65 ++++++++++++
>  package/samba/samba4/powerpc-cache.txt             |  65 ++++++++++++
>  ...-0001-build-don-t-execute-tests-summary.c.patch |  67 +++++++++++++
>  ...ld-don-t-execute-statfs-and-f_fsid-checks.patch |  31 ++++++
>  ...003-build-find-FILE_OFFSET_BITS-via-array.patch |  54 ++++++++++
>  ...uild-allow-some-python-variable-overrides.patch |  45 +++++++++
>  ...amba4-0005-builtin-heimdal-external-tools.patch |  42 ++++++++
>  package/samba/samba4/samba4.mk                     | 111 +++++++++++++++++++++
>  10 files changed, 555 insertions(+)
>  create mode 100644 package/samba/samba4/S91smb
>  create mode 100644 package/samba/samba4/arm-cache.txt
>  create mode 100644 package/samba/samba4/powerpc-cache.txt
>  create mode 100644 package/samba/samba4/samba4-0001-build-don-t-execute-tests-summary.c.patch
>  create mode 100644 package/samba/samba4/samba4-0002-build-don-t-execute-statfs-and-f_fsid-checks.patch
>  create mode 100644 package/samba/samba4/samba4-0003-build-find-FILE_OFFSET_BITS-via-array.patch
>  create mode 100644 package/samba/samba4/samba4-0004-build-allow-some-python-variable-overrides.patch
>  create mode 100644 package/samba/samba4/samba4-0005-builtin-heimdal-external-tools.patch
>  create mode 100644 package/samba/samba4/samba4.mk
>
> diff --git a/package/samba/Config.in b/package/samba/Config.in
> index d11401f..e037dd9 100644
> --- a/package/samba/Config.in
> +++ b/package/samba/Config.in
> @@ -25,8 +25,27 @@ choice
>         help
>           The well-tested legacy branch.
>
> +       config BR2_PACKAGE_SAMBA4
> +       bool "4.1.x"

Indentation is weird here, no?

> +       depends on BR2_INET_IPV6
> +       depends on BR2_USE_WCHAR # e2fsprogs
> +       depends on BR2_LARGEFILE

Does not samba4 depend on !BR2_PREFER_STATIC_LIB too?
Last time I try to build/link statically a waf project (libtalloc
which is under the
samba umbrella IIRC), it was impossible because of waf build-system. :-/

> +       # Supported architectures only limited by the cached answers
> +       depends on BR2_arm || BR2_powerpc
> +       select BR2_PACKAGE_E2FSPROGS
> +       select BR2_PACKAGE_POPT
> +       select BR2_PACKAGE_PYTHON
> +       select BR2_PACKAGE_ZLIB
> +       help
> +         The new branch with support for the SMB3 protocol.
> +
>  endchoice
>
>  endif
>
>  source "package/samba/samba3/Config.in"
> +
> +comment "samba4 needs a toolchain w/ IPv6, wchar, largfile, threads"
> +       depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_LARGEFILE || \
> +               !BR2_USE_WCHAR || !BR2_INET_IPV6
> +       depends on BR2_USE_MMU

[...]

Regards,


-- 
Samuel
