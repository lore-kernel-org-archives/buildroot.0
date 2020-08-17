From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 17 Aug 2020 23:33:10 +0200
Subject: [Buildroot] OpenSSH login problem
In-Reply-To: <52-5f356200-5-2c492440@36238474>
References: <cc86bfd55f944197bcd610626edecf2f@go-sys.de>
 <52-5f356200-5-2c492440@36238474>
Message-ID: <20200817233310.0e513ec1@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Michael (Fischer),

On Thu, 13 Aug 2020 17:54:31 +0200, Michael Nosthoff via buildroot <buildroot@busybox.net> wrote:

> Hi,
>
> I try to rephrase what you did to see if I understood it correctly:
>
> You built a Raspberry Pi BR Image based on commit 01632805ab4be2bea4010ba1e46ab71f52d175a9
> from the Buildroot git. OpenSSH works.
> Then you did a git pull, did a "make clean && make" and with the resulting image you can't login via ssh.
>
> Is this correct?
>
> This assumed I tried the following:
>
> git log --oneline  01632805ab4be2bea4010ba1e46ab71f52d175a9..origin/master
> (origin/master is currently at d1d89d37c02e3d8224fb6f812e87fef5612a771a)
>
> From the result I can tell that the OpenSSH package hasn't changed. So it has to be some lib
> or something in the Filesystem.
>
> One commit that looks like it could be the troublemaker is:
>
> 060599fc23 package/rpi-userland: bump version to 188d3bf
>
> But else this might be a good idea to try to debug using git bisect and move through the tree to see
> when it breaks.
>
> I don't really have a Pi at hand right now. But to reproduce someone would need a minimal BR configuration
> which shows the issue. Can you provide that?

Could not reproduce the problem on RPi3 Model B+ with the following defconfig
(with buildroot-master up to commit d1c3f077e24a41f004945f94aceb6f059c58e423):

BR2_arm=y
BR2_cortex_a53=y
BR2_ARM_FPU_NEON_VFPV4=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_SYSTEM_DHCP="eth0"
BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,1c64f4bc22811d2d371b271daa3fb27895a8abdd)/linux-1c64f4bc22811d2d371b271daa3fb27895a8abdd.tar.gz"
BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2710-rpi-3-b bcm2710-rpi-3-b-plus bcm2710-rpi-cm3"
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_PACKAGE_STRACE=y
BR2_PACKAGE_RPI_FIRMWARE=y
BR2_PACKAGE_OPENSSH=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
# BR2_TARGET_ROOTFS_TAR is not set
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y


Mind to share your .config/defconfig file? Which (exact) hardware do you use?

Regards,
Peter


>
> Regards,
> Michael
>
>
> On Thursday, August 13, 2020 16:51 CEST, Michael Fischer <mf@go-sys.de> wrote:
>
> > Hi Michael,
> >  here is the log, the connection is closed from the server.
> >
> > PS: All settings between the commits are the same.
> > The difference between this is only a git pull.
> >
> >
> > OpenSSH_8.3p1, OpenSSL 1.1.1g  21 Apr 2020
> > debug1: Reading configuration data /etc/ssh/ssh_config
> > debug1: /etc/ssh/ssh_config line 20: Applying options for *
> > debug1: Connecting to 192.168.1.194 [192.168.1.194] port 22.
> > debug1: Connection established.
> > debug1: identity file /root/.ssh/id_rsa type -1
> > debug1: identity file /root/.ssh/id_rsa-cert type -1
> > debug1: identity file /root/.ssh/id_dsa type -1
> > debug1: identity file /root/.ssh/id_dsa-cert type -1
> > debug1: identity file /root/.ssh/id_ecdsa type -1
> > debug1: identity file /root/.ssh/id_ecdsa-cert type -1
> > debug1: identity file /root/.ssh/id_ecdsa_sk type -1
> > debug1: identity file /root/.ssh/id_ecdsa_sk-cert type -1
> > debug1: identity file /root/.ssh/id_ed25519 type -1
> > debug1: identity file /root/.ssh/id_ed25519-cert type -1
> > debug1: identity file /root/.ssh/id_ed25519_sk type -1
> > debug1: identity file /root/.ssh/id_ed25519_sk-cert type -1
> > debug1: identity file /root/.ssh/id_xmss type -1
> > debug1: identity file /root/.ssh/id_xmss-cert type -1
> > debug1: Local version string SSH-2.0-OpenSSH_8.3
> > debug1: Remote protocol version 2.0, remote software version OpenSSH_8.3
> > debug1: match: OpenSSH_8.3 pat OpenSSH* compat 0x04000000
> > debug1: Authenticating to 192.168.1.194:22 as 'root'
> > debug1: SSH2_MSG_KEXINIT sent
> > debug1: SSH2_MSG_KEXINIT received
> > debug1: kex: algorithm: curve25519-sha256
> > debug1: kex: host key algorithm: ecdsa-sha2-nistp256
> > debug1: kex: server->client cipher: chacha20-poly1305 at openssh.com MAC: <implicit> compression: none
> > debug1: kex: client->server cipher: chacha20-poly1305 at openssh.com MAC: <implicit> compression: none
> > debug1: kex: curve25519-sha256 need=64 dh_need=64
> > debug1: kex: curve25519-sha256 need=64 dh_need=64
> > debug1: expecting SSH2_MSG_KEX_ECDH_REPLY
> > debug1: Server host key: ecdsa-sha2-nistp256 SHA256:RCq6wRn5ZZrwZ7wY84zaMFMdG1mhIorheFPFhbwBz+0
> > debug1: Host '[192.168.1.194]:22' is known and matches the ECDSA host key.
> > debug1: Found key in /root/.ssh/known_hosts:1
> > debug1: rekey out after 134217728 blocks
> > debug1: SSH2_MSG_NEWKEYS sent
> > debug1: expecting SSH2_MSG_NEWKEYS
> > debug1: SSH2_MSG_NEWKEYS received
> > debug1: rekey in after 134217728 blocks
> > debug1: Will attempt key: /root/.ssh/id_rsa
> > debug1: Will attempt key: /root/.ssh/id_dsa
> > debug1: Will attempt key: /root/.ssh/id_ecdsa
> > debug1: Will attempt key: /root/.ssh/id_ecdsa_sk
> > debug1: Will attempt key: /root/.ssh/id_ed25519
> > debug1: Will attempt key: /root/.ssh/id_ed25519_sk
> > debug1: Will attempt key: /root/.ssh/id_xmss
> > debug1: SSH2_MSG_EXT_INFO received
> > debug1: kex_input_ext_info: server-sig-algs=<ssh-ed25519,sk-ssh-ed25519 at openssh.com,ssh-rsa,rsa-sha2-256,rsa-sha2-512,ssh-dss,ecdsa-sha2-nistp256,ecdsa-sha2-nistp384,ecdsa-sha2-nistp521,sk-ecdsa-sha2-nistp256@openssh.com>
> > debug1: SSH2_MSG_SERVICE_ACCEPT received
> > Connection closed by 192.168.1.194 port 22
> >
> > Regards,
> >   Michael.
> >
> >
> > > On Thursday, August 13, 2020 16:35 CEST, Michael Nosthoff <buildroot@heine.tech>
> > > wrote:
> > >
> > > Hi Michael,
> > >
> > > On Thursday, August 13, 2020 15:35 CEST, Michael Fischer <mf@go-sys.de>
> > > wrote:
> > >
> > > > Dear all,
> > > >
> > > > I have a problem with the OpenSSH login on my raspberry.
> > > > I can't login via ssh, after entering the username, the sever closed the
> > > connection.
> > > >
> > > > I have checked it with the commit
> > > 01632805ab4be2bea4010ba1e46ab71f52d175a9 and this version works with
> > > the same configuration.
> > > > The actual commit doesn't work but  both commits have the same OpenSSH
> > > version.
> > > >
> > > > OpenSSH Version is:  OpenSSH_8.3p1, OpenSSL 1.1.1g  21 Apr 2020
> > > >
> > > > My SSHD logofile:
> > > >
> > > > debug2: parse_server_config_depth: config reprocess config len 236
> > > > debug3: auth_shadow_acctexpired: today 18487 sp_expire -1 days left -
> > > 18488
> > > > debug3: account expiration disabled
> > > > debug3: mm_answer_pwnamallow: sending MONITOR_ANS_PWNAM: 1
> > > > debug3: mm_request_send entering: type 9
> > > > debug2: monitor_read: 8 used once, disabling now
> > > > debug2: input_userauth_request: setting up authctxt for root [preauth]
> > > > debug3: mm_inform_authserv entering [preauth]
> > > > debug3: mm_request_send entering: type 4 [preauth]
> > > > debug2: input_userauth_request: try method none [preauth]
> > > > debug3: mm_request_receive entering
> > > > debug3: monitor_read: checking request 4
> > > > debug3: mm_answer_authserv: service=ssh-connection, style=
> > > > debug2: monitor_read: 4 used once, disabling now
> > > > debug3: user_specific_delay: user specific delay 0.000ms [preauth]
> > > > debug3: ensure_minimum_time_since: elapsed 10.528ms, delaying
> > > 10.089ms (requested 5.154ms) [preauth]
> > > > debug1: monitor_read_log: child log fd closed
> > > > debug3: mm_request_receive entering
> > > > debug1: do_cleanup
> > > > debug1: Killing privsep child 390
> > > >
> > > > I don't know what is going wrong.
> > > > Console login works and ftp also.
> > > >
> > > > Any help is welcome, I have no more idea where to look.
> > > >
> > >
> > > Could you run the Client with the -v flag? So you could see if actually the client
> > > or the server is closing the connection.
> > > A pretty common problem is often a mismatch in available authentication
> > > mechanisms (commonly "publickey,password").
> > >
> > > Also what sometimes is an issue is the permissions of the users .ssh folder on
> > > the server side.
> > > If it is globally readable sshd in many configurations refuses to authenticate
> > > against it.
> > >
> > > Regards,
> > > Michael
> > >
> > > >
> > > > thanks,
> > > >   Michael.
> > > >
> > > > _______________________________________________
> > > > buildroot mailing list
> > > > buildroot at busybox.net
> > > > http://lists.busybox.net/mailman/listinfo/buildroot
> > >
> > >
> > >
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
