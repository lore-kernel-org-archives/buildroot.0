From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 14 Sep 2016 00:57:15 +0200
Subject: [Buildroot] [PATCH 1/2] xen: Disable -Werror when building
In-Reply-To: <1473799504-20372-1-git-send-email-alistair.francis@xilinx.com>
References: <1473799504-20372-1-git-send-email-alistair.francis@xilinx.com>
Message-ID: <55fa8ac2-b998-7729-3d0b-e10f500a870d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-09-16 22:45, Alistair Francis wrote:
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
>  ...1-Remove-hardcoded-strict-Werror-checking.patch | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100644 package/xen/0001-Remove-hardcoded-strict-Werror-checking.patch
> 
> diff --git a/package/xen/0001-Remove-hardcoded-strict-Werror-checking.patch b/package/xen/0001-Remove-hardcoded-strict-Werror-checking.patch
> new file mode 100644
> index 0000000..ca772dd
> --- /dev/null
> +++ b/package/xen/0001-Remove-hardcoded-strict-Werror-checking.patch
> @@ -0,0 +1,26 @@
> +From 234847440a5d3cf95540ea79f7a08d50cccfef73 Mon Sep 17 00:00:00 2001
> +From: Alistair Francis <alistair.francis@xilinx.com>
> +Date: Tue, 13 Sep 2016 10:48:31 -0700
> +Subject: [PATCH] Remove hardcoded strict -Werror checking
> +
> +Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> +---
> + Config.mk | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Config.mk b/Config.mk
> +index bd991c6..e7ac662 100644
> +--- a/Config.mk
> ++++ b/Config.mk
> +@@ -36,7 +36,7 @@ CONFIG_$(XEN_OS) := y
> + SHELL     ?= /bin/sh
> + 
> + # Tools to run on system hosting the build
> +-HOSTCFLAGS  = -Wall -Werror -Wstrict-prototypes -O2 -fomit-frame-pointer
> ++HOSTCFLAGS  = -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer

 I had a quick look, and there are actually roughly 60 instances of this -Werror
spread out over various Makefiles... (It's an autotools package but it looks
like it's not using automake.) Although we probably don't use some of them
(components that don't get build, Makefiles meant for different targets, etc.),
I doubt that removing this one instance is going to be sufficient. But a patch
that changes those 60 instances doesn't sound very attractive either...

 Although, I must admit, the two errors encountered by the autobuilders come
from kconfig which is clearly not -Werror-clean. Perhaps their own code really
_is_ -Werror-clean. So we could start with this patch at least.

 Better still, work with upstream to find a solution.

 Regards,
 Arnout


> + HOSTCFLAGS += -fno-strict-aliasing
> + 
> + DISTDIR     ?= $(XEN_ROOT)/dist
> +-- 
> +2.7.4
> +
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
