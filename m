From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 14 Sep 2011 12:16:47 +0200
Subject: [Buildroot] linux.mk: custom tarball: re-download if tarball
	changed
In-Reply-To: <CAAXf6LWpKhWVSWmxBHcp5gNmMRK0C9Z5Fw72bPXb7QJ1xmRGdQ@mail.gmail.com>
References: <CAAXf6LWpKhWVSWmxBHcp5gNmMRK0C9Z5Fw72bPXb7QJ1xmRGdQ@mail.gmail.com>
Message-ID: <CAAXf6LVeSpEph0Lkdyxx2YdyBF5cNK4DJq0PnjW8A84BBXtnHw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 20, 2011 at 3:20 PM, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
> Hi,
>
> If you use a vanilla kernel, and you upstep your kernel, buildroot
> automatically downloads and compiles the new version, because
> LINUX26_DIR changed, and the .stamp_downloaded file is not yet present
> in that new directory.
>
> When you specify a LINUX26_TARBALL, the variable LINUX26_VERSION will
> be set to the fixed "custom". As a result, LINUX26_DIR remains the
> same even though you modified the .config file to specify a different
> tarball. ?When re-running make, buildroot does not see the change, and
> you'll have to force building the new kernel.
>
> How can we make sure that buildroot notices this change in configuration?
> One way would be to step away from the fixed 'custom' version string,
> and encode the tarball name in some way in LINUX26_DIR.
> Another possibility is to let the download step depend on the tarball.
> If the tarball changes, then make will initiate the download step.
>
> In buildroot-2011.05, I applied the following (working) patch
> implementing the second alternative:
>
> linux: depend on source archive so that updates to custom tarballs are picked up
> diff --git a/linux/linux.mk b/linux/linux.mk
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -75,9 +75,14 @@ endif
> ?endif # BR2_LINUX_KERNEL_VMLINUX
>
> ?# Download
> -$(LINUX26_DIR)/.stamp_downloaded:
> +$(DL_DIR)/$(LINUX26_SOURCE):
> ? ? ? ?@$(call MESSAGE,"Downloading kernel")
> ? ? ? ?$(call DOWNLOAD,$(LINUX26_SITE),$(LINUX26_SOURCE))
> +
> +# Download patches
> +# Explicitly depend on linux download archive so that custom tarballs get
> +# redownloaded if the configured file changes.
> +$(LINUX26_DIR)/.stamp_downloaded: $(DL_DIR)/$(LINUX26_SOURCE)
> ? ? ? ?$(foreach patch,$(filter ftp://% http://%,$(LINUX26_PATCH)),\
> ? ? ? ? ? ? ? ?$(call DOWNLOAD,$(dir $(patch)),$(notdir $(patch)))$(sep))
> ? ? ? ?mkdir -p $(@D)
>
>
> I wanted to submit this to the list, but just noticed that linux is
> now using the gentargets infrastructure. To address this problem we
> can
> a. adapt gentargets, so that the generic .stamp_downloaded rule also
> depends on the downloaded archive. Is there any reason why this would
> not be good?
> b. adapt the version string in linux.mk so that a custom tarball is
> automatically picked up.

Bump...
