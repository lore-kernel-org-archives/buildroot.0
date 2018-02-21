From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Feb 2018 22:50:10 +0100
Subject: [Buildroot] [PATCH-FOR-NEXT v1 3/6] pkgconf: add
 host-pkg-config wrapper
In-Reply-To: <20180221142801.28997-4-gael.portay@savoirfairelinux.com>
References: <20180221142801.28997-1-gael.portay@savoirfairelinux.com>
 <20180221142801.28997-4-gael.portay@savoirfairelinux.com>
Message-ID: <20180221225010.4b4228aa@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

+Peter, Yann, Arnout, there's a question below about a small change but
has a big impact.

On Wed, 21 Feb 2018 09:27:58 -0500, Ga?l PORTAY wrote:
> The host-pkg-config wrapper gets package data compiled for host.
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---
>  package/pkgconf/host-pkg-config | 4 ++++
>  package/pkgconf/pkgconf.mk      | 6 ++++--
>  2 files changed, 8 insertions(+), 2 deletions(-)
>  create mode 100644 package/pkgconf/host-pkg-config
> 
> diff --git a/package/pkgconf/host-pkg-config b/package/pkgconf/host-pkg-config
> new file mode 100644
> index 0000000000..3362a3f927
> --- /dev/null
> +++ b/package/pkgconf/host-pkg-config
> @@ -0,0 +1,4 @@
> +#!/bin/sh
> +PKGCONFDIR=$(dirname "$0")
> +DEFAULT_PKG_CONFIG_PATH=${PKGCONFDIR}/../lib/pkgconfig:${PKGCONFDIR}/../share/pkgconfig
> +PKG_CONFIG_PATH=${PKG_CONFIG_PATH:-${DEFAULT_PKG_CONFIG_PATH}} exec ${PKGCONFDIR}/pkgconf "$@"

I've been thinking about this for a while, and I remember having a
discussion about this with some other Buildroot developer a while ago.
I think the most correct thing to do would be:

 $(HOST_DIR)/bin/pkg-config returns results valid for native compilation

 $(HOST_DIR)/bin/<tuple>-pkg-config returns results valid for cross-compilation

I.e, the current pkg-config wrapper should be renamed
<tuple>-pkg-config, and pkg-config should behave like a normal native
pkg-config, except that it provides results for libraries located in
$(HOST_DIR).

The autoconf PKG_CHECK_MODULES() macro uses PKG_PROG_PKG_CONFIG(),
which internally uses AC_PATH_TOOL(). And AC_PATH_TOOL() will first
search for the program with the host machine tuple, and warn if the
program cannot be found with this tuple. From
https://www.gnu.org/software/autoconf/manual/autoconf-2.68/html_node/Generic-Programs.html:

"""
When cross-compiling, this macro will issue a warning if no program
prefixed with the host type could be found. For more information, see
Specifying Target Triplets. 
"""

I know this change will:

 - Potentially break a number of packages we have in Buildroot, which
   directly use pkg-config without first trying to use
   <tuple>-pkg-config

 - Potentially break a number of downstream users who are using
   pkg-config.

However:

 - It would solve that once you add $(HOST_DIR)/bin to your PATH, you
   cannot anymore do native builds because "pkg-config" returns results
   that are not relevant for native builds. I already saw a number of
   people affected by this.

 - It would comply with the standard autoconf expectations.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
