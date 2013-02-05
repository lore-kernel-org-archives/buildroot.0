From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 05 Feb 2013 21:37:46 +0100
Subject: [Buildroot] [PATCH 2/4] target/generic: add filesystem overlay
	option
In-Reply-To: <228e7c83b0dda1bb7e9ba6748ade0974368b8335.1360084128.git.arnout@mind.be>
 (Arnout Vandecappelle's message of "Tue, 5 Feb 2013 18:16:00 +0100")
References: <cover.1360084128.git.arnout@mind.be>
 <cover.1360084128.git.arnout@mind.be>
 <228e7c83b0dda1bb7e9ba6748ade0974368b8335.1360084128.git.arnout@mind.be>
Message-ID: <874nhqpkdg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 Arnout> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
 Arnout> The filesystem overlay is a tree that is copied over the target fs
 Arnout> after building everything - which is currently usually done in the
 Arnout> post-build script.

 Arnout> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 Arnout> Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
 Arnout> ---
 Arnout> v4: Rebased against master.

 Arnout> v3: keep the custom skeleton documentation

 Arnout> v2: don't deprecate custom skeleton
 Arnout> ---
 Arnout>  Makefile                         |    9 +++++++++
 Arnout>  docs/manual/customize-rootfs.txt |   17 +++++++++++------
 Arnout>  docs/manual/customize-store.txt  |   13 +++++--------
 Arnout>  system/Config.in                 |   11 +++++++++++
 Arnout>  4 files changed, 36 insertions(+), 14 deletions(-)

 Arnout> diff --git a/Makefile b/Makefile
 Arnout> index 6f8ed0e..ac59071 100644
 Arnout> --- a/Makefile
 Arnout> +++ b/Makefile
 Arnout> @@ -501,6 +501,15 @@ endif
 Arnout>  		echo "PRETTY_NAME=\"Buildroot $(BR2_VERSION)\"" \
 Arnout>  	) >  $(TARGET_DIR)/etc/os-release
 
 Arnout> +	@for dir in $(call qstrip,$(BR2_ROOTFS_OVERLAY)); do \
 Arnout> +		if [ -d $${dir} ]; then \
 Arnout> +			$(call MESSAGE,"Copying overlay $${dir}"); \
 Arnout> +			rsync -a \
 Arnout> +				--exclude .svn --exclude .git --exclude .hg --exclude '*~' \
 Arnout> +				$${dir}/ $(TARGET_DIR); \
 Arnout> +		fi \

Similar to the recent discussion about the post-build script, I don't
think we should ignore missing (misspelled?) directories, so I dropped
the -d test and committed, thanks.

-- 
Bye, Peter Korsgaard
