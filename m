From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 14:59:52 +0200
Subject: [Buildroot] [PATCH v2] toolchain-ext: rm shared libs for static
 builds
In-Reply-To: <20191026085222.24520-1-matthew.weber@rockwellcollins.com>
References: <20191026085222.24520-1-matthew.weber@rockwellcollins.com>
Message-ID: <20191026145952.237e6016@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 26 Oct 2019 03:52:22 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> +# NOTE: below the readlink call follows/builds each absolute path with any
> +# invalid paths failing (falling out of the list). Thus no checking of paths
> +# existing is required before doing the find. This assumes that GCC returns
> +# at least one directory as a working toolchain should always have search
> +# paths.
> +ifeq ($(BR2_STATIC_LIBS),y)
> +define TOOLCHAIN_EXTERNAL_REMOVE_SHARED_LIBS
> +	$(Q)$(call MESSAGE,"Removing shared libraries from toolchain...")
> +	GCC_LIBRARY_PATHS=`$(TOOLCHAIN_EXTERNAL_CC) -print-search-dirs | sed -r -e '/libraries: =(.+)/!d; s//\1/; s/:/\n/g' | xargs readlink -f | grep -v 'gcc\|/[0-9.]\+$$'` ; \
> +	find $${GCC_LIBRARY_PATHS} -name *.so* -delete

As discussed live during the meeting, this doesn't work for
pre-installed toolchain, because you are removing files directly from
the original toolchain location, which could be read-only. And even if
it's not read-only, we don't want to tamper with the pre-installed
toolchain of the user.

So another solution is needed I'm afraid.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
