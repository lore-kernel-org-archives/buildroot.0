From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Aug 2017 17:03:41 +0200
Subject: [Buildroot] Package site method and patches download
In-Reply-To: <20170808061207.sk7ohikqvlq7qzz3@sapphire.tkos.co.il>
References: <20170808061207.sk7ohikqvlq7qzz3@sapphire.tkos.co.il>
Message-ID: <aae3ae30-8add-4988-2d99-a5f6c5900c9f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-08-17 08:12, Baruch Siach wrote:
> Hi Yann,
> 
> I hit a problem with applying patches from URLs to a git fetched kernel 
> (BR2_LINUX_KERNEL_CUSTOM_GIT). The patches were silently skipped; no error. 
> After some head scratching it turned out that 
> package/pkg-download.mk:DOWNLOAD_INNER determines the download helper 
> according to the per-package $(PKG)_SITE_METHOD. The same site method applies 
> to both the source tree, and all patches of the package.
> 
> Since my case involved a github repo, I simply switched to direct tarball 
> download, similar to the github helper. But this workaround is far from 
> obvious. The help text of BR2_LINUX_KERNEL_PATCH is misleading:
> 
>           A space-separated list of patches to apply to the
>           kernel. Each patch can be described as an URL, a local file
>           path, or a directory. In the case of a directory, all files
>           matching *.patch in the directory will be applied.
> 
> In fact, the patch descriptors must match the source tree download method.
> 
> I have not tested regular packages, so I don't know whether they are also 
> affected by this.
> 
> Do you have any idea how to best solve this?

 We could of course correct the help text, but really we want to solve this
fundamentally.

 The thing is, _SITE_METHOD only makes sense for VCS downloads, because for
other downloads (wget, scp, file), the method can always be derived from the
URL. And patches are obviously never coming from VCS (at least I hope so...). So
I guess we could just ignore _SITE_METHOD for patches, and rely on the
geturischeme from the patch URL instead. And for the EXTRA_DOWNLOADS I think we
can follow the same reasoning.

 Clearly this is a huge change, not for 2017.08. Also it should probably be
worked into Maxime's [added in Cc] download infra rework. And it should be
checked against primary/secondary site, source-check, ...

 The current stance, however, is that for VCS-downloaded kernels (or bootloaders
or ...), there shouldn't be any patches necessary (the assumption being that you
control the VCS repo). So for 2017.08, perhaps the easy way out is to disable
BR2_LINUX_KERNEL_PATCH for git and hg kernels.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
