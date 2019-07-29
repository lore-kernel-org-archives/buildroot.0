From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 28 Jul 2019 23:21:21 -0300
Subject: [Buildroot] syslog-ng test does not work due to lack of random
 numbers
References: <20190621214130.1074b702@windsurf>
Message-ID: <5d3e5821b78b7_6df63fe81e0ca148393a4@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, Jun 21, 2019 at 04:41 PM, Thomas Petazzoni wrote:

> The syslog-ng runtime test is no longer working:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/237108732
> 
> I had a look, and the problem is that syslog-ng is stuck when starting,
> waiting for random numbers. strace shows:
> 
> [pid    65] open("/dev/random", O_RDONLY|O_LARGEFILE) = 6
> [pid    65] _newselect(7, [6], NULL, NULL, NULL
> 
> And then nothing.
> 
> Adding haveged to the configuration would have been an option, but
> haveged is started as S21haveged, while syslog-ng is started as
> S01syslog-ng, so obviously, this won't help.
> 
> What should we do ?

We can use VirtIORNG like Peter did for the docker compose test.

We need kernel config CONFIG_HW_RANDOM_VIRTIO=y.
It is not enabled in the 2 binary kernel images we have for test infra.
We also need qemu argument -device virtio-rng-pci.

I will cook a patch.

Regards,
Ricardo
