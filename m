From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 May 2020 22:55:50 +0200
Subject: [Buildroot] [PATCH 1/2] package/uboot-tools:
 tools/env/fw_env.h: remove env.h
In-Reply-To: <20200511214744.2749796-1-romain.naour@gmail.com>
References: <20200511214744.2749796-1-romain.naour@gmail.com>
Message-ID: <20200526205550.GH8737@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2020-05-11 23:47 +0200, Romain Naour spake thusly:
> As reported by Nicolas Carrier on the Buildroot mailing list [1],
> there is a new build issue while building a program which interacts with
> the u-boot environment. This program uses the headers of the ubootenv
> library provided by uboot-tools.
> 
> This is an upstream change from uboot [2] adding "#include <env.h>" to
> fw_env.h. Adding env.h require a board configuration to build.
> 
> But only fw_env.h header is installed in the staging directory by
> uboot-tools package, but since it now include env.h the build is broken
> because env.h is missing from the staging directory.
> 
> It's seems an upstream bug since env_set() is not used in fw_env tool.
> Nicolas removed env.h from fw_env tool and fixed it's build issue.
> 
> This problem is present since uboot v2019.10, so the uboot version
> present in Buildroot 2020.02 is affected.
> 
> It's probably not a problem for upstream uboot but it's a problem
> for uboot-tools package that build uboot tools without a board
> configuration for the target.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2020-April/280307.html
> [2] https://gitlab.denx.de/u-boot/u-boot/-/commit/9fb625ce05539fe6876a59ce1dcadb76b33c6f6e
> 
> Reported-by: Nicolas Carrier <nicolas.carrier@orolia.com>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Applied to master, thanks.

I've just added the URL to the upstream commit.

Regards,
Yann E. MORIN.

> ---
>  ...0004-tools-env-fw_env.h-remove-env.h.patch | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 package/uboot-tools/0004-tools-env-fw_env.h-remove-env.h.patch
> 
> diff --git a/package/uboot-tools/0004-tools-env-fw_env.h-remove-env.h.patch b/package/uboot-tools/0004-tools-env-fw_env.h-remove-env.h.patch
> new file mode 100644
> index 0000000000..8175ae139f
> --- /dev/null
> +++ b/package/uboot-tools/0004-tools-env-fw_env.h-remove-env.h.patch
> @@ -0,0 +1,51 @@
> +From 664ef61e19d6261d8984493b5f22127ec2ad44fc Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@gmail.com>
> +Date: Sun, 10 May 2020 23:15:32 +0200
> +Subject: [PATCH] tools/env/fw_env.h: remove env.h
> +
> +As reported by Nicolas Carrier on the Buildroot mailing list [1],
> +there is a new build issue while building a program which interacts with
> +the u-boot environment. This program uses the headers of the ubootenv
> +library provided by uboot-tools.
> +
> +This is an upstream change from uboot [2] adding "#include <env.h>" to
> +fw_env.h. Adding env.h require a board configuration to build.
> +
> +But only fw_env.h header is installed in the staging directory by
> +uboot-tools package, but since it now include env.h the build is broken
> +because env.h is missing from the staging directory.
> +
> +It's seems an upstream bug since env_set() is not used in fw_env tool.
> +
> +Adding env.h is an error since it also include compiler.h (and others
> +uboot internal includes).
> +
> +Nicolas removed env.h from fw_env tool and fixed it's build issue.
> +
> +This problem is present since uboot v2019.10, so the uboot version
> +present in Buildroot 2020.02 is affected.
> +
> +[1] http://lists.busybox.net/pipermail/buildroot/2020-April/280307.html
> +[2] https://gitlab.denx.de/u-boot/u-boot/-/commit/9fb625ce05539fe6876a59ce1dcadb76b33c6f6e
> +
> +Reported-by: Nicolas Carrier <nicolas.carrier@orolia.com>
> +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> +---
> + tools/env/fw_env.h | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/tools/env/fw_env.h b/tools/env/fw_env.h
> +index b60fbfc8f8..78c803c944 100644
> +--- a/tools/env/fw_env.h
> ++++ b/tools/env/fw_env.h
> +@@ -4,7 +4,6 @@
> +  * Wolfgang Denk, DENX Software Engineering, wd at denx.de.
> +  */
> + 
> +-#include <env.h>
> + #include <stdint.h>
> + 
> + /*
> +-- 
> +2.25.4
> +
> -- 
> 2.25.4
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
