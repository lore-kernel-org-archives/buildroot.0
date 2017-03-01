From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Mar 2017 21:48:00 +0100
Subject: [Buildroot] [PATCH] ncftp: fix host/target confusion
In-Reply-To: <1488322477-25447-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1488322477-25447-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170301214800.1a6c3405@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 28 Feb 2017 23:54:37 +0100, Thomas Petazzoni wrote:
> The ncftp build process tries to build and run a small program called
> ccdv to beautify the build process output. If it manages to build and
> run it, then it uses it.
> 
> Unfortunately, this doesn't work well when the target architecture is
> close to the host architecture, but not exactly the same. Because both
> architectures are close to each other, the test run of ccdv succeeds,
> but real use of ccdv during ncftp build process causes an Illegal
> instruction issue.
> 
> This for example happens with the CodeSourcery AMD64 toolchain, on a
> build machine running an i7-4600U, and has been detected in the
> autobuilders since the CodeSourcery AMD64 toolchain was upgraded at
> the end of January:
> 
>   http://autobuild.buildroot.net/?reason=ncftp-3.2.6
> 
> The issue was also reported by Christopher Arguin back in July 2016:
> 
>   http://lists.busybox.net/pipermail/buildroot/2016-July/168026.html
> 
> and at the time, we identified that simply disabling the ccdv tool, by
> passing --disable-ccdv, was enough to solve the issue. But Christopher
> never submitted the patch, so the problem remained unfixed.
> 
> Therefore, we pass --disable-ccdv to the configure script, which
> fixes:
> 
>   http://autobuild.buildroot.net/results/6eadad0e879ca70bb07b13b4196d42c64b11699f/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/ncftp/ncftp.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks. Peter, I believe this one qualifies for the
LTS branch.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
