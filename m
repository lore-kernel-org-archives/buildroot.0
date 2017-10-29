From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Oct 2017 15:52:51 +0100
Subject: [Buildroot] [PATCHv4] package/glibc: switch to using the
 maintenance branch
In-Reply-To: <20171029095248.24830-1-yann.morin.1998@free.fr>
References: <20171029095248.24830-1-yann.morin.1998@free.fr>
Message-ID: <20171029155251.7c321e00@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 29 Oct 2017 10:52:48 +0100, Yann E. MORIN wrote:
> glibc upstream has ruled against doing regular point-releases, but they
> do have a lot of interesting and important fixes for regressions and
> security.
> 
> Backporting each patch, or cherry-picking individual patches is off
> limits for us, so we just switch to using the currently-latest HEAD of
> the maintenance branch instead.
> 
> The version number is obtained with:
>     $ git describe --match 'glibc-*' --abbrev=40 origin/release/2.26/master
> 
> The alternative options were:
>   - download the tarball from the git tree
>     --> does nto work; not an option  
>   - download the 2.26 tarball, and bundle the individual patches in
>     Buildroot
>     --> maintenance of patches is a burden; not an option  
>   - download the 2.26 tarball, maintain the list of patches to download from
>     the git tree
>     --> not an option for the same reason  
> 
> So we end up just doing a git clone. The git tree is today about ten
> times the size of the tarball, so a rough estimate makes it at about ten
> times the download time.
> 
> Also upstream doesn't officially provide an https download location [1].
> There is one but it's not reliable, sometimes the connection time out and
> end-up with a corrupted git repo:
> 
> fatal: unable to access 'https://sourceware.org/git/glibc.git/': Failed to connect to sourceware.org port 443: Connection timed out
> 
> So switch to using a git mirror from github which is updated once a day [2].
> This allow at the same time to clone the git repository faster.
> 
> Note: The glibc 2.26 patches are not keept for the arc toolchain since they
> are fixing an issue with the new float128 support introduced in x86, x86_64
> and powerpc64le.
> 
> [1] https://sourceware.org/git/?p=glibc.git;a=summary
> [2] https://github.com/bminor/glibc.git
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Romain Naour <romain.naour@openwide.fr>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Evgeniy Didin <didin@synopsys.com>
> CC: Alexey Brodkin <abrodkin@synopsys.com>
> [Romain: bump 4b692dffb95ac4812b161eb6a16113d7e824982e]
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> [yann.morin.1998 at free.fr: update comment to never decide on the mirror]
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> ---
> Changes v3 -> v4:
>   - update comment, to never use the mirror as a reference
> ---
>  ...__builtin_types_compatible_p-in-C-mode-bu.patch |  50 -----
>  ...02-Do-not-use-generic-selection-in-C-mode.patch |  56 -----
>  ...-version-of-issignaling-that-does-not-use.patch | 225 ---------------------
>  ...ersion-of-issignaling-when-__NO_LONG_DOUB.patch |  47 -----
>  ...-version-of-iszero-that-does-not-use-__MA.patch | 210 -------------------
>  ...ify-use-the-builtin-when-optimizing-for-s.patch |  63 ------
>  package/glibc/glibc.hash                           |   4 +-
>  package/glibc/glibc.mk                             |  14 +-
>  8 files changed, 13 insertions(+), 656 deletions(-)
>  delete mode 100644 package/glibc/0001-Do-not-use-__builtin_types_compatible_p-in-C-mode-bu.patch
>  delete mode 100644 package/glibc/0002-Do-not-use-generic-selection-in-C-mode.patch
>  delete mode 100644 package/glibc/0003-Provide-a-C-version-of-issignaling-that-does-not-use.patch
>  delete mode 100644 package/glibc/0004-Fix-the-C-version-of-issignaling-when-__NO_LONG_DOUB.patch
>  delete mode 100644 package/glibc/0005-Provide-a-C-version-of-iszero-that-does-not-use-__MA.patch
>  delete mode 100644 package/glibc/0006-Let-fpclassify-use-the-builtin-when-optimizing-for-s.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
