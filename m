From: Mason <slash.tmp@free.fr>
Date: Tue, 5 Jan 2016 13:55:27 +0100
Subject: [Buildroot] package/linux-fusion: 'struct msghdr' has no member
	named 'msg_iov'
Message-ID: <568BBD3F.2030607@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The linux-fusion package fails to build with recent kernels.

Using the following defconfig on a Trusty Tahr desktop.

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_NEON=y
BR2_ARM_ENABLE_VFP=y
BR2_ARM_FPU_NEON=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
BR2_LINUX_KERNEL_ZIMAGE=y
BR2_PACKAGE_LINUX_FUSION=y


Al, can you suggest the most straight-forward fix?

Source code for the kernel module may be downloaded here:
http://sources.buildroot.net/linux-fusion-9.0.3.tar.xz


The issue probably appeared since kernel v3.19 as a consequence of
kernel commit 666547ff591ce.

Author: Al Viro <viro@zeniv.linux.org.uk>
Date:   Sun Apr 6 14:03:05 2014 -0400

    separate kernel- and userland-side msghdr
    
    Kernel-side struct msghdr is (currently) using the same layout as
    userland one, but it's not a one-to-one copy - even without considering
    32bit compat issues, we have msg_iov, msg_name and msg_control copied
    to kernel[1].  It's fairly localized, so we get away with a few functions
    where that knowledge is needed (and we could shrink that set even
    more).  Pretty much everything deals with the kernel-side variant and
    the few places that want userland one just use a bunch of force-casts
    to paper over the differences.
    
    The thing is, kernel-side definition of struct msghdr is *not* exposed
    in include/uapi - libc doesn't see it, etc.  So we can add struct user_msghdr,
    with proper annotations and let the few places that ever deal with those
    beasts use it for userland pointers.  Saner typechecking aside, that will
    allow to change the layout of kernel-side msghdr - e.g. replace
    msg_iov/msg_iovlen there with struct iov_iter, getting rid of the need
    to modify the iovec as we copy data to/from it, etc.
    
    We could introduce kernel_msghdr instead, but that would create much more
    noise - the absolute majority of the instances would need to have the
    type switched to kernel_msghdr and definition of struct msghdr in
    include/linux/socket.h is not going to be seen by userland anyway.
    
    This commit just introduces user_msghdr and switches the few places that
    are dealing with userland-side msghdr to it.
    
    [1] actually, it's even trickier than that - we copy msg_control for
    sendmsg, but keep the userland address on recvmsg.


struct msghdr {
	void		*msg_name;	/* ptr to socket address structure */
	int		msg_namelen;	/* size of socket address structure */
	struct iov_iter	msg_iter;	/* data */
	void		*msg_control;	/* ancillary data */
	__kernel_size_t	msg_controllen;	/* ancillary data buffer length */
	unsigned int	msg_flags;	/* flags on received message */
	struct kiocb	*msg_iocb;	/* ptr to iocb for async requests */
};
 
struct user_msghdr {
	void		__user *msg_name;	/* ptr to socket address structure */
	int		msg_namelen;		/* size of socket address structure */
	struct iovec	__user *msg_iov;	/* scatter/gather array */
	__kernel_size_t	msg_iovlen;		/* # elements in msg_iov */
	void		__user *msg_control;	/* ancillary data */
	__kernel_size_t	msg_controllen;		/* ancillary data buffer length */
	unsigned int	msg_flags;		/* flags on received message */
};


Kernel commit d8725c86aebaf is also relevant.

Author: Al Viro <viro@zeniv.linux.org.uk>
Date:   Thu Dec 11 00:02:50 2014 -0500

    get rid of the size argument of sock_sendmsg()
    
    it's equal to iov_iter_count(&msg->msg_iter) in all cases


make[1]: Entering directory `/tmp/buildroot-git/output/build/linux-fusion-9.0.3'
rm -f linux/drivers/char/fusion/Makefile
rm -f one/Makefile
cp linux/drivers/char/fusion/Makefile-2.6 linux/drivers/char/fusion/Makefile
cp one/Makefile-2.6 one/Makefile
echo kernel is in /tmp/buildroot-git/output/build/linux-4.3.3 and version is 3, building module in linux/drivers/char/fusion
kernel is in /tmp/buildroot-git/output/build/linux-4.3.3 and version is 3, building module in linux/drivers/char/fusion
/usr/bin/make -C /tmp/buildroot-git/output/build/linux-4.3.3 \
		KCPPFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DFUSION_CALL_INTERRUPTIBLE -I`pwd`/linux/drivers/char/fusion -I`pwd`/linux/drivers/char/fusion/multi -I`pwd`/linux/drivers/char/fusion/single -I`pwd`/linux/include" INSTALL_MOD_DIR="drivers/char/fusion" \
		SUBDIRS=`pwd`/linux/drivers/char/fusion modules
make[2]: Entering directory `/tmp/buildroot-git/output/build/linux-4.3.3'
  CC [M]  /tmp/buildroot-git/output/build/linux-fusion-9.0.3/linux/drivers/char/fusion/single/fusioncore_impl.o
  CC [M]  /tmp/buildroot-git/output/build/linux-fusion-9.0.3/linux/drivers/char/fusion/call.o
  CC [M]  /tmp/buildroot-git/output/build/linux-fusion-9.0.3/linux/drivers/char/fusion/debug.o
  CC [M]  /tmp/buildroot-git/output/build/linux-fusion-9.0.3/linux/drivers/char/fusion/entries.o
  CC [M]  /tmp/buildroot-git/output/build/linux-fusion-9.0.3/linux/drivers/char/fusion/fifo.o
  CC [M]  /tmp/buildroot-git/output/build/linux-fusion-9.0.3/linux/drivers/char/fusion/fusiondev.o
  CC [M]  /tmp/buildroot-git/output/build/linux-fusion-9.0.3/linux/drivers/char/fusion/fusionee.o
  CC [M]  /tmp/buildroot-git/output/build/linux-fusion-9.0.3/linux/drivers/char/fusion/hash.o
/tmp/buildroot-git/output/build/linux-fusion-9.0.3/linux/drivers/char/fusion/fusionee.c: In function 'fusionee_poll':
/tmp/buildroot-git/output/build/linux-fusion-9.0.3/linux/drivers/char/fusion/fusionee.c:877:6: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
      unsigned int mask = 0;
      ^
In file included from include/linux/printk.h:6:0,
                 from include/linux/kernel.h:13,
                 from include/linux/list.h:8,
                 from include/linux/module.h:9,
                 from /tmp/buildroot-git/output/build/linux-fusion-9.0.3/linux/drivers/char/fusion/fusiondev.c:18:
/tmp/buildroot-git/output/build/linux-fusion-9.0.3/linux/drivers/char/fusion/fusiondev.c: In function 'call_ioctl':
include/linux/kern_levels.h:4:18: warning: format '%ld' expects argument of type 'long int', but argument 7 has type 'int' [-Wformat=]
 #define KERN_SOH "\001"  /* ASCII Start Of Header */
                  ^
include/linux/kern_levels.h:10:18: note: in expansion of macro 'KERN_SOH'
 #define KERN_ERR KERN_SOH "3" /* error conditions */
                  ^
/tmp/buildroot-git/output/build/linux-fusion-9.0.3/linux/drivers/char/fusion/fusiondev.c:775:39: note: in expansion of macro 'KERN_ERR'
                               printk( KERN_ERR "fusion: FUSION_CALL_EXECUTE3 with errorneous call (failed on previous ioctl call), "
                                       ^
  CC [M]  /tmp/buildroot-git/output/build/linux-fusion-9.0.3/linux/drivers/char/fusion/list.o
  CC [M]  /tmp/buildroot-git/output/build/linux-fusion-9.0.3/linux/drivers/char/fusion/property.o
  CC [M]  /tmp/buildroot-git/output/build/linux-fusion-9.0.3/linux/drivers/char/fusion/reactor.o
  CC [M]  /tmp/buildroot-git/output/build/linux-fusion-9.0.3/linux/drivers/char/fusion/ref.o
  CC [M]  /tmp/buildroot-git/output/build/linux-fusion-9.0.3/linux/drivers/char/fusion/skirmish.o
  CC [M]  /tmp/buildroot-git/output/build/linux-fusion-9.0.3/linux/drivers/char/fusion/shmpool.o
  LD [M]  /tmp/buildroot-git/output/build/linux-fusion-9.0.3/linux/drivers/char/fusion/fusion.o
  Building modules, stage 2.
  MODPOST 1 modules
  CC      /tmp/buildroot-git/output/build/linux-fusion-9.0.3/linux/drivers/char/fusion/fusion.mod.o
  LD [M]  /tmp/buildroot-git/output/build/linux-fusion-9.0.3/linux/drivers/char/fusion/fusion.ko
make[2]: Leaving directory `/tmp/buildroot-git/output/build/linux-4.3.3'
echo kernel is in /tmp/buildroot-git/output/build/linux-4.3.3 and version is 3, building module in one
kernel is in /tmp/buildroot-git/output/build/linux-4.3.3 and version is 3, building module in one
/usr/bin/make -C /tmp/buildroot-git/output/build/linux-4.3.3 \
		KCPPFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I`pwd`/one -I`pwd`/one/single -I`pwd`/include  -I`pwd`/linux/include" INSTALL_MOD_DIR="drivers/char/fusion" \
		SUBDIRS=`pwd`/one modules
make[2]: Entering directory `/tmp/buildroot-git/output/build/linux-4.3.3'
  CC [M]  /tmp/buildroot-git/output/build/linux-fusion-9.0.3/one/single/onecore_impl.o
  CC [M]  /tmp/buildroot-git/output/build/linux-fusion-9.0.3/one/app.o
  CC [M]  /tmp/buildroot-git/output/build/linux-fusion-9.0.3/one/debug.o
  CC [M]  /tmp/buildroot-git/output/build/linux-fusion-9.0.3/one/entries.o
  CC [M]  /tmp/buildroot-git/output/build/linux-fusion-9.0.3/one/fifo.o
  CC [M]  /tmp/buildroot-git/output/build/linux-fusion-9.0.3/one/list.o
  CC [M]  /tmp/buildroot-git/output/build/linux-fusion-9.0.3/one/onedev.o
  CC [M]  /tmp/buildroot-git/output/build/linux-fusion-9.0.3/one/one_udp.o
  CC [M]  /tmp/buildroot-git/output/build/linux-fusion-9.0.3/one/packet.o
  CC [M]  /tmp/buildroot-git/output/build/linux-fusion-9.0.3/one/queue.o
/tmp/buildroot-git/output/build/linux-fusion-9.0.3/one/one_udp.c: In function 'ksocket_send_iov':
/tmp/buildroot-git/output/build/linux-fusion-9.0.3/one/one_udp.c:186:9: error: 'struct msghdr' has no member named 'msg_iov'
      msg.msg_iov = (struct iovec*) iov;
         ^
/tmp/buildroot-git/output/build/linux-fusion-9.0.3/one/one_udp.c:187:9: error: 'struct msghdr' has no member named 'msg_iovlen'
      msg.msg_iovlen = iov_count;
         ^
/tmp/buildroot-git/output/build/linux-fusion-9.0.3/one/one_udp.c:192:13: error: too many arguments to function 'sock_sendmsg'
      size = sock_sendmsg(sock,&msg,len);
             ^
In file included from include/linux/skbuff.h:29:0,
                 from include/linux/if_ether.h:23,
                 from include/uapi/linux/ethtool.h:17,
                 from include/linux/ethtool.h:16,
                 from include/linux/netdevice.h:42,
                 from include/net/inet_sock.h:24,
                 from include/linux/udp.h:20,
                 from /tmp/buildroot-git/output/build/linux-fusion-9.0.3/one/one_udp.c:17:
include/linux/net.h:213:5: note: declared here
 int sock_sendmsg(struct socket *sock, struct msghdr *msg);
     ^
/tmp/buildroot-git/output/build/linux-fusion-9.0.3/one/one_udp.c: In function 'ksocket_receive':
/tmp/buildroot-git/output/build/linux-fusion-9.0.3/one/one_udp.c:221:9: error: 'struct msghdr' has no member named 'msg_iov'
      msg.msg_iov = &iov;
         ^
/tmp/buildroot-git/output/build/linux-fusion-9.0.3/one/one_udp.c:222:9: error: 'struct msghdr' has no member named 'msg_iovlen'
      msg.msg_iovlen = 1;
         ^
make[3]: *** [/tmp/buildroot-git/output/build/linux-fusion-9.0.3/one/one_udp.o] Error 1
make[3]: *** Waiting for unfinished jobs....
make[2]: *** [_module_/tmp/buildroot-git/output/build/linux-fusion-9.0.3/one] Error 2
make[2]: Leaving directory `/tmp/buildroot-git/output/build/linux-4.3.3'
make[1]: *** [modules] Error 2
make[1]: Leaving directory `/tmp/buildroot-git/output/build/linux-fusion-9.0.3'
make: *** [/tmp/buildroot-git/output/build/linux-fusion-9.0.3/.stamp_built] Error 2


Regards.
