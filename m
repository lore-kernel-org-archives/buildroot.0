From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Jul 2015 23:46:17 +0200
Subject: [Buildroot] [PATCH] Disable gcc-4.8.x + binutils-2.25 + MIPS
 combination
In-Reply-To: <1435850348-19416-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1435850348-19416-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20150702234617.4d33bb5f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vicente Olivert Riera,

On Thu, 2 Jul 2015 17:19:08 +0200, Vicente Olivert Riera wrote:
> This combination causes a compilation failure of the host-gcc-final
> recipe like this one:
> 
> /br/output/host/usr/mips-buildroot-linux-gnu/bin/ld:
> .libs/gload.o: relocation R_MIPS_HI16 against `__gnu_local_gp' can not
> be used when making a shared object; recompile with -fPIC
> 
> The problem is the file 'libatomic/gload.c' is compiled without -fPIC
> when using binutils-2.25. All gcc (with libatomic) versions below 4.9.3
> are affected by this issue.
> 
> Here is a summary of affected/unaffected versions in Buildroot:
> 
> 4.7.x: unaffected (doesn't have libatomic)
> 4.8.x: affected
> 4.9.x: unaffected (we have 4.9.3 which is fixed)
> 5.1.x: unaffected
> 
> The fix can be found here:
> 
>   https://github.com/gcc-mirror/gcc/commit/57f5c0954f95cb37f995d60167ddde06c7d6e697
> 
> However, given the following reasons...
> 
> - Upstream gcc 4.8 branch is closed.
> - The fix is very hard to backport from 4.9 to 4.8.
> - This stuff is insanely sensitive and not working at all could be
>   better than looking like it works but not quite.
> 
> ...I think the best choice is to disable that combination in Buildroot.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/gcc/Config.in.host | 2 ++
>  1 file changed, 2 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
