From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 8 Apr 2021 23:52:26 +0200
Subject: [Buildroot] sshd reports error in libcrypto while trying to
 read host key
In-Reply-To: <DM6PR08MB4425422C1100F44BFF129275AE7C9@DM6PR08MB4425.namprd08.prod.outlook.com>
References: <DM6PR08MB4425422C1100F44BFF129275AE7C9@DM6PR08MB4425.namprd08.prod.outlook.com>
Message-ID: <20210408235226.153250d5@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Michael,

On Wed, 31 Mar 2021 14:12:15 +0000, Michael John <MJohn@midmark.com> wrote:

> Hello,
> 
> I?ve built openssh and I?m having some issues running it on my board. While running sshd it reports an error in libcrypto while trying to read the host key. The host keys are generated under /etc/ssh.
> 
> ~> ls /etc/ssh  
> moduli                                 ssh_host_ecdsa_key                    ssh_host_rsa_key
> ssh_config                           ssh_host_ecdsa_key.pub           ssh_host_rsa_key.pub
> ssh_host_dsa_key             ssh_host_ed25519_key              sshd_config
> ssh_host_dsa_key.pub     ssh_host_ed25519_key.pub
> 
> ~> systemctl status sshd  
> ? sshd.service - OpenSSH server daemon
>      Loaded: loaded (/usr/lib/systemd/system/sshd.service; enabled; vendor preset: enabled)
>      Active: failed (Result: exit-code) since Wed 2021-03-31 13:21:02 UTC; 11s ago
>     Process: 315 ExecStartPre=/usr/bin/ssh-keygen -A (code=exited, status=0/SUCCESS)
>     Process: 341 ExecStart=/usr/sbin/sshd -D -e (code=exited, status=1/FAILURE)
>    Main PID: 341 (code=exited, status=1/FAILURE)
> 
> Mar 31 13:20:51 cm1sd systemd[1]: Starting OpenSSH server daemon...
> Mar 31 13:20:54 cm1sd systemd[1]: Started OpenSSH server daemon.
> Mar 31 13:21:02 cm1sd sshd[341]: Unable to load host key "/etc/ssh/ssh_host_rsa_key": error in libcrypto
> Mar 31 13:21:02 cm1sd sshd[341]: Unable to load host key: /etc/ssh/ssh_host_rsa_key
> Mar 31 13:21:02 cm1sd sshd[341]: sshd: no hostkeys available -- exiting.
> Mar 31 13:21:02 cm1sd systemd[1]: sshd.service: Main process exited, code=exited, status=1/FAILURE
> Mar 31 13:21:02 cm1sd systemd[1]: sshd.service: Failed with result 'exit-code'.
> 
> I?m using:
> openssh version 8.5p1
> openssl version 1.1.1k
> crpytodev-linux fabe5989a3d
> 
> Is there an issue using this combination of packages? These are the lastest versions in buildroot.
> 
> My config file (sshd_config) is only trying to load the host key for RSA, but I get the same error about libcrypto for ecdsa and ed25519.
> 
> Anyone see this issue as well? Any help is appreciated.

You can try to run sshd with strace to get a clue about the failing syscall
(in case this is the reason) in libcrypto....

Which hardware and which (hardware) crypto device?

Regards,
Peter

> 
> Thanks.
> -Michael
> 
> CONFIDENTIALITY NOTICE: This message, including any attachments, contains confidential information intended for a specific individual and purpose. If you are not the intended recipient, you should delete this message and any disclosure, copying, or distribution of this message, or the taking of any action based on it, by you is strictly prohibited.
