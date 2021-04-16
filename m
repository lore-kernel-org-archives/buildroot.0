From: Michael John <MJohn@midmark.com>
Date: Fri, 16 Apr 2021 20:07:21 +0000
Subject: [Buildroot] sshd reports error in libcrypto while trying to
 read host key
In-Reply-To: <20210408235226.153250d5@gmx.net>
References: <DM6PR08MB4425422C1100F44BFF129275AE7C9@DM6PR08MB4425.namprd08.prod.outlook.com>
 <20210408235226.153250d5@gmx.net>
Message-ID: <DM6PR08MB442526A0F6C1B531DC2480B7AE4C9@DM6PR08MB4425.namprd08.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

>Hello Michael,
>
>On Wed, 31 Mar 2021 14:12:15 +0000, Michael John <MJohn@midmark.com> wrote:
>
>> Hello,
>>
>> I?ve built openssh and I?m having some issues running it on my board. While running sshd it reports an error in libcrypto while trying to read the host key. The host keys are generated under /etc/ssh.
>>
>> ~> ls /etc/ssh
>> moduli                                 ssh_host_ecdsa_key                    ssh_host_rsa_key
>> ssh_config                           ssh_host_ecdsa_key.pub           ssh_host_rsa_key.pub
>> ssh_host_dsa_key             ssh_host_ed25519_key              sshd_config
>> ssh_host_dsa_key.pub     ssh_host_ed25519_key.pub
>>
>> ~> systemctl status sshd
>> ? sshd.service - OpenSSH server daemon
>>      Loaded: loaded (/usr/lib/systemd/system/sshd.service; enabled; vendor preset: enabled)
>>      Active: failed (Result: exit-code) since Wed 2021-03-31 13:21:02 UTC; 11s ago
>>     Process: 315 ExecStartPre=/usr/bin/ssh-keygen -A (code=exited, status=0/SUCCESS)
>>     Process: 341 ExecStart=/usr/sbin/sshd -D -e (code=exited, status=1/FAILURE)
>>    Main PID: 341 (code=exited, status=1/FAILURE)
>>
>> Mar 31 13:20:51 cm1sd systemd[1]: Starting OpenSSH server daemon...
>> Mar 31 13:20:54 cm1sd systemd[1]: Started OpenSSH server daemon.
>> Mar 31 13:21:02 cm1sd sshd[341]: Unable to load host key
>> "/etc/ssh/ssh_host_rsa_key": error in libcrypto Mar 31 13:21:02 cm1sd
>> sshd[341]: Unable to load host key: /etc/ssh/ssh_host_rsa_key Mar 31 13:21:02 cm1sd sshd[341]: sshd: no hostkeys available -- exiting.
>> Mar 31 13:21:02 cm1sd systemd[1]: sshd.service: Main process exited,
>> code=exited, status=1/FAILURE Mar 31 13:21:02 cm1sd systemd[1]: sshd.service: Failed with result 'exit-code'.
>>
>> I?m using:
>> openssh version 8.5p1
>> openssl version 1.1.1k
>> crpytodev-linux fabe5989a3d
>>
>> Is there an issue using this combination of packages? These are the lastest versions in buildroot.
>>
>> My config file (sshd_config) is only trying to load the host key for RSA, but I get the same error about libcrypto for ecdsa and ed25519.
>>
>> Anyone see this issue as well? Any help is appreciated.
>
> You can try to run sshd with strace to get a clue about the failing syscall (in case this is the reason) in libcrypto....
>
> Which hardware and which (hardware) crypto device?
>
> Regards,
> Peter
>
>>
>> Thanks.
>> -Michael
>>

Here is the tail of the strace output:

mmap2(0xb6b2f000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x8000) = 0xb6b2f000
mmap2(0xb6b31000, 21260, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0xb6b31000
close(3)                                = 0
mprotect(0xb6b2f000, 4096, PROT_READ)   = 0
openat(AT_FDCWD, "/etc/passwd", O_RDONLY|O_CLOEXEC) = 3
_llseek(3, 0, [0], SEEK_CUR)            = 0
fstat64(3, {st_mode=S_IFREG|0644, st_size=826, ...}) = 0
read(3, "root:x:0:0:root:/root:/usr/bin/e"..., 1024) = 826
close(3)                                = 0
openat(AT_FDCWD, "/etc/ssh/ssh_host_rsa_key", O_RDONLY|O_LARGEFILE) = 3
fstat64(3, {st_mode=S_IFREG|0600, st_size=2590, ...}) = 0
getuid32()                              = 0
fstat64(3, {st_mode=S_IFREG|0600, st_size=2590, ...}) = 0
read(3, "-----BEGIN OPENSSH PRIVATE KEY--"..., 4096) = 2590
read(3, "", 1506)                       = 0
read(3, "", 4096)                       = 0
getpid()                                = 719
ioctl(4, _IOC(_IOC_READ|_IOC_WRITE, 0x63, 0x66, 0x1c), 0x23e8798) = -1 EBADF (Bad file descriptor)
ioctl(4, _IOC(_IOC_WRITE, 0x63, 0x67, 0x4), 0x23e1ca8) = -1 EBADF (Bad file descriptor)
ioctl(4, _IOC(_IOC_WRITE, 0x63, 0x67, 0x4), 0x23e2080) = -1 EBADF (Bad file descriptor)
ioctl(4, _IOC(_IOC_WRITE, 0x63, 0x67, 0x4), 0x23e87b0) = -1 EBADF (Bad file descriptor)
close(3)                                = 0
write(2, "Unable to load host key \"/etc/ss"..., 73Unable to load host key "/etc/ssh/ssh_host_rsa_key": error in libcrypto
) = 73
openat(AT_FDCWD, "/etc/ssh/ssh_host_rsa_key", O_RDONLY|O_LARGEFILE) = 3
fstat64(3, {st_mode=S_IFREG|0600, st_size=2590, ...}) = 0
read(3, "-----BEGIN OPENSSH PRIVATE KEY--"..., 1024) = 1024
close(3)                                = 0
openat(AT_FDCWD, "/etc/ssh/ssh_host_rsa_key.pub", O_RDONLY|O_LARGEFILE) = 3
fstat64(3, {st_mode=S_IFREG|0644, st_size=564, ...}) = 0
read(3, "ssh-rsa AAAAB3NzaC1yc2EAAAADAQAB"..., 1024) = 564
close(3)                                = 0
write(2, "Unable to load host key: /etc/ss"..., 52Unable to load host key: /etc/ssh/ssh_host_rsa_key
) = 52
ioctl(4, _IOC(_IOC_READ|_IOC_WRITE, 0x63, 0x66, 0x1c), 0x23e6d78) = -1 EBADF (Bad file descriptor)
ioctl(4, _IOC(_IOC_WRITE, 0x63, 0x67, 0x4), 0x23e6d90) = -1 EBADF (Bad file descriptor)
write(2, "accumulate_host_timing_secret: s"..., 49accumulate_host_timing_secret: ssh_digest_start
) = 49
exit_group(255)                         = ?
+++ exited with 255 +++

Thanks,
-Michael

CONFIDENTIALITY NOTICE: This message, including any attachments, contains confidential information intended for a specific individual and purpose. If you are not the intended recipient, you should delete this message and any disclosure, copying, or distribution of this message, or the taking of any action based on it, by you is strictly prohibited.
