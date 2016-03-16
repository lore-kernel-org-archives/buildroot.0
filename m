From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Mar 2016 08:54:45 +0100
Subject: [Buildroot] user: openssh build question
In-Reply-To: <CAJJ6jxusP5Q2AuX3WXH8yBu8rakt-mhnk4xU+1cQX_JkL1hg1Q@mail.gmail.com>
 (Steve Calfee's message of "Tue, 15 Mar 2016 18:40:47 -0700")
References: <CAJJ6jxusP5Q2AuX3WXH8yBu8rakt-mhnk4xU+1cQX_JkL1hg1Q@mail.gmail.com>
Message-ID: <87r3fa6enu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Steve" == Steve Calfee <stevecalfee@gmail.com> writes:

 > Hi,
 > Does anyone know why the build litters my target /etc directory with
 > files instead of putting them in ssh? I think I must have something
 > configured wrong. I have upgraded to buildroot 2016.02.

What is your config? Do you use a rootfs overlay?

 > here is the /etc dir, see the generated keys at the end. I think they
 > should be put in ssh:

 > Thanks, Steve

 > ls -1 output/target/etc/
[snip]
 > ssh
 > ssh_host_dsa_key
 > ssh_host_dsa_key.pub
 > ssh_host_ecdsa_key
 > ssh_host_ecdsa_key.pub
 > ssh_host_ed25519_key
 > ssh_host_ed25519_key.pub
 > ssh_host_key
 > ssh_host_key.pub
 > ssh_host_rsa_key
 > ssh_host_rsa_key.pub
 > ssl

We don't generate ssh host keys at build time, but only at (first) boot
in the /etc/init.d/S50sshd init script, so I wonder where you got these
from?

I just did a test build here:

ls -1 ls -1 output/target/etc
fstab
group
hostname
hosts
init.d
inittab
issue
mtab
network
nsswitch.conf
os-release
passwd
profile
profile.d
protocols
resolv.conf
services
shadow
ssh
ssl

Whereas on the target I see:

# ls -1 /etc/
fstab
group
hostname
hosts
init.d
inittab
issue
mtab
network
nsswitch.conf
os-release
passwd
profile
profile.d
protocols
random-seed
resolv.conf
services
shadow
ssh
ssl

# ls -1 /etc/ssh/
moduli
ssh_config
ssh_host_dsa_key
ssh_host_dsa_key.pub
ssh_host_ecdsa_key
ssh_host_ecdsa_key.pub
ssh_host_ed25519_key
ssh_host_ed25519_key.pub
ssh_host_rsa_key
ssh_host_rsa_key.pub
sshd_config

-- 
Bye, Peter Korsgaard
