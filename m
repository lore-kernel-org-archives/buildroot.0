From: Peter Rosin <peda@lysator.liu.se>
Date: Fri, 20 Nov 2015 06:37:53 +0100
Subject: [Buildroot] [PATCH] openssl: fix race condition when symlink
 shared libs
In-Reply-To: <1447962631-60866-1-git-send-email-ryan.barnett@rockwellcollins.com>
References: <1447962631-60866-1-git-send-email-ryan.barnett@rockwellcollins.com>
Message-ID: <564EB1B1.805@lysator.liu.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ryan,

On 2015-11-19 20:50, Ryan Barnett wrote:
> The build-shared target depends on do_crypto and link-shared, which
> will be executed in parallel. do_crypto calls
> link_a.linux_shared -> link_a.gnu which does SYMLINK_SO; in parallel,
> link-shared calls symlink.linux_shared which also does SYMLINK_SO.
> Before the symlink is created, it is rm'ed, but there is a tiny chance
> that the second one is created after the rm has been called.
>
> Fix this by using 'ln -sf' instead of 'ln -s' so the build doesn't
> error out.
>
> Patch submitted upstream at:
>   https://bugs.gentoo.org/show_bug.cgi?id=566260
>
> Thanks to Arnout for explain the issue (wording used above).
>
> Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
> CC: Arnout Vandecappelle <arnout@mind.be>
> CC: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>
> ---
>
> Note this is a temporary fix until a gentoo maintainer weighs in and
> updates their parallel build patch.
>
> Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
> ---
>  ...ared-fix-race-condition-when-symlinking-s.patch | 45 ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/openssl/0003-makefile.shared-fix-race-condition-when-symlinking-s.patch
>
> diff --git a/package/openssl/0003-makefile.shared-fix-race-condition-when-symlinking-s.patch b/package/openssl/0003-makefile.shared-fix-race-condition-when-symlinking-s.patch
> new file mode 100644
> index 0000000..fd39723
> --- /dev/null
> +++ b/package/openssl/0003-makefile.shared-fix-race-condition-when-symlinking-s.patch
> @@ -0,0 +1,45 @@
> +From bcea66251e8014c12db81ff54f419fe82b6f8527 Mon Sep 17 00:00:00 2001
> +From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
> +Date: Thu, 19 Nov 2015 10:47:00 -0600
> +Subject: [PATCH] makefile.shared: fix race condition when symlinking shared
> + libs
> +
> +The build-shared target depends on do_crypto and link-shared, which
> +will be executed in parallel. do_crypto calls
> +link_a.linux_shared -> link_a.gnu which does SYMLINK_SO; in parallel,
> +link-shared calls symlink.linux_shared which also does SYMLINK_SO.
> +Before the symlink is created, it is rm'ed, but there is a tiny chance
> +that the second one is created after the rm has been called.
> +
> +Fix this race condition by just using ln -sf since it will be the same
> +symlink regards and not cause the build to error out.
> +
> +Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
> +---
> + Makefile.shared | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/Makefile.shared b/Makefile.shared
> +index 8d57163..ce66574 100644
> +--- a/Makefile.shared
> ++++ b/Makefile.shared
> +@@ -118,14 +118,14 @@ SYMLINK_SO=	\
> + 		if [ -n "$$SHLIB_COMPAT" ]; then \
> + 			for x in $$SHLIB_COMPAT; do \
> + 				( $(SET_X); rm -f $$SHLIB$$x$$SHLIB_SUFFIX; \
> +-				  ln -s $$prev $$SHLIB$$x$$SHLIB_SUFFIX ); \
> ++				  ln -sf $$prev $$SHLIB$$x$$SHLIB_SUFFIX ); \

I thought the problem was that the two parties raced, not that the symlink couldn't be
created. Thus, the key part was to replace "rm" with the force flag of ln, so that race
loser does a no-operation instead of (temporarily) clobbering the state for the race
winner. So, you apparently only do half the job in this patch...

> + 				prev=$$SHLIB$$x$$SHLIB_SUFFIX; \
> + 			done; \
> + 		fi; \
> + 		if [ -n "$$SHLIB_SOVER" ]; then \
> + 			[ -e "$$SHLIB$$SHLIB_SUFFIX" ] || \
> + 			( $(SET_X); rm -f $$SHLIB$$SHLIB_SUFFIX; \
> +-			  ln -s $$prev $$SHLIB$$SHLIB_SUFFIX ); \
> ++			  ln -sf $$prev $$SHLIB$$SHLIB_SUFFIX ); \
> + 		fi; \
> + 	fi
> + 
> +-- 
> +1.9.1
> +
Cheers,
Peter
