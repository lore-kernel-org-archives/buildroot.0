From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Nov 2018 21:54:10 +0100
Subject: [Buildroot] [PATCH 1/1] package/gdb: prevent gdbserver being
 selected for RISC-V builds
In-Reply-To: <20181126142438.20337-1-mark.corbin@embecosm.com> (Mark Corbin's
 message of "Mon, 26 Nov 2018 14:24:38 +0000")
References: <20181126142438.20337-1-mark.corbin@embecosm.com>
Message-ID: <87pnun61vx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Mark" == Mark Corbin <mark.corbin@embecosm.com> writes:

 > There is currently no version of gdbserver for RISC-V. Until this
 > is implemented we will prevent both the direct and indirect
 > selection of gdbserver for RISC-V builds. In practice this means
 > that 'cross gdb for the host' cannot be selected and that
 > 'full debugger' must be automatically selected for the gdb target
 > package.

 > Signed-off-by: Mark Corbin <mark.corbin@embecosm.com>
 > ---
 >  package/gdb/Config.in      | 5 ++++-
 >  package/gdb/Config.in.host | 1 +
 >  2 files changed, 5 insertions(+), 1 deletion(-)

 > diff --git a/package/gdb/Config.in b/package/gdb/Config.in
 > index 55c1b194ce..b3668aeb24 100644
 > --- a/package/gdb/Config.in
 > +++ b/package/gdb/Config.in
 > @@ -24,7 +24,9 @@ config BR2_PACKAGE_GDB
 >  	# target, we don't allow building a separate gdbserver. The
 >  	# one from the external toolchain should be used.
 >  	select BR2_PACKAGE_GDB_SERVER if \
 > -		(!BR2_PACKAGE_GDB_DEBUGGER && !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)
 > +		(!BR2_PACKAGE_GDB_DEBUGGER && !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY && \
 > +		!BR2_riscv)
 > +	select BR2_PACKAGE_GDB_DEBUGGER if BR2_riscv

It is slightly simpler to just move this select above, then we don't
need to change the BR2_PACKAGE_GDB_SERVER logic. I have also added a
comment about no gdbserver on RISC-V and committed, thanks.

-- 
Bye, Peter Korsgaard
