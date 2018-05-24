From: David PIERRET <david.pierret@smile.fr>
Date: Thu, 24 May 2018 15:49:37 +0200
Subject: [Buildroot] Openssh with ssl-engine issue
Message-ID: <a04bda479b9ef0b4152ecd2e0b8022fe@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am working on an NXP LS1021a CPU with a hardware crypto engine.
I'm using Buildroot branch 2018.02.x

I have activated cryptodev-linux and my tests with OpenSSL show it 
works.

However, when I try an SSH connection to the target, the connection 
fail with the following message :

[...]
debug1: kex: algorithm: curve25519-sha256 at libssh.org
debug1: kex: host key algorithm: ecdsa-sha2-nistp256
debug1: kex: server->client cipher: chacha20-poly1305 at openssh.com MAC: 
<implicit> compression: none
debug1: kex: client->server cipher: chacha20-poly1305 at openssh.com MAC: 
<implicit> compression: none
debug3: send packet: type 30
debug1: expecting SSH2_MSG_KEX_ECDH_REPLY
Connection closed by 192.168.1.43 port 22

On the target side, a call to "strace sshd" shows me the following 
error:

[...]
[pid   821] <... poll resumed> )        = 2 ([{fd=7, 
revents=POLLIN|POLLHUP}, {fd=8, revents=POLLHUP}])
[pid   837] +++ killed by SIGSYS +++
[pid   821] read(8, "", 4)              = 0
[pid   821] --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_KILLED, 
si_pid=837, si_uid=1001, si_status=SIGSYS, si_utime=3, si_stime=0} ---
[pid   821] close(8)                    = 0
[pid   821] poll([{fd=7, events=POLLIN}], 1, -1) = 1 ([{fd=7, 
revents=POLLIN|POLLHUP}])
[pid   821] read(7, "", 4)              = 0
[pid   821] kill(837, SIGKILL)          = 0
[pid   821] exit_group(255)             = ?
[pid   821] +++ exited with 255 +++

Note that if the cryptodev module is not inserted, the connection is 
established correctly.

After some research, I could find this thread : 
https://archlinuxarm.org/forum/viewtopic.php?f=53&t=11505

The proposed solution does not seem to work on my target.
The fork process continue to chroot to /var/empty.

[pid  1205] chroot("/var/empty")        = 0
[pid  1205] chdir("/")                  = 0
[pid  1205] setgroups32(1, [1001])      = 0

Has this problem ever been encountered?
I'm aware that the UsePrivilegeSeparation option is deprecated.

Best regards

David Pierret
