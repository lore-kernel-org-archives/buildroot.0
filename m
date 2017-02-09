From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Feb 2017 23:24:29 +0100
Subject: [Buildroot] [PATCH 3/6] infra: fix 'packages-file-list.txt'
 with TLP
In-Reply-To: <20161114132238.6569-4-jezz@sysmic.org>
References: <20161114132238.6569-1-jezz@sysmic.org>
 <20161114132238.6569-4-jezz@sysmic.org>
Message-ID: <20170209232429.0c133424@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Adding Gustavo in Cc. Gustavo, you are working on TLP support. Could
you comment on the below patch?

See also my comments below.

On Mon, 14 Nov 2016 14:22:35 +0100, J?r?me Pouiller wrote:
> Until now, `$(BUILD_DIR)/packages-file-list.txt' was not filled properly when
> top level parallelization is enabled. Therefore, all scripts that rely on
> packages-file-list.txt did not work.
> 
> In order to fix it,this patch place target installation task in a critical
> section.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/pkg-generic.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 987efa6..c5f70e0 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -62,6 +62,9 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
>  # files currently installed in the target. Note that the MD5 is also
>  # stored, in order to identify if the files are overwritten.
>  define step_pkg_size_start
> +	while ! flock $(BUILD_DIR) -c "[ ! -e $(BUILD_DIR)/.target_lock ] && touch $(BUILD_DIR)/.target_lock"; do \
> +		sleep 0.5; \
> +	done

I personally don't really like this retry loop around flock, but since
package-file-list.txt is a global file, I don't really see how to do
otherwise. Unless storing a per-package file with just the time/date of
the start/end of each step for this package, and then have a
post-processing logic at the very end of the build that regroups all
those per-package files into a single global file, ordering the entries
by their timestamp. Don't know if it's really better.


>  	(cd $(TARGET_DIR) ; find . -type f -print0 | xargs -0 md5sum) | sort > \
>  		$($(PKG)_DIR)/.br_filelist_before
>  endef
> @@ -78,6 +81,7 @@ define step_pkg_size_end
>  		while read hash file ; do \
>  			echo "$(1),$${file}" >> $(BUILD_DIR)/packages-file-list.txt ; \
>  		done
> +	rm $(BUILD_DIR)/.target_lock
>  endef
>  
>  define step_pkg_size

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
