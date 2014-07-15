From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 22:54:15 +0200
Subject: [Buildroot] [PATCH] Add target-clean makefile target
In-Reply-To: <1403778551-31435-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1403778551-31435-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20140715225415.08f5a5a6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Angelo Compagnucci,

On Thu, 26 Jun 2014 12:29:11 +0200, Angelo Compagnucci wrote:
> This makefile target wipes the target folder and forces buildroot into rebuild it.
> It's useful when you have changed the list of packages and the target
> tree remains out of sync keeping old installed packages no longer needed.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
> ---
>  Makefile | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 14fca2b..83dceb7 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -835,6 +835,11 @@ clean:
>  		$(BUILD_DIR) $(BASE_DIR)/staging \
>  		$(LEGAL_INFO_DIR)
>  
> +target-clean:
> +	rm -rf $(TARGET_DIR)
> +	find $(BUILD_DIR) -name ".stamp_target_installed" -exec rm {} \;
> +	rm $(BUILD_DIR)/.root
> +
>  distclean: clean
>  ifeq ($(DL_DIR),$(TOPDIR)/dl)
>  	rm -rf $(DL_DIR)
> @@ -848,6 +853,7 @@ help:
>  	@echo 'Cleaning:'
>  	@echo '  clean                  - delete all files created by build'
>  	@echo '  distclean              - delete all non-source files (including .config)'
> +	@echo '  target-clean           - delete all target files and forces reinstall'
>  	@echo
>  	@echo 'Build:'
>  	@echo '  all                    - make world'

Thanks for this patch. However, until now, we've always rejected
similar patches, because they are potentially dangerous for users.
Users might be lead to think that they can do some changes in
"menuconfig", then do "make target-clean all" and get the updated
rootfs without rebuilding everything. This is obviously completely
wrong if the configuration of some packages is changed, if some
libraries are added/removed from the build, etc.

Therefore, I'm tempted to also reject this patch, but I'll wait for
other Buildroot developers to give their opinion.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
