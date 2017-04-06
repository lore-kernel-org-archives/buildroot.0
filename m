From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Apr 2017 22:34:22 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain-external: fix handling of
 ld.so
In-Reply-To: <20170406202505.17605-1-patrickdepinguin@gmail.com>
References: <20170406202505.17605-1-patrickdepinguin@gmail.com>
Message-ID: <20170406223422.388475a5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  6 Apr 2017 22:25:05 +0200, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> Commit ba6bac138331cea449592f877e558f84176a70bf made a change in copying of
> the dynamic loader, with the goal of reducing toolchain-specific fixups.
> Any ld*.so file found in the toolchain's lib directory would be copied to
> the staging/lib directory.
> 
> For the toolchains that previously needed fixup, this new behavior is fine.
> The reason they needed fixup was that the normal copy action did not include
> any dynamic loader.
> 
> However, for certain other toolchains this new behavior actually breaks
> things: regardless of ARCH_LIB_DIR, which may be lib64 instead of lib, the
> dynamic loader from lib is copied _over_ any previously correct dynamic
> loader.
> 
> This has been witnessed with the CodeSourcery x86_64 and
> CodeSourcery MIPS64 toolchains. In both cases, a 32-bit dynamic loader was
> copied to staging/lib, while a 64-bit version was expected.
> 
> Fix the problem by only performing this explicit dynamic loader copy if no
> dynamic loader is found in staging/lib.
> 
> Fixes http://autobuild.buildroot.net/results/8bf/8bffe54032aad9cc710a22411ef3bff4a2c93e55/
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  toolchain/helpers.mk | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)

Applied to master, thanks. It's adding more complexity to the existing
complexity, but oh well :/ Thanks for fixing it so quickly!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
