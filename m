From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Jul 2015 22:38:51 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-07-19
In-Reply-To: <1437422115.1945.4.camel@embedded.rocks>
References: <20150720063017.2400B101C74@stock.ovh.net>
 <1437422115.1945.4.camel@embedded.rocks>
Message-ID: <20150720223851.68e8f706@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Mon, 20 Jul 2015 21:55:15 +0200, J?rg Krause wrote:

> >          arm |                 libtirpc-0.3.1 | NOK | 
> > http://autobuild.buildroot.net/results/80321de8d4c6c0a00439b07289a581
> > 8962128b43/
> 
> This is odd:
> # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS is not set
> # libtirpc needs a toolchain w/ threads
> 
> -> why is libtirpc build anyhow?

Take the configuration, run menuconfig and exit, you will see:

warning: (BR2_PACKAGE_NFS_UTILS) selects BR2_PACKAGE_RPCBIND which has unmet direct dependencies (BR2_TOOLCHAIN_HAS_THREADS && !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && BR2_USE_MMU)

The problem is that nfs-utils selects libtirpc without properly caring
for the thread dependency. This is caused by a patch from Maxime
Hadjinlian that added a "select BR2_PACKAGE_RPCBIND" in
nfs-utils/Config.in.

Since we probably don't care much about using nfs-utils in a
non-threaded scenario, maybe we could simply do:

comment "nfs-utils needs a toolchain w/ threads"
        depends on BR2_USE_MMU
        depends on !BR2_TOOLCHAIN_HAS_THREADS

config BR2_PACKAGE_NFS_UTILS
        bool "nfs-utils"
        depends on BR2_TOOLCHAIN_HAS_THREADS # libtirpc, rpcbind
        select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
        select BR2_PACKAGE_RPCBIND # runtime

We could try to be smarter and use portmap when no threads are
available, but really this is too much complexity for such a corner
case.

Care to send a patch?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
