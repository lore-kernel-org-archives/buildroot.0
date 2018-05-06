From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 06 May 2018 10:32:11 +0200
Subject: [Buildroot] boot failure
In-Reply-To: <CO2PR01MB197635D773CF49B7A8986DEFCC840@CO2PR01MB1976.prod.exchangelabs.com>
 (Enoch W.'s message of "Sun, 6 May 2018 07:04:51 +0000")
References: <CO2PR01MB197635D773CF49B7A8986DEFCC840@CO2PR01MB1976.prod.exchangelabs.com>
Message-ID: <87po29qj5g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Enoch" == Enoch W <ixew@hotmail.com> writes:

 > Hi,
 > Recent buildroot versions, updated from git master, start getting stuck with:

 > random: dropbear: uninitialized urandom read (32 bytes read)

This normally means that something (in this case dropbear) tries to get
/dev/{,u}random data from the kernel very early.

What is your configuration / what have you customized related to
dropbear? We by default run dropbear with the -R option to only generate
the host keys on the first connection, so this shouldn't happen.

I can also not reproduce it here:

Initializing random number generator... done.
Starting network: 8139cp 0000:00:0c.0 eth0: link up, 100Mbps, full-duplex, lpa 0x05E1
udhcpc: started, v1.28.3
udhcpc: sending discover
udhcpc: sending select for 10.0.2.15
udhcpc: lease of 10.0.2.15 obtained, lease time 86400
deleting routers
adding dns 10.0.2.3
OK
Starting dropbear sshd: OK

Welcome to Buildroot
buildroot login:


Looking closer, I do see that dropbear indeed tries to read 32 bytes
from /dev/urandom at startup. I'm not sure if that is something new or
if it has always been like that. You better ask on the dropbear mailing
list (dropbear at ucc.asn.au) for more details:

# strace -e open,read,getrandom dropbear -R -F
open("/lib//libc.so.0", O_RDONLY)       = 3
read(3, "\177ELF\1\1\1\0\0\0\0\0\0\0\0\0\3\0(\0\1\0\0\0 \343\0\0004\0\0\0"..., 4096) = 4096
open("/etc/dropbear/dropbear_rsa_host_key", O_RDONLY|O_LARGEFILE) = -1 ENOENT (No such file or directory)
open("/etc/dropbear/dropbear_dss_host_key", O_RDONLY|O_LARGEFILE) = -1 ENOENT (No such file or directory)
open("/etc/dropbear/dropbear_ecdsa_host_key", O_RDONLY|O_LARGEFILE) = -1 ENOENT (No such file or directory)
open("/dev/urandom", O_RDONLY|O_LARGEFILE) = 3
read(3, "\35=\2109\343Z(\251\325\211F0o'*\206s\247\242\336\336\313\207\262\273W\260:j\32\370\270", 32) = 32

-- 
Bye, Peter Korsgaard
