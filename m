From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Jun 2017 21:48:39 +0200
Subject: [Buildroot] [PATCH v2] gdb: fix full gdb build for MIPS musl
In-Reply-To: <20170619160008.61280-1-Vincent.Riera@imgtec.com>
References: <20170619160008.61280-1-Vincent.Riera@imgtec.com>
Message-ID: <20170619214839.33f328c0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 19 Jun 2017 17:00:08 +0100, Vicente Olivert Riera wrote:
> Currently building full gdb for MIPS musl fails because it's trying to
> include <sgidefs.h> which is provided by glibc and uClibc, but not by
> musl.
> 
> However, the kernel headers provide <asm/sgidefs.h> which has the same
> definitions, so we can use that one instead.
> 
> Backporting a patch that has been sent upstream. Taken from here:
> 
> https://sourceware.org/bugzilla/show_bug.cgi?id=21070
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
> Changes v1 -> v2:
>  - state the fix is actually for full gdb
>  - properly add comments and SoB so the patches apply with git --am
> ---
>  package/gdb/7.10.1/0011-use-asm-sgidefs.h.patch | 41 +++++++++++++++++++++++++
>  package/gdb/7.11.1/0006-use-asm-sgidefs.h.patch | 40 ++++++++++++++++++++++++
>  package/gdb/7.12.1/0005-use-asm-sgidefs.h.patch | 40 ++++++++++++++++++++++++
>  package/gdb/8.0/0003-use-asm-sgidefs.h.patch    | 40 ++++++++++++++++++++++++
>  4 files changed, 161 insertions(+)
>  create mode 100644 package/gdb/7.10.1/0011-use-asm-sgidefs.h.patch
>  create mode 100644 package/gdb/7.11.1/0006-use-asm-sgidefs.h.patch
>  create mode 100644 package/gdb/7.12.1/0005-use-asm-sgidefs.h.patch
>  create mode 100644 package/gdb/8.0/0003-use-asm-sgidefs.h.patch

Applied to master, thanks. To be honest, I am not sure the proposed
patch is the correct solution: perhaps the good fix is to have musl
provide this userspace header, rather than making gdb directly use a
kernel header.

But until the gdb developers speak up on this, I've merged your patch
to fix the issue.

It's worth mentioning that I submitted another patch to gdb, and it got
merged 15 minutes after being sent. Perhaps the patch should simply be
submitted to the gdb-patches@ mailing list?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
