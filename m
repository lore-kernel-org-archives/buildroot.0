From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 9 Sep 2020 00:29:28 +0200
Subject: [Buildroot] [PATCH 2020.02.x v2 4/4] package/systemd: Backport
 fix for makefs
In-Reply-To: <20200908221256.126984-4-brandon.maier@rockwellcollins.com>
References: <20200908221256.126984-1-brandon.maier@rockwellcollins.com>
 <20200908221256.126984-4-brandon.maier@rockwellcollins.com>
Message-ID: <20200908222928.GL14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brandon, All,

On 2020-09-08 17:12 -0500, Brandon Maier spake thusly:
> The systemd fstab option "x-systemd.makefs" will fail to work, and throw
> an error that it can't find a device named "" (an empty string).
> Backport this fix from systemd v245.
> 
> Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
> ---
> v2:
> - Add "backport from" and SoB

Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

>  ...0004-makefs-strdup-arguments-to-mkfs.patch | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 package/systemd/0004-makefs-strdup-arguments-to-mkfs.patch
> 
> diff --git a/package/systemd/0004-makefs-strdup-arguments-to-mkfs.patch b/package/systemd/0004-makefs-strdup-arguments-to-mkfs.patch
> new file mode 100644
> index 0000000000..140d741f63
> --- /dev/null
> +++ b/package/systemd/0004-makefs-strdup-arguments-to-mkfs.patch
> @@ -0,0 +1,48 @@
> +From c315b79fb43a4d921a533ba0c2cb303324887993 Mon Sep 17 00:00:00 2001
> +From: Oliver Giles <ohw.giles@gmail.com>
> +Date: Thu, 13 Feb 2020 08:55:57 +0200
> +Subject: [PATCH] makefs: strdup arguments to mkfs
> +
> +Don't pass values from argv[] directly to child process forked using
> +safe_fork, because it clears argv[]. strdup them first.
> +
> +[Brandon: backport from https://github.com/systemd/systemd/commit/c315b79fb43a4d921a533ba0c2cb303324887993]
> +Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
> +---
> + src/partition/makefs.c | 13 +++++++++----
> + 1 file changed, 9 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/partition/makefs.c b/src/partition/makefs.c
> +index 951989cbb6..d73d67c4e8 100644
> +--- a/src/partition/makefs.c
> ++++ b/src/partition/makefs.c
> +@@ -41,8 +41,7 @@ static int makefs(const char *type, const char *device) {
> + }
> + 
> + static int run(int argc, char *argv[]) {
> +-        const char *device, *type;
> +-        _cleanup_free_ char *detected = NULL;
> ++        _cleanup_free_ char *device = NULL, *type = NULL, *detected = NULL;
> +         struct stat st;
> +         int r;
> + 
> +@@ -52,8 +51,14 @@ static int run(int argc, char *argv[]) {
> +                 return log_error_errno(SYNTHETIC_ERRNO(EINVAL),
> +                                        "This program expects two arguments.");
> + 
> +-        type = argv[1];
> +-        device = argv[2];
> ++        /* type and device must be copied because makefs calls safe_fork, which clears argv[] */
> ++        type = strdup(argv[1]);
> ++        if (!type)
> ++                return -ENOMEM;
> ++
> ++        device = strdup(argv[2]);
> ++        if (!device)
> ++                return -ENOMEM;
> + 
> +         if (stat(device, &st) < 0)
> +                 return log_error_errno(errno, "Failed to stat \"%s\": %m", device);
> +-- 
> +2.23.0
> +
> -- 
> 2.28.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
