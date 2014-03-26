From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 26 Mar 2014 18:46:16 +0100
Subject: [Buildroot] Different site methods for the main package and
	patches
In-Reply-To: <CA+-urNQrPff3iTDGdWwYvbhLPXwCrqZgVA91qQS_RgM66VG1eQ@mail.gmail.com>
References: <CA+-urNQrPff3iTDGdWwYvbhLPXwCrqZgVA91qQS_RgM66VG1eQ@mail.gmail.com>
Message-ID: <53331268.4030205@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/03/14 01:47, Frank Hunleth wrote:
> I've run into an issue where I'd like to retrieve a package using git
> and then patch it using a diff file from another site. In my case, the
> package is the Linux kernel.
> 
> This is possible to reproduce using the raspberrypi_defconfig and
> adding the BR2_LINUX_KERNEL_PATCH line below. Here are the relevant
> lines:
> 
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_CUSTOM_GIT=y
> BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/raspberrypi/linux.git"
> BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="3bff11d4d4b8dc28cb9ce81449c989466ba27198"
> BR2_LINUX_KERNEL_PATCH="http://download.filesystems.org/unionfs/unionfs-2.x-latest/unionfs-2.5.12_for_3.10.21.diff.gz"
> 
> The call that fails is in package/pkg-download.mk in DOWNLOAD_INNER.
> There's a test whether LINUX_SITE_METHOD is defined (which it is) and
> to use it for the $scheme. This is correct to download the kernel, but
> incorrect when going through the kernel patches. If I could undefine
> LINUX_SITE_METHOD, my use case would work since the method would be
> determined via the URI, but obviously other use cases would break.
> 
> For patches, I'd almost think that the <package>_SITE_METHOD shouldn't
> be used at all, since multiple patches could be specified that come
> from different places. I don't know what the ramifications of that
> change would be, though, or if there's a simpler solution.

 You're probably right about that. The problem is that the DOWNLOAD macro
cannot know if it is given a patch or the package itself. So it should
probably be changed to get _SITE_METHOD as an optional argument.

 Yann, perhaps you could take that up into your download method rework
series?

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
