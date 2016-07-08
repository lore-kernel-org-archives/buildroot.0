From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Jul 2016 21:47:12 +0200
Subject: [Buildroot] [PATCH 3/3] package/runc: disable for static only
 build
In-Reply-To: <1467916777-29220-3-git-send-email-romain.naour@gmail.com>
References: <1467916777-29220-1-git-send-email-romain.naour@gmail.com>
 <1467916777-29220-3-git-send-email-romain.naour@gmail.com>
Message-ID: <20160708214712.30976a76@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  7 Jul 2016 20:39:37 +0200, Romain Naour wrote:
> When build statically, runc try to link against Scrt1.o which is not
> provided by a toolchain for static build only.
> 
> [...]arm-buildroot-linux-uclibcgnueabi/bin/ld: cannot find Scrt1.o: No such file or directory
> collect2: error: ld returned 1 exit status
> 
> Add the reverse dependency on docker-containerd.
> 
> Remove the static case handling for runc.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Christian Stewart <christian@paral.in>

I believe this only happens on ARM, because on ARM, Go forces the use
of -pie, for some reason:

        pie := (goarch == "arm" && goos == "linux") || goos == "android"
        if pie { // we need to use -pie for Linux/ARM to get accurate imported sym
                cgoLDFLAGS = append(cgoLDFLAGS, "-pie")
        }

And static linking + PIE isn't supported by uClibc. But on
architectures other than ARM, I believe Go doesn't use -pie, so static
linking with uClibc should work (remains to be tested, though).

For this reason, I believe your patch is not correct as it disables Go
packages for static linking on all architectures, while only ARM is
affected by this problem.

This is yet another situation which makes me think we should add a
"BR2_TOOLCHAIN_SUPPORTS_PIE" hidden boolean.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
