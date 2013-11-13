From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Nov 2013 21:32:18 +0100
Subject: [Buildroot] Init not handling signals
In-Reply-To: <000301cedfc4$0dfbe880$29f3b980$@osullivan@cloudiumsystems.com>
References: <000301cedfc4$0dfbe880$29f3b980$@osullivan@cloudiumsystems.com>
Message-ID: <5283E1D2.1090007@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/11/13 17:27, John OSullivan wrote:
> Hi,
>
> I?m not sure if this is the correct forum to ask this question but I have
> seen a few buildroot/busybox references to this problem but none with a
> clear solution.

  The busybox mailing list would probably be more appropriate...

>
> I am running buildroot-2012-05 with busybox 1.19, using the busybox init
> with an inittab based on the default one provided.
>
> In the init tab there is a trap for ctrlaltdel
>
> ::ctrlaltdel:/sbin/reboot
>
> This line is never called after hitting ctrl alt del on a keyboard
>
> Instead we get a signal pending on the init task
>
> Cat /proc/1/status
>
> ---------------------------
>
> Name:   swapper
>
> State:    R (running)
>
> Tgid:      1
>
> Pid:        1
>
> PPid:      0
>
> TracerPid:            0
>
> Uid:        0             0             0             0
>
> Gid:        0             0             0             0
>
> FDSize:  32
>
> Groups:
>
> Threads:              1
>
> SigQ:      1/938
>
> SigPnd:  0000000000000100
>
> ShdPnd: 0000000000000002

  If I understand correctly, this is a SIGCHLD and a SIGINT. The SIGINT 
is sent to init by the kernel when you press ctrlaltdel - so I guess you 
pressed it twice.

>
> SigBlk:   0000000000000000
>
> SigIgn:   0000000000000000
>
> SigCgt:  0000000000000000
>
> CapInh: 0000000000000000
>
> After the init process is signalled the Swapper task assumes 100%
> processor occupancy and system performance degenerates. (as evidenced by top)

  That seems to indicate it's getting fork-bombed. You can check that by 
running ps; ps from the shell - if the two instances have very different 
PIDs, then you have a fork bomb :-)


  Regards,
  Arnout

>
> The kernel version is 2.6.33.3 (I also tried 2.6.39.4). This happens on a
> minimal system built from buildroot without any other processes running,
> the only way to recover the situation is with a reboot.
>
> Any ideas or suggestions on what the issue might be?
>
> I was going to try a non-busybox init but before I do that I want to make
> sure that there is not an available explanation for the behaviour I am
> observing.
>
> Regards
>
> johnos
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
