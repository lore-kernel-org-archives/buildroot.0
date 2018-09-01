From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 1 Sep 2018 15:05:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/delve: new package
In-Reply-To: <20180830162807.1721-1-sam@gpsm.co.uk>
References: <20180830162807.1721-1-sam@gpsm.co.uk>
Message-ID: <20180901150549.56db064b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sam,

Thanks for this contribution! A few comments/questions below.

On Thu, 30 Aug 2018 17:28:07 +0100, sam at gpsm.co.uk wrote:
> From: Sam Lancia <sam@gpsm.co.uk>
> 
> Including "Delve", the debugger for Go applications.
> 
> Signed-off-by: Sam Lancia <sam@gpsm.co.uk>

Could you explain a bit how Delve is going to be used in the context of
Buildroot. Indeed, you're packaging it as a target package, which means
the delve debugger runs on the target. However, a quick read of
https://github.com/derekparker/delve/blob/master/Documentation/cli/getting_started.md
shows that:

 (1) It needs access to the source code of the Go application being
     debugged. In the context of Buildroot, the code is generally not on
     the target.

 (2) It apparently also builds the application, because it does it in a
     way that makes it more suitable for debugging than a normal build.
     In the context of Buildroot, I don't think we have support for
     having a Go compiler on the target.

With this in mind, could you explain how you are using delve with
Buildroot ?

Besides these fundamental questions, I'm doing a regular review below.
First, you need to add an entry in the DEVELOPERS file for this new
package.

> diff --git a/package/Config.in b/package/Config.in
> index f5a17492c7..dbf609b29d 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -83,6 +83,7 @@ menu "Debugging, profiling and benchmark"
>  	source "package/blktrace/Config.in"
>  	source "package/bonnie/Config.in"
>  	source "package/cache-calibrator/Config.in"
> +        source "package/delve/Config.in"

Obvious indentation problem here.

>  	source "package/dhrystone/Config.in"
>  	source "package/dieharder/Config.in"
>  	source "package/dmalloc/Config.in"
> diff --git a/package/delve/Config.in b/package/delve/Config.in
> new file mode 100644
> index 0000000000..5c6045513c
> --- /dev/null
> +++ b/package/delve/Config.in
> @@ -0,0 +1,18 @@
> +config BR2_PACKAGE_DELVE
> +	bool "delve"
> +	depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
> +	depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	help
> +          Delve is a debugger for the Go programming language.
> +          The goal of the project is to provide a simple, full featured debugging tool for Go.
> +          Delve should be easy to invoke and easy to use.
> +          Chances are if you're using a debugger, things aren't going your way.
> +          With that in mind, Delve should stay out of your way as much as possible.

Lines are too long, please wrap at 72 characters. You can
use ./utils/check-package to verify such coding style issues before
submitting a new version.

> diff --git a/package/delve/delve.hash b/package/delve/delve.hash
> new file mode 100644
> index 0000000000..37fad79c3d
> --- /dev/null
> +++ b/package/delve/delve.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256  de023318accf33ffe7cbb393f5a301551390111db8c0849fe5f4002b6c476583  delve-v1.1.0.tar.gz

Please add the hash of the LICENSE file as well here.

> diff --git a/package/delve/delve.mk b/package/delve/delve.mk
> new file mode 100644
> index 0000000000..d4da282e2a
> --- /dev/null
> +++ b/package/delve/delve.mk
> @@ -0,0 +1,19 @@
> +
> +################################################################################
> +#
> +# delve
> +#
> +################################################################################
> +
> +DELVE_VERSION = v1.1.0
> +DELVE_SITE = $(call github,derekparker,delve,$(DELVE_VERSION))
> +
> +DELVE_LICENSE = MIT
> +DELVE_LICENSE_FILES = LICENSE
> +
> +DELVE_DEPENDENCIES = host-go host-pkgconf

You're using the golang-package infrastructure, so there is no need for
an explicit host-go dependencies: the golang-package infrastructure
adds it for you.

All in all, this looks pretty good. If I didn't had the fundamental
questions mentioned at the beginning of this e-mail, I would have
applied and fixed the minor details. But since I have those questions,
I thought you could also fixup the minor details :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
