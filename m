From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 8 Aug 2017 09:12:07 +0300
Subject: [Buildroot] Package site method and patches download
Message-ID: <20170808061207.sk7ohikqvlq7qzz3@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

I hit a problem with applying patches from URLs to a git fetched kernel 
(BR2_LINUX_KERNEL_CUSTOM_GIT). The patches were silently skipped; no error. 
After some head scratching it turned out that 
package/pkg-download.mk:DOWNLOAD_INNER determines the download helper 
according to the per-package $(PKG)_SITE_METHOD. The same site method applies 
to both the source tree, and all patches of the package.

Since my case involved a github repo, I simply switched to direct tarball 
download, similar to the github helper. But this workaround is far from 
obvious. The help text of BR2_LINUX_KERNEL_PATCH is misleading:

          A space-separated list of patches to apply to the
          kernel. Each patch can be described as an URL, a local file
          path, or a directory. In the case of a directory, all files
          matching *.patch in the directory will be applied.

In fact, the patch descriptors must match the source tree download method.

I have not tested regular packages, so I don't know whether they are also 
affected by this.

Do you have any idea how to best solve this?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
