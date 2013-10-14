From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Oct 2013 08:58:03 +0200
Subject: [Buildroot] [PATCH 1/1] trace-cmd: use pkg-config instead of
 python-config
In-Reply-To: <525B1E2E.2040209@openwide.fr>
References: <525B1E2E.2040209@openwide.fr>
Message-ID: <20131014085803.4c139478@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Mon, 14 Oct 2013 00:26:54 +0200, Romain Naour wrote:
> 
> Add missing python dependency.
> Makefile use host's python-config, which seems breaks powerpc and arm build.
> Replaces python-config with pkg-config.
> Add pkg-config as dependency.
> 
> Fixes:
> http://autobuild.buildroot.net/results/980/980875810528ac1dee34b8c268d9b3c40b2e35ec/
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Interesting, this looks simpler than what I have done.

> ---
> Note: Makefile use swig which is not available in buildroot.

swig is definitely available, in package/swig/.

> 
>  package/trace-cmd/Config.in                        |  2 ++
>  ...e-use-pkg-config-instead-of-python-config.patch | 34 ++++++++++++++++++++++
>  package/trace-cmd/trace-cmd.mk                     |  2 ++
>  3 files changed, 38 insertions(+)
>  create mode 100644 package/trace-cmd/trace-cmd-0001-Makefile-use-pkg-config-instead-of-python-config.patch
> 
> diff --git a/package/trace-cmd/Config.in b/package/trace-cmd/Config.in
> index 8d79304..96ed63a 100644
> --- a/package/trace-cmd/Config.in
> +++ b/package/trace-cmd/Config.in
> @@ -2,6 +2,8 @@ config BR2_PACKAGE_TRACE_CMD
>  	bool "trace-cmd"
>  	depends on BR2_LARGEFILE
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_PYTHON

No, Python support is optional in trace-cmd. We should keep optional,
by doing:

ifeq ($(BR2_PACKAGE_PYTHON),)
TRACE_CMD_MAKE_FLAGS += -NO_PYTHON=1
else
TRACE_CMD_DEPENDENCIES += python
endif

> +	select BR2_PACKAGE_PKG_CONFIG

No, this is wrong. The pkg-config you're using is not the target
pkg-config, but the host pkg-config. There is no need to add a
Config.in dependency for that.

> diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
> index 7a750f9..cd6ba20 100644
> --- a/package/trace-cmd/trace-cmd.mk
> +++ b/package/trace-cmd/trace-cmd.mk
> @@ -11,6 +11,8 @@ TRACE_CMD_INSTALL_STAGING = YES
>  TRACE_CMD_LICENSE = GPLv2 LGPLv2.1
>  TRACE_CMD_LICENSE_FILES = COPYING COPYING.LIB
> 
> +TRACE_CMD_DEPENDENCIES = python pkg-config

Python dependency should be optional. The pkg-config dependency should
be on host-pkg-config.

See also the patch set I had posted to fix the same issue (in a
different way, which required changing python2 and python3 config
scripts):

  http://patchwork.ozlabs.org/patch/279267/
  http://patchwork.ozlabs.org/patch/279265/
  http://patchwork.ozlabs.org/patch/279269/

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
