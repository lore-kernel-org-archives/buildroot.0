From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 May 2021 22:09:58 +0200
Subject: [Buildroot] [PATCH v3 4/4] lmbench: lat_rpc: fix stray pointer
In-Reply-To: <20210510180049.61421-6-vgupta@synopsys.com>
References: <20210510180049.61421-1-vgupta@synopsys.com>
 <20210510180049.61421-6-vgupta@synopsys.com>
Message-ID: <20210517200958.GF2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vineet, All,

On 2021-05-10 11:00 -0700, Vineet Gupta via buildroot spake thusly:
> | # ./lat_rpc -S localhost
> | potentially unexpected fatal signal 11.
> | Path: /lmbench/bin/arc64/lat_rpc
> | CPU: 0 PID: 62 Comm: lat_rpc Not tainted 5.6.0-00224-g8e1b159f529e #39
> | Invalid Read @ 0x00000001 by insn @ 0x2011f110
> |   @off 0x6c110 in [/lib/libc-2.32.so]  VMA: 0x200b3000 to 0x201b8000
> | ECR: 0x00050100 EFA: 0x00000001 ERET: 0x2011f110
> | STAT32: 0x80081082 [IE U     ]   BTA: 0x2011b87c
> |  SP: 0x5fffefe8  FP: 0x00000000 BLK: 0x20103242
> | r00: 0x00000001 r01: 0x00000002 r02: 0x00000001
> | r03: 0x20101eb0 r04: 0x00000001 r05: 0x00000001
> | r06: 0x00000000 r07: 0x00000000 r08: 0x00000001
> | r09: 0x2019d8b0 r10: 0x20039fc4 r11: 0x5ffff0f0
> | r12: 0x2019d6d0 r13: 0x2019d748 r14: 0x5ffff588
> | r15: 0x00000000 r16: 0x00000000 r17: 0x5ffff708
> | r18: 0x20039fc0 r19: 0xffffffff r20: 0x201ba010
> | r21: 0x00000000 r22: 0x00000000 r23: 0x20039fc0
> | r24: 0x00000bd0 r25: 0x00000073
> Segmentation fault
> 
> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>

Applied to master, thanks.

I was going to suggest sending those patches upstream to lmbench,
but.... It's dead, Jim.

Regards,
Yann E. MORIN.

> ---
>  ...bage-pointer-for-lat_rpc-S-localhost.patch | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 package/lmbench/0004-Fix-garbage-pointer-for-lat_rpc-S-localhost.patch
> 
> diff --git a/package/lmbench/0004-Fix-garbage-pointer-for-lat_rpc-S-localhost.patch b/package/lmbench/0004-Fix-garbage-pointer-for-lat_rpc-S-localhost.patch
> new file mode 100644
> index 000000000000..619ec3861463
> --- /dev/null
> +++ b/package/lmbench/0004-Fix-garbage-pointer-for-lat_rpc-S-localhost.patch
> @@ -0,0 +1,25 @@
> +From 3830453a06269912d2772fe8c31bae44f27bb131 Mon Sep 17 00:00:00 2001
> +From: Vineet Gupta <vgupta@synopsys.com>
> +Date: Fri, 8 May 2015 11:35:58 +0530
> +Subject: [PATCH] Fix garbage pointer for lat_rpc -S localhost
> +
> +Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> +---
> + src/lat_rpc.c | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/lat_rpc.c b/src/lat_rpc.c
> +index 9c021926d761..ff4380ff38f3 100644
> +--- a/src/lat_rpc.c
> ++++ b/src/lat_rpc.c
> +@@ -101,6 +101,7 @@ main(int ac, char **av)
> + 	char	*usage = "-s\n OR [-p <tcp|udp>] [-P parallel] [-W <warmup>] [-N <repetitions>] serverhost\n OR -S serverhost\n";
> + 
> + 	state.msize = 1;
> ++	state.server = NULL;
> + 
> + 	while (( c = getopt(ac, av, "sS:m:p:P:W:N:")) != EOF) {
> + 		switch(c) {
> +-- 
> +2.25.1
> +
> -- 
> 2.25.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
