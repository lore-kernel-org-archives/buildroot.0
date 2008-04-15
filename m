From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Tue, 15 Apr 2008 12:56:26 +0200
Subject: [Buildroot] Can't compile NSF mounts
References: <005601c89afa$bdfe24b0$ad289e86@LPSC0173W>
Message-ID: <02fb01c89ee7$5d21f680$ad289e86@LPSC0173W>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> mount.c:(.text.singlemount+0xf14): undefined reference to `clnt_sperror'
[...]

The solution was a simple "rm -rf toolchain_build_powerpc" when compiling 
from buildroot.

But I still have NFS woes, a bit off-topic for the busybox mailing list, so 
I'll crosspost to buildroot at uclibc.org, I hope it's OK.

Briefly put: I can't mount mount my root filesystem off NFS and I can't 
event do a normal mount.

/etc/exports on the host contains:
/home/guinevere/prj/buildroot/project_build_powerpc/genepy/root 
*(rw,async,no_all_squash,no_root_squash)
(note that some of the path is a "ln -s", don't know if it can be a problem)

I can mount it fine on a different PC with this in the /etc/fstab:
192.168.1.185:/home/guinevere/prj/buildroot/project_build_powerpc/genepy/root 
/media/loop nfs wsize=1024,rsize=1024,hard,intr,rw 0 0

When I try to mount it on my target board:
$ mount /media/loop
[  922.797996] rpcbind: server localhost not responding, timed out
[  922.853581] RPC: failed to contact local rpcbind server (errno 5).
[  957.926565] rpcbind: server localhost not responding, timed out
[  957.982067] RPC: failed to contact local rpcbind server (errno 5).
[  993.055133] rpcbind: server localhost not responding, timed out
[  993.110661] RPC: failed to contact local rpcbind server (errno 5).
mount: mounting 
192.168.1.185:/home/guinevere/prj/buildroot/project_build_powerpc/genepy/root 
on /media/
loop failed: Input/output error

And in the meanwhile I see this in the log of my host:
Apr 15 12:40:58 lpsc6185x mountd[6261]: authenticated mount request from 
192.168.1.200:804 for 
/home/guinevere/Min_UartLite_NetLite_Ace/buildroot/project_build_powerpc/genepy/root 
(/home/guinevere/Min_UartLite_NetLite_Ace/buildroot/project_build_powerpc/genepy/root)

I've enabled every RPC related stuff in buildroot/kernel (I don't know if 
all are necessary):
$ egrep "RPC|NFS" `find -name .config`
linux-2.6.24-xlnx/.config:# CONFIG_AF_RXRPC is not set
linux-2.6.24-xlnx/.config:CONFIG_NFS_FS=y
linux-2.6.24-xlnx/.config:CONFIG_NFS_V3=y
linux-2.6.24-xlnx/.config:# CONFIG_NFS_V3_ACL is not set
linux-2.6.24-xlnx/.config:# CONFIG_NFS_V4 is not set
linux-2.6.24-xlnx/.config:# CONFIG_NFS_DIRECTIO is not set
linux-2.6.24-xlnx/.config:# CONFIG_NFSD is not set
linux-2.6.24-xlnx/.config:CONFIG_ROOT_NFS=y
linux-2.6.24-xlnx/.config:CONFIG_NFS_COMMON=y
linux-2.6.24-xlnx/.config:CONFIG_SUNRPC=y
linux-2.6.24-xlnx/.config:# CONFIG_SUNRPC_BIND34 is not set
linux-2.6.24-xlnx/.config:# CONFIG_RPCSEC_GSS_KRB5 is not set
linux-2.6.24-xlnx/.config:# CONFIG_RPCSEC_GSS_SPKM3 is not set
buildroot/project_build_powerpc/genepy/busybox-1.10.0/.config:CONFIG_FEATURE_HAVE_RPC=y
buildroot/project_build_powerpc/genepy/busybox-1.10.0/.config:CONFIG_FEATURE_MOUNT_NFS=y
buildroot/project_build_powerpc/genepy/busybox-1.10.0/.config:CONFIG_FEATURE_INETD_RPC=y
buildroot/.config:BR2_INET_RPC=y
buildroot/.config:# BR2_PACKAGE_NFS_UTILS is not set
buildroot/toolchain_build_powerpc/uClibc-0.9.29/.config:UCLIBC_HAS_RPC=y
buildroot/toolchain_build_powerpc/uClibc-0.9.29/.config:UCLIBC_HAS_FULL_RPC=y
buildroot/toolchain_build_powerpc/uClibc-0.9.29/.config:UCLIBC_HAS_REENTRANT_RPC=y


Thanks
-- 
Guillaume Dargaud
http://www.gdargaud.net/
