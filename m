From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Oct 2016 21:38:41 +0200
Subject: [Buildroot] cached downloads for scm branches
In-Reply-To: <f006d88783fb1d99aaef2d6cab1dfc88@walle.cc>
References: <f006d88783fb1d99aaef2d6cab1dfc88@walle.cc>
Message-ID: <20161020213841.75105d07@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Oct 2016 19:27:19 +0200, Michael Walle wrote:

> If I have a package which downloads it's source from a SCM branch, the 
> download will be cached in DL_DIR/<pkgname>-<branchname>.tar.gz. This 
> makes sense if the version is a tag or a (git) hash. But if used with 
> branches, the package will never be downloaded again until I remove it 
> from the DL_DIR. This may be the intended behaviour, but as far as I can 
> tell, I have no chance to change it.
> 
> Do I miss something? Does it make sense to add a new package variable to 
> force a download?

This behavior is intended and adding a new package variable to force a
download is not what we want to do. Indeed, Buildroot aims at doing
*reproducible* builds. If a package points to a branch, then you have
no idea what you are building, this what you're building depends on the
moment you start the build (as it decides when you will fetch, and
therefore what you will fetch).

*However*, we have a mechanism called <pkg>_OVERRIDE_SRCDIR, which
allows you to tell Buildroot: "For this specific package, please skip
the download/extract/patch steps, and instead take the source from
<this> local directory". Thanks to that, you can checkout/clone your
project source code in <this> folder, and ask Buildroot to fetch it
from there. This is what we recommend during active development on a
given component.

See
http://free-electrons.com/doc/training/buildroot/buildroot-slides.pdf
slides 261 and following for more details.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
