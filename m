From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 18 Sep 2007 19:10:28 +0200
Subject: [Buildroot] oddity with project_ vs. kernel dir
In-Reply-To: <20070918163008.GA14096@aon.at>
References: <20070918163008.GA14096@aon.at>
Message-ID: <20070918171028.GB14096@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 18, 2007 at 06:30:08PM +0200, Bernhard Fischer wrote:
>
>Ulf,
>
>I'm trying to build a kernel with openswan (for i386, for example).
>Everything works as expected when generating and installing the
>kernel-headers ??) but the, when unpacking/patching the kernel for the
>target, soomebody seems to try to apply a duplicate patch:
>
>rm -rf
>/scratch/obj.i686/buildroot_trunk/project_build_i386/uclibc/linux-2.6.22.6
>*** Unpacking kernel source
>bzcat /scratch/obj.i686/buildroot_trunk/down/linux-2.6.22.6.tar.bz2 |
>tar -C /scratch/obj.i686/buildroot_trunk/project_build_i386/uclibc   -xf -
>touch /scratch/obj.i686/buildroot_trunk/project_build_i386/uclibc/linux-2.6.22.6/.unpacked
>toolchain/patch-kernel.sh /scratch/obj.i686/buildroot_trunk/project_build_i386/uclibc/linux-2.6.22.6
>toolchain/kernel-headers \
>                linux-2.6.22.6-\*.patch{,.gz,.bz2}
>toolchain/patch-kernel.sh /scratch/obj.i686/buildroot_trunk/toolchain_build_i386/linux-2.6.22.6
>package/openswan \
>                linux-2.6.22.6-\*.patch{,.gz,.bz2}
>
>Applying linux-2.6.22.6-openswan-2.4.9.kernel-2.6-klips.patch using
>plaintext: 
>The next patch would create the file README.openswan-2,
>which already exists!  Assume -R? [n] 
>Apply anyway? [n] 
>Skipping patch.
>(a bit line-wrapped, sorry).
>
>Does that sound familiar to you?

Ah, yes. Has to be KERNEL26_DIR there.
 19671        ulf ifeq ($(BR2_PACKAGE_OPENSWAN),y)
 19671        ulf       toolchain/patch-kernel.sh $(LINUX_HEADERS_UNPACK_DIR) package/openswan \
 19671        ulf 	linux-$(LINUX26_VERSION)-\*.patch{,.gz,.bz2}
 19671        ulf endif

fixing this up..
