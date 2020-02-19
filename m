From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 19 Feb 2020 19:48:58 +0100
Subject: [Buildroot] [PATCH v3 1/2] support/scripts/pkg-stats: add
 support for CVE reporting
In-Reply-To: <20200215124417.236492-2-titouan.christophe@railnova.eu>
References: <20200215124417.236492-1-titouan.christophe@railnova.eu>
 <20200215124417.236492-2-titouan.christophe@railnova.eu>
Message-ID: <20200219194858.11b317f6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Titouan,

On Sat, 15 Feb 2020 13:44:16 +0100
Titouan Christophe <titouan.christophe@railnova.eu> wrote:

> This commit extends the pkg-stats script to grab information about the
> CVEs affecting the Buildroot packages.

Here the script consumes too much memory. On my 4 GB RAM server, the
script gets killed by the OOM killer. It goes like this:

Cannot parse package 'mysql' version ''
Cannot parse package 'mysql' version ''
Cannot parse package 'mysql' version ''
Killed

In the logs, I have:

[273138.062124] sh invoked oom-killer: gfp_mask=0x3000d0, order=2, oom_score_adj=0
[273138.062131] sh cpuset=/ mems_allowed=0
[273138.062139] CPU: 1 PID: 27711 Comm: sh Not tainted 3.14.32-xxxx-grs-ipv6-64 #9
[273138.062142] Hardware name: OVH KS/D425KT, BIOS MWPNT10N.86A.0083.2011.0524.1600 05/24/2011
[273138.062145]  0000000000000000 ffffc90006383b78 ffffffff81efb3fc 00000000003000d0
[273138.062152]  ffffc90006383be0 ffffffff81ef50fb ffffc90006383bc8 ffffffff81157741
[273138.062157]  ffffc90006383bc8 ffffffff81694cf5 0000000001320122 0000000000000206
[273138.062162] Call Trace:
[273138.062177]  [<ffffffff81efb3fc>] dump_stack+0x45/0x56
[273138.062183]  [<ffffffff81ef50fb>] dump_header+0x93/0x1f7
[273138.062191]  [<ffffffff81157741>] ? delayacct_end+0x81/0x90
[273138.062198]  [<ffffffff81694cf5>] ? gr_task_acl_is_capable_nolog+0x15/0xb0
[273138.062204]  [<ffffffff81169751>] oom_kill_process+0x201/0x350
[273138.062210]  [<ffffffff810f180c>] ? has_ns_capability_noaudit+0x2c/0x40
[273138.062215]  [<ffffffff810f1832>] ? has_capability_noaudit+0x12/0x20
[273138.062220]  [<ffffffff81169f3d>] out_of_memory+0x4bd/0x500
[273138.062227]  [<ffffffff8116faf8>] __alloc_pages_nodemask+0x878/0x8c0
[273138.062234]  [<ffffffff810e635a>] copy_process.part.49+0x11a/0x1840
[273138.062239]  [<ffffffff810e7c3b>] do_fork+0xcb/0x340
[273138.062246]  [<ffffffff811db708>] ? set_close_on_exec+0x28/0x50
[273138.062252]  [<ffffffff811baa21>] ? filp_close+0x51/0x70
[273138.062257]  [<ffffffff810e7f31>] SyS_clone+0x11/0x20
[273138.062263]  [<ffffffff81f04935>] stub_clone+0x65/0x90
[273138.062269]  [<ffffffff81f0469e>] ? system_call_fastpath+0x16/0x1b
[273138.062271] Mem-Info:
[273138.062273] Node 0 DMA per-cpu:
[273138.062278] CPU    0: hi:    0, btch:   1 usd:   0
[273138.062280] CPU    1: hi:    0, btch:   1 usd:   0
[273138.062282] Node 0 DMA32 per-cpu:
[273138.062286] CPU    0: hi:  186, btch:  31 usd:   0
[273138.062289] CPU    1: hi:  186, btch:  31 usd:   0
[273138.062291] Node 0 Normal per-cpu:
[273138.062294] CPU    0: hi:  186, btch:  31 usd:   0
[273138.062297] CPU    1: hi:  186, btch:  31 usd:   0
[273138.062305] active_anon:705765 inactive_anon:254745 isolated_anon:0
                 active_file:89 inactive_file:100 isolated_file:0
                 unevictable:0 dirty:0 writeback:3 unstable:0
                 free:8553 slab_reclaimable:2431 slab_unreclaimable:6643
                 mapped:823 shmem:4774 pagetables:4050 bounce:0
                 free_cma:0
[273138.062308] Node 0 DMA free:15632kB min:28kB low:32kB high:40kB active_anon:0kB inactive_anon:0kB active_file:0kB inactive_file:0kB unevictable:0kB isolated(anon):0kB isolated(file):0kB present:15984kB managed:15900kB mlocked:0kB dirty:0kB writeback:0kB mapped:0kB shmem:0kB slab_reclaimable:0kB slab_unreclaimable:40kB kernel_stack:0kB pagetables:0kB unstable:0kB bounce:0kB free_cma:0kB writeback_tmp:0kB pages_scanned:0 all_unreclaimable? yes
[273138.062321] lowmem_reserve[]: 0 3201 3904 3904
[273138.062327] Node 0 DMA32 free:13744kB min:6540kB low:8172kB high:9808kB active_anon:2490620kB inactive_anon:686120kB active_file:312kB inactive_file:300kB unevictable:0kB isolated(anon):0kB isolated(file):0kB present:3374452kB managed:3279848kB mlocked:0kB dirty:0kB writeback:12kB mapped:2940kB shmem:18728kB slab_reclaimable:7512kB slab_unreclaimable:19620kB kernel_stack:4000kB pagetables:13164kB unstable:0kB bounce:0kB free_cma:0kB writeback_tmp:0kB pages_scanned:3700 all_unreclaimable? yes
[273138.062339] lowmem_reserve[]: 0 0 702 702
[273138.062345] Node 0 Normal free:4836kB min:1436kB low:1792kB high:2152kB active_anon:332440kB inactive_anon:332860kB active_file:44kB inactive_file:100kB unevictable:0kB isolated(anon):0kB isolated(file):0kB present:786432kB managed:719824kB mlocked:0kB dirty:0kB writeback:0kB mapped:352kB shmem:368kB slab_reclaimable:2212kB slab_unreclaimable:6912kB kernel_stack:1280kB pagetables:3036kB unstable:0kB bounce:0kB free_cma:0kB writeback_tmp:0kB pages_scanned:908 all_unreclaimable? yes
[273138.062357] lowmem_reserve[]: 0 0 0 0
[273138.062362] Node 0 DMA: 0*4kB 0*8kB 1*16kB (U) 0*32kB 0*64kB 0*128kB 1*256kB (U) 0*512kB 1*1024kB (U) 1*2048kB (U) 3*4096kB (MR) = 15632kB
[273138.062383] Node 0 DMA32: 3296*4kB (UEM) 8*8kB (MR) 17*16kB (R) 0*32kB 1*64kB (R) 2*128kB (R) 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 13840kB
[273138.062404] Node 0 Normal: 1137*4kB (EMR) 15*8kB (MR) 2*16kB (R) 1*32kB (R) 2*64kB (R) 0*128kB 0*256kB 0*512kB 0*1024kB 0*2048kB 0*4096kB = 4860kB
[273138.062425] 6049 total pagecache pages
[273138.062428] 1018 pages in swap cache
[273138.062431] Swap cache stats: add 1138680, delete 1137662, find 493695/665941
[273138.062433] Free swap  = 0kB
[273138.062434] Total swap = 525308kB
[273138.062436] 1044217 pages RAM
[273138.062438] 0 pages HighMem/MovableOnly
[273138.062439] 16652 pages reserved
[273138.062441] 0 pages hwpoisoned
[273138.062443] [ pid ]   uid  tgid total_vm      rss nr_ptes swapents oom_score_adj name
[273138.062468] [  148]     0   148    10899      927      26       48             0 systemd-journal
[273138.062474] [  171]     0   171    23689        0      17       52             0 lvmetad
[273138.062480] [  178]     0   178    10542       11      22      206         -1000 systemd-udevd
[273138.062486] [  410]   108   410    25077       10      19       51             0 systemd-timesyn
[273138.062492] [  455]     0   455     1095        0       8       38             0 acpid
[273138.062497] [  457]     0   457    69070      408      36       84             0 accounts-daemon
[273138.062503] [  460]     0   460     7465        0      19       61             0 cgmanager
[273138.062508] [  465]     0   465     6507        0      18       59             0 atd
[273138.062514] [  467]   102   467    10722       56      25       64          -900 dbus-daemon
[273138.062519] [  512]     0   512     7075       16      20       59             0 cron
[273138.062524] [  518]     0   518     6301       11      17      179             0 smartd
[273138.062530] [  519]   101   519    64094      240      29      232             0 rsyslogd
[273138.062536] [  523]     0   523     7132       37      19       52             0 systemd-logind
[273138.062541] [  615]     0   615     4864       25      15       48             0 irqbalance
[273138.062546] [  622]     0   622    69274       57      39      127             0 polkitd
[273138.062552] [  623]     0   623     3340        7      11       29             0 mdadm
[273138.062557] [  839]   103   839    81055     3108      76    11814             0 named
[273138.062563] [  852]     0   852     3808        0      13       35             0 agetty
[273138.062569] [  866]   106   866   393554    19089     246    64828             0 mysqld
[273138.062574] [  869]     0   869    16374        6      35      171         -1000 sshd
[273138.062580] [  879]    33   879    13620      602      31      283             0 lighttpd
[273138.062585] [  887]    33   887    64908        0      87      869             0 php-cgi
[273138.062591] [  996]    33   996    67392     1467      87     2273             0 php-cgi
[273138.062596] [  997]    33   997    67696     1845      89     2226             0 php-cgi
[273138.062601] [  998]    33   998    67718      823      89     3254             0 php-cgi
[273138.062607] [  999]    33   999    67734     1720      89     2362             0 php-cgi
[273138.062612] [ 2503]  1000  2503    11253        1      26      153             0 systemd
[273138.062618] [ 2504]  1000  2504    15961        6      34      608             0 (sd-pam)
[273138.062624] [ 2578]  1000  2578     6861      142      17      233             0 screen
[273138.062629] [ 2579]  1000  2579     5509        2      16      507             0 bash
[273138.062634] [ 2593]  1000  2593    38787      892      49     1786             0 irssi
[273138.062640] [ 2657]  1000  2657    15173     2553      32      580             0 mosh-server
[273138.062645] [ 2658]  1000  2658     6587       14      19       57             0 screen
[273138.062651] [10896]  1001 10896    11253       48      26      106             0 systemd
[273138.062657] [10897]  1001 10897    15961        6      34      608             0 (sd-pam)
[273138.062663] [11013]  1001 11013     6786      224      16       68             0 screen
[273138.062668] [11014]  1001 11014     5552      262      16      292             0 bash
[273138.062673] [13729]  1001 13729     5555       77      16      479             0 bash
[273138.062679] [22603]     0 22603    24231        9      51      235             0 sshd
[273138.062684] [22703]  1001 22703    24231       44      50      205             0 sshd
[273138.062690] [22704]  1001 22704     5522        2      15      521             0 bash
[273138.062695] [22719]  1001 22719     6588        8      19       62             0 screen
[273138.062701] [22986]  1001 22986  1057556   917096    1867    16394             0 python
[273138.062804] [27001]     0 27001    13411       83      32       30             0 cron
[273138.062810] [27002]     0 27002     1122        1       8       21             0 sh
[273138.062816] [27005]     0 27005     1123        0       8       23             0 sessionclean
[273138.062821] [27006]     0 27006     1123        1       8       23             0 sessionclean
[273138.062826] [27008]     0 27008     4288        1      12       58             0 sort
[273138.062832] [27009]     0 27009     4288        1      11       59             0 sort
[273138.062837] [27010]     0 27010     1123        0       8       23             0 sessionclean
[273138.062842] [27016]     0 27016     1123        0       8       24             0 sessionclean
[273138.062848] [27017]     0 27017    45942      297      78      260             0 php7.0
[273138.062854] [27019]     0 27019    13411        9      32      104             0 cron
[273138.062859] [27021]  1001 27021     1122        1       8       21             0 sh
[273138.062865] [27023]  1001 27023     2951        9      11       38             0 bash
[273138.062871] [27024]  1001 27024     8496       49      20       64             0 git
[273138.062877] [27226]     0 27226     1122        1       8       23             0 50-motd-news
[273138.062883] [27293]     0 27293    47531     2442      61     2836             0 curl
[273138.062888] [27383]     0 27383    13411       64      32       50             0 cron
[273138.062894] [27385]  1001 27385     1122       20       8        1             0 sh
[273138.062899] [27386]  1001 27386     2950       37      11        9             0 bash
[273138.062905] [27388]  1001 27388     8496       73      20       40             0 git
[273138.062911] [27527]  1001 27527    27219       76      34       47             0 git
[273138.062917] [27598]  1001 27598    27219       89      31       19             0 git
[273138.062922] [27654]     0 27654    13411       68      32       38             0 cron
[273138.062928] [27704]     0 27704     1122       22       8        0             0 sh
[273138.062934] [27705]     0 27705     5125      140      14       17             0 rtm
[273138.062939] [27708]     0 27708    13411       89      32       24             0 cron
[273138.062944] [27711]     0 27711     1122       22       7        0             0 sh
[273138.062947] Out of memory: Kill process 22986 (python) score 823 or sacrifice child
[273138.063047] Killed process 22986 (python) total-vm:4230224kB, anon-rss:3668384kB, file-rss:0kB

So Python needs more than 4.2 GB of virtual memory, and 3.6 GB of
resident memory. To me, it feels like there is something wrong going on
with the NVD files.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
