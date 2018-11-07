From: Nicolas Carrier <nicolas.carrier@orolia.com>
Date: Wed, 7 Nov 2018 14:40:39 +0000
Subject: [Buildroot] [PATCH 1/1] Added local directory as source of
 kernel code
In-Reply-To: <CANQCQpb6BYDMXJTDKEXKgpmBG1jHjOt2G1_eDF_cSVbCM=x=nw@mail.gmail.com>
References: <20181107100605.13141-1-nicolas.carrier@orolia.com>,
 <CANQCQpb6BYDMXJTDKEXKgpmBG1jHjOt2G1_eDF_cSVbCM=x=nw@mail.gmail.com>
Message-ID: <PR1PR06MB49557D35D7EB1F1D03DEFDD784C40@PR1PR06MB4955.eurprd06.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have a workspace managed by google repo, which fetches the sources of the external git repositories for which we have created .mk buildroot Makefiles.

Because the sources are cloned by repo, I don't want them to be fetched by buildroot, hence I used "_SITE_METHOD = local" for all the packages.

For linux and u-boot, I can't do that because they dont support the local method and I think there is no reason to make these two packages an exception.

As for modifying the local.mk file to put some LINUX_OVERRIDE_SRCDIR value inside, I want to avoid it because it would force me to version the local.mk file for things to work out-of-the-box. Versionning this file is problematic because developers needing to modify it temporarily may commit it by error.


Is there another solution to achieve what I want ? I found none so far but I may have missed something.

________________________________
From: Matthew Weber <matthew.weber@rockwellcollins.com>
Sent: Wednesday, November 7, 2018 2:57:28 PM
To: Nicolas Carrier
Cc: buildroot; Peter Korsgaard; rafal.fabich at gmail.com
Subject: Re: [Buildroot] [PATCH 1/1] Added local directory as source of kernel code

Nicolas,

On Wed, Nov 7, 2018 at 7:41 AM Nicolas Carrier
<nicolas.carrier@orolia.com> wrote:
>
> From: Rafal Fabich <rafal.fabich@gmail.com>
>
> This patch is a resubmit of commit 73da2ff6f718f2889e3c5024d899f8d58f502863,
> which was reverted by commit e782cd5b1bc231dda527d5d0a04e6a338669b92c in 2016.
>
> This is the original commit message:
>    Add the option to use a local directory as the source for
>    building the Linux kernel, which can be useful during
>    kernel development.
>
> As for the arguments used in the commit message when the patch was reverted:
> * Using _OVERRIDE_SRCDIR is not a good solution since it forces some content in
> local.mk, which should stay a mechanism local to the developer's workspace.

OVERRIDE_SRCDIR seems to work fine for the use cases where I've had a
similar need.  Yann's revert commit description makes sense and
follows the same conclusion of why it was removed.

Please share your use case if you could or why it wouldn't work.

> * Without this patch, the linux kernel has no equivalent to the
> FOO_SITE_METHOD = local variable which is available for almost all the other
> packages.
> * When using packages with _SITE_METHOD = local, an external tool is used to
> retrieve the packages' sources, like a sub-repository mechanism or google repo.
> This tool has the responsibility of the build reproductibility in regard of
> these packages.
> It is the same for a linux kernel using the local method.
>
> Signed-off-by: Rafal Fabich <rafal.fabich@gmail.com>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>
> # Conflicts:
> #       linux/Config.in
>
> Signed-off-by: Nicolas Carrier <nicolas.carrier@orolia.com>
> ---
>  linux/Config.in | 13 +++++++++++++
>  linux/linux.mk  |  3 +++
>  2 files changed, 16 insertions(+)
>
> diff --git a/linux/Config.in b/linux/Config.in
> index ecb12d0b16..e6c5c561b9 100644
> --- a/linux/Config.in
> +++ b/linux/Config.in
> @@ -91,6 +91,12 @@ config BR2_LINUX_KERNEL_CUSTOM_SVN
>           This option allows Buildroot to get the Linux kernel source
>           code from a Subversion repository.
>
> +config BR2_LINUX_KERNEL_CUSTOM_LOCAL
> +       bool "Local directory"
> +       help
> +         This option allows Buildroot to get the Linux kernel source
> +         code from a local directory.
> +
>  endchoice
>
>  config BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE
> @@ -118,6 +124,12 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION
>
>  endif
>
> +config BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH
> +       string "Path to the local directory"
> +       depends on BR2_LINUX_KERNEL_CUSTOM_LOCAL
> +       help
> +         Path to the local directory with the Linux kernel source code.
> +
>  config BR2_LINUX_KERNEL_VERSION
>         string
>         default "4.18.14" if BR2_LINUX_KERNEL_LATEST_VERSION
> @@ -127,6 +139,7 @@ config BR2_LINUX_KERNEL_VERSION
>         default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
>         default BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION \
>                 if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG || BR2_LINUX_KERNEL_CUSTOM_SVN
> +       default "custom" if BR2_LINUX_KERNEL_CUSTOM_LOCAL
>
>  #
>  # Patch selection
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 476ff16329..c47c792926 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -20,6 +20,9 @@ ifeq ($(BR2_LINUX_KERNEL_CUSTOM_TARBALL),y)
>  LINUX_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
>  LINUX_SITE = $(patsubst %/,%,$(dir $(LINUX_TARBALL)))
>  LINUX_SOURCE = $(notdir $(LINUX_TARBALL))
> +else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_LOCAL),y)
> +LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH))
> +LINUX_SITE_METHOD = local
>  else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
>  LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
>  LINUX_SITE_METHOD = git
> --
> 2.11.0
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
buildroot Info Page - BusyBox<http://lists.busybox.net/mailman/listinfo/buildroot>
lists.busybox.net
Buildroot is a set of Makefiles and patches that makes it easy generate a cross-compilation toolchain and root filesystem for your target Linux system.





--
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / RC Linux Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com<http://www.rockwellcollins.com>

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
ATTENTION: This email came from an external source.
Do not open attachments or click on links from unknown senders or unexpected emails.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181107/d0a6e3a8/attachment.html>
