From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 22 Jul 2013 00:09:49 +0200
Subject: [Buildroot] [PATCH 1 of 3] linux: add support for custom
	Mercurial repository
In-Reply-To: <301f1051caabe2cf9f48.1374233232@BEANTN0L019720> (Thomas De
 Schampheleire's message of "Fri, 19 Jul 2013 13:27:12 +0200")
References: <patchbomb.1374233231@BEANTN0L019720>
 <301f1051caabe2cf9f48.1374233232@BEANTN0L019720>
Message-ID: <87y58zr2du.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> writes:

 Thomas> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
 Thomas> ---
 Thomas>  linux/Config.in |  27 ++++++++++++++++++---------
 Thomas>  linux/linux.mk  |   5 ++++-
 Thomas>  2 files changed, 22 insertions(+), 10 deletions(-)

 Thomas> diff --git a/linux/Config.in b/linux/Config.in
 Thomas> --- a/linux/Config.in
 Thomas> +++ b/linux/Config.in
 Thomas> @@ -52,6 +52,12 @@ config BR2_LINUX_KERNEL_CUSTOM_GIT
 Thomas>  	  This option allows Buildroot to get the Linux kernel source
 Thomas>  	  code from a Git repository.
 
 Thomas> +config BR2_LINUX_KERNEL_CUSTOM_HG
 Thomas> +	bool "Custom Mercurial repository"
 Thomas> +	help
 Thomas> +	  This option allows Buildroot to get the Linux kernel source
 Thomas> +	  code from a Mercurial repository.
 Thomas> +
 Thomas>  endchoice
 
 Thomas>  config BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE
 Thomas> @@ -62,25 +68,28 @@ config BR2_LINUX_KERNEL_CUSTOM_TARBALL_L
 Thomas>  	string "URL of custom kernel tarball"
 Thomas>  	depends on BR2_LINUX_KERNEL_CUSTOM_TARBALL
 
 Thomas> -config BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL
 Thomas> -	string "URL of custom Git repository"
 Thomas> -	depends on BR2_LINUX_KERNEL_CUSTOM_GIT
 Thomas> +if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG
 
 Thomas> -config BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION
 Thomas> -	string "Custom Git version"
 Thomas> -	default "HEAD"
 Thomas> -	depends on BR2_LINUX_KERNEL_CUSTOM_GIT

Please add Config.in.legacy entries for these.

 Thomas> +config BR2_LINUX_KERNEL_CUSTOM_REPO_URL
 Thomas> +	string "URL of custom repository"
 Thomas> +
 Thomas> +config BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION
 Thomas> +	string "Custom repository version"
 Thomas> +	default "HEAD" if BR2_LINUX_KERNEL_CUSTOM_GIT
 Thomas> +	default "tip" if BR2_LINUX_KERNEL_CUSTOM_HG

I know we had this already for git, but these are not really good
defaults as buildroot will only download these once and not update the
tarballs even though HEAD/tip changes - So I think we should just
default to "".

-- 
Bye, Peter Korsgaard
