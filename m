From: Andreas Ziegler <br015@umbiko.net>
Date: Mon, 24 Feb 2020 14:07:19 +0100
Subject: [Buildroot] SSH server starts too late
In-Reply-To: <1d91f38acaeecb790f5a44d104ae0ca1@umbiko.net>
References: <mailman.11.1582286403.41897.buildroot@busybox.net>
 <33327ed4301c921b1ded444b5b7c3b89@umbiko.net>
 <CAGSpp9=Ji6HASueKR3m_LbFAm6vR6Lb_2SvAsFHsGY9qmmDyZA@mail.gmail.com>
 <1d91f38acaeecb790f5a44d104ae0ca1@umbiko.net>
Message-ID: <07080405b2cf67605b4b9f38b40b4850@umbiko.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Message: 31
> Date: Mon, 24 Feb 2020 10:29:42 +0100
> From: Hammami Omar <omar18hammami@gmail.com>
> To: Andreas Ziegler <br015@umbiko.net>
> Cc: buildroot at busybox.net, Peter Seiderer <ps.report@gmx.net>
> Subject: Re: [Buildroot] SSH server starts too late

> Hello Andreas,
> 
> Thank you for your response.
> In fact, I have tried to add extra randomnes by enabling "haveged". The
> entropy has increased but the problem is the same.
> Is it possible that the entropy value is always less than the wanted 
> one ?
> 
> Kind regards,
> Omar

Hi Omar,

The kernel entropy pool needs to be "seeded"; after that it works as 
intended. Until the seeding is finished, calls to getentropy() or reads 
from /dev/random block; reads from /dev/urandom work, but print warnings 
in the kernel log. Thus it seems that there is always less entropy than 
needed, because successful reads do not produce warning messages:

# dmesg | grep random
[    0.070842] 000: random: get_random_u32 called from 0x8b299601 with 
crng_init=0
[    9.553915] 000: random: fast init done
[   11.522913] 000: random: dd: uninitialized urandom read (512 bytes 
read)
[   14.271888] 000: random: wpa_supplicant: uninitialized urandom read 
(32 bytes read)
[   14.307673] 000: random: mktemp: uninitialized urandom read (6 bytes 
read)
[   23.668125] 000: random: mktemp: uninitialized urandom read (6 bytes 
read)
[   23.863680] 000: random: mktemp: uninitialized urandom read (6 bytes 
read)
[   24.003307] 000: random: sshd: uninitialized urandom read (32 bytes 
read)
[  221.067499] 000: random: sshd: uninitialized urandom read (32 bytes 
read)
[  221.092863] 000: random: sshd: uninitialized urandom read (32 bytes 
read)
[  221.405090] 000: random: sshd: uninitialized urandom read (32 bytes 
read)
[  327.117294] 000: random: crng init done
[  327.117305] 000: random: 1 urandom warning(s) missed due to 
ratelimiting

Changes in libopenssh, starting with version 1.1.1c, try to enforce a 
blocking behaviour (regardless of the device used) until the kernel pool 
is ready.

Increasing entropy can be achieved by typing on the keyboard, generating 
I/O from physical disks, or by using hardware devices (RNG). Another 
source of randomness is the patch that was introduced by Linus Torvalds 
in kernel 5.4.y:

   https://lkml.org/lkml/2019/9/18/1078

Kind regards,
Andreas
