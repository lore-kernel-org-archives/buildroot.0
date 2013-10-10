From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 10 Oct 2013 09:59:46 +0200
Subject: [Buildroot] [PATCH v3] ccache: expose control interface via
	'make ccache-options'
In-Reply-To: <1381339099-3666-1-git-send-email-tjlee@ambarella.com>
References: <5253AA39.1090908@mind.be>
 <1381339099-3666-1-git-send-email-tjlee@ambarella.com>
Message-ID: <CAAXf6LWg8YGG-yv3dvZjqswagBOMV8gmT1XsWz4KOygEbFUtGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Tzu-Jung,

On Wed, Oct 9, 2013 at 7:18 PM, Tzu-Jung Lee <roylee17@gmail.com> wrote:
> usage:
>         # set cache limit size
>         make CCACHE_OPTIONS="--max-size=5G" ccache-options
>
>         # zero statistics counters
>         make CCACHE_OPTIONS="--zero-stats" ccache-options
>
> Signed-off-by: Tzu-Jung Lee <tjlee@ambarella.com>
> ---
> Fix a typo of manual in v2
>
>  docs/manual/ccache-support.txt | 11 +++++++++++
>  package/ccache/ccache.mk       |  5 +++++
>  2 files changed, 16 insertions(+)
>
> diff --git a/docs/manual/ccache-support.txt b/docs/manual/ccache-support.txt
> index 4969180..fe06a01 100644
> --- a/docs/manual/ccache-support.txt
> +++ b/docs/manual/ccache-support.txt
> @@ -23,3 +23,14 @@ remove this directory.
>
>  You can get statistics on the cache (its size, number of hits,
>  misses, etc.) by running +make ccache-stats+.
> +
> +The make target +ccache-options+ and the +CCACHE_OPTIONS+ variable
> +provide more generic access to the ccache. For example
> +
> +-----------------
> +# set cache limit size
> +make CCACHE_OPTIONS="--max-size=5G" ccache-options
> +
> +# zero statistics counters
> +make CCACHE_OPTIONS="--zero-stats" ccache-options
> +-----------------
> diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
> index c5e9385..663a959 100644
> --- a/package/ccache/ccache.mk
> +++ b/package/ccache/ccache.mk
> @@ -45,3 +45,8 @@ ifeq ($(BR2_CCACHE),y)
>  ccache-stats: host-ccache
>         $(Q)$(CCACHE) -s
>  endif
> +
> +ifeq ($(BR2_CCACHE),y)
> +ccache-options: host-ccache
> +       $(Q)$(CCACHE) $(CCACHE_OPTIONS)
> +endif

I think this 'ifeq' block can be merged with the previous one
containing ccache-stats.

Also, while testing I noticed the following: if you do not specify
CCACHE_OPTIONS, ccache gives its help message, but it is unclear to
the user that he should put those options in CCACHE_OPTIONS. Assume
someone knows there is a make target ccache-options but did not read
the manual.
Therefore, I would suggest to add a check inside the ccache-options
recipe for a non-empty CCACHE_OPTIONS and give a warning message.
Something like:

diff --git a/package/ccache/ccache.mk b/package/ccache/ccache.mk
--- a/package/ccache/ccache.mk
+++ b/package/ccache/ccache.mk
@@ -48,5 +48,11 @@ endif

 ifeq ($(BR2_CCACHE),y)
 ccache-options: host-ccache
+ifeq ($(CCACHE_OPTIONS),)
+       $(Q)echo "Usage: make ccache-options CCACHE_OPTIONS=\"opts\""
+       $(Q)echo "where 'opts' corresponds to one or more valid ccache
options" \
+               "(see ccache help text below)"
+       $(Q)echo
+endif
        $(Q)$(CCACHE) $(CCACHE_OPTIONS)
 endif

This makes the output:

$ make ccache-options
Usage: make ccache-options CCACHE_OPTIONS="opts"
where 'opts' corresponds to one or more valid ccache options (see
ccache help text below)

Usage:
    ccache [options]
    ccache compiler [compiler options]
    compiler [compiler options]          (via symbolic link)

Options:
    -c, --cleanup         delete old files and recalculate size counters
                          (normally not needed as this is done automatically)
    -C, --clear           clear the cache completely
    -F, --max-files=N     set maximum number of files in cache to N (use 0 for
                          no limit)
    -M, --max-size=SIZE   set maximum size of cache to SIZE (use 0 for no
                          limit; available suffixes: G, M and K; default
                          suffix: G)
    -s, --show-stats      show statistics summary
    -z, --zero-stats      zero statistics counters

    -h, --help            print this help text
    -V, --version         print version and copyright information

See also <http://ccache.samba.org>.
make: *** [ccache-options] Error 1


Best regards,
Thomas
