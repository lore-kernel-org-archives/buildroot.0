From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 28 Oct 2019 04:11:35 -0500
Subject: [Buildroot] [PATCH 1/1] package/jitterentropy-library: fix
 build without ssp
In-Reply-To: <20191028090251.4027-1-fontaine.fabrice@gmail.com>
References: <20191028090251.4027-1-fontaine.fabrice@gmail.com>
Message-ID: <CANQCQpbVpcideLC4_2hMuWBfFAhfhBucTKa+LO_8nafuY4JxjA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice,

On Mon, Oct 28, 2019 at 4:02 AM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> Fixes:
>  - http://autobuild.buildroot.net/results/cba1ae830c7a4d1740098fe67aec59b4dc2f9a03
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Tested-by: Matt Weber <matthew.weber@rockwellcollins.com>

> ---
>  ...-the-user-to-disable-stack-protector.patch | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/jitterentropy-library/0003-Makefile-allow-the-user-to-disable-stack-protector.patch
>
> diff --git a/package/jitterentropy-library/0003-Makefile-allow-the-user-to-disable-stack-protector.patch b/package/jitterentropy-library/0003-Makefile-allow-the-user-to-disable-stack-protector.patch
> new file mode 100644
> index 0000000000..c8ab93122d
> --- /dev/null
> +++ b/package/jitterentropy-library/0003-Makefile-allow-the-user-to-disable-stack-protector.patch
> @@ -0,0 +1,36 @@
> +From 37e8a6a7e5875e20a8de07fbfbb69912f1964f7d Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Mon, 28 Oct 2019 09:47:49 +0100
> +Subject: [PATCH] Makefile: allow the user to disable stack protector
> +
> +Allow the user to disable stack-protector by overriding CFLAGS as it is
> +not supported by all toolchains
> +
> +Fixes:
> + - http://autobuild.buildroot.net/results/cba1ae830c7a4d1740098fe67aec59b4dc2f9a03
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: not sent yet]
> +---
> + Makefile | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 41bc4f7..b0f20e2 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -1,9 +1,9 @@
> + # Compile Noise Source as user space application
> +
> + CC ?= gcc
> +-CFLAGS +=-Wextra -Wall -pedantic -fPIC -O0
> + #Hardening
> +-CFLAGS +=-fstack-protector-all -fwrapv --param ssp-buffer-size=4
> ++CFLAGS ?=-fstack-protector-all --param ssp-buffer-size=4

One thing I do wonder is if we should be setting -fno-stack-protector
as well when we don't support it.  It wouldn't have fixed this case
but possibly others our flags might append and take precedence.

Regards,
Matt
