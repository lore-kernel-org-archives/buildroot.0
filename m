From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jan 2016 23:07:28 +0100
Subject: [Buildroot] [PATCH 10/21] libtorrent: use the proper
 BR2_TOOLCHAIN_HAS_SYNC_x symbols
In-Reply-To: <20160125214529.GK3386@free.fr>
References: <1453676887-31236-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453676887-31236-11-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160125214529.GK3386@free.fr>
Message-ID: <20160125230728.6b2f577a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 25 Jan 2016 22:45:29 +0100, Yann E. MORIN wrote:

> On 2016-01-25 00:07 +0100, Thomas Petazzoni spake thusly:
> > libtorrent uses 1 bytes and 4 bytes __sync built-ins, so let's use the
> > appropriate BR2_TOOLCHAIN_HAS_SYNC_x symbols instead of
> > BR2_ARCH_HAS_ATOMICS. The rtorrent package, which is a reverse
> > dependency of libtorrent, gets fixed as well.
> > 
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > ---
> >  package/libtorrent/Config.in | 4 ++--
> >  package/rtorrent/Config.in   | 4 ++--
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/package/libtorrent/Config.in b/package/libtorrent/Config.in
> > index 17a1f23..4787f9c 100644
> > --- a/package/libtorrent/Config.in
> > +++ b/package/libtorrent/Config.in
> > @@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBTORRENT
> >  	bool "libtorrent"
> >  	depends on BR2_INSTALL_LIBSTDCPP
> >  	depends on BR2_TOOLCHAIN_HAS_THREADS
> > -	depends on BR2_ARCH_HAS_ATOMICS
> > +	depends on BR2_TOOLCHAIN_HAS_SYNC_1 && BR2_TOOLCHAIN_HAS_SYNC_4
> 
> The original build failure that prompted adding the atomics dependency
> only reported errors about the __sunc_*_4() functions, but libtorrent
> has been bumped sinc ethen.
> 
> I was not able to easily reproduce a failure so far, but I will try with
> an arc toolchain (which is lacking __sync_*_1() functions...

Beware with ARC: you need to have a toolchain with BR2_ARC_ATOMIC_EXT
disabled, otherwise the __sync built-ins are provided. And by default,
BR2_ARC_ATOMIC_EXT is enabled.

You should rather try with the SPARC toolchain at
http://autobuild.buildroot.org/toolchains/configs/br-sparc-glibc.config.

Or I can provide you an external ARC toolchain without atomics.

Regarding libtorrent, if you want to test:

 1/ Remove the dependency on BR2_TOOLCHAIN_HAS_SYNC_<x> (or
    BR2_ARCH_HAS_ATOMICS in the current Buildroot)

 2/ Build it with the br-sparc-glibc.config pointed above.

 3/ Test the following:

$ echo "int main(void) { return 0; }" >> foo.c
$ ./output/host/usr/bin/sparc-linux-gcc -o foo foo.c -ltorrent -lpthread

You get:

/home/thomas/projets/buildroot/output/host/usr/sparc-buildroot-linux-gnu/sysroot/usr/lib/libtorrent.so: undefined reference to `__sync_sub_and_fetch_4'
/home/thomas/projets/buildroot/output/host/usr/sparc-buildroot-linux-gnu/sysroot/usr/lib/libtorrent.so: undefined reference to `__sync_bool_compare_and_swap_1'
/home/thomas/projets/buildroot/output/host/usr/sparc-buildroot-linux-gnu/sysroot/usr/lib/libtorrent.so: undefined reference to `__sync_or_and_fetch_4'
/home/thomas/projets/buildroot/output/host/usr/sparc-buildroot-linux-gnu/sysroot/usr/lib/libtorrent.so: undefined reference to `__sync_bool_compare_and_swap_4'
/home/thomas/projets/buildroot/output/host/usr/sparc-buildroot-linux-gnu/sysroot/usr/lib/libtorrent.so: undefined reference to `__sync_add_and_fetch_4'
/home/thomas/projets/buildroot/output/host/usr/sparc-buildroot-linux-gnu/sysroot/usr/lib/libtorrent.so: undefined reference to `__sync_fetch_and_or_4'
/home/thomas/projets/buildroot/output/host/usr/sparc-buildroot-linux-gnu/sysroot/usr/lib/libtorrent.so: undefined reference to `__sync_fetch_and_and_4'
collect2: error: ld returned 1 exit status

See the __sync_bool_compare_and_swap_1() ?

And now, you can test it with a Microblaze toolchain, which implements
the 4-byte __sync builtins, but not the 1-byte builtins. And you get:

$ ./output/host/usr/bin/microblazeel-linux-gcc -o foo foo.c -ltorrent -lpthread
/home/thomas/projets/buildroot/output/host/usr/microblazeel-buildroot-linux-gnu/sysroot/usr/lib/libtorrent.so: undefined reference to `__sync_bool_compare_and_swap_1'
collect2: error: ld returned 1 exit status

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
