From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Apr 2019 11:27:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/git: Fix build with NLS enabled
In-Reply-To: <20190416225154.4760-1-vadim4j@gmail.com>
References: <20190416225154.4760-1-vadim4j@gmail.com>
Message-ID: <20190418112749.55c547ca@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 17 Apr 2019 01:51:54 +0300
Vadim Kochan <vadim4j@gmail.com> wrote:

> git fails to build with NLS enabled because of weak check
> for gettext in configure.ac. The AC_CHECK_LIB(c, gettext ...)
> is used to set LIBC_CONTAINS_LIBINTL variable. If the variable
> is set then '-libs' is not passed to the linker, but this variable
> is set to 'Yes' even libc implementation does not provide libintl
> support, the AC_CHECK passes because gcc has gettext builtin.
> 
> So use instead AC_LINK_IFELSE with included libintl.h because it
> makes gettext to unfold as libintl_gettext which causes AC_CHECK
> to fail for cases when gettext is not provided by libc.
> 
> Tested by ./utils/test-pkg with NLS disabled/enabled.
> 
> Fixes:
> 	http://autobuild.buildroot.net/results/091b790ca6f5b46d5d29211dc1cb3ff05b62a965
> 	http://autobuild.buildroot.net/results/a69b58b35b270fdd2df9b076e7030bb594520197
> 	http://autobuild.buildroot.net/results/f104c4e6ff41b1dd175f2d27f3b4ea7c9b61f7c5
> 	http://autobuild.buildroot.net/results/ee12bdba398a139995de5f6f6718be6a493541d9
> 	http://autobuild.buildroot.net/results/74fa6b2bfbb1301e35c9dd1bbc04856c1cbf25f2
> 
> Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
> ---
>  ...1-configure.ac-Properly-check-for-libintl.patch | 49 ++++++++++++++++++++++
>  package/git/git.mk                                 |  1 +
>  2 files changed, 50 insertions(+)
>  create mode 100644 package/git/0001-configure.ac-Properly-check-for-libintl.patch

Applied to master, thanks. Please submit the Git change to the upstream
Git project. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
