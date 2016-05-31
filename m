From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 31 May 2016 21:55:05 +0200
Subject: [Buildroot] [PATCH v3] Fix for GIT cross-compilation.
In-Reply-To: <1463950732-28803-1-git-send-email-mc5686@mclink.it>
References: <1463950732-28803-1-git-send-email-mc5686@mclink.it>
Message-ID: <20160531215505.22b48955@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 22 May 2016 22:58:52 +0200, Mauro Condarelli wrote:
> GIT configuration partially relies on system parameters retrieved
> using 'uname -?' directlly at make time.
> This does not mix well with cross compilation.
> 
> This patch allows to feed canned uname results directly from git.mk.
> 

Your Signed-off-by line should be here, and not after the "---",
otherwise it gets stripped when applying your patch.

Also, the commit title should always follow this convention:

	<package>: <description>

So in your case, something like:

	git: fix for build environment leak into the target

or something similar.

> Changes v2 -> v3
>   - Use BR2_TOOLCHAIN_HEADERS_AT_LEAST instead of BR2_LINUX_KERNEL_VERSION
>                                                 (suggested by T.Petazzoni)
>   - Use $(call qstrip,...) to strip quotes      (suggested by T.Petazzoni)
>   - Correctly spell "Buildroot"                 (suggested by T.Petazzoni)
> 
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> ---
>  ...nfig.mak.uname-to-allow-cross-compilation.patch | 47 ++++++++++++++++++++++
>  package/git/git.mk                                 | 10 +++++
>  2 files changed, 57 insertions(+)
>  create mode 100644 package/git/0001-Fix-config.mak.uname-to-allow-cross-compilation.patch

Unfortunately, your change causes a rather annoying regression: git now
gets built twice, once during the "build step" and once again during
the "install target step". I've tested with your patch, and git is only
build once, during the "build step".

Without your patch:

  http://code.bulix.org/h0xlwt-99879?raw

With your patch:

  http://code.bulix.org/msebii-99878?raw

Maybe you need to pass all the uname_<XYZ> variables during the install
step as well, so that it doesn't think it needs to rebuild the whole
thing again?

Could you have a look at this issue?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
