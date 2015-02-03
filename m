From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 10:28:32 +0100
Subject: [Buildroot] [PATCH v6 02/16] package/pkg-rebar: new
 infrastructure
In-Reply-To: <1421055140-5092-3-git-send-email-johan.oudinet@gmail.com>
References: <1421055140-5092-1-git-send-email-johan.oudinet@gmail.com>
 <1421055140-5092-3-git-send-email-johan.oudinet@gmail.com>
Message-ID: <20150203102832.51cb4f7d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Johan Oudinet,

On Mon, 12 Jan 2015 10:32:06 +0100, Johan Oudinet wrote:
> Ease the development of packages that use the erlang rebar tool as
> their build system.
> 
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
> [yann.morin.1998 at free.fr: split the patch into semantically separated
> patches; large rewrites of the rest]
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

On this patch (the most important one, obviously), we did a number of
changes:

    [Thomas, with help from Yann and Arnout:
     - Fix the comment about the symlink used to make sure rebar does not
       download dependencies. The comment was not up-to-date with where
       the symlink is actually created.
     - Make <pkg>_USE_BUNDLED_REBAR and <pkg>_USE_AUTOCONF be inherited by
       host packages from their corresponding target package.
     - Make sure host dependencies are inherited from the corresponding
       target packages dependencies. This requires copying some logic from
       inner-autotools-package and inner-generic-package, just like
       inner-autotools-package duplicates some logic from
       inner-generic-package.
     - Fix host variant of $(2)_BUILD_CMDS indentation, use double quotes
       instead of simple quotes. So that it matches the target
       $(2)_BUILD_CMDS, and what we do elsewhere in Buildroot.]

See some questions below.


> +# Directories to store rebar dependencies in.
> +#
> +# These directories actually only contain symbolic links to Erlang
> +# applications in either $(HOST_DIR) or $(STAGING_DIR).  One needs
> +# them to avoid rebar complaining about missing dependencies, as this
> +# infrastructure tells rebar to NOT download dependencies during
> +# the build stage.
> +#
> +REBAR_HOST_DEPS_DIR = $(HOST_DIR)/usr/share/rebar/deps
> +REBAR_TARGET_DEPS_DIR = $(STAGING_DIR)/usr/share/rebar/deps

Rather than having those paths, why don't we point directly rebar at
$(STAGING_DIR)/usr/lib/erlang/lib/ ? This directory already contains
<erlang-app>-<version> directory for each package, and we would only
have to create a symlink <erlang-app> --> <erlang-app>-<version>.

But maybe it's cleaner to have something completely separate, I don't know.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
