From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Aug 2016 23:00:08 +0200
Subject: [Buildroot] [PATCH] libunwind: fix architecture dependencies
In-Reply-To: <1470559598-21216-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470559598-21216-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160807230008.0123f13a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  7 Aug 2016 10:46:38 +0200, Thomas Petazzoni wrote:
> Due to a misplaced parenthesis, the libunwind dependency were
> incorrect. Indeed, they were of the form:
> 
>  default y if LIBC_TYPE && (arm dependency) || (list of other architectures)
> 
> Which meant that that the LIBC_TYPE dependency was not taken into
> account for the "other architectures". This commit changes that to:
> 
>  default y if LIBC_TYPE && ((arm dependency) || list of other architectures)
> 
> Without this fix, libunwind can be selected for example on
> PowerPC/uClibc configurations, while only PowerPC/glibc should be
> allowed. This fixes:
> 
>   http://autobuild.buildroot.net/results/96c53ff240dcd68fcc9e3d32c4026c9886edcbe7/
> 
> Similarly, it also fixes cases where SuperH/uClibc was allowed, while
> only SuperH/glibc should be allowed. This fixes:
> 
>   http://autobuild.buildroot.net/results/95a6cca21aea9914ba8bb3f571760fc054c53ecd/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/libunwind/Config.in | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
