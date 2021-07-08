From: Maxim Kochetkov <fido_max@inbox.ru>
Date: Thu, 8 Jul 2021 11:48:14 +0300
Subject: [Buildroot] Segfault on init (gcc-11, glibc-2.32-37, linux-5.13)
Message-ID: <2c8538b1-e378-7491-ea07-ebb0dbb8956f@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, all!

I found such a problem on x86 (gcc-11, glibc-2.32-37, linux-5.13):
-------------------------------------------------------------------
         0.0731111 Spectre  2: Spectre mitigation: kernel not compiled 
with retpoli
                 auailablet 

         0.28786g atio21    segfault at 10 ip 00007f5f9a8d6e10 sp 
00007fffa751f5c8 error 9 in Id-2.32.sof7f5f9a8cd000.200001
         0.2882001 Code: 97 01 00 e8 12 60 00 00 98 86 9c 29 00 e9 e8 fb 
ff ff Of lf 89 00 00 00 00 00 91 57 91 56 91 55 91 54 99 89
fc 55 98 89 d5 53 <69> 98 rtb 09 25 10 00 00 00 98 81 ec a0 00 00 00 98 
89 79 29 10 98
         0.2887921 Eernel paGame:ic - not syncing: Attempted to kill 
init., exitcode=0x00000006
         0.2890261 CPU: 9       I Comm: init Mot tainted 5.13.0.3 El 

         0 2892091 Hardware      Supermicro Super SeruerAllSSH-III9F, 
BIOS 2.5 11,26,020
         0 2899931 Call Trace: 

         0 2895211 dump_stackt0x6,0x88 

         0 2896231 panictOxfdt0x287 

         0 2897161 doexit.coldt0x21,0x60 

         0 2898251 do_groupexittOx36,0xa0 

         0 2899371 get signaltOxe3t0x6f0 

         0 2900951 arch_do_sigoal or restarttOrd6t0x6c0 

         2901921 7 _rou_spin_unlock_irgrestoretOrlarOx20 

         0 2903981 7 force sig_ info to tasktOrcOtOxf0 

         0 2909891 exit to user mode preparetrd,Ox18 

         0 2906371 irgentryexit to user modetO0x9t0x300 

         0 2907811 irgentryexitt0x33,0x90 

         0 2908991 exc_page_faultt0x2c0Ax630 

         0 2910161 7 exit_to user mode preparet0x3,0x180 

         0 2911691 7 asmexc_page faulttOx8t0x30 

         0 2912981 asmexc_page_faulttOxlet0x30 

                 BIP: 0033:0x7f5f9a8d6e10 

         0.2915351 Code: 97 01 00 e8 12 60 00 00 98 86 9c 29 00 e9 e8 fb 
ff ff Of lf 89 00 00 00 00 00 91 57 91 56 91 55 91 54 99 89
fc 55 98 89 d5 53 <69> 98 rtb 09 25 10 00 00 00 98 81 ec a0 00 00 00 98 
89 79 29 10 98
         0.2921211? 

         0.2922851 BAX: 00007fffa751f690 BBX: 00007fffa751f6b0 BCX: 
00007f5f9a8f8ae8
         0 2925091 BOX: 00007fffa751f688 BSI: 00007f5f9a8f8750 EDI: 
00007f5f9a8ee191
         0 2927311 BBP: 00007fffa751f688 B08: 00007fffa751f6b0 B09: 
0000000000000000
         0 2929551 B10: 0000000070000022 Ell: 0000000000000032 B12: 
00007f5f9a8ee191
         0 2931771 B13: 00007f5f9a8f8750 B19: 00007fffa751f688 B15: 
000000006fffff91
         0 2939091 Eernel Offset: Oxl6c00000 from Oxffffffff81000000 
(relocation range: Oxffffffff80000000-Oxffffffffbfffffff7
         0 2937901 -I end Eeroel panic - not syncing: Attempted to kill 
init, exitcode=0x00000006 1---

-------------------------------------------------------------------
I did some additional test with different gcc/libc variants:
      gcc |                  libc |         result |
---------|-----------------------|----------------|
   11.1.0 |   2.32-37-g760e1d2878 |       SEGFAULT |
   10.3.0 |   2.32-37-g760e1d2878 |             OK |
   10.3.0 |      uClibc-ng-1.0.38 |             OK |
   11.1.0 |      uClibc-ng-1.0.38 |             OK |
   11.1.0 |      uClibc-ng-1.0.38 |             OK |
   11.1.0 |   2.32-49-g27e892f660 |       SEGFAULT |
   11.1.0 |   2.33-46-gedfd11197e |             OK |
---------------------------------------------------------
It seems like we need to bump glibc version to 2.33-46-gedfd11197e for 
gcc 11 on x86.
