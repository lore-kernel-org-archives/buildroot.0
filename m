From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Feb 2015 17:59:51 +0100
Subject: [Buildroot] [PATCHv3 2/5] pkg-generic: add step_pkg_size global
 instrumentation hook
In-Reply-To: <1423171200-24583-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1423171200-24583-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1423171200-24583-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150215165951.GC4211@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-02-05 22:19 +0100, Thomas Petazzoni spake thusly:
> This patch adds a global instrumentation hook that collects the list
> of files installed in $(TARGET_DIR) by each package, and stores this
> list into a file called $(BUILD_DIR)/packages-file-list.txt. It can
> later be used to determine the size contribution of each package to
> the target root filesystem.
> 
> Note that in order to detect if a file installed by one package is
> later overriden by another package, we calculate the md5 of installed
> files and compare them at each installation of a new package.
> 
> This commit also adds a Config.in option to enable the collection of
> this data, as calculating the md5 of all installed files at the
> beginning and end of the installation of each package can be
> considered a time-consuming process which maybe some users will not be
> willing to suffer from.

Well, I'd like to challenge that assertion, so I did a pretty "big" build:
Kodi on the RPi, with all Kodi addons enabled, plus a few additional
usefull packages (connman, dropbear and the likes).

The config has about 148 packages (make show-targets |wc -w), and takes
roughly 1h and 20min on my machine.

Because I did not time md5sum after each package was installed, I simply
timed the md5sum at the end, on a completely-populated target/ . That
gives a pretty good upper-bound of the overhead each package would incur
(i.e. the very first packages would be so much faster as there are far
fewer files installed).

    $ du -hs target/
    247M    target/

    $ find target -type f |wc -l
    5150

    $ tar cf - target/ |wc -c
    242923520

    $ tar cf - target/ |time md5sum
    1d393aaf76ef6a7a462519f4b8b861e7  -
    0.36user 0.03system 0:00.41elapsed 96%CPU (0avgtext+0avgdata 748maxresident)k
    0inputs+0outputs (0major+233minor)pagefaults 0swaps

    $ date '+%s.%N'; \
      find target -type f -print0 2>/dev/null \
      | xargs -0 md5sum >/dev/null 2>&1; \
      date '+%s.%N'
    1424018960.577764719
    1424018960.994814894

So, the overhead of md5sum-ing each file independently (on a cache-hot
target/) is about less than 0.5s (only so-slightly bigger than md5sum-ing
the whole tarball thereof) .

Yes, 0.5s. Half-a-second. ;-)

That would give an upper-bound of the overhead for the whole build
somewhere in the 2-minute range (148*2*0.5). Out of a 1h 20min build.

Yes, md5 is a very fast hash. For reference, hashing a 512MiB blob takes
about less than a second.

I believe this overhead is negligible and we should unconditionally
enable that feature.

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  Config.in              |  9 +++++++++
>  package/pkg-generic.mk | 36 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 45 insertions(+)
> 
> diff --git a/Config.in b/Config.in
> index f5b6c73..58a5085 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -613,6 +613,15 @@ config BR2_COMPILER_PARANOID_UNSAFE_PATH
>  	  toolchain (through gcc and binutils patches) and external
>  	  toolchain backends (through the external toolchain wrapper).
>  
> +config BR2_COLLECT_FILE_SIZE_STATS
> +	bool "collect statistics about installed file size"
> +	help
> +	  Enable this option to let Buildroot collect data about the
> +	  installed files. When this option is enabled, you will be
> +	  able to use the 'size-stats' make target, which will
> +	  generate a graph and CSV files giving statistics about the
> +	  installed size of each file and each package.
> +
>  endmenu
>  
>  endmenu
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 1b09955..db35a87 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -55,6 +55,42 @@ define step_time
>  endef
>  GLOBAL_INSTRUMENTATION_HOOKS += step_time
>  
> +# Hooks to collect statistics about installed files
> +ifeq ($(BR2_COLLECT_FILE_SIZE_STATS),y)
> +
> +# This hook will be called before the target installation of a
> +# package. We store in a file named $(1).filelist_before the list of
> +# files currently installed in the target. Note that the MD5 is also
> +# stored, in order to identify if the files are overwritten.
> +define step_pkg_size_start
> +	(cd $(TARGET_DIR) ; find . -type f -print0 | xargs -0 md5sum) | sort > \
> +		$(BUILD_DIR)/$(1).filelist_before

Why don't you store that in the package's $(@D) ?

I don't really care, but if we're going to use $(BUILD_DIR) to store
temporary files, it might be time we introduce a better location
(probably somthing like BR2_TMP_DIR=$(BUILD_DIR)/.tmp/ )

We alreaduy ahve some temporary stuff written in there, and I find it
ugly (yes, I added some myself!).

Note: not related to your changes, of course, just prompted by them.

> +endef
> +
> +# This hook will be called after the target installation of a
> +# package. We store in a file named $(1).filelist_after the list
> +# of files (and their MD5) currently installed in the target. We then
> +# do a diff with the $(1).filelist_before to compute the list of
> +# files installed by this package.
> +define step_pkg_size_end
> +	(cd $(TARGET_DIR); find . -type f -print0 | xargs -0 md5sum) | sort > \
> +		$(BUILD_DIR)/$(1).filelist_after
> +	comm -13 $(BUILD_DIR)/$(1).filelist_before $(BUILD_DIR)/$(1).filelist_after | \
> +		while read hash file ; do \
> +			echo "$(1),$${file}" >> $(BUILD_DIR)/packages-file-list.txt ; \
> +		done
> +	$(RM) -f $(BUILD_DIR)/$(1).filelist_before \
> +		$(BUILD_DIR)/$(1).filelist_after
> +endef
> +
> +define step_pkg_size
> +	$(if $(filter install-target,$(2)),\
> +		$(if $(filter start,$(1)),$(call step_pkg_size_start,$(3))) \
> +		$(if $(filter end,$(1)),$(call step_pkg_size_end,$(3))))
> +endef

When I introduced the instrumentation hooks, I did not envision they
would be used like that, directly as Makefile code.

What I expected is we would be using scripts (python, shell, whatever!)
somewhere in support/ , that would do their own filtering.

It's pretty fascinating how we all differ in reasoning! :-)

Regards,
Yann E. MORIN.

> +GLOBAL_INSTRUMENTATION_HOOKS += step_pkg_size
> +endif
> +
>  # User-supplied script
>  ifneq ($(BR2_INSTRUMENTATION_SCRIPTS),)
>  define step_user
> -- 
> 2.1.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
