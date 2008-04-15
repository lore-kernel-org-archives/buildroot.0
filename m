From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Tue, 15 Apr 2008 14:30:55 +0200
Subject: [Buildroot] Can't compile NSF mounts
References: <005601c89afa$bdfe24b0$ad289e86@LPSC0173W>
	<02fb01c89ee7$5d21f680$ad289e86@LPSC0173W>
	<48048C8E.50006@gmail.com>
Message-ID: <030801c89ef4$901679a0$ad289e86@LPSC0173W>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Have you installed/enabled portmap and friends?

On the host I have
$ cat /etc/hosts.allow
portmap: 192.168.1.200


On the target board:
# cat /etc/hosts.allow
portmap: 192.168.1.185

# ps
PID   USER     COMMAND
    1 root     init
    2 root     [kthreadd]
    3 root     [ksoftirqd/0]
    4 root     [watchdog/0]
    5 root     [events/0]
    6 root     [khelper]
   27 root     [kblockd/0]
   47 root     [pdflush]
   48 root     [pdflush]
   49 root     [kswapd0]
   50 root     [aio/0]
  157 root     [rpciod/0]
  169 daemon   portmap
  188 root     /usr/sbin/dropbear
  191 root     -sh
  192 root     /sbin/syslogd -n -m 0
  193 root     /sbin/klogd -n
  197 root     ps

# ll /etc/init.d
drwxr-xr-x    3 root     root         1024 Apr 15  2008 ./
drwxr-xr-x    7 root     root         1024 Dec 31 17:02 ../
drwxr-xr-x    6 root     root         1024 Apr 11  2008 .svn/
-rwxr-xr-x    1 root     root          532 Apr 15  2008 S13portmap*
-rwxr-xr-x    1 root     root         1365 Apr 11  2008 S20urandom*
-rwxr-xr-x    1 root     root          340 Apr 11  2008 S40network*
-rwxr-xr-x    1 root     root         1092 Apr 11  2008 S50dropbear*
-rwxr-xr-x    1 root     root          969 Apr 11  2008 S99at*
-rwxr-xr-x    1 root     root          408 Apr 11  2008 rcS*



If I try to mount it as / during boot:
Linux/PPC load: console=ttyUL0,9600 root=/dev/nfs rw ip=on 
nfsroot=192.168.1.185:/home/guinevere/prj/buildroot/project_build_powerpc/genepy/root
Uncompressing Linux...done.
[...]
[    4.089232] TCP cubic registered
[    4.126816] NET: Registered protocol family 1
[    4.178834] NET: Registered protocol family 17
[    4.232919] RPC: Registered udp transport module.
[    4.288086] RPC: Registered tcp transport module.
[    5.851503] Sending DHCP requests ..,. OK
[   12.450875] IP-Config: Got DHCP answer from 0.0.0.0, my address is 
192.168.1.200
[   12.524428] IP-Config: Complete:
[   12.560324]       device=eth0, addr=192.168.1.200, mask=255.255.255.0, 
gw=192.168.1.185,
[   12.656078]      host=genepy, domain=, nis-domain=(none),
[   12.720738]      bootserver=0.0.0.0, rootserver=192.168.1.185, 
rootpath=/home/guinevere/prj/buildroot
/project_build_powerpc/genepy/root/dev
[   12.875318] Looking up port of RPC 100003/2 on 192.168.1.185
[   17.939272] Looking up port of RPC 100005/1 on 192.168.1.185
[   40.724135] nfs: server 192.168.1.185 not responding, timed out
[   40.779925] VFS: Unable to mount root fs via NFS, trying floppy.
[   40.853703] VFS: Cannot open root device "nfs" or unknown-block(2,0)
[   40.927506] Please append a correct "root=" boot option; here are the 
available partitions:
[   41.027535] fe00     507024 xsa (driver?)
[   41.075230]   fe01      98248 xsa1
[   41.115914]   fe02     402192 xsa2
[   41.156546] Kernel panic - not syncing: VFS: Unable to mount root fs on 
unknown-block(2,0)
[   41.255578] Rebooting in 180 seconds..
equests ..,. OK
[   12.450875] IP-Config: Got DHCP answer from 0.0.0.0, my address is 
192.168.1.200
[   12.524428] IP-Config: Complete:
[   12.560324]       device=eth0, addr=192.168.1.200, mask=255.255.255.0, 
gw=192.168.1.185,
[   12.656078]      host=genepy, domain=, nis-domain=(none),
[   12.720738]      bootserver=0.0.0.0, rootserver=192.168.1.185, 
rootpath=/home/guinevere/prj/buildroot
/project_build_powerpc/genepy/root/dev
[   12.875318] Looking up port of RPC 100003/2 on 192.168.1.185
[   17.939272] Looking up port of RPC 100005/1 on 192.168.1.185
[   40.724135] nfs: server 192.168.1.185 not responding, timed out
[   40.779925] VFS: Unable to mount root fs via NFS, trying floppy.
[   40.853703] VFS: Cannot open root device "nfs" or unknown-block(2,0)
[   40.927506] Please append a correct "root=" boot option; here are the 
available partitions:
[   41.027535] fe00     507024 xsa (driver?)
[   41.075230]   fe01      98248 xsa1
[   41.115914]   fe02     402192 xsa2
[   41.156546] Kernel panic - not syncing: VFS: Unable to mount root fs on 
unknown-block(2,0)
[   41.255578] Rebooting in 180 seconds..
-- 
Guillaume Dargaud
http://www.gdargaud.net/
