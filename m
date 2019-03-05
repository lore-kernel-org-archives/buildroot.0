From: yann.morin at orange.com <yann.morin@orange.com>
Date: Tue, 5 Mar 2019 16:39:02 +0100
Subject: [Buildroot] [PATCH 1/1] core/pkg-infra: Fix package files
 statistics for parallel build
In-Reply-To: <20190305144216.13738-1-anaumann@ultratronik.de>
References: <20190305144216.13738-1-anaumann@ultratronik.de>
Message-ID: <13651_1551800345_5C7E9819_13651_366_1_20190305153902.GH2808@r-lnx-nyma7486-2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andreas, All,

On 2019-03-05 15:42 +0100, Andreas Naumann spake thusly:
> When activating top level parallel build, multiple processes may
> try to modify the various *files-list* files in the common build/
> directory at the same time. This can cause racy build failures.
> 
> The fix here is to use flock to ensure exclusive execution of the
> statistics gathering code. For this to work it is assumed that the
> target/staging/host directories are isolated, which is true for
> per-package builds.
> For standard sequential builds, the locking is of course unnecessary
> but no conditional handling is implemented  since the runtime cost is
> expected to be next to nothing.
> 
> For flock to work, the statistics gathering code must be run in a
> single subshell. Otherwise the lockfile descriptor would be closed
> after the subshell (= the Makefile line where it was opened) ends
> and thus the lock would be released before even entering the critical
> code section.
> 
> Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
> ---
> 
> Notes:
> This patch has been developed on top of Thomas ppsh-v7 branch, rebased
> on master.
> 
> Of course this solution adds a dependency on flock. However flock is
> part of util-linux which probably is a dependency of other buildroot
> prerequisites anyway.

We already use flock in the download infra, so that's OK.

> Also, even though this solution has a somewhat hacky feel to me, it does
> work for both per-package and standard sequential builds. When converting
> to per-package for good, the statistics gathering code could probably
> be simplified because, well, all the files are installed isolated folders
> which contents should be easier to compare before/after.

Well, I was going to suggest just that: create the lists in the
per-package directory, so you won't have the race to begin with.

Then, at the end of the build, when all the target/ directories (ditto
host) are gathere into one, then do so for all the individual package
file lists too.

If, as you seem to suggest, this also simplifies the code, then bonus
point for you! ;-)

Regards,
Yann E. MORIN.

>  package/pkg-generic.mk | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 6d4442b824..0f875736d6 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -64,20 +64,22 @@ GLOBAL_INSTRUMENTATION_HOOKS += step_time
>  # $(3): suffix of file  (optional)
>  define step_pkg_size_inner
>  	@touch $(BUILD_DIR)/.files-list$(3).stat
> -	@touch $(BUILD_DIR)/packages-file-list$(3).txt
> -	$(SED) '/^$(1),/d' $(BUILD_DIR)/packages-file-list$(3).txt
> +	exec 3>$(BUILD_DIR)/packages-file-list$(3).txt; \
> +	flock -x 3; \
> +	$(SED) '/^$(1),/d' $(BUILD_DIR)/packages-file-list$(3).txt; \
>  	cd $(2); \
>  	LC_ALL=C find . \( -type f -o -type l \) -printf '%T@:%i:%#m:%y:%s,%p\n' \
> -		| LC_ALL=C sort > $(BUILD_DIR)/.files-list$(3).new
> +		| LC_ALL=C sort > $(BUILD_DIR)/.files-list$(3).new; \
>  	LC_ALL=C comm -13 \
>  		$(BUILD_DIR)/.files-list$(3).stat \
>  		$(BUILD_DIR)/.files-list$(3).new \
> -		> $($(PKG)_BUILDDIR)/.files-list$(3).txt
> +		> $($(PKG)_BUILDDIR)/.files-list$(3).txt; \
>  	sed -r -e 's/^[^,]+/$(1)/' \
>  		$($(PKG)_BUILDDIR)/.files-list$(3).txt \
> -		>> $(BUILD_DIR)/packages-file-list$(3).txt
> +		>> $(BUILD_DIR)/packages-file-list$(3).txt; \
>  	mv $(BUILD_DIR)/.files-list$(3).new \
> -		$(BUILD_DIR)/.files-list$(3).stat
> +		$(BUILD_DIR)/.files-list$(3).stat; \
> +	exec 3>&-
>  endef
>  
>  define step_pkg_size
> -- 
> 2.21.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
| +33 534.541.179 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
|      yann.morin (at) orange.com      |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
