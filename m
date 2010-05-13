From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 May 2010 17:22:02 +0200
Subject: [Buildroot] Status of external toolchain support
In-Reply-To: <4BEAE23A.2000906@carallon.com>
References: <4BEAE23A.2000906@carallon.com>
Message-ID: <20100513172202.3c3539f7@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 May 2010 18:15:38 +0100
Will Wagner <will_wagner@carallon.com> wrote:

> When configuring buildroot I set all my options the same as the 
> toolchain, except for thread support where nptl was not an option. Does 
> it matter that they don't match up?

It matters if some packages do depend on these options. The only reason
why we have BR2_INET_RPC, BR2_INET_IPV6 and other similar options in
the external toolchain case is because some packages do depend on them.
As we can't detect their value at menuconfig time, we have to ask the
user to provide the appropriate values according to its toolchain
configuration.

> Should you even be able to set thread library when using an external toolchain?

The thread type (none, linuxthreads, linuxthreads old and nptl) can
already be set from the menuconfig interface in external toolchain mode.

However, the "NPTL" selection isn't visible, as it depends on
BR2_UCLIBC_VERSION_SNAPSHOT. So we should probably :

 1. Make BR2_PTHREADS_NATIVE depends on BR2_UCLIBC_VERSION_SNAPSHOT
    *OR* BR2_TOOLCHAIN EXTERNAL

 2. Improve toolchain/external-toolchain/ext-tool.mk so that it checks
    that the value selected for the thread implementation actually
    matches the one available in the external toolchain.

> When using crosstools who should build gdb? If buildroot builds it I 
> have to make sure my toolchain is not read only? Can I just let 
> crosstools build gdb for the host and only get buildroot to make gdb-server?

I always build the cross gdb and gdbserver with crosstool-ng. This is
an area in which I haven't clarified the relation between Buildroot and
the external toolchain.

We should probably :

 *) Hide the option to build the cross-gdb in Buildroot in external
    toolchain mode, making the assumption that the external toolchain
    should provide its own cross gdb.

 *) Add an option to ask Buildroot to either build a new gdbserver, or
    copy the one available for the external toolchain (so that we are
    sure its version matches the version of the cross-gdb in the
    external toolchain)

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
