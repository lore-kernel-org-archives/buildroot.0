From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Date: Wed, 06 Mar 2019 12:57:50 +0100
Subject: [Buildroot] 
 =?iso-8859-1?q?=5Bgit_commit=5D_core/pkg-infra=3A_re?=
 =?iso-8859-1?q?store_completeness_of_packages_files_lists?=
In-Reply-To: <20190208083943.3BB41884AC@busybox.osuosl.org>
References: <20190208083943.3BB41884AC@busybox.osuosl.org>
Message-ID: <6b2a27b3-5bd0-442f-80fb-608c858b9828@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>  package/pkg-generic.mk | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index f5cab2b9c2..6168b40e89 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -63,13 +63,21 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
>  # $(2): base directory to search in
>  # $(3): suffix of file  (optional)
>  define step_pkg_size_inner
> +	@touch $(BUILD_DIR)/.files-list$(3).stat
>  	@touch $(BUILD_DIR)/packages-file-list$(3).txt
>  	$(SED) '/^$(1),/d' $(BUILD_DIR)/packages-file-list$(3).txt
>  	cd $(2); \
> -	find . \( -type f -o -type l \) \
> -		-newer $($(PKG)_DIR)/.stamp_built \
> -		-exec printf '$(1),%s\n' {} + \
> +	LC_ALL=C find . \( -type f -o -type l \) -printf '%T@:%i:%#m:%y:%s,%p\n' \
> +		| LC_ALL=C sort > $(BUILD_DIR)/.files-list$(3).new
> +	LC_ALL=C comm -13 \
> +		$(BUILD_DIR)/.files-list$(3).stat \
> +		$(BUILD_DIR)/.files-list$(3).new \
> +		> $($(PKG)_BUILDDIR)/.files-list$(3).txt
> +	sed -r -e 's/^[^,]+/$(1)/' \
> +		$($(PKG)_BUILDDIR)/.files-list$(3).txt \
>  		>> $(BUILD_DIR)/packages-file-list$(3).txt
> +	mv $(BUILD_DIR)/.files-list$(3).new \
> +		$(BUILD_DIR)/.files-list$(3).stat

This breaks top-level parallel build. Here's an example how it looks when 
it breaks:

2019-03-06T12:50:02 >>> expat 2.2.6 Fixing libtool files
2019-03-06T12:50:02 Making install in gnulib-lib
2019-03-06T12:50:02 /usr/bin/make  install-am
2019-03-06T12:50:02 >>> ethtool 4.19 Installing to target
2019-03-06T12:50:02 
PATH="/home/jkt/work/prog/_build/br-cfb/host/bin:/home/jkt/work/prog/_build/br-cfb/host/sbin:/home/jkt/.local/bin:/home/jkt/bin/:/opt/qtc/bin:/opt/darktable/bin:/home/jkt/
.local/bin:/home/jkt/bin/:/opt/qtc/bin:/opt/darktable/bin:/usr/x86_64-pc-linux-gnu/gcc-bin/8.1.0:/usr/lib/llvm/6/bin:/usr/lib/llvm/4/bin:/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/games/bin" 
 /usr/bin/make  DESTDIR=/home/jkt/work/prog/_build/br-cfb/target install -C 
/home/jkt/work/prog/_build/br-cfb/build/ethtool-4.19/
2019-03-06T12:50:02 /bin/mkdir -p 
'/home/jkt/work/prog/_build/br-cfb/target/usr/sbin'
2019-03-06T12:50:02 /bin/mkdir -p 
'/home/jkt/work/prog/_build/br-cfb/host/lib'
2019-03-06T12:50:02 /bin/sh ../libtool   --mode=install /usr/bin/install -c 
  libgettextlib.la '/home/jkt/work/prog/_build/br-cfb/host/lib'
2019-03-06T12:50:02 /usr/bin/install -c ethtool 
'/home/jkt/work/prog/_build/br-cfb/target/usr/sbin'
2019-03-06T12:50:02 comm: 
/home/jkt/work/prog/_build/br-cfb/build/.files-list-staging.new: No such 
file or directory
2019-03-06T12:50:02 make[1]: *** [package/pkg-generic.mk:287: 
/home/jkt/work/prog/_build/br-cfb/build/expat-2.2.6/.stamp_staging_installed] 
Error 1
2019-03-06T12:50:02 make[1]: *** Waiting for unfinished jobs....

I can't offer much insight into how to best fix this, unfortunately, 
whether to add some locking or whether to make this per-package.

This is just with a patched top-level Makefile to remove the .NOTPARALLEL 
stanza, with no per-package build dire patches atec.

With kind regards,
Jan
