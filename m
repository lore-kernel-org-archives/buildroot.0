From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Jul 2014 19:25:47 +0200
Subject: [Buildroot] [PATCH v2] binutils: gdb: Support unified
 binutils-gdb git repository
In-Reply-To: <1406638477-30555-1-git-send-email-Anton.Kolesov@synopsys.com>
References: <da75c405-7171-4d8a-883c-19b2b24863ee@email.android.com>
 <1406638477-30555-1-git-send-email-Anton.Kolesov@synopsys.com>
Message-ID: <20140730192547.2f561eac@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Anton Kolesov,

On Tue, 29 Jul 2014 16:54:37 +0400, Anton Kolesov wrote:
> If Binutils and/or GDB are fetched from the unified bintuils-gdb repository,
> then tarball will contain both Binutils and GDB sources, unlike the "normal"
> tarballs that contain only the titular package. To keep packages separated
> in Buildroot we need to disable undesired components when configuring.
> 
> Binutils and GDB migrated to a common Git repository in the October 2013
> [1]. Previous Git repositories were incomplete copies of CVS repository
> which copied only the relevant files (no binutils files in GDB, and vice
> versa). In the new binutils-gdb repository there is no such separation and
> a result all files exist in directory after checkout. So if "configure" and
> "make" are used without explicit targets, all projects will be built:
> binutils, ld, gas, bfd, opcodes, gdb, etc. In case of Buildroot this would
> mean that selecting Binutils only, still will build both Binutils and GDB.
> And if GDB is selected as well, then both packages will be built two times,
> and Binutils from GDB directory will overwrite initial build of Binutils (or
> vice versa if Binutils will be built after the GDB). This is a serious
> problem, because binutils and GDB use separate branches in this common
> repository. In case of Buildroot this means that separate Git commits (or
> tags) should be used when downloading source from Git.
> 
> This affects only Git repositories, because GNU release tarballs still
> contain only relevant packages.
> 
> This change is backward compatible, because if "normal" tarball is used
> (without extra directories), than --disable-* configure options are just
> ignored by configure.
> 
> [1] https://sourceware.org/ml/gdb/2013-10/msg00071.html
> 
> Signed-off-by: Anton Kolesov <Anton.Kolesov@synopsys.com>
> Cc: Alexey Brodkin <abrodkin@synopsys.com>
> ---
>  package/binutils/binutils.mk | 2 ++
>  package/gdb/gdb.mk           | 6 ++++++
>  2 files changed, 8 insertions(+)

Thanks, I've committed this patch, after changing it slightly to use a
variable inside gdb.mk and inside binutils.mk to avoid repeating the
options, and add an explanation comment.

See
http://git.buildroot.net/buildroot/commit/?id=b737b12dadd321858f20efcb6b504c8ccbd21fcf.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
