From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 17 Apr 2021 00:02:57 +0200
Subject: [Buildroot] sshd reports error in libcrypto while trying to
 read host key
In-Reply-To: <DM6PR08MB442526A0F6C1B531DC2480B7AE4C9@DM6PR08MB4425.namprd08.prod.outlook.com>
References: <DM6PR08MB4425422C1100F44BFF129275AE7C9@DM6PR08MB4425.namprd08.prod.outlook.com>
 <20210408235226.153250d5@gmx.net>
 <DM6PR08MB442526A0F6C1B531DC2480B7AE4C9@DM6PR08MB4425.namprd08.prod.outlook.com>
Message-ID: <20210417000257.1fef7f4e@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Michael,

On Fri, 16 Apr 2021 20:07:21 +0000, Michael John <MJohn@midmark.com> wrote:

> Hello Peter,
> 
> >Hello Michael,
> >
> >On Wed, 31 Mar 2021 14:12:15 +0000, Michael John <MJohn@midmark.com> wrote:
> >  
> >> Hello,
> >>
> >> I?ve built openssh and I?m having some issues running it on my board. While running sshd it reports an error in libcrypto while trying to read the host key. The host keys are generated under /etc/ssh.
> >>  
> >> ~> ls /etc/ssh  
> >> moduli                                 ssh_host_ecdsa_key                    ssh_host_rsa_key
> >> ssh_config                           ssh_host_ecdsa_key.pub           ssh_host_rsa_key.pub
> >> ssh_host_dsa_key             ssh_host_ed25519_key              sshd_config
> >> ssh_host_dsa_key.pub     ssh_host_ed25519_key.pub
> >>  
> >> ~> systemctl status sshd  
> >> ? sshd.service - OpenSSH server daemon
> >>      Loaded: loaded (/usr/lib/systemd/system/sshd.service; enabled; vendor preset: enabled)
> >>      Active: failed (Result: exit-code) since Wed 2021-03-31 13:21:02 UTC; 11s ago
> >>     Process: 315 ExecStartPre=/usr/bin/ssh-keygen -A (code=exited, status=0/SUCCESS)
> >>     Process: 341 ExecStart=/usr/sbin/sshd -D -e (code=exited, status=1/FAILURE)
> >>    Main PID: 341 (code=exited, status=1/FAILURE)
> >>
> >> Mar 31 13:20:51 cm1sd systemd[1]: Starting OpenSSH server daemon...
> >> Mar 31 13:20:54 cm1sd systemd[1]: Started OpenSSH server daemon.
> >> Mar 31 13:21:02 cm1sd sshd[341]: Unable to load host key
> >> "/etc/ssh/ssh_host_rsa_key": error in libcrypto Mar 31 13:21:02 cm1sd
> >> sshd[341]: Unable to load host key: /etc/ssh/ssh_host_rsa_key Mar 31 13:21:02 cm1sd sshd[341]: sshd: no hostkeys available -- exiting.
> >> Mar 31 13:21:02 cm1sd systemd[1]: sshd.service: Main process exited,
> >> code=exited, status=1/FAILURE Mar 31 13:21:02 cm1sd systemd[1]: sshd.service: Failed with result 'exit-code'.
> >>
> >> I?m using:
> >> openssh version 8.5p1
> >> openssl version 1.1.1k
> >> crpytodev-linux fabe5989a3d
> >>
> >> Is there an issue using this combination of packages? These are the lastest versions in buildroot.
> >>
> >> My config file (sshd_config) is only trying to load the host key for RSA, but I get the same error about libcrypto for ecdsa and ed25519.
> >>
> >> Anyone see this issue as well? Any help is appreciated.  
> >
> > You can try to run sshd with strace to get a clue about the failing syscall (in case this is the reason) in libcrypto....
> >
> > Which hardware and which (hardware) crypto device?
> >
> > Regards,
> > Peter
> >  
> >>
> >> Thanks.
> >> -Michael
> >>  
> 
> Here is the tail of the strace output:
> 
> mmap2(0xb6b2f000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x8000) = 0xb6b2f000
> mmap2(0xb6b31000, 21260, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xb6b31000
> close(3)                                = 0
> mprotect(0xb6b2f000, 4096, PROT_READ)   = 0
> openat(AT_FDCWD, "/etc/passwd", O_RDONLY|O_CLOEXEC) = 3
> _llseek(3, 0, [0], SEEK_CUR)            = 0
> fstat64(3, {st_mode=S_IFREG|0644, st_size=826, ...}) = 0
> read(3, "root:x:0:0:root:/root:/usr/bin/e"..., 1024) = 826
> close(3)                                = 0
> openat(AT_FDCWD, "/etc/ssh/ssh_host_rsa_key", O_RDONLY|O_LARGEFILE) = 3
> fstat64(3, {st_mode=S_IFREG|0600, st_size=2590, ...}) = 0
> getuid32()                              = 0
> fstat64(3, {st_mode=S_IFREG|0600, st_size=2590, ...}) = 0
> read(3, "-----BEGIN OPENSSH PRIVATE KEY--"..., 4096) = 2590
> read(3, "", 1506)                       = 0
> read(3, "", 4096)                       = 0
> getpid()                                = 719
> ioctl(4, _IOC(_IOC_READ|_IOC_WRITE, 0x63, 0x66, 0x1c), 0x23e8798) = -1 EBADF (Bad file descriptor)
> ioctl(4, _IOC(_IOC_WRITE, 0x63, 0x67, 0x4), 0x23e1ca8) = -1 EBADF (Bad file descriptor)
> ioctl(4, _IOC(_IOC_WRITE, 0x63, 0x67, 0x4), 0x23e2080) = -1 EBADF (Bad file descriptor)
> ioctl(4, _IOC(_IOC_WRITE, 0x63, 0x67, 0x4), 0x23e87b0) = -1 EBADF (Bad file descriptor)

Can you search for the corresponding 'open(...) = 4' which file the file descriptor
belongs (or belonged) to? Would suspect your crypto hardware device '/dev/...' file...

Wait a moment, I get the same failure here (RPi0w), according to
build/cryptodev-linux-fabe5989a3dc9fba0cd0a40b612247cdde351c01/README you
can enable cryptodev logging via

	$ sysctl ioctl.cryptodev_verbosity=3

and another (failing) run of sshd gives

	$ dmesg
[   26.069137] cryptodev: loading out-of-tree module taints kernel.
[   26.082646] cryptodev: driver 1.11 loaded.
[  293.113559] cryptodev: sshd[345] (cryptodev_open:525): allocated new item at 3d0bde58
[  293.113597] cryptodev: sshd[345] (cryptodev_open:525): allocated new item at 0c134c14
[  293.113620] cryptodev: sshd[345] (cryptodev_open:525): allocated new item at 7617e45f
[  293.113640] cryptodev: sshd[345] (cryptodev_open:525): allocated new item at 76de8bfe
[  293.113660] cryptodev: sshd[345] (cryptodev_open:525): allocated new item at d82d7450
[  293.113679] cryptodev: sshd[345] (cryptodev_open:525): allocated new item at 305fca08
[  293.113701] cryptodev: sshd[345] (cryptodev_open:525): allocated new item at 413b2286
[  293.113727] cryptodev: sshd[345] (cryptodev_open:525): allocated new item at 2d346c3e
[  293.113749] cryptodev: sshd[345] (cryptodev_open:525): allocated new item at 04de1c1b
[  293.113769] cryptodev: sshd[345] (cryptodev_open:525): allocated new item at 6407ed5b
[  293.113788] cryptodev: sshd[345] (cryptodev_open:525): allocated new item at 514f4dcd
[  293.113810] cryptodev: sshd[345] (cryptodev_open:525): allocated new item at 0c09d977
[  293.113830] cryptodev: sshd[345] (cryptodev_open:525): allocated new item at 55c5f1b5
[  293.113850] cryptodev: sshd[345] (cryptodev_open:525): allocated new item at 6bff11bf
[  293.113870] cryptodev: sshd[345] (cryptodev_open:525): allocated new item at 87f9d9e6
[  293.113890] cryptodev: sshd[345] (cryptodev_open:525): allocated new item at 1726e6b9
[  293.113909] cryptodev: sshd[345] (cryptodev_open:529): Cryptodev handle initialised, 16 elements in queue
[  293.120614] cryptodev: sshd[345] (crypto_create_session:300): got alignmask 0
[  293.120649] cryptodev: sshd[345] (crypto_create_session:303): preallocating for 32 user pages
[  293.121243] cryptodev: sshd[345] (crypto_destroy_session:358): Removed session 0x58F7EA46
[  293.121282] cryptodev: sshd[345] (crypto_destroy_session:361): freeing space for 32 user pages
[  293.121883] cryptodev: sshd[345] (crypto_create_session:300): got alignmask 0
[  293.121911] cryptodev: sshd[345] (crypto_create_session:303): preallocating for 32 user pages
[  293.122471] cryptodev: sshd[345] (crypto_destroy_session:358): Removed session 0xFF3B568E
[  293.122509] cryptodev: sshd[345] (crypto_destroy_session:361): freeing space for 32 user pages
[  293.714449] cryptodev: sshd[345] (cryptodev_cipher_init:156): Failed to load cipher cbc(blowfish)
[  293.714488] cryptodev: sshd[345] (crypto_create_session:264): Failed to load cipher for cbc(blowfish)

[...]

[  294.328797] cryptodev: sshd[345] (cryptodev_cipher_init:156): Failed to load cipher cbc(camellia)
[  294.328835] cryptodev: sshd[345] (crypto_create_session:264): Failed to load cipher for cbc(camellia)
[  294.919951] cryptodev: sshd[345] (cryptodev_cipher_init:156): Failed to load cipher cbc(camellia)
[  294.919988] cryptodev: sshd[345] (crypto_create_session:264): Failed to load cipher for cbc(camellia)
[  295.510857] cryptodev: sshd[345] (cryptodev_cipher_init:156): Failed to load cipher cbc(camellia)
[  295.510896] cryptodev: sshd[345] (crypto_create_session:264): Failed to load cipher for cbc(camellia)

[...]

[  295.816778] cryptodev: sshd[345] (cryptodev_hash_init:360): Failed to load transform for rmd160
[  295.816815] cryptodev: sshd[345] (crypto_create_session:287): Failed to load hash for rmd160

[...]

[  295.944596] cryptodev: sshd[345] (cryptodev_release:585): Cryptodev handle deinitialised, 16 elements freed

And here

	$ grep BLOWFISH build/linux-custom/.config
# CONFIG_CRYPTO_BLOWFISH is not set
	$ grep CAMELLIA build/linux-custom/.config
# CONFIG_CRYPTO_CAMELLIA is not set

Seems the kernel module cryptodev.ko needs some more kernel options enabled...

Regards,
Peter


> close(3)                                = 0
> write(2, "Unable to load host key \"/etc/ss"..., 73Unable to load host key "/etc/ssh/ssh_host_rsa_key": error in libcrypto
> ) = 73
> openat(AT_FDCWD, "/etc/ssh/ssh_host_rsa_key", O_RDONLY|O_LARGEFILE) = 3
> fstat64(3, {st_mode=S_IFREG|0600, st_size=2590, ...}) = 0
> read(3, "-----BEGIN OPENSSH PRIVATE KEY--"..., 1024) = 1024
> close(3)                                = 0
> openat(AT_FDCWD, "/etc/ssh/ssh_host_rsa_key.pub", O_RDONLY|O_LARGEFILE) = 3
> fstat64(3, {st_mode=S_IFREG|0644, st_size=564, ...}) = 0
> read(3, "ssh-rsa AAAAB3NzaC1yc2EAAAADAQAB"..., 1024) = 564
> close(3)                                = 0
> write(2, "Unable to load host key: /etc/ss"..., 52Unable to load host key: /etc/ssh/ssh_host_rsa_key
> ) = 52
> ioctl(4, _IOC(_IOC_READ|_IOC_WRITE, 0x63, 0x66, 0x1c), 0x23e6d78) = -1 EBADF (Bad file descriptor)
> ioctl(4, _IOC(_IOC_WRITE, 0x63, 0x67, 0x4), 0x23e6d90) = -1 EBADF (Bad file descriptor)
> write(2, "accumulate_host_timing_secret: s"..., 49accumulate_host_timing_secret: ssh_digest_start
> ) = 49
> exit_group(255)                         = ?
> +++ exited with 255 +++
> 
> Thanks,
> -Michael
> 
> CONFIDENTIALITY NOTICE: This message, including any attachments, contains confidential information intended for a specific individual and purpose. If you are not the intended recipient, you should delete this message and any disclosure, copying, or distribution of this message, or the taking of any action based on it, by you is strictly prohibited.
