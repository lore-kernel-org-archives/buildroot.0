From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 21 Apr 2021 00:21:41 +0200
Subject: [Buildroot] sshd reports error in libcrypto while trying to
 read host key
In-Reply-To: <DM6PR08MB442588F094FC4CB27C189B5FAE489@DM6PR08MB4425.namprd08.prod.outlook.com>
References: <DM6PR08MB4425422C1100F44BFF129275AE7C9@DM6PR08MB4425.namprd08.prod.outlook.com>
 <20210408235226.153250d5@gmx.net>
 <DM6PR08MB442526A0F6C1B531DC2480B7AE4C9@DM6PR08MB4425.namprd08.prod.outlook.com>
 <20210417000257.1fef7f4e@gmx.net>
 <DM6PR08MB442588F094FC4CB27C189B5FAE489@DM6PR08MB4425.namprd08.prod.outlook.com>
Message-ID: <20210421002141.43e84571@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Michael,

On Tue, 20 Apr 2021 14:13:07 +0000, Michael John <MJohn@midmark.com> wrote:

> Hello Peter,
> 
> >
> > Hello Michael,
> >
> > On Fri, 16 Apr 2021 20:07:21 +0000, Michael John
> > <MJohn@midmark.com> wrote:
> >  
> > > Hello Peter,
> > >  
> > > >Hello Michael,
> > > >
> > > >On Wed, 31 Mar 2021 14:12:15 +0000, Michael John  
> > <MJohn@midmark.com> wrote:  
> > > >  
> > > >> Hello,
> > > >>
> > > >> I?ve built openssh and I?m having some issues running it on my  
> > board. While running sshd it reports an error in libcrypto while trying to
> > read the host key. The host keys are generated under /etc/ssh.  
> > > >>  
> > > >> ~> ls /etc/ssh  
> > > >> moduli                                 ssh_host_ecdsa_key  
> > ssh_host_rsa_key  
> > > >> ssh_config                           ssh_host_ecdsa_key.pub  
> > ssh_host_rsa_key.pub  
> > > >> ssh_host_dsa_key             ssh_host_ed25519_key              sshd_config
> > > >> ssh_host_dsa_key.pub     ssh_host_ed25519_key.pub
> > > >>  
> > > >> ~> systemctl status sshd  
> > > >> ? sshd.service - OpenSSH server daemon
> > > >>      Loaded: loaded (/usr/lib/systemd/system/sshd.service;  
> > enabled; vendor preset: enabled)  
> > > >>      Active: failed (Result: exit-code) since Wed 2021-03-31 13:21:02  
> > UTC; 11s ago  
> > > >>     Process: 315 ExecStartPre=/usr/bin/ssh-keygen -A (code=exited,  
> > status=0/SUCCESS)  
> > > >>     Process: 341 ExecStart=/usr/sbin/sshd -D -e (code=exited,  
> > status=1/FAILURE)  
> > > >>    Main PID: 341 (code=exited, status=1/FAILURE)
> > > >>
> > > >> Mar 31 13:20:51 cm1sd systemd[1]: Starting OpenSSH server  
> > daemon...  
> > > >> Mar 31 13:20:54 cm1sd systemd[1]: Started OpenSSH server  
> > daemon.  
> > > >> Mar 31 13:21:02 cm1sd sshd[341]: Unable to load host key
> > > >> "/etc/ssh/ssh_host_rsa_key": error in libcrypto Mar 31 13:21:02
> > > >> cm1sd
> > > >> sshd[341]: Unable to load host key: /etc/ssh/ssh_host_rsa_key Mar  
> > 31 13:21:02 cm1sd sshd[341]: sshd: no hostkeys available -- exiting.  
> > > >> Mar 31 13:21:02 cm1sd systemd[1]: sshd.service: Main process
> > > >> exited, code=exited, status=1/FAILURE Mar 31 13:21:02 cm1sd  
> > systemd[1]: sshd.service: Failed with result 'exit-code'.  
> > > >>
> > > >> I?m using:
> > > >> openssh version 8.5p1
> > > >> openssl version 1.1.1k
> > > >> crpytodev-linux fabe5989a3d
> > > >>
> > > >> Is there an issue using this combination of packages? These are the  
> > lastest versions in buildroot.  
> > > >>
> > > >> My config file (sshd_config) is only trying to load the host key for  
> > RSA, but I get the same error about libcrypto for ecdsa and ed25519.  
> > > >>
> > > >> Anyone see this issue as well? Any help is appreciated.  
> > > >
> > > > You can try to run sshd with strace to get a clue about the failing  
> > syscall (in case this is the reason) in libcrypto....  
> > > >
> > > > Which hardware and which (hardware) crypto device?
> > > >
> > > > Regards,
> > > > Peter
> > > >  
> > > >>
> > > >> Thanks.
> > > >> -Michael
> > > >>  
> > >
> > > Here is the tail of the strace output:
> > >
> > > mmap2(0xb6b2f000, 8192, PROT_READ|PROT_WRITE,
> > > MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x8000) = 0xb6b2f000  
> > mmap2(0xb6b31000, 21260, PROT_READ|PROT_WRITE,
> > MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xb6b31000  
> > > close(3)                                = 0
> > > mprotect(0xb6b2f000, 4096, PROT_READ)   = 0
> > > openat(AT_FDCWD, "/etc/passwd", O_RDONLY|O_CLOEXEC) = 3
> > > _llseek(3, 0, [0], SEEK_CUR)            = 0
> > > fstat64(3, {st_mode=S_IFREG|0644, st_size=826, ...}) = 0 read(3,
> > > "root:x:0:0:root:/root:/usr/bin/e"..., 1024) = 826
> > > close(3)                                = 0
> > > openat(AT_FDCWD, "/etc/ssh/ssh_host_rsa_key",  
> > O_RDONLY|O_LARGEFILE) =  
> > > 3 fstat64(3, {st_mode=S_IFREG|0600, st_size=2590, ...}) = 0
> > > getuid32()                              = 0
> > > fstat64(3, {st_mode=S_IFREG|0600, st_size=2590, ...}) = 0 read(3,
> > > "-----BEGIN OPENSSH PRIVATE KEY--"..., 4096) = 2590
> > > read(3, "", 1506)                       = 0
> > > read(3, "", 4096)                       = 0
> > > getpid()                                = 719
> > > ioctl(4, _IOC(_IOC_READ|_IOC_WRITE, 0x63, 0x66, 0x1c), 0x23e8798) = -  
> > 1  
> > > EBADF (Bad file descriptor) ioctl(4, _IOC(_IOC_WRITE, 0x63, 0x67,
> > > 0x4), 0x23e1ca8) = -1 EBADF (Bad file descriptor) ioctl(4,
> > > _IOC(_IOC_WRITE, 0x63, 0x67, 0x4), 0x23e2080) = -1 EBADF (Bad file
> > > descriptor) ioctl(4, _IOC(_IOC_WRITE, 0x63, 0x67, 0x4), 0x23e87b0) =
> > > -1 EBADF (Bad file descriptor)  
> >
> > Can you search for the corresponding 'open(...) = 4' which file the file
> > descriptor belongs (or belonged) to? Would suspect your crypto
> > hardware device '/dev/...' file...
> >  
> 
> I'm not seeing any line matching this.
> 
> $ strace /usr/sbin/sshd -D -e | grep open
> openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (No such file or directory)
> openat(AT_FDCWD, "/lib/tls/v7l/vfp/libcrypto.so.1.1", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (No such file or directory)
> openat(AT_FDCWD, "/lib/tls/v7l/libcrypto.so.1.1", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (No such file or directory)
> openat(AT_FDCWD, "/lib/tls/vfp/libcrypto.so.1.1", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (No such file or directory)
> openat(AT_FDCWD, "/lib/tls/libcrypto.so.1.1", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (No such file or directory)
> openat(AT_FDCWD, "/lib/v7l/vfp/libcrypto.so.1.1", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (No such file or directory)
> openat(AT_FDCWD, "/lib/v7l/libcrypto.so.1.1", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (No such file or directory)
> openat(AT_FDCWD, "/lib/vfp/libcrypto.so.1.1", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = -1 ENOENT (No such file or directory)
> openat(AT_FDCWD, "/lib/libcrypto.so.1.1", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
> openat(AT_FDCWD, "/lib/libdl.so.2", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
> openat(AT_FDCWD, "/lib/libutil.so.1", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
> openat(AT_FDCWD, "/lib/libz.so.1", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
> openat(AT_FDCWD, "/lib/libssl.so.1.1", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
> openat(AT_FDCWD, "/lib/libcrypt.so.1", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
> openat(AT_FDCWD, "/lib/libresolv.so.2", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
> openat(AT_FDCWD, "/lib/libc.so.6", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
> openat(AT_FDCWD, "/lib/libatomic.so.1", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
> openat(AT_FDCWD, "/lib/libpthread.so.0", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
> openat(AT_FDCWD, "/dev/null", O_RDWR|O_LARGEFILE) = 3
> openat(AT_FDCWD, "/dev/crypto", O_RDWR|O_LARGEFILE) = 3
> openat(AT_FDCWD, "/etc/ssl/openssl.cnf", O_RDONLY|O_LARGEFILE) = 3
> openat(AT_FDCWD, "/dev/hwrng", O_RDONLY|O_LARGEFILE) = 3
> openat(AT_FDCWD, "/proc/553/fd", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_CLOEXEC|O_DIRECTORY) = 5
> openat(AT_FDCWD, "/etc/ssh/sshd_config", O_RDONLY|O_LARGEFILE) = 3
> openat(AT_FDCWD, "/etc/gai.conf", O_RDONLY|O_CLOEXEC) = -1 ENOENT (No such file or directory)
> openat(AT_FDCWD, "/etc/nsswitch.conf", O_RDONLY|O_CLOEXEC) = 3
> openat(AT_FDCWD, "/lib/libnss_files.so.2", O_RDONLY|O_LARGEFILE|O_CLOEXEC) = 3
> openat(AT_FDCWD, "/etc/passwd", O_RDONLY|O_CLOEXEC) = 3
> openat(AT_FDCWD, "/etc/ssh/ssh_host_rsa_key", O_RDONLY|O_LARGEFILE) = 3
> openat(AT_FDCWD, "/etc/ssh/ssh_host_rsa_key", O_RDONLY|O_LARGEFILE) = 3
> openat(AT_FDCWD, "/etc/ssh/ssh_host_rsa_key.pub", O_RDONLY|O_LARGEFILE) = 3
> 
> crypto device is /dev/crypto
> 
> > Wait a moment, I get the same failure here (RPi0w), according to
> > build/cryptodev-linux-
> > fabe5989a3dc9fba0cd0a40b612247cdde351c01/README you can
> > enable cryptodev logging via
> >
> >         $ sysctl ioctl.cryptodev_verbosity=3
> >
> > and another (failing) run of sshd gives
> >
> >         $ dmesg
> > [   26.069137] cryptodev: loading out-of-tree module taints kernel.
> > [   26.082646] cryptodev: driver 1.11 loaded.
> > [  293.113559] cryptodev: sshd[345] (cryptodev_open:525): allocated
> > new item at 3d0bde58 [  293.113597] cryptodev: sshd[345]
> > (cryptodev_open:525): allocated new item at 0c134c14 [  293.113620]
> > cryptodev: sshd[345] (cryptodev_open:525): allocated new item at
> > 7617e45f [  293.113640] cryptodev: sshd[345] (cryptodev_open:525):
> > allocated new item at 76de8bfe [  293.113660] cryptodev: sshd[345]
> > (cryptodev_open:525): allocated new item at d82d7450 [  293.113679]
> > cryptodev: sshd[345] (cryptodev_open:525): allocated new item at
> > 305fca08 [  293.113701] cryptodev: sshd[345] (cryptodev_open:525):
> > allocated new item at 413b2286 [  293.113727] cryptodev: sshd[345]
> > (cryptodev_open:525): allocated new item at 2d346c3e [  293.113749]
> > cryptodev: sshd[345] (cryptodev_open:525): allocated new item at
> > 04de1c1b [  293.113769] cryptodev: sshd[345] (cryptodev_open:525):
> > allocated new item at 6407ed5b [  293.113788] cryptodev: sshd[345]
> > (cryptodev_open:525): allocated new item at 514f4dcd [  293.113810]
> > cryptodev: sshd[345] (cryptodev_open:525): allocated new item at
> > 0c09d977 [  293.113830] cryptodev: sshd[345] (cryptodev_open:525):
> > allocated new item at 55c5f1b5 [  293.113850] cryptodev: sshd[345]
> > (cryptodev_open:525): allocated new item at 6bff11bf [  293.113870]
> > cryptodev: sshd[345] (cryptodev_open:525): allocated new item at
> > 87f9d9e6 [  293.113890] cryptodev: sshd[345] (cryptodev_open:525):
> > allocated new item at 1726e6b9 [  293.113909] cryptodev: sshd[345]
> > (cryptodev_open:529): Cryptodev handle initialised, 16 elements in
> > queue [  293.120614] cryptodev: sshd[345] (crypto_create_session:300):
> > got alignmask 0 [  293.120649] cryptodev: sshd[345]
> > (crypto_create_session:303): preallocating for 32 user pages [
> > 293.121243] cryptodev: sshd[345] (crypto_destroy_session:358):
> > Removed session 0x58F7EA46 [  293.121282] cryptodev: sshd[345]
> > (crypto_destroy_session:361): freeing space for 32 user pages [
> > 293.121883] cryptodev: sshd[345] (crypto_create_session:300): got
> > alignmask 0 [  293.121911] cryptodev: sshd[345]
> > (crypto_create_session:303): preallocating for 32 user pages [
> > 293.122471] cryptodev: sshd[345] (crypto_destroy_session:358):
> > Removed session 0xFF3B568E [  293.122509] cryptodev: sshd[345]
> > (crypto_destroy_session:361): freeing space for 32 user pages [
> > 293.714449] cryptodev: sshd[345] (cryptodev_cipher_init:156): Failed to
> > load cipher cbc(blowfish) [  293.714488] cryptodev: sshd[345]
> > (crypto_create_session:264): Failed to load cipher for cbc(blowfish)
> >
> > [...]
> >
> > [  294.328797] cryptodev: sshd[345] (cryptodev_cipher_init:156): Failed to
> > load cipher cbc(camellia) [  294.328835] cryptodev: sshd[345]
> > (crypto_create_session:264): Failed to load cipher for cbc(camellia) [
> > 294.919951] cryptodev: sshd[345] (cryptodev_cipher_init:156): Failed to
> > load cipher cbc(camellia) [  294.919988] cryptodev: sshd[345]
> > (crypto_create_session:264): Failed to load cipher for cbc(camellia) [
> > 295.510857] cryptodev: sshd[345] (cryptodev_cipher_init:156): Failed to
> > load cipher cbc(camellia) [  295.510896] cryptodev: sshd[345]
> > (crypto_create_session:264): Failed to load cipher for cbc(camellia)
> >
> > [...]
> >
> > [  295.816778] cryptodev: sshd[345] (cryptodev_hash_init:360): Failed to
> > load transform for rmd160 [  295.816815] cryptodev: sshd[345]
> > (crypto_create_session:287): Failed to load hash for rmd160
> >
> > [...]
> >
> > [  295.944596] cryptodev: sshd[345] (cryptodev_release:585): Cryptodev
> > handle deinitialised, 16 elements freed
> >
> > And here
> >
> >         $ grep BLOWFISH build/linux-custom/.config #
> > CONFIG_CRYPTO_BLOWFISH is not set
> >         $ grep CAMELLIA build/linux-custom/.config #
> > CONFIG_CRYPTO_CAMELLIA is not set
> >
> > Seems the kernel module cryptodev.ko needs some more kernel
> > options enabled...  
> 
> I was missing these two kernel options. I've enabled them and ran this again with cryptodev debug enabled. Not seeing any error about failing to load a module.
> 
> [    8.260969] cryptodev: loading out-of-tree module taints kernel.
> [    8.290183] cryptodev: driver 1.11 loaded.
> [  107.915389] cryptodev: sshd[465] (cryptodev_open:525): allocated new item at e11e6ec6
> [  107.915410] cryptodev: sshd[465] (cryptodev_open:525): allocated new item at 7a056a82
> [  107.915422] cryptodev: sshd[465] (cryptodev_open:525): allocated new item at 8958d969
> [  107.915433] cryptodev: sshd[465] (cryptodev_open:525): allocated new item at 5668dff8
> [  107.915445] cryptodev: sshd[465] (cryptodev_open:525): allocated new item at ceddf882
> [  107.915457] cryptodev: sshd[465] (cryptodev_open:525): allocated new item at c0b32e4b
> [  107.915468] cryptodev: sshd[465] (cryptodev_open:525): allocated new item at f931b198
> [  107.915479] cryptodev: sshd[465] (cryptodev_open:525): allocated new item at 6113eeb0
> [  107.915490] cryptodev: sshd[465] (cryptodev_open:525): allocated new item at 88496fa1
> [  107.915501] cryptodev: sshd[465] (cryptodev_open:525): allocated new item at fda63da3
> [  107.915513] cryptodev: sshd[465] (cryptodev_open:525): allocated new item at 6b601f93
> [  107.915524] cryptodev: sshd[465] (cryptodev_open:525): allocated new item at a5c34893
> [  107.915535] cryptodev: sshd[465] (cryptodev_open:525): allocated new item at 79a1c78e
> [  107.915547] cryptodev: sshd[465] (cryptodev_open:525): allocated new item at 41e843cf
> [  107.915558] cryptodev: sshd[465] (cryptodev_open:525): allocated new item at 3027bcfb
> [  107.915582] cryptodev: sshd[465] (cryptodev_open:525): allocated new item at 8bec1c66
> [  107.915593] cryptodev: sshd[465] (cryptodev_open:530): Cryptodev handle initialised, 16 elements in queue
> [  107.915997] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  107.916013] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  107.916055] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0x87ACB922
> [  107.916072] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  107.916126] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  107.916136] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  107.916165] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0xD7520D1F
> [  107.916179] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  107.930542] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 3
> [  107.930559] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  107.930611] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0xA464DA90
> [  107.930642] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  107.930687] cryptodev: sshd[465] (crypto_create_session:177): bad cipher: 4
> [  107.930746] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  107.930755] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  107.930788] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0x8CA3975C
> [  107.930802] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  107.930848] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  107.930858] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  107.930889] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0x42432AC5
> [  107.930902] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  107.930944] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  107.930954] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  107.930983] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0x5A91669F
> [  107.930996] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  107.931020] cryptodev: sshd[465] (crypto_create_session:177): bad cipher: 12
> [  107.936472] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  107.936491] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  107.936543] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0xA029FE82
> [  107.936561] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  107.936626] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  107.936638] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  107.936668] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0x804CD437
> [  107.936683] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  107.936726] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  107.936736] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  107.936765] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0x18AC29E9
> [  107.936778] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  107.936819] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  107.936830] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  107.936859] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0x2869F044
> [  107.936872] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  107.936910] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  107.936920] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  107.936948] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0xE5A76CE4
> [  107.936961] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  107.936999] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  107.937009] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  107.937036] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0x30F8A867
> [  107.937049] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  107.937111] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 3
> [  107.937121] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  107.937151] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0x1D16349D
> [  107.937166] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  107.937231] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 3
> [  107.937242] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  107.937272] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0x0C2A4519
> [  107.937287] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  107.937342] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 3
> [  107.937352] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  107.937382] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0x7A728B1F
> [  107.937396] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  107.937489] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  107.937500] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  107.937544] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  107.937555] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  107.937592] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0xC1531C23
> [  107.937608] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  107.937625] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0x48738365
> [  107.937638] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  107.937684] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  107.937694] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  107.937737] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  107.937746] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  107.937782] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0xCC7A60B3
> [  107.937796] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  107.937813] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0x392DB3F2
> [  107.937826] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  108.530106] cryptodev: sshd[465] (cryptodev_hash_init:360): Failed to load transform for rmd160
> [  108.530127] cryptodev: sshd[465] (crypto_create_session:287): Failed to load hash for rmd160

Here I would suspect CONFIG_CRYPTO_RMD160...

Regards,
Peter

> [  108.530482] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  108.530498] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  108.530550] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  108.530560] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  108.530604] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0x7E03B1F9
> [  108.530622] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  108.530639] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0xC93EF465
> [  108.530653] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  108.530877] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  108.530893] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  108.530942] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  108.530952] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  108.530993] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0x2A569899
> [  108.531010] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  108.531027] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0x257C787A
> [  108.531040] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  108.531085] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  108.531096] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  108.531137] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  108.531147] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  108.531187] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0xF6CA8FC4
> [  108.531202] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  108.531219] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0xE18B4DDF
> [  108.531234] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  108.531279] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  108.531289] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  108.531330] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  108.531339] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  108.531377] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0xDA30C430
> [  108.531393] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  108.531410] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0x34B694A0
> [  108.531424] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  108.663804] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  108.663823] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  108.664200] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  108.664217] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  108.664471] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0x2219E4AB
> [  108.664488] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  108.664528] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  108.664537] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  108.664643] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0x0D14212D
> [  108.664658] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  108.664695] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  108.664705] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  108.664753] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  108.664762] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  108.673933] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  108.673952] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  108.674168] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0xA0CB8DAC
> [  108.675615] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  108.675676] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  108.675688] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  108.675825] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0x8B14541C
> [  108.675842] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  108.675886] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  108.675897] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  108.675937] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0xFB3DB3C2
> [  108.675953] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  108.675991] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  108.676001] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  108.676123] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0xADC7FCCC
> [  108.676140] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  108.676178] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  108.676487] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  108.676536] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0x861A8A7E
> [  108.676553] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  108.676601] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  108.676612] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  108.676689] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  108.676700] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  108.677953] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0xA2B3541F
> [  108.677974] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  108.678028] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  108.678040] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  108.678161] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0xF024F5FE
> [  108.678177] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  108.678218] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  108.678228] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  108.678282] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  108.678291] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  108.678490] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0xCAD0084C
> [  108.678506] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  108.678546] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  108.678556] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  108.678663] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0x9915D526
> [  108.678679] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  108.678716] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  108.678726] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  108.678759] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0xBCFFBC34
> [  108.678772] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  108.678804] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  108.678814] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  108.678940] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0x9A96D40E
> [  108.678954] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  108.678995] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  108.679006] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  108.679042] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0x6FEEBEC1
> [  108.679055] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  108.680126] cryptodev: sshd[465] (crypto_create_session:300): got alignmask 0
> [  108.680142] cryptodev: sshd[465] (crypto_create_session:303): preallocating for 32 user pages
> [  108.685393] cryptodev: sshd[465] (cryptodev_release:564): freeing item at 8bec1c66
> [  108.685417] cryptodev: sshd[465] (cryptodev_release:564): freeing item at 3027bcfb
> [  108.685431] cryptodev: sshd[465] (cryptodev_release:564): freeing item at 41e843cf
> [  108.685443] cryptodev: sshd[465] (cryptodev_release:564): freeing item at 79a1c78e
> [  108.685455] cryptodev: sshd[465] (cryptodev_release:564): freeing item at a5c34893
> [  108.685467] cryptodev: sshd[465] (cryptodev_release:564): freeing item at 6b601f93
> [  108.685479] cryptodev: sshd[465] (cryptodev_release:564): freeing item at fda63da3
> [  108.685491] cryptodev: sshd[465] (cryptodev_release:564): freeing item at 88496fa1
> [  108.685503] cryptodev: sshd[465] (cryptodev_release:564): freeing item at 6113eeb0
> [  108.685514] cryptodev: sshd[465] (cryptodev_release:564): freeing item at f931b198
> [  108.685526] cryptodev: sshd[465] (cryptodev_release:564): freeing item at c0b32e4b
> [  108.685539] cryptodev: sshd[465] (cryptodev_release:564): freeing item at ceddf882
> [  108.685551] cryptodev: sshd[465] (cryptodev_release:564): freeing item at 5668dff8
> [  108.685562] cryptodev: sshd[465] (cryptodev_release:564): freeing item at 8958d969
> [  108.685575] cryptodev: sshd[465] (cryptodev_release:564): freeing item at 7a056a82
> [  108.685587] cryptodev: sshd[465] (cryptodev_release:564): freeing item at e11e6ec6
> [  108.685602] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0x00C48C20
> [  108.685618] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  108.685632] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0xE7EBC24C
> [  108.685646] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  108.685657] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0x75DCA55A
> [  108.685670] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  108.685681] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0xDA46C32B
> [  108.685694] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  108.685706] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0x6819A412
> [  108.685718] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  108.685729] cryptodev: sshd[465] (crypto_destroy_session:358): Removed session 0x77B8F57D
> [  108.685742] cryptodev: sshd[465] (crypto_destroy_session:361): freeing space for 32 user pages
> [  108.685754] cryptodev: sshd[465] (cryptodev_release:586): Cryptodev handle deinitialised, 16 elements freed
> 
> Thanks,
> Michael
> 
> >
> > Regards,
> > Peter
> >
> >  
> > > close(3)                                = 0
> > > write(2, "Unable to load host key \"/etc/ss"..., 73Unable to load host
> > > key "/etc/ssh/ssh_host_rsa_key": error in libcrypto
> > > ) = 73
> > > openat(AT_FDCWD, "/etc/ssh/ssh_host_rsa_key",  
> > O_RDONLY|O_LARGEFILE) =  
> > > 3 fstat64(3, {st_mode=S_IFREG|0600, st_size=2590, ...}) = 0 read(3,
> > > "-----BEGIN OPENSSH PRIVATE KEY--"..., 1024) = 1024
> > > close(3)                                = 0
> > > openat(AT_FDCWD, "/etc/ssh/ssh_host_rsa_key.pub",
> > > O_RDONLY|O_LARGEFILE) = 3 fstat64(3, {st_mode=S_IFREG|0644,
> > > st_size=564, ...}) = 0 read(3, "ssh-rsa  
> > AAAAB3NzaC1yc2EAAAADAQAB"..., 1024) = 564  
> > > close(3)                                = 0
> > > write(2, "Unable to load host key: /etc/ss"..., 52Unable to load host
> > > key: /etc/ssh/ssh_host_rsa_key
> > > ) = 52
> > > ioctl(4, _IOC(_IOC_READ|_IOC_WRITE, 0x63, 0x66, 0x1c), 0x23e6d78) = -  
> > 1  
> > > EBADF (Bad file descriptor) ioctl(4, _IOC(_IOC_WRITE, 0x63, 0x67,
> > > 0x4), 0x23e6d90) = -1 EBADF (Bad file descriptor) write(2,
> > > "accumulate_host_timing_secret: s"...,
> > > 49accumulate_host_timing_secret: ssh_digest_start
> > > ) = 49
> > > exit_group(255)                         = ?
> > > +++ exited with 255 +++
> > >
> > > Thanks,
> > > -Michael
> > >  
> 
> CONFIDENTIALITY NOTICE: This message, including any attachments, contains confidential information intended for a specific individual and purpose. If you are not the intended recipient, you should delete this message and any disclosure, copying, or distribution of this message, or the taking of any action based on it, by you is strictly prohibited.
