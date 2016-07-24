From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 21:50:34 +0200
Subject: [Buildroot] [PATCH] package/go: needs PIE support
In-Reply-To: <1469374783-22190-1-git-send-email-romain.naour@gmail.com>
References: <1469374783-22190-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160724215034.249ce0a3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Jul 2016 17:39:43 +0200, Romain Naour wrote:
> When build statically, runc try to link against Scrt1.o which is not
> provided by uClibc ARM toolchain for static build only.
> 
> [...]arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find Scrt1.o: No such file or directory
> collect2: error: ld returned 1 exit status
> 
> On ARM, Go forces the use of -pie, for some reason:
> 
>     pie := (goarch == "arm" && goos == "linux") || goos == "android"
>     if pie { // we need to use -pie for Linux/ARM to get accurate imported sym
>               cgoLDFLAGS = append(cgoLDFLAGS, "-pie")
>     }
> 
> For this reason, add a dependency on BR2_TOOLCHAIN_SUPPORTS_PIE for ARM CPUs
> to disable Go for such toolchains.
> 
> While at it, rewrap Go dependencies.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2016-July/167206.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Christian Stewart <christian@paral.in>
> ---
> Require https://patchwork.ozlabs.org/patch/646956/
> ---
>  package/go/Config.in.host | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
