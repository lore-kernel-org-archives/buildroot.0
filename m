From: Anton Kolesov <Anton.Kolesov@synopsys.com>
Date: Mon, 28 Jul 2014 17:32:31 +0000
Subject: [Buildroot] [PATCH] binutils: gdb: Support unified binutils-gdb
 git repository
In-Reply-To: <20140728185856.42222efe@free-electrons.com>
References: <1406559424-15244-1-git-send-email-Anton.Kolesov@synopsys.com>
 <20140728185856.42222efe@free-electrons.com>
Message-ID: <39A54937CC95F24AA2F794E2D2B66B1356D00223@de02wembxa.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> -----Original Message-----
> From: Thomas Petazzoni [mailto:thomas.petazzoni at free-electrons.com]
> Sent: 28 July 2014 20:59
> To: Anton Kolesov
> Cc: buildroot at uclibc.org; Alexey Brodkin
> Subject: Re: [Buildroot] [PATCH] binutils: gdb: Support unified binutils-gdb git
> repository
> 
> Dear Anton Kolesov,
> 
> On Mon, 28 Jul 2014 18:57:04 +0400, Anton Kolesov wrote:
> 
> > ARC GNU Toolchain will use a unified binutils-gdb repository starting
> > from the August release. I'm sending this patch in advance to ensure
> > that it will be sorted out before our release.
> 
> Is this a general movement? What is the motivation behind such a change?
> 

Binutils and GDB migrated to a common Git repository in the October 2013. [1]
Previous Git repositories were incomplete copies of CVS repository which copied
only the relevant files (no binutils files in GDB, and vice versa). In the new
binutils-gdb repository there is no such separation and a result all files
exist in directory after checkout. So if "configure" and "make" are used
without explicit targets, all projects will be built: binutils, ld, gas, bfd,
opcodes, gdb, etc. In case of Buildroot this would mean that selecting Binutils
only, still will build both Binutils and GDB. And if GDB is selected as well,
then both packages will be built two times, and Binutils from GDB directory
will overwrite initial build of Binutils (or vice versa if Binutils will be
built after the GDB).  Not only this is a waste of build time, but also binutils
and GDB use separate branches in this common repository: GDB is in master and
gdb-7.* branches, while binutils is in binutils_master and binutils_2_*
branches). I hope that will be merged later on. So in case of Buildroot this means
that separate Git commits (or tags) should be used when downloading source
from Git.

So obviously ARC GNU tools team wants to be in sync with upstream work, thus we
moved to the unified binutils-gdb repository and rebased our patches on top of
it.

As far as I understand this affects only Git repositories, because GNU release
tarballs still contain only relevant packages, but when we download file from
Git over HTTP there is no way to specify custom filter of what
files/directories should be in the tarball, or at least I'm not aware of such
feature.

This change is backward compatible, because if "normal" tarball is used
(without extra directories), than those --disable-* options are just ignored by
configure.

[1] https://sourceware.org/ml/gdb/2013-10/msg00071.html

Anton 

> Thanks,
> 
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
