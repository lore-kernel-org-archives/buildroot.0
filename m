From: Oleksandr Zhadan <oleks@arcturusnetworks.com>
Date: Fri,  2 Jun 2017 13:02:15 -0400
Subject: [Buildroot] [PATCH 1/1] Arcturus uCLS1012A-SOM support
Message-ID: <20170602170215.16627-1-oleks@arcturusnetworks.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Signed-off-by: Michael Durrand <mike.durrant@arcturusnetworks.com>
Signed-off-by: Oleksandr Zhadan <oleks@arcturusnetworks.com>
---
 board/arcturus/aarch64-ucls1012a/post-image.sh     |  19 +++++
 board/arcturus/aarch64-ucls1012a/readme.txt        |  72 +++++++++++++++++++
 .../aarch64-ucls1012a/rootfs/etc/init.d/S09modload |  14 ++++
 .../rootfs/lib/firmware/Freescale-Binary-EULA      |  80 +++++++++++++++++++++
 .../rootfs/lib/firmware/ppfe_class_ls1012a.elf     | Bin 0 -> 53016 bytes
 .../rootfs/lib/firmware/ppfe_tmu_ls1012a.elf       | Bin 0 -> 11492 bytes
 board/arcturus/aarch64-ucls1012a/ucls1012a.its     |  52 ++++++++++++++
 configs/arcturus_ucls1012a_defconfig               |  22 ++++++
 8 files changed, 259 insertions(+)
 create mode 100755 board/arcturus/aarch64-ucls1012a/post-image.sh
 create mode 100644 board/arcturus/aarch64-ucls1012a/readme.txt
 create mode 100755 board/arcturus/aarch64-ucls1012a/rootfs/etc/init.d/S09modload
 create mode 100644 board/arcturus/aarch64-ucls1012a/rootfs/lib/firmware/Freescale-Binary-EULA
 create mode 100755 board/arcturus/aarch64-ucls1012a/rootfs/lib/firmware/ppfe_class_ls1012a.elf
 create mode 100755 board/arcturus/aarch64-ucls1012a/rootfs/lib/firmware/ppfe_tmu_ls1012a.elf
 create mode 100644 board/arcturus/aarch64-ucls1012a/ucls1012a.its
 create mode 100644 configs/arcturus_ucls1012a_defconfig

diff --git a/board/arcturus/aarch64-ucls1012a/post-image.sh b/board/arcturus/aarch64-ucls1012a/post-image.sh
new file mode 100755
index 000000000..8e561d65f
--- /dev/null
+++ b/board/arcturus/aarch64-ucls1012a/post-image.sh
@@ -0,0 +1,19 @@
+#!/bin/sh
+
+echo ---------Making ITB partition image---------
+
+MKIMAGE=${HOST_DIR}/usr/bin/mkimage
+MKIMAGE_IN=board/arcturus/aarch64-ucls1012a/ucls1012a.its
+MKIMAGE_OUT=output/images/part0-000000.itb
+
+${MKIMAGE} -f $MKIMAGE_IN $MKIMAGE_OUT
+
+# Remove intermediate files
+rm -f output/images/Image
+rm -f output/images/arc-ucls1012a.dtb
+rm -f output/images/rootfs.cpio
+rm -f output/images/rootfs.cpio.gz
+
+echo Done
+
+exit 0
diff --git a/board/arcturus/aarch64-ucls1012a/readme.txt b/board/arcturus/aarch64-ucls1012a/readme.txt
new file mode 100644
index 000000000..77db9917d
--- /dev/null
+++ b/board/arcturus/aarch64-ucls1012a/readme.txt
@@ -0,0 +1,72 @@
+Arcturus uCLS1012A SoM
+======================
+This file was located <buildrootdir>/board/arcturus/aarch64-ucls1012a/readme.txt
+
+This tutorial describes how to use the predefined Buildroot
+configuration for the Arcturus uCLS101A SoM platform.
+
+Additional information about the uCLS1012A System on Module can be found at
+https://www.arcturusnetworks.com/products/ucls1012a
+and product support for registered users at
+https://www.arcturusnetworks.com/support
+
+Building
+--------
+Return the the top directory <buildrootdir> and execute the following commands. 
+
+  make arcturus_ucls1012a_defconfig
+  make
+
+nb: Any errors throw by build root may be accociated with missing host compilers and build tools
+    required by buildroot such as bison, awk, cmake, g++. 
+
+
+Result of the build
+-------------------
+
+After compilation and linking is complete, your image should be located  <buildrootdir>/output/images/
+
+  cd output/images/
+  ls
+
+  part0-000000.itb
+  rootfs.tar
+  u-boot.bin
+
+
+Flashing
+--------
+
+You'll need to program the image created by buildroot into the SPI NOR flash.
+
+1. Reboot your module and via the serial console press <escape> to enter the B$ u-boot shell.
+   From the shell you will need to update three environment variables replacing the
+   IPv4 IP Address with ones that will work with your network and tftp server. 
+
+   B$ setenv ipaddr 192.168.1.81
+   B$ setenv serverip 192.168.1.80
+   B$ setenv gatewayip 192.168.1.1 
+   B$ saveenv
+
+2. Program the new U-Boot binary (optional)
+    If you don't feel confident upgrading your bootloader then don't do it,
+    it's unnecessary most of the time.
+
+    B$ tftp u-boot.bin
+    B$ run program_uboot
+
+3. Program the ITB image (includes Kernel, DTB and Ramdisk)
+
+    B$ tftp part0-000000.itb
+    B$ run program0
+
+4. Booting your new system
+
+    Reboot you system by reset command
+    B$ reset
+
+        or
+
+    B$ run bootcmd
+
+Good Luck !
diff --git a/board/arcturus/aarch64-ucls1012a/rootfs/etc/init.d/S09modload b/board/arcturus/aarch64-ucls1012a/rootfs/etc/init.d/S09modload
new file mode 100755
index 000000000..07d1d855a
--- /dev/null
+++ b/board/arcturus/aarch64-ucls1012a/rootfs/etc/init.d/S09modload
@@ -0,0 +1,14 @@
+#!/bin/sh
+#
+case "$1" in
+	start)
+		modprobe pfe
+		;;
+	stop)
+		;;
+	restart|reload)
+		;;
+	*)
+		echo "Usage: $0 {start|stop|restart}"
+		exit 1
+esac
diff --git a/board/arcturus/aarch64-ucls1012a/rootfs/lib/firmware/Freescale-Binary-EULA b/board/arcturus/aarch64-ucls1012a/rootfs/lib/firmware/Freescale-Binary-EULA
new file mode 100644
index 000000000..8145c144a
--- /dev/null
+++ b/board/arcturus/aarch64-ucls1012a/rootfs/lib/firmware/Freescale-Binary-EULA
@@ -0,0 +1,80 @@
+Copyright ? 2016, Freescale Semiconductor, Inc. All rights reserved.
+
+Software License Agreement (?Agreement?)
+
+ANY USE, REPRODUCTION, OR DISTRIBUTION OF THE ACCOMPANYING BINARY SOFTWARE
+CONSTITUTES LICENSEE'S ACCEPTANCE OF THE TERMS AND CONDITIONS OF THIS
+AGREEMENT.
+
+Licensed Software. ?Binary Software? means software in binary form specified
+in ANNEX A Subject to the terms and conditions of this Agreement, Freescale
+Semiconductor, Inc., a 100% affiliated company of NXP Semiconductors N.V.
+which will be renamed in due course ("NXP"), grants to Licensee a worldwide,
+non-exclusive, and royalty-free license to use, reproduce, and distribute the
+Binary Software in its complete and unmodified binary form as provided by NXP.
+
+Restrictions. Licensee must reproduce the NXP copyright notice above with each
+binary copy of the Binary Software. Licensee must not reverse engineer,
+decompile, disassemble or modify in any way the Binary Software. Licensee must
+not use the Binary Software in violation of any applicable law or regulation.
+This Agreement shall automatically terminate upon Licensee's breach of any
+term or condition of this Agreement in which case, Licensee shall destroy all
+copies of the Binary Software.
+
+Warranty Disclaimer.  TO THE MAXIMUM EXTENT PERMITTED BY LAW, NXP EXPRESSLY
+DISCLAIMS ANY WARRANTY FOR THE BINARY SOFTWARE.  THE BINARY SOFTWARE IS
+PROVIDED ?AS IS?, WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED,
+INCLUDING WITHOUT LIMITATION THE IMPLIED WARRANTIES OF MERCHANTABILITY,
+FITNESS FOR A PARTICULAR PURPOSE, OR NON-INFRINGEMENT.  LICENSEE ASSUMES
+THE ENTIRE RISK ARISING OUT OF THE USE OR PERFORMANCE OF THE BINARY SOFTWARE,
+OR ANY SYSTEMS LICENSEE DESIGNS USING THE BINARY SOFTWARE (IF ANY).  WITHOUT
+LIMITING THE GENERALITY OF THE FOREGOING, NXP DOES NOT WARRANT THAT THE BINARY
+SOFTWARE IS ERROR-FREE OR WILL OPERATE WITHOUT INTERRUPTION, AND NXP GRANTS
+NO WARRANTY REGARDING ITS USE OR THE RESULTS THEREFROM, INCLUDING ITS
+CORRECTNESS, ACCURACY, OR RELIABILITY.
+
+Limitation of Liability. IN NO EVENT WILL NXP, OR ANY OF NXP'S LICENSORS HAVE
+ANY LIABILITY HEREUNDER FOR ANY INDIRECT, SPECIAL, OR CONSEQUENTIAL DAMAGES,
+HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER FOR BREACH OF CONTRACT,
+TORT (INCLUDING NEGLIGENCE), OR OTHERWISE, ARISING OUT OF THIS AGREEMENT,
+ INCLUDING DAMAGES FOR LOSS OF PROFITS, OR THE COST OF PROCUREMENT OF
+ SUBSTITUTE GOODS, EVEN IF SUCH PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
+ SUCH DAMAGES. NXP?S TOTAL LIABILITY FOR ALL COSTS, DAMAGES, CLAIMS, OR LOSSES
+ WHATSOEVER ARISING OUT OF OR IN CONNECTION WITH THIS AGREEMENT OR THE BINARY
+ SOFTWARE SUPPLIED UNDER THIS AGREEMENT IS LIMITED TO THE AGGREGATE AMOUNT PAID
+ BY LICENSEE TO NXP IN CONNECTION WITH THE BINARY SOFTWARE TO WHICH LOSSES OR
+ DAMAGES ARE CLAIMED.
+
+Trade Compliance.  Licensee shall comply with all applicable export and import
+ control laws and regulations including but not limited to the US Export
+ Administration Regulation (including prohibited party lists issued by other
+ federal governments), Catch-all regulations and all national and international
+ embargoes. Licensee will not knowingly transfer, divert, export or re-export,
+ directly or indirectly, any product, software, including software source code,
+ or technology restricted by such regulations or by other applicable national
+ regulations, received from the other party under this Agreement, or any direct
+ product of such software or technical data to any person, firm, entity, country
+ or destination to which such transfer, diversion, export or re-export is
+ restricted or prohibited, without obtaining prior written authorization from
+ the applicable competent government authorities to the extent required by
+ those laws.
+
+Restrictions, Warranty Disclaimer, Limitation of Liability, Trade Compliance,
+ and Governing Law shall survive termination or expiration of this Agreement.
+
+Governing Law.  This Agreement will be governed by, construed, and enforced in
+ accordance with the laws of the State of Texas, USA, without regard to
+ conflicts of laws principles, will apply to all matters relating to this
+ Agreement or the binary software, and Licensee agrees that any litigation will
+ be subject to the exclusive jurisdiction of the state or federal courts Texas,
+ USA.  The United Nations Convention on Contracts for the International Sale of
+ Goods will not apply to this Agreement.
+
+
+?
+ANNEX A
+BINARY SOFTWARE
+Only software in binary form may be provided under this Agreement
+Here is a list of software covered by this Agreement:
+ppfe_class_ls1012a.elf
+ppfe_tmu_ls1012a.elf
diff --git a/board/arcturus/aarch64-ucls1012a/rootfs/lib/firmware/ppfe_class_ls1012a.elf b/board/arcturus/aarch64-ucls1012a/rootfs/lib/firmware/ppfe_class_ls1012a.elf
new file mode 100755
index 0000000000000000000000000000000000000000..887fc879075d6bebc092fcf703621362b74d3992
GIT binary patch
literal 53016
zcmeFadstN0y*Ix0p5Z2U1V)XDL1eHoOhQzcVb5%1lGZdA&q>nLoSvpJ+%<_<dpVjY
zGhB!3jG}@Un5_s5Hj!zKGNx5Q1coFEspeu5g~i|njY^uNIVMr&{j3ct^t9*g^Lw86
z_s9F{<DPw6dtJWkyT14D!uZ&eKje6h-2TUtY+Q4S?-gk{&nM*gETSY{xSB=0NgSC>
z!r1%U<>iY>zJyHrIWD~k31Lt0e$ui#M^HT>>=^$(%0$Sm1N9R5P~Q1|)@UnoOY5H`
zgdOO|?fQ2T#rH%$2vMfUuL$wE^Zxhb7`|l(AydB?J#M$p9^U<T7Xo)7a2Eo1A#fK0
z|Ib3;2l)3t4xWo%MY!nAgqv-^*@R=&#PYshgSQV6GC7HGucI!A0%X#XV_YcC!OL*n
zgaf=A@&K2La^VM$agh}F|AOQBW1Q*>!mWq_-(G`b7QR7yzl<j&Y>04cJMip%lzR@}
zq1|wl at lzh-LcrIje1Yev&o2q*EYykn$#@^ur1)NGLOpoK<O5|JuH(>0ybr%lNCd$@
zyt(~fz9igBXg6#g-kI<K2aiKxBHS<V+$RLj at mTRQ!c9^VZrRV|dsz(Paj8HP9*^?q
z3}@RM^1!X@ql5$;<%#d(Pe1<LGe3EH7JD~#%*S~?-i5I9qmMoOD9S2v_-^69B{+xR
z2q%j7Hyl->4kg|xiEq1tOu?bV!L9?^6&%5Vd(OAr3-7$}&I=O&5Vj at oNjT=?J60F#
z$1EH%p3@#mLVo;1TnC`-M=>yE+k^6?jSlJV?_CJog}_}1+=akh2;7ChT?pKTz+DL3
zg}_}1+=akh2>jm&0lu3l at OS^+g}_}1+=akh2;7Ch|E~~Wes&xO|98j#sZO=6Ta&Be
ztC}e1$O_M^PNG2u+knS4%Na+BY8mAkhnz|FI79P*r)wwWjtt?+X_UdeYZm2NpQrq1
zk1oq?QzqrLEn8Ex)@yCSYl_$MUgx$im%g<>e@>ZzQrk;(OB;_+PTF?PD`BUuSG?+e
zz-6M`wmp>Fp;ec<NsmeCQ~wJ}qB?1?@FHn&2kRc8WJZ^<SVdHxNa7~zcG7sux90*E
zHo1ev6OqN#FL9Tf^qR!aX?F6wE)Sl*6aS5i!!sp!Ngt_?puzem)EGd0Ly0{|?89|v
zqTL=ueMKAf4L4B|kriR0{K+5LE8WDEtFEM8)$FQRQ(<oxzvfEqC&j;VW~p8LiYt&#
zir;YeT6t?_dGxuU#JF?8i95xf`EkNh>ps-jJ at 2PvJ5|^#jpj_VT|zAdnj2|86WW<f
z^5wp;HVQPC@s2Djddcghf)qtcUMkl%3oyiNP_AOCYU6-LAFMX3isW;CI3dOT{}SVk
z9&UB>E|cc^7|b7CQ at B>SHvcvLwOp0SP1Xtn9gcSGkUj2D<&kK^N~(06baP!s${*ly
zR7wXMyB8kC6OTcn!D5u5MsPG{b!?`Ah8dLG|E1v0DWcq|N8RK&QBKp*_MHg!*g%65
z?xn%nD9V*Ti(`<Q8X_oH+uP1j{?nUOX>E6TbVlW?Brnt?q%JFbN%>NK3ZIhOCSXKQ
zuE}4^uO02(eAYWvF6*6k=>KE?3MhB-Yq at _)A(e6;%>oqjU*ccNZJVEzH{fZTzouZV
zVr|}QoH!&b(=OLu?g$r#BLv;cl<PkP9QcvlqV^ceRC(ETs`BhzD${^Q8~j=*CE4BT
zLe=K~EEn9QKvj<Ops@Uf05|DSP|~r82C7U(Gq7_S4Ro1)9Y_N^h_M`XVm8->hv!rN
z6SAz}CB;j5DI6tjPma!I)t=E6<xHw-s-DZ%jWbR~sJCMYRlJ`xHiyrRUpG>mcF5?j
zTOQLu71rgz=1`6&hc+f<`X5aj^c*$1raR-3U$Mvi;UQr;<;Ae|lh&IlcX|ost@Cw5
z>60?enz(uDIo?=p3gB6Y+E+*oFQMFrzY8}~1u0cm;LS7YNhE*J<MN0$;BuShb;>zU
z;(5N1%CL*_SPOh#ZaASl`3vRdOvh~J;eD7b<(&V5o%$YW^|^qBvkXsD&K^U#n&@+Z
ziHlm?;U?#5tmp(h4QEd%*MhH{VfZqQa<&g}9gS!EDAy3K|Beei=eJ-HeONy!>GSiR
z<DNlJr%~8G=xOr^8_`Oeumk1lBZ%R3l$^An4JFHxuAKLrFruVKe-A6E4@Ex~>8B^J
z4>55*^kGBApr^}2IYX6 at GZ}6>`mh*;aT=+&IEC`Hn+H6RM*R&H;Q}m`G-yGc at G6^M
zaf&0%9V9*}&Y*t!sp3>pz`hY at urb7cZ##+6KSKk>8RDxhPFzP{)it-Aq-4%&al5!p
z+$dJb<tM_DkU`daP|MBdf)=znQ_ck~Y{U3 at P}Ro{d<iI2I{50 at fQ`~T|3GwNv?B~}
z05J!z3dL{OZ13uYZj*~R6G+}$36Z4b86hRSaD8cVN{;Wb@SGChBKIjEv?VRWmvRRH
z*DcTOe+E|x>HetwnND8 at PuwrgG^dwll&Gr&tbmG2;VQnHo at ov*rjvvyAp>`c0guYV
zRus+FHaS~Jq5as9ve(pl3^=tP7?{ghtd&?fF^TO|V;y0u&M`>&GgmL(Bwyft9#;$;
z1J<1VcOeze&QUL^UR{K8{Aa(!ec#2K(XEuP#>#aJS_-WZ)&@q$fqApUrxKgQ9_s?o
zqNV1gz}H1;jHdM%`?k*;-?l{%AyqiPeKzGjn~DC<p`7)=f;c)!d{_4xFSqgWuTk#J
zzh5uvLCuz>f?I#??23ywW2OkHyL>7C at y~>mx$E%Vh6xmS9#-uucPMH#R<AaT(Meaa
z^I$bru<N?m>};yhQm)i**V~{zjk+Nrh4QC<ETjnM^=bOSNYXcD90d$d%A>sfw5ABW
zVXF%Cvh_u at F@aOspVwZpAJJVl47(rbGU;B9EdxwVN?(~Db~AoR3F#CD^{E}jol{gK
z(nS3Qn^ac2L*_y6xs(R*o8A!aukJuYXAU?fCDY$gc_P3M*3AOfygrU=`i^nUOW>OK
z$y~Gh4%ft&f%=&>6}7eJ{O0eZfdc9lYvsDXHiXk)gUnBpQ|&>=eE%Uo<@%)CTrO8r
zNqto&i`5!cuDLVk^W&_o!qYO>Oe4R)#dX!60~>wAHvl91=A{d%9aC_(6L%la`vrLL
zU%Ah~gTLlZla2o)pXK^ql=*pq=IY<&uvz1&E#s%!Ea2Tv?Iqm`-RD%X+gIHvT<8et
z*clN5ob$K0GYaW^#CghoQoc%cer0#FE39S(j!pJ2$L@fm&bP)!ldI0J{>WJ{cDF(8
z0DfHPnANd?)%qy~h0GiK>JfZ(3ip*`_o=x53ioyLJ&!hc=O*0m8 at r#4`|+)GIX7dy
zom5wW$|~LD-Hi-iLFYVN;lTZ3tyoLUVm9d3db(2Y5U-*3f(bZ31^D>rn&P!SYl~j<
zdadAf#m2eSNxC8JOvY_&Z~tL|_EJuH^;}4Zquh&Q+{+%vc#p&<J_+pbrb_Ow8Rg<7
zdVlHau3}d)4bsjqR-iATIaZ@T7s;34TFK4CFDu(mHsLCPDwUt&{E*jM_<ae_Pm#uq
zGO0qE0qKsA_cHw>H%k_2ri}gW2xUYrC7;fXNlq&h(uX~ty+Ssp2MXzen{t1ym#LRh
znINQ7@<|?55{ea{CVvq^l`*m8bChKztz#u2?MPmj_hlMCLweWz2ohmB9B{Y>wC6Fb
zQg6p&nE}-Mcj>tL3ApA7NTH at klVx>|1+pqfl{~mJ`Cgx`zs7oCNHb0{mh?p=XJt;x
zETMeN<Cym;;G{&&_i?z6bT7hnu(Tl4nqi?qqOD;Lcnw$ak&qs4($B<b8W?Oib7om}
zHhSel6`Ch8tC5D4ZoUg#I6jQ}R(Rv6qP~_`aKkv655K!G&hP}Dw$K3m@j*`yI6U`2
z5$2=|@<sf8_<B|siS+^R#aO$RQAO;%)Xx%2{VG}(#<6c|8}v7*g0I48_MzPe)S>DA
zLI$Ij7|+X at CH1qd*@9b`+2Pw!95IV>pX8fY3mGn>V|632-I at xVm|2w5Wo*tlTLC)v
zL&M6?30e$j=uCX_;$WoFJ>5mn&KZ<@y7e*2H~vt3<uZfI^euT8sY(R*enj8rj_O*(
zdeg!;?53P071uRe%JqG$MqvFT?kLwH8l>-W1^_1BfE4iD1!>fg&XwEpD4FTMunXgB
zrS})zU~qM$14 at 9F1<<m_qK!Dvo}Gr{iE-jnc-kUdK!19QdLY-e;X7bk{DlY(xWj#X
z1?>-RN!4cQ?+1UJ#(3y~)c?6QR+sr{^hl}pkrvd?Veq2l&kj&ijHO|>ZP3UWz at H_r
z+68rUjJzILR{j$l=M5=zl5QI1KQ#Z-E%>q)YUc<ufz9O4>(OWa)Yp_FLqf)x<2e7}
z*aHlQ*;xMc6G}dN5YIkMPC4eQPcfunW`{ec=s^QM@YZEfE@m1qqZ=3v7;-eTOq!En
zb*-^274Nt8%kte*jlj!ZF8Nj6tCSpDMoD`XR|>qfy15geFTh^5Qop7o_BWBf1M%W?
zO4O^yRwe2GL|$t|nHdU+Z;x9 at t4^t1;98SW?!>qa+l31Qp3Ye`5IUG560rJAAM?C@
zP9$;pw$6z(RnKv)an2FbUGt9w9kDT3j$fI3&a;)tM*s2C=)om7*W=;t?})+7av!(O
zi at V*2YSstkoQ(2JOVt8{Buj?@hMJZILVDF4$TU&VeC}^)030Bl0Ah-k!i+NLx##hu
zgWhk?5jpZU#t8}feLu2a;(=}Ti9f__i!|Q49<b<S_{RD#dDZW(O%;|Kp@Vk#KtGrT
zPR)O~l=brTPf3+H=qj$&R18yp{eAiy7jJkyPCgmM5QguTb&RrH{GR`q^eiiW$>*h_
z6t9$mRE4ZV{R1s8GvpBD^aFXV(M->yd`qQ0uCZG>xbUd{+Nh4_<~lu$9~gEBj)o!X
zXP62OU&}N-{S{f)BWItHA at on_dLQ`wZ*;viYx34|jZM-)$O_U{sa8|lYFjG3xG|V6
z`n^OK{Xuge_<+=+af;PR)lIH-Ov-j9xe8nXPR3nq7kQP*X|Z<$D(~R<_r&^zO_-mj
z2HRXF@r2X1Ebk?*%{M7eKUbLA$<sv#;=sFBjp~<}%R22P8ds0-Hgd|IkNMzjR>KG|
z`#qb4yD<5>)8 at c+v|)s6wYB0Z0at&t_2OzVt`0~q;_9Sm<bF@~*xr(ic=m=3+*u07
zRigynEJ=8~i)>-CMFiH`N8d4Nhjc^pFUTyggTJ_Pq4^gGDe~LT?RoN(zmQVV?b=}5
zEoGyoXY1?c(NH3!EF0BaLokkUawo>}yV0 at 4G^3pdpuG;FrOx&ZXzKy$8 at 32C@i{#C
z at x1B4F5mF?asBALNJt3^90lm%2F%nWI681$O3FuTL8;xW2GWoA|4VNFj;;<#Rkl7T
z-oLy|w&$Q1@74$7x6*DEqB=Od|M>*jiA?pOWLk6o6-w at bjyz2%427CL&+Fmsm9E^@
zN_(NEwV|BOwtoXlOuzb at 9G`W?{U4<juY-jD;XMrnnZ?3A#*#zI3?F-?kjlQu0jK)(
zsQd+qdZN`r$kE&kA2&IgkGfj!)TJ59@#+6VS_!M^gKruN8p1P+Ars#tOgmg43?B;5
z@VV$At#W&|(e^$Vv=^io3sHxZ5hTM$mD{?-UZ^g*-On2;Q|lJt^Ytb7KZ!5vP<!53
z?XHG!dqIW|r0^(VT5CZBcPKo)n9xx>jZ_T2Zc^K%gIITK#3<{v2$L%=;y$twl2=)*
z8Na2m1)!jZxN>ow)uJe|*t&8T?iOd@*&n%Um=|yB5Fi}G^eWJiA<BQWnB=Pp$akZ2
z@PDwKpb70fKYnJlFE=#p_M_fXGLHACckO36lXRD{BDL!w$@OrBT?2s;FVK)kV)UUa
zv~L=V-K4WXm!-WlIHU80Ih%zGki7W5ndL<lkrj>5C7K|y%+f!;pvkgO|1R}5JTVXw
zkyh9hPVgOg&zv4`!!9Nd&2NGR{!VdKMbSC#ft`?Xnv&kDXk5^wKU&;E{gd7+e2;xG
zr&hQiFzJpzd-5N*F|p2YZh(&<6-C8WtX5V#tJ$)U)y;YoQ`XRNkq<E~s2^<WWE$3c
zzt1~Rxuw3ou+ws&e#`#OFPYWh!2Wp!kmHLF6#^O=cIfxb&voU9I{+1)-<&$hjkx6d
zLTtZkENlq|2T`;@N|7czHBz8clx8@WO7|0s?W-0m-sQJ2s)To$K29;y*SR#)&-vnk
z><O|t=o>6rA>*ZUSVhaIw<SwuvQDM*EUz24XtRt}+Dqn7jQ*fBc{zcWJyxx{AhXPs
zOY$<y7+s|bXQeR|RvjU;4D?`&`4lUuDa*tcz0gUyhjc63jmB~nM+#x(Dp!#de`5$K
zQst^(;|e3j5NV$jZQNuGR}u3mV-WjVU0z=&KqBb)ISv{T2HFy+$~9V4CNb4$h21EZ
zDl9$m7OE(+b&W7?#N-UGqGhm|#X$lg!!#hVo_Z(NB~L##oqB7l3>jT~PMC~Y3X7qx
zhhZASF@|A9k1@=Gtfq{eDx8nV6;h0T#!}cIu2gtcY_ZH4FA-Y~7 at o*1&Ge&QhT{y+
ziXOvveC)yr-?jYx at 7Om*k7fF?FEUGGrwQj7*0A=_R?R>DhLy_n%Pb}N?5Zj{qp~Zg
zCAuo1Yc(VeV at m>X8xqCdlMQt>RgBy3FR!WHUsJPp|C=?P`w!K8xc|8A{DD_m&QPxC
z<Q-`7h09>AYjTrHz^aZ00$$8c8>j^bw_QyOL at y<1>5zDvAq~!ay0JX=W?j4f<%FZQ
z1aN+%n``$_FId984D8ra8%@3SHOx|ROX`xL$entD$uH&4*y`}>&f)YKdi2)D=kR#W
zzn_$`DJ{5VUk67ORh7#&!@j0ysr-H2y5NiuHs)BrjE!9$VLew!Hb$Cq%5~YUTvzzA
zGVw1LZz?^+3>;###$>dF0ecwkKuY{FGe|wDK3br_9)?9{7zTZCWk<sHI at rM|os=Bm
z+$YP2oVA@v;V!H=$4S_^6cQ}1z0d`{-nXB$w~p2KE)7bEhMhWwNjtDrOZHxKuZ-n~
zKwo<rt+5_^UE^Z?@WO|gOay#1irL^xHI%q0lU8tECJbYq$K=sb$eetC6fz7hwz?cH
z6Vk7Z&-BaT^~3s=>|Ot!w-WZ%VO*T+rsEV<R9CtHA7|z0NMUtLK^Y?Lvqu|-Sl<Rc
z9n2cpWIxGd(Yn at zqi)iU(GYiLna-$i$YbzJh!$X<*KVT<v*g0+abflJ=J7i-13NYV
z4k`L&dTM!=`k@5rd=AHHA?55$*%rn1y)&^jS>{EHu(UAvjMg25FFEPjGHB^8w3Gx|
z<ZyRvXl#eox%onr%82Jy(2l;uH__{*t?i>NVl?C0JaeA4q#MF`q9E&X)@M}t5!caE
zp86;M2hA3m#cc6&*B6Ftz<UkmbRJ#2*IyWJ2354AIF>fQSoADgY4PD{{<<{^8}-K=
z2B42vAv8c+1KKgYD~HXMOkXY4(aAFyJ#(TpGrn~3G+qqU%_N(v>RO~C;8s^|d_`}F
zV`*lD&C=3pn`vuidJMjq(W+_ZG9z0>wbHz_ca~!*>n)>xJn(I1VPcF-CpmKtYUMOj
zMr+rEV?JS*ooR*zS>X&5hV4&vY;bX{PvO~KNLo+1IOru$(ZEsM%ZLCTVRhyNbOE~L
zuthH}r(FC(bH$xGq?}i?Yn2H39C+fNtN}zy^w%7=>bmBqoi_2R>%Z*QoJeA~EM;Tn
zsxl&Dl|@hV%xZoDGz7i2yvVGdh95UBX54CF%wSs=G5mPdo4>ukBG?io(?MpL|8a%J
z+KQ3^`X|NX<-rwE7R@=|`EfEIUIMGZk1Is>F8-<XNW=23RfmN+ffdJvm!Y}Ln&%r`
zc+nG1^xY)y#Lm6YDhr3{!{v{I^IC-`=)-S5PPv5Wb-~m(Atq_-8qjm?#<W1nZ5=Qy
zcat_r2t^rf(r{bxn)0qyCd^7(Zd`d<@bQp0pR8HBU#NLe8b)7cK^mJEU3@=m9o3cM
z^3he}CMR<FTG%hW7SuC|j&kPjF(bK}O{^54?lW4>6=FY5$&|g28qq)dQ5U>stw-Cr
zuFb-=On+U@#S!JP%yMvvEfn-Z4c+du3Q`2ykRLFZd=ffd!-BVF)u`;Nf+p%L)-Uf2
zF++ESN3cMZ$DW)qj7h|ttys*0_mYDLu8>Z$ej85IZ_p6y9vV{dHuWybNo)d5=`|R`
zIZjfU$Y%X8)@J*HT^P%b^84td#9gplPpkOT{5Yzp{jt7V|2kLd$`x-YUl|->ev1}M
zI7!M2hpa6QQO?!$c|b22(1;pgNWF0oR{8;r5T!1cr9$W*l#7UiUivoEMF at O^NqOU?
zM*9-=gN at xo;JQb;s}9mhmZur_XgOE~{IT at NdT*1Zk9sv<r~X!ho9i{Qw5*wLy1WuW
zNg*}FTh?17t7g3Y#M&x8CH9E9q-fal$z}L6`CHmT+eEvnzqwrd3SgM0$p>xg1gx$w
zs?D`(hmw~I%Y`ej?t<#eHdoSrVctX3-^?_n4eBzKJ;|sY$E4%}E<{~M>X}Wd!xvvb
z*XZw!$tIAv-hGMlBGB*O)sP#|hur-S&I_U3+m8^~=wNLujm~Fx_G95>2(`5yBY^7!
z>55rC$7x+me$~PT3>?(RkWlqkQ4;f0z$8+iBBa3rf4;v0+ at vZLax1(gDOwH2_D=P`
zSHA=A^U~_&`0c4)%YG?W?KgIwI(D8rcGj{p^S#la#BN+Kl_^0`Vh6iM?Xv)dR;sBV
zi793CD$g<Lcgb3&1)63#>q&%059?9?4`U$Z)bo9pwOMn2gV`WcRnRFX>U67a`9o_j
zN#8Q7Avl<yz8BPgn|4U1j%2#Zur$)7GQrB?hq>nyW3+R%@ejsmr%?X_%t}WdY(=GX
zQn{OQ^NMiB{2b5alJJW*xtoC4OE`Z^14|dvz~YlMu-pyLf1E63cg$}Rj^gQ;)Gz5B
z{kJH0p8BJlKg#+4w{rfY<qT_4?$2yi`+gV`A4&jctjH5{@wDroX@%SR&$PjTE&yNN
zh~55Am4=qnYr?EML^sJZxaC*_{^AICF&47Pkz?9dNzp|Q=mGp!+HB0jm^Zi$+C80Y
zogxmYgJ`HVi-uaRC&q!_^k}?ks3QyZ=1|8PyvfEJ&*&Q(X6eQ8BJ3Yw<r-!K!JP=I
z;cHkzCs#P=WDDr8Ve2TTOcaFac%MzfDm<fhUBh}NXLyx#<;vVYXkj-Eb1WrQC}qVF
zHELHejCg^Y$^OxR#3kV1q0Q)n!$`xL(Ry=#QXViO)G_u9JTuI}yjK%f`XuvdZI%cQ
z?*f<ZRl+CLL^-|-cH8dHJ;p0T1pefByHR_oQfuEM^3`((J?%zuv+H@M20U^fyQ4~R
zbM+qQW>|kdz)bgoK6Q&}a=(;_)d0sAZPjy~;WW^)1jlI_Xw4c=m0;Bkv|N`VIu+dD
z- at z%d0xiG5aZT3tm<+&Ka|}-`Y%&}dpBnQ`WA;&}zZH_FL#a_(jqEI0i#Ds)C3YD4
zunzN8JjRqyS85%sc1O677QQ(G*!bD<{gArIDbT7V@(8@d%@{@a=tx|roeiL8z!%Un
zSPtty5z;%Rbd<yQL;7C>F6>k9!n?d3F>2U}`o6@<Rn$DPKZZUmz-!xK6e5{Nxx?7O
zoeQ47Nb|k)0X(!uAxazquNa|OI>-L!tbf&@|JDM>U(MlFg{V!T!b<H`z=zwcS_(}8
zvYXiBEc}}o6GroXJ!&z7XLFMEoy|$wOM-^Awm+e|4o@EM*vjNoXPq5)6_3D6w-vpP
zk}0f0+6S3EYRqaCfVzIZ#=O>hZQ*Om*YaQIQ6pEsMCM$-cQ5KS at sLiVssV{$^p8_3
z1;n9nFXP!3vur1WMhf{qs!D$T8Fa?8X9~5jfyDd-vyu;-ViF#&X14VW>LSY3J at W%E
zl<Lx at w)<KNtl`%BJ3d9(k365rs)L?h57TKe7RVmpAb-M_ZeaH!Y0FBxJEYfSkKU2c
zu$n8bJ`ibg8(rY4Vg=bS5Eyw@yvbPvirKOoePLU^_i4N8%}igaF+ii$ltRvpl<IVi
zm~rS;VgqLK7>;Kd*B6)Sz`yx5_V!Dl60PlM{VV7>#|`eT{je_8G7nN~V3-Nip`C`{
zyO3MoX`pqHGvaw at ARUkopu1Q#<ziwSJfs2es*?{-fcid3gUtsS94M#mf*ik#`bfSg
z8wL4fDfEX4HR?Rde}|Sg*zZrdKQ4yEGs!v#dwDygpgm}7FS`e1pmlKXBg!SE@4vJ|
z!Z}zhx$TgKKU;zIQxDwQzo3cwi|^^a_j1}->r=(qo!*ggWTO at FTD@;@Uidx4 at fz@J
zZH;xiD>res0oqNM(U9Xc{P$-EJpr7oy~3a|*KmH=^T8JI*Nk0xc+P#iQJXsVd#tHG
z`L2{vd`dL$(~#19jBZl`s7hH3px()P_D~$=qAS`eUT`tF;+WT;+<v_tz5wu@q%uj-
zqLJSRD0NeXV^A2Rir;;OQ5J|<+v)(9a}flyOFsQZ`%R{=*E>I`wJ0r{flGJ%L`~ue
z%YN2dLoZ?nu0bCj93DCQL`<-dg6IM6<75^+K#EyU&#WK?+95;|G%Yi~<o!}%iZUfX
zm2ZogC|gt?G)&WGF|J=92aUW&xT%kV$N5zO76!#GeJY^-k-e_5-M-q8z3`|wS=M=A
zGhq^2>uOO`&-!8$qNty46MROqZ)vHNoE;#=dU$6(Yq5XHsLvl)PvrmOBcfmr{zN;Z
zg_M4RS66Yca;yu7EFqv44ZDU7=MS<sz#9=DCKdrgc7z*=gcy}~xJf$Dc+hI@Bjldb
zm_w_HnMp48ELT3&w5~<n?bWkg<y3<hAf>rI9P%@~679FR;8;wQ>>=1SWx+AwJ(a05
zeE&Wnr6A7<d7{I50Gie(3HzV9W#w;MGTtU>FOiar<;kEh(zm;|8H=^c?L+l(?qHV(
z-ZsA4&sd^ciS^KAENy=!vluIM4Gqvm)$O6YZ5zYN9RIE>EwRwG3k>zq=Co4%D>>$2
z&#5yRX2^H**i4o~lc|7ju40~Sv1D;h?<|PZGrj8&ouq$Pf4MUk5lh{ad$SzpHk@nd
z=>3}uX2ZI3h%RF5b*68GsS&!>f!X at B9CN>!$*vKkA7N$3NrqX$d??R=GUQ+-nr#a+
ziyIngfCzn8UvuQQlt<JC^j+M&Dfc=s)I^n*#j^f;4z#kjF*tU8W(guOg0-8q!@!FA
zBN_12dyJ5Jdre-^nPozXvyt_LMWggDi7vLa)W at ck*2W4mFy6GZige%fav{TzYB<;D
zko(5<U1NQ_=uytku#k5c^niIm2FV$#e-%+jCjB7BF+0N?T_P<Us|!BsQ-%!lo!a_J
z<huC2?y<Uppp)!?%_<ri@r=g9hBHUX2)F>#!e+d$;x2vx>xt6RF0NOuv?sJ?2pQp+
ziIYDKH%^ezlVl5M+yqSU(=9jpA;vLleHrH8*wADQkdhk1;UQ+SLcB2$QVYrciFpzt
zOd&^RKc|{Uc?o`b+qU{Wj!8o#^Eco|JjqjWL&W$SH!(hsKKTxj^uIPtTCiLH?m*jN
zo9lXdna<5 at zMwR3v;!u`)-bx?N#$p-Pcf_1`i;=x5s3!N@ND2PtgZ*%jO5l&GC0;(
z8X8+>uCv6HNDtM|POA`RGJHE(pJB%RZs-#>=)7x$l{scci$2S)ekij99?ypan&#`e
zE?_Nmd=TLaODg&7CFbpkAbt0Y!yv at csW$_IYPUUPM?{DYen2to?O#z|Mcmv`qZrMk
zC-J=Nx-rC%o#}5ZF~nyUYcs?eBjgmzqcT371wJip3<5rt18$9ms3WPsA(G*nSz?@Q
zi1PXYq8T<jXGdPo48t70;MDZww$x-=)Wx>9*oe|6F^oEyoVFp|YDf`M_34HSXAzNw
zzH(<f5d#vbUCCld#_&O%v56eZ^v^6wepPJF^aVVP;0965(w7;^V0i#kEqP{(Lv<av
z{i2h#WR~QXgebJ*!`hKsNkKc$$nEfFH_Ek-DA&l?76dD4kZz{kAimHV0BnPviuL#}
zs$5_j){*s5aRk`5zjYAtYQVNX&zgvBpi$3*Zp$&a@a@1dsM#(h*_$GZAcb;P3I3dl
z*v*m5yHgRn0kGP~!3Nv=76-e3?;Z}Gs@?%ki71I>WQz*gr(;OGhB)b+;L!)e&DBgw
zKxB?<r?ZLKIGqP!@oXHgv5&P`CndpZv9+-Ytp*sRs_9sdYhzXL5#5X|`XBo+Aorm_
z?!(N#(}$wJ+lREVK1`77D}QJG&bp%gy3V0%wl&ETPk;fw1{Nnpy#>h~*n?HZKi{~d
z_Ta*YslQ=|Ot%7Abb|#^<f5&<v_8vF<MI`3!VG=-9gg*Badn+tNrQEgv+m*-@E0Jy
zE$Yv$!GwsZwrH1kWE0tLWz_6V&LUnIFj<D1E#NF`bT)hRzTJpvMkEVjl7qChR+}t!
z$X<QJ4X+F25?xf)JJ8l58HT&A8`gV$TV3bEYHE!RC(b(P{}X8oWMS$BeT+oqGYtjj
zldKm>d3IP^Krx1ZJI`XiHrTToEexNI3=MqgGNETC{y)db(aW_%{bz*Ken at apKK35i
zq!3vWbw7=^kAMe8w~pMAm)Usn?pfi*LqP=an^1nPTz+orNK#%*S)0r$q5Ts`)#PKB
zkTPcB8S{aUO7Ys|HSj&Ms8#AGPPH|`p9uNe at Ur1|8gG4y{_60^Cl3>;;ktggeov>j
z3esCSaP|0oOnN&maQr-fM7h|?r*&}iXNyy0n(?~Va1JMA>)nQx!z2A2tnY11(w~4G
zc5UN9XnKz)s$mVPMI`MTG;l$u0ahjb46#;@RFiGpf7i;vpc9AHW!1qJq+6l=oN9LE
zkgY;WhZ3F%@=<?`Vi!*~;65Dj9OR>q=dHzT)FJlouQ=~RH2z;m-rVKTu*XNwv)K%u
zZ$B3_{~g#-&>I?zUO|FG<Zm!C0nnd+qF?v1eo>8mgjnnvaV>HHqQo`G0mv3#Lk at sZ
ze4SI+t(vcdY+1e=i!{f0Y+ at F^3}!YY#AV0VdkAdzhzTgnEX0{<I|Z8W(+YtllW`AC
z4fkI_hR?&OU;%|MEw$fUn>BCsIJ*J!$ltc!P;c{fZI-KsYHHRXHUOG|Zbg5qm=z<^
zU`rG8r1s=;hirAa8PvzttXuC at 30!E`SnmBp)m!04x2ek%UxI$ViKndtanN_L8ej=R
zPr5e5?=)P)szMaO5$G)y7U<tIaWvo3otfSYox#9#XJ}VOl at S_oldzH$fa<bUHO|s8
z-l7Is%@?)-X6rVAZhWrZ4jbtj*hM!$E`Uu`JL=0))V@c(Y*+O+IR&KtLD?R<YH$QL
zcNQ<rNeo(4ZAKj3CbssJJZYV%RmnP)mjpTA*^UUYuW&vI+ifm%o-e6a<z#nAJNbcH
z9Hhhrsjamg(w_I;#S!qz0Pa%%(}&n<Aj-&FEhvHk?Jv<*E>{k_^GT}M_YA8WYZo<Q
z%o}g_3clE}l0~xh_@rFII8g>~OPe6S_}aI+gM=PLoG%4t&IDF25^YR37_$hn^%0CQ
zTeU;F<+{tsFJra|vj`HWj8n)k8HZD5_V(=1ZLAumepVJOTT6L6TQl%P*rV<F@cTku
zuqW6z;mV4u#rEASHUwAC*x$lcAq}?XA;-lR*tk!w^9b<qCx5fbrjMgdBqEK`rVrQt
zEp37Y0J^LOK0okZ-VV9~+wyB{&HUpx<KlRB$!kf3B>?M4wry`47hS{hYG5@%_D&kw
zPQJaCfG3~~KIl8Frv1(6`>)V<P%mVLu=tvPS?i@;cJu+v#8`$BU34&PV5DuGNL{-V
zI};n|qSkhCg?JhB at pz&gHe5#4#;Ar^!|YI__FBx&9L!EDU34e`v}@6!I^8RDQT<{z
zLv+#MXZlwqXF(4|Oi*Lhk-WydM)=se3gU0n=Ls33z5akU7Rk at PKz;yZb^A$!hlAbF
zcERu!XNTYXg5hg!H_qS0R-;4}O6)_4?I`gPuIq5UnT?WBM+SwD{sl2XY*mea_Cxlp
z9<|pm?pG&g-S;E9XlIy^K7nRF@Xx|Uds(_Hy*8Tj1o*sj3qGUyBYy*($+w_`oErw6
zE2EI9U)(pSGC_k|)Or%oIbn}%<?XyZ2&I*pb>pD(uXb<w*(xEUV?MNZa_Xab4`9V*
zh`;9Egnu$a{0-NH^KaGD0MSMD`#NG!reoerl=(LXA7Jy=@v!)?jYXlecHv1M2cr-7
z-+Dd@r@l>q(_+;441?8wgVe;R{kUxh2bh06P at F7X1(mxI7R2nyQbkzUKuF{{Sduoh
zL&}B594v;5n_zvCKv8xvt-JSQSYG~<S)y>h21y7!0g^CcfbgypRFESVs^1!fWr}i|
z0Z5*V?t$iTpKTwMzG69a$VgG>m<@ju^XMT1XE&a_C8X<@Muzs4!Cv%3<Zi%T1PbPl
z-#mPK7^U;%>>f_-#C113J|0eu^}iL=Vt4gE at Rnd*lye_srgKy&!U7}}!#;lU=w{Hq
zynXNsNN(J_-9gYZ&Cm-=5Vs5(O)Mz61ZOt-u@*E%<cm>z8d`=|O&;N7DL?TzdQ*f^
ze<RI~G(naPv<}7>$TDq_t<DvPD0RXQiK(u*$#JB@VzXLC<E4^kG_E#W>nb+jz4A1J
z1{cT|sJ{Rn{TX*}a4+K*o__9Kask>y6>9LUvDQlZRAFW3l*mw{uhHCBrW?xijY*=s
z1&{%^d<*LdQ0Vbo^l;M<I|?3na#yDLqG#UZ>I7XRo4ZZXE?=fmI1`So!RWlGGC2ku
z#61QLg_CE{U{Ja^!e2*;$3Pt<P^WmiN6Zc9z#acvjvo!2-zmN-4w1bOV57k0n74b9
zVVX^&pKcRzEXDC6j%*x8{dDv)SpJQYe^ClgP!7K+iC>h(FG}Or=-R2Du6a&ezOVsn
zC`y=-_^^1*FhmLmOtu*=58mB?o|>C at Z%iTLSFa~F>7#@dpaRf&`uCGUW(Q^#U)k>b
z-7S0csD8kn-Fh!xV*E;of~BO5`Uz7ZMQ*3Q`g>5*1YVb%#k_#We3)FMyL at yF;!mo`
zX6+5|;%r?Vyd>xJ*+NE+4<MhePiGc{{$FPJ=!SG*+Pb+{|AtzD_uRH!uh74u{k;D_
z^jXY)c}utGZ~uoQ807;@j>SkL$o#r~^Bv7g9BOQ;N!kfsBW$g8$bOZeq$d3y at pZ!r
zMP<WM;pzfJjdUPt1Q}HrY0_T%FeKejeKWkdwIn~nge;|N!=C<qV|CuLu)o}Jy75oq
z)ys%qg)Q?eJjby515-_^FqH)|ltz0s>6!u7m!mtoHn%mo$vY<cs`lQ-IO*V#l7>GC
zpSx#um|}`pRDoee*9KDT4(T+_IXHG-bflCVsL96aw{D5DfmTRS%&*RJcRF8z)k+ec
z65wg<G@@s-5AkHXFs#qEIXYMt5%cv02vTi1urJCMfS4R$p*S6V+rWK|D1;)W!L{;`
zbu0rO*Z|8IC$v8gc{<8&z$j*^e@2dtao17pK+f_MsD4?;=FSi|S-%xp(YkrQFDcUs
z_wzz(x_AE*`}wgiAge=8M656?ug&V%&>4U)HutB^o0L|N?j at x3FPP_LZy)kymUP)3
z2w7NI%NJsG$<e67Txe+}jm7pU28Vsyky6p<1^GqPv~GtMKxY1|%Y#^S`Tj_$+}7<Z
zSsKFfWKVE%oY@Mk!|G?<Rx%enZ7ier!8q+w>)Xr=A-0>_b+DDX3Rvt}m_ at xAc09xx
ze6r7yXAQH~jrTp2B#1rQrD0Vp-pt(2W?8)tc>t+$dDA~CKUz{#*bZ+`yN6V>FGl0d
z&`SE>`>MT|`HtH?+NG>q^=={EWpVDVe#`YGTaU;K;;gV_I-Z412=gVyID at 76&M4_o
zL?A9k1mZJ at KukH1?R;^fd at A|bwgCdj#%nBw_Bev*g&opd+uLK$q;L)~%azjOwok^M
zIB;KDvs_whZ<QlCo`yzIoRpW8=MEIQA=%`ML*nxI2E!1p^I}VFzP1w7v7X!E%5(9N
zc_c5=)L?B43g`4UxQz``<4l|@8XS%BIG4m0)MQK7NPfL&KQa&}1dpy+xvu=!e8dh6
z_cx8Lvk4qow|x7-`lj7$ge}51uv1(XUly+ at tjTi+Vv~O+r0Fx(7i$}3N at LG7XZq?Q
zbyfFnLc9}aNf^zDW^1h8&En+XVc()p)n7AYgDyQdK@J$p(T>P<i^n})g<@8O2|WVm
zI2Ch;o&dj;{00%Dcjc?gi5Z-IE!8;Iz#f$cd&hU&b&}VAcC<VVSn!zPintv7U~_||
z%X8S;U^^@|G#_>}968+D&~v!Aq3>{i!?nZ14I{2uhdr*H at mFc^!a0aXmc+|w0TC1S
zlGbATw$`ooJ*`dlw>vhp9_$E_-xaIPqwhM3Teo)j%Fhba;05+=1E$uk at _in=mvHag
ziU=QWj>1~vz+5sqDPBVTxoYzq?*Wr_Tc>fr<k%`d%Tt%IHRM&qzU<6l-}cvxjt9@Z
zyh>@1FpWTu{@ZcGnv0s`dSvK;e#UA3>yDNy*PhShe at HHn3=su_Hf&Qnb5tAPp)*;g
zb{bV%Ntt*F*HNA8B`b?yFf8rJR~1L at q&#5hNOJ2hkwd%67K&8);8}P9o;>3FU~8MF
z at gAyN_yS~+N8aALP~7##?YD6cwl*f;es>V>-n;#73Eut3?RTf~?(^I4vheQp&Yid4
zUhkL{*Gc^!oFm>N?9gLwIycO*HI$$qz6;J8mK+IM(Aqea`l1j1!V`yW3&n;#><#Gf
zlSkt5PTK(qe(dcLSBP9g at tlpfYLLsxb#xTpE at yN3%H;~?lu`eM;(+N+3j?OZHuOQU
zP{f?@94PDw1&8QHHgnv@iV~*XlZsk)-bqTz=hl`WK8(eOpm&Jg^;>vM=IVjy`*Fhx
ztYl at Z*MRAW4YrlmG0ZWa3trfU*|)L$Dj9o}xaw}UOt1(5lib0KF1YeF`F$UdyuNE=
zYh^;_J9OPE at Xz?PUti}3y^7b>uPaT?T3>v$SihRJcgzRbyhM3IsMn`Mn$yEC>!;n!
ze6m7 at KBfOenxAk%pVIeWs$Zr#IZPKNUO<ax-5g^XzEzN#v{KlNEA{Dpv(kL;^U3sw
z<S-L=i%1cCCWAthKE3~qG{3ZBya^L*coU$Tqm9u0hCde#|B3u<T3={pS*ouvn2gM6
zeOmt})}|1qPa~Vt5FewPCe$0vXFZv|(9qE@Cfl$+_8T+Ja__Rw{$&C+nTK^YfrgF2
z$()=eE>{=yuY!ErEw2ePB9mU$T?sX*_fdsGqyLrgvfxl|(7$5zF&3Y7B9{U!>7w+h
zXa9g)2wtqz&LNO0#qCC)P!mcV$Sj7>K`wLFfhZyi?1hs-71NDAXQ3-4PlhCxes+^~
zi*`<?kM=kGU+(o6(pVXN%Gv6%_bF#9C-k1t!U;1t+EXzLvJrG0mrqVv@+(vf^N7aL
z*s5b|2IlDYaCY)mG<KZO+k{sUQ<bqE9uQ+mPHEqjj8ahEtNM(yOVdH2GfRjy4YPEs
z#MwvF$`~E*JDpjQ>6>oW#%il{k=oz#pWdsAE{9juhFr`+U_du&IgfrPLu&ETOQTQE
z&L4f+_x6M_uo)N^1J<=(cS*la3v6r84<&phRqA2$7ShhH72OPf#lJHDu|Ac{Kf8+L
zpDiVb44=qLv1X<r3f%POR^c`7CX+^@{=*JyHs~ns+&+*XNz@s(&h+mdhIc3G>>=yt
zdA$XPf|=!cqLr1|f3z!-Uq-ea at v0bwF6F{ZItOs|GwmGh7F|UD`?}c#R-6c;ztI2Z
z0nbrFxud53PGG}i?B>9|L-;RY3BJ&Otp86FMh+Paw$de#>f<0QEETh0aU+Rwm$?oj
z_BB}oEub6y!P>p7$T<z|nR8r~^!B}tpjV=;@vzL<q4C+uNuKSBJEX_N?R7zBv_?Vx
zib-5d<IU^Xm-y~gL~%;49_B4(be(cM_AQt<6@IwyU{PoTY^bIfQ4(^5L~HF3w~oK8
zSob{I^mcS(1$07_e8F%7+Fb{0!H^A4-A&7IS6l=Me}ilqh&Pm~k$q?=QNxbc!?eIJ
z4X<0uDN$UrPIqyMvkf!x{Er-B2g#sy7=74>GKemi_tViHO0dxUgFY}DVz&x*b;oIV
z;t;b)PBN|EaDyv_MTobyVg}`X5zINH5Kt)M%qrz&g^`Urn>5nlu3F|zW%?#B!7{61
zE#mH8j`@^$t0%FYfS30Clq(Z$k|(hXJ(26A8uJJ=Y7$jphPBRdl|h7(GY=ugzJQcS
z!GQAZJj9}#Xz_W<HD5#a(#A2`D$ktp`Nlpw<_hv?p>!e<kt7btDzX*Wp)MM$(~o%;
z`u)egdvd(35@mf@kL}I+tMF?yU*?QwXxwh#uxeFJBcd-h49pe!I?F*Rwz2uMEo}9_
zIHDr0J7f>nVSR?wNWI>Cl?EmM0 at 3^r)W<d;j_1$}SIA-LLOneEu2&A-+~tpR<>C7q
z$|&!=3cK(<ow?4vtuIjSFybu{VmhnCfZ2Lde?`t`<o2Eb56kBZ5hIM)ZBp0?+?csx
zLA}0qbUqL7m9=suKj^yQ+>0?>#rqw0z%1%oLxtTs>gQk*v$D)S13tlG;Ntfzm!Q|A
z2q2q<R{$Bz_Xm(bj&mI1D#!`8W0Bg-aF%H$@Ed>EzZB2A#8(EfO9%Y<Kcztnp8%u*
zuk~#9aowxnS!B7~N7p*m$HW+Mh75JCHExg~vs)QE$FN+ruH!4Aud&4S1-NG?R+d>m
zV~DI at 1KZNxu2ojQi#Jrcs99lXX8!G#CbYhOh-7>x`9UA+hfIDSjvt9VtXFJQ(o|Va
zm+vuSSL}Yc|M93z0-4_6vONl9igz0>FucLePAx~8;W7KJrCH2?&pgr<BE_HMADpFq
zTDJ96iYcEz;3677%A37i>&GJfcwWYzaOC-rqp+zIi5V{FeLaQzUyE$F at KH>;?2Bw~
zKfvuZ26gN!f at oahYp9Xnxr&u*>~VcFG^@vSq{rC|deTA_Er{N;b>ZA+K#p+NACEL6
z>MIX*p%?Ibug4W42`($v0?ulstIKeqtID}sypV%6?|L_~Ma(dkxmM(qhOv2Cqaxz@
zjB;0A;%-1ostJ}PS!Y=a&S%OfN0iWRM6KY>x<FmlowsLKGy4xLC%ZFC)w`)i_ab=F
zRed(~iCjYw;gM5pEHU~Fd(N0LOEUa3iVaaY{st*yl1^jL<V>oX&0;!QW;gzdY0Rx(
zW%`ianlSrr`y+<zMA#CL(SUeK%;wAtf0WQLZOxu4MhPqR;DD at t)()%xv%h5eRPPqU
zby53fll+UGALuebt*~EKU^{T)T}0}0mDu4S!?oCTjg8j1+mND5xjd_jTwc@;Xl-eU
zoyy`9<dqS;pozt=NdIQji|;k=Ww^pd4sT3c;u6H5AjZ+DA-@|f4~im}uQiD8+2dJR
z5j$LoQ7z9JE?|Cs*i~iQ3z;)+;S$&mj<;aM3!4yU%3@VD1tTq+z<m(aGwk_z$^K{2
zW(MZ^G*z&c;JfXywQ8@~9V~JM_KV*lqe%f9DK8a`&dr&(n6=5dd;dc}@Twj}+ut|`
zK`mvB!)_Mqv9>@v_yM+VBZuuGdfsPnUpB$Zl}GZ2_+A1LmC;0egSFU$@}L)piX>59
zq|gO=5fzeHF9J_NRk_wC(S2Eo^_`F29>6v4GF`mEe86V3XnbDIJ?g=8Mgz99HYswu
zkF-iaj|>)fYO7v3h&EyWou%T at GXCO*UA$M(JB#G?E at C}lt-!l~tBn=x2`P~41&8}&
zHQB|Ugu^z}qvW=!V8Laa?~_wxi~R_rN=mkZ<h6Z^`h;_563FNZG!1*+pUB(igLB`q
zL1opifhG#xt8PSe5wX=t33`nkaT18|2R9YtP(SgSLT8IVvoAIb%h(A^myDe@<h^R3
z69YR1Y1nhRz`h#uH2Li>$60<R<OD}HSuaJHLf#-1&{k@#)4O~b|JARf_glY3dz^AV
zGIq)|tMQww$wteExL0V<{5gnR-vLW&K;kjrhK<fctS;Vm`M`b>u;38Z($8V9;^L=E
zen~@#KWqcXbcqk_Mn1(OEc=8}UHXHHUoJR;-1`3zVf(t at jCv3QUh?$ZMDXnQK%eeO
zDPCp<d<njap)YA0D9dx0q}!f?$RLY9vgEkV`TEH$v!Ex~t8 at pqy|9x{{tYCBzOGem
zdBnP9(gyTKH_tsu|1h(vp=Z;vbHq|szwUB;I?gVPC6)%vkI^sJT{6t<^ljg&zp~y3
zHSd3|SidR9PesB)#MOwj(yF`x1B=ERyFF<{i;7b-KD7fgf?iuzs<_xW^XCY)%ofY6
zGnDW68N6wgbW!a={Rm%<bCVu?3+Ju+n|wiSvHqsQ?8=3Xe?y6{k-JHNUtH&A@{X`_
zg51X<6DRocsXyS)S*IEhnLBew7oti5RqT-fq3i~B5Wy_KlNykSSx7pA at xEr6s?9p;
zw{Y=;vnjXm5y~4XSs8k7 at t1O$e#mVkJ_~e(jYJcB-&U4)fP7nU7QZCsv)Cr{mZjLa
zkGQ@TYeRQNn!=1^OKHCzve~<)<d^EoXoj}V?VbEs>3i5s#*58W!U9BE{bbG`yK)UT
zlrO7_0JUIEp=u*LtM}Z2opq%~p~@w8jEO}qb2dc0+O!kkcXJGWH^<<2Lx$fCMY#+=
zL<kWI%$&=e?bzJ6F$QoKCT8U_>*YiUk{S0%+QvPY`8lotP{Zli3kU0KASCqMKxkMH
z4*09OrU}<z%h(3X<5|P^Tq0k=<VE0D25fmIJb6%-qBoG8@B&WZ%>yB-L3sL#fma_I
zzDBuc41eVyU5{eP{Mm>G^|uBwXp^HhEwJ`p&MaK(C~YwIhk!8s39-#gu5^w*>zhZu
zfzCCB29#IC)NGq+xI(!HpMo_Y>Zp<7)ee2~Y6h1b_b0DraM>{<`Imgbj=<z!Dz<dy
zb`|TtRjza?Azw<sg<V+P$l0|`hfU9$#iT2L8wuN1q)B*n0<Hm4h*`f5X)TYpsvsSl
z2&OA_ztgXD`2xaAc-U-(X^60Ks@8~of(CXU&>e8cFJMcsI)V{Z^d2lp&5o!8QG0uv
zk$Ye}Xm7eW5*dtrjX)n<K3zkG=9YtEb5&E<R!B=TTACse#o2tCE`D<u^Il9JZUM$w
zy6K_@;8vFvb8}`P%c6ZMa+QJYO49?cU^aYUOK^S>=jU-=igOmuqHD-740vbb_ at Zk=
zYhY{b9lDBVyD6fFn3sB&ac|!KO8fQ0Vd5S}X&sgDt(m+w2rJ+(@jzzaIzYWTOpt)d
zu;;^piyoE9f!!vtf6krQqrb4&Bi#Ggk3iBsGLFKIQF5t7dnuFvZhzvpk3x#kZ#+Tf
z7H<g^C?9D;MiO>u8i>~ZLWn}#W(sKb+p0s(d|6Mu?E{hf9%uK|7%?8`3HG>#C5CIv
z#{o at +`8X7{TkS(^j}``fJz_z`?U=h<FJNobYVkd`GeiHnF@0eI{cl{dtBHCod{|7C
z4vx;H94Qalia0B-{IpgQx6}<8{UBH8=_JI+Wea<>ESF;up5*ddQNP#xdT0~K<1nwq
z3@bG}N-MiCZWeDA*%nE}^yE}{N#>C^5J8y(c=+&Jn5?lrCW7tINdA0JRUP*IL#7Ba
zqrJ5@>~s^Pv$fP^nn^MHmaU89<y=4*fxSJWqk#Da`=5?9F{=&93nR7B8GeZQ9u_kC
z>Zq at 73Vm3&q+vC)<LEZS!#Wo;NdCq%#b~M=ucggGOl?a4Z}n`n@RpW8Q(K1~CESi_
z9*gR-cWblMhzN9j>1?V#2pj%E7SV7L)E03l-tevF_MaY$t+^HNHNj4_JFc!<%t$yo
z5z5I?47%DZodkG8%k0hNH!|%5kqayz1pL<wcp<;lJG^{&<jgKmjy^_ndvm>tT_X|s
zp at 2-Ung1PjGQ~XL8}NO61ML;jO8JmUFd_*MVsZ>hg7T=^Xqwg$YC?uy%6h>5{j%x=
zaY&XGHO>U>P<3>=S+qIp(4Uj|j`Wsu!BRqfv>iK*VppjG*nW!pHe?p3V+SO0>!H=~
zI3BBw#)?gW&1tIP9IP1I&h`tFvG?N=>X$qXPy)w}$nDclpfk)8H3t8)!+`&aTksaM
zTx(Q$1My<B#;YS|KqEG(i^3J~DxB`{N1mlpzVg2HwcEFgXjjB4hI~($#7m5BA?Lba
zDCC5R6pG6+Hw9k#z`55OVZ|S~A2}h599e94N4f|UXOS}wJJM_wme=R?cOK%yy>Ip5
zc4P}@#oQQ~m%JDdrRoiA-w?>649W_4(8-LioWY?5xPIOl#k`84CYEm_?gk#61U2J@
zC}4R=|L-yj01?c_7>!`jEx%sNBf2F3nLW8$+P2DYNuV8N^N-Entx}-h9B(FDgcWSo
zKWihkhy5aa9giP)yBRi+>AyxKH(PgObO)9}GSdrk49kc{M8zn^s8hr&ay}__0#(XI
zF6<?__Hwduy<&Y{|KsU-=?ZZuTmc`AlWZMbonBvsE68=Z)<Dz>FAH`#xQRGrM8#lL
zo8SlCBVHpHK~I<`al%d{Iexm&*OltBl2>S7O)tv`V6DM^WJa_>g|U>;1%`t%rz5b-
zo!4GK{?q-y>tpaGp98ew5N{WZJjRFh-P&xbNWKSI`2M;bEH0UtS$Rkt0bDez;hki@
zP8?+PTV(XxgFIvw-vR9`QUEQCroP(BaMQpK#81~3vsmtr0>bk{1(hkiIKxaz!x8Ni
zX(C18`LL$Q&kd>Rle*RjDd=-P7Z at Hg5U0&b8fwGbcXxyH1!%WIw at nPWZunR2n@MOF
zyP571-`V?f<kQq*9lX02`R}@I`=<l%r#g-cshK5B<$4wgeH7N{H2A07{m6d>e;r|~
z_M(U14(<#JjrAT3I5WL&Z0%kgQGb4Mgj}AmX0W#i(-FkwX$3i)czIo3lDuw(mkqCW
zc!77k1pn7?zjj%^JS(^35D|OG)q{G)lvF5&J%4^qmsOrGr07$yYv}3n{L*ZFR_A<B
zvaLee1Rp at won19mCPa;S=dH=!8fwbkc9DizF`FLooE+P at 8j)uvVCl2W0~=$wo%O`4
z4}vSVYs&4<RPD2@WLVU)ud2?vlJPrdG-B6g0}8+mt`xcAEDptl9Bqq)ETHnq^>wZb
zpf63#zaKH3X)>pr_(Fl$y>^YJ3VRsHHaa%*Gc+5m(0YpAa%@szr8*FK(^a4{#TQf`
zVKqA6B4){w*nzi at D;=AVF&Au|T#(P!uyYgg7f+38y(9f6_CHJBFbr4kV_cQB;PS+m
zVUM7h)%majeTXlXI at wM?RqR_SxGEpJ+^sTv$RaGUE0zMktE#LlW~j?5KIK%P_C1b4
zsm=*2M#W^AF8mHYz(I`VU(tt6)d{Fa!=iUskL3Qat4*Ydy|Lum>sY<<X4qvJJ+~&-
zAv*)|L&KMbYx?G{B2^RFXknHGIkT$=nO*T^kf@?8GrG8iv&9<LfAM>-VOT;zi{zO&
zS+x&2s|@}L)@;@;%Nj(y(<3_Npyyp9H${%kARX8H29RU16%iE3`+PI18gnAZaYk%T
z_D5p{l8Yk>j*@%3kT(q-7*;ssZrI!5y{vQ5);h!{?R4(DUE3d7Z4|jqZz5x9tb90&
z<*ZMEPZSi%Wv0O{lModV0u22DzTO~5HGSc%Te|H>Q!s)`*j~LIh|R$YapP(q&Mb1X
z4w??=svOaTtTfcL0a=#h&ub9rnvYm&U&OlJ$*yL4z%8!7VIHCu!gFB{I((b%r;X-W
zRv)C^72R6Im at pXLzYP$>%CrSxw{Ar2)Xqe<$v)YO`Qser;kv_>u>9Uc^v2AwS+b9=
zWC>C!cIA`3^hPBx98#stGj at -xNLYk<n>2Rsje8C5TgUEw&;zVF>+_-wa$EveR0GUn
zaU!I!#v!$`D`A<?+YvH6^648f>RYQ$T`Sw*zd}|M%QnRBy+W$=7NWr(5wjt+&jQ30
z)w4yLoYSydw)nmU2neJE`4t7jBd1r90_L-O|MVE&7#G0<iQsMf8c+fjrEwiF;;eIJ
z3_4gHhwDA;Ir1bp^ER|{UBYTBDM8EK(%bkw4Li+7<ltd$PHtiL^LKJ#dm$h0WjXNg
z?;6LYAl)`J*^&nM5EHbY8tJMkNc_uaoStedPLIW@an&xw>bZ=_AY##2i=-N0;V#bC
z at G8z9(^ru5eFb$Rb|g~S;zyDH5nqJ8iA?M&7Pc!}cWeRfys?*p!gd<h at EhP7B?gdN
ziV<`Jl3Z)I9a5bmTb1i9aZZvWr*qlP`L=_NaoAfri1k3c<{H6_M@5q6Nmapvd=J6i
zVXwNv*gIr|jJ}m3^O{Smtb-vv=QwzP|K{DUm?H2T86uG%w^*y<u=@k(Wmg_stB_No
z%%!~rj#7AyLR92d*^7ay7o5Rt4+(GuMCMe-RUedR=WjArWZ5NGU8G+|z012hgZr6m
zhlpy~mUVL2^XXn0{~0F-?E60*(-P!5QL@{<#PvNe=`=h)iwwg(8<^)<9`{qNOWd;%
zC!VE#1G0++ygQ)(-g&d^C+q91*%I;u8FmO#1OZ<C7ULs4R@|@${@ZOYcuRHRH^l9U
zxvr)c5Sa-5;gjK!k5^%@1nilOt9ir>o^tOzCHvyjpWo`CEPnyokiY&LBu4vR9p?&i
z##JY|Ry&ha!RU9E${)YaqZaMh$i^gkX{$C1c1KfdH`dUVd4AP(fXSCmM!PJ|eSpI)
zIetu=vmvht at C_1cim)cTtf0Jk;9dpT)5}925kZNWe69RXIcBU)QzTx~Uvm|8=0Or=
zSH+zL%o+^~YjLL%(184c`CXyah?ipvY^7a!Vr at -X%{`DQ{h$ZI60 at +|9jHISTEcZ5
z*1|pXzT)pHW>oBjZARXo&2m`(Fm^+GmucOQWDt2=TcN+sVGov)3d$ANBFmIRX~l!`
z?rELANyip6Rp_vLn!o;uIcCG>UDs=`>c8bKk#n&-ZQxryyRfPXz(bl1GoX=SJ=>oV
zYn_0L{YXoKoF#n(y3}6G7kPglVc7|zzAm>suj4h~2{DC~tHU0byW;>ou4Ybh6!2jX
z(gKND4?A8HY){`pIvY9NngM+z=2zel2SAw?ftuzrm>OQiYHkjj#I9B4OnX7bz;1n7
z=XCWSa5V@|&L?_zCvvvo#qx(Ai{(U&<`lG3Zz&(t=T2?`cW5#E|0y{>497Bj<|RuB
zjdfxSjc;C$HEdJy4(LzS3(z*F2_Y5LElh?`Uz6&XMopE{S9&9VFS+2#BLz~lGs;yU
z{RY{a!N|!4XObc!OwK5H(-cmP>RzX4$Y4Ac5xT%BaKHL}3Bxz~2T8dVyOiACn>_{C
z>Bg#vnjq^jx;sICRC$m=n`Mu)9fW0e1hvfoJUXct_pP+q7H2SW{^AYl#X~!Vr6tOK
zT{J54TGv$XXW8;pp*f3{4C$zJGrr2DUS56R;VeEGYY*9fp~E-MevcVZ#vr3Y+6qez
z55J8<^CR~njJ{0T*ANX^kE=L^)oFr6d!s)V``_kcuinWxc7q~}+Z!HF9>VUIke0Cf
zY at 3|h at 5RL;$6+^iGJY$uNs0!fdlCOvgx&$V)Jsz>=W&3Rs5h}J_y}kk>vs;1e1yI1
zv1^N$(q}Z!!?hC`{n#BBkj{hDkNiN*cjPPFeITZ}!quh7NjW9fvYoUC<bAZAN9<pL
zpSC&EoL}1q*%k6rz=^T{HZMWubk^gXkMn-i3L)ZMX4@N)A>s{)tOi6BF~Q>?!fOna
zug2<i`Jin9F!05JXbfxIxLownJ&O-wmn~+k8ifIN%;2z-mlc^`mZZcu?AwO@m9d*g
zQT2Sl0A58+1f!*YGyeJV_>~jJPsWX3A&=inIt9t0p8cf+gM>&>>`sKgc;FDzDBscy
z2m~g!wVab7fGg}+1U&ff5FpLSJ?&xG!2>dKmJy9FF{E_Om%aP}t(gBKqxm%L at a-Xv
zTQvY5n^jW;xf*AxP$U1I#iR`1JcInnnEOE!ZhnT{oXA^{2 at 0g=SZutbfXxmddQ6N0
zXUr9E!n){iK8Ku>Q}T}cn?`rs$Ne!eTlP2xG%ij&esK`{n at z`z2N{0BFbg{}@b*W<
zYs~MXmMr0z+aHPWlDhJN7wg0*NBDVUu%P7hiGS%qdX7oZ6I%9?^6?$yJBK?HnjWL!
zihuk2f17}{Y+cHtf4jOtwJsrs7(4TAs{{Xlv{S)s@?(GLK>Hp3(g8TvN7&bby!H2M
zllde2O9$t$SHX=l$drqj$#z!2SLfuN6?lTZ=!Qp5B2yUoOMnpNHQ3$CehWq%`CcQp
z@@X|nn1u7#4}!?ON%{LNQojd}!d8P(bTn1;3MsI4-q6n;9y!JEpF-Mc2PAyeLD=`W
z9(O0vL$*$kM>Tx&?0J;wVZA#$8CUOw7UOTnY?jVRzXsP~d&uleP7`~MLB5x8)YR8j
zu{;N4B|dFH>=)MZv`p9lVqhtfmH^5;R at y00)zQB*^0n*SsN7p$$1o5%P6|thyhC&$
zC{8ij%MUZbbF5JL4rrhW5cNoHg0LJJ*I76ythDoQMU-RLhc9C?s{dDe=N=tZktXoE
z-5nC1LC6C~r6VATf at wf@0x{`^K?U4MJPtFuXLk%CFW7<Lfw-sxNl3svAl>qe!$MjU
zp at Tfy6+-Zpuox0Fk|?Oi%n_P^0}2ucT!%Rb+242jb|gM#&Yb;g&*^(k-CMV+Zr!@y
zt@`S#?^VNChdfn3tfkaFuCW>kSXC4&hFwTFeeuh?HdMcQR3x2y*D~uIv3KnG<#)O)
z_}@4nUwQm0Jc*BmQ%g&K!P;gBHY#t?UX$NCE_M^WxHeXNh%H3U<NVG(4j!i8KJGB~
zaoc1xS{4Ru<Df{jH)ca&tb@nl*4H=}Xk88U@|CZP%~}z21HI8b?Z23J{TcuY${E{@
z>qlN>?pXK3x#N#Ly<`b*tp`uWz3)XRmx*rXkn)uo-8LN-?E`mBw1U^>v{_EY-#Z|-
zmwQ-CE&ggOrY8JCmeCJt2gOBNB6dWUMn!a}*3rPC!1O$^Ud$b#CMba6|H_>O?6w_v
zp$pT>zC2jUsMb-W3BU3X at q1)Hf!1+m<W8+N($}jRVo6#O=XCKJ)|yDFcn~@EH*k+=
z_AsNr{D`mD_SvGtAag}>cI2|oYsbF<<NQ1S?b`8wBj=Lj$o>P|e?Iz2<WYDkLcX@!
zWdl$B+GSlCE>ccMRpL-z{Jnjc=~B4%<~q$WkJj|sdI=ua_JZDmE$r9NcA23f)ayR;
ztAk`jet<59+7GwEtoB8tRiKKa*5#MUTihY;_0G#sQs`KOR43=clcpv1Y~fflqnxl~
z&%!t`jbKLWo at X^<o_#K-x6HIY@k*pse41$0XWNMU(#~)Hn41l5YVD;xTlpDdlp1W8
znR)s%^V~+*sn0&L(o7MrI;14aC^!7-JkIR7S)X0jC4DJAW0+lQsrC9%p+i+R+J}}D
zy^LykC3cfq%RIG{c`DhMt5Y3#0W!TopVVjF*z;hUJ-Q}fR`Q>ubtlGTmzG>knvWdi
zvfO`~E_Hei|6L4D34L#Y{u|6^Wp9CSktW+8hp)0<+FxG`l%T6yWyaMpw6 at A^hF{h<
z;Lp8e3D`g|cR4y3O7;eT6EXbnLq^}ZCd at WbpaCWLu8jB(?*z|$MC(mloBWvd*cZfG
zrPS}M1!BkQ_%g8Q-+sf7;n)wP)~(I22$p4BYYj)39q%P=ll?TZx{Rdx^p%SThuE{_
zJs*ZU&haK~gc3|(;LF4AYWMvuSE at d8y!1V6sX15NfGzP%3Wm(+#+4 at qz4|gcV^!8{
z9 at lcEz6NX=6TqCwc<4fN1#kYWwthV#9ZSWImeR)R<~^0w(TdX5x+f(3AW6I7wRDfb
zmpcSz$L6Rv1V?HkvBvsR@cgmkIVGd5*=6vsEcSJ$#hPw_SYydI!|}lG3LFP4Uhh~t
zj1)Aou+IYHy*kXmbx?qU>)s!woX}=MCxcbQzn<=ITYu{(Wj$zR;fvm&5gJj5L`x0v
zo;`h2!70-q#j1VT<_Y-2*tnrT`&K{|{CrwRxIL9x at t2wag+2k#iRFK;5YLGr<7#zH
z&x7nd at z1VCwZ%8N-1)<tibmPpq5@xxuBVc(gYh0t?u5E_K>^TDU8D4Rm=hgRPbw*I
zfJxe7`$KtLVQjZk_N4e~N^He`;<RdWZ^rHyU7-;>JfC<R*mj2}^n%KGjy5hES=>@A
z9FrDCLA#1Ji4~ILBBNkO%L-aAyeS)gAFEvAIn~%V!(|5#9F{SJ=f~BqlLsxn5bu at B
z+PVqo*VTFsx%xYfB;22Hr=zX$kUDS!hYYJ7zo&m}Xy9Me*Rq#jEz+HL1QY6h{&gS!
z;@=+*#Y6b`ch(I>XIA(B at 4}Cp>+|oe1~e=RXh*EmgN+pHy}xp2MaySyLL6;xLvB*z
zj??)hrS-KfCS+?@cykxNHiRE;a(+&D+VA~tuUj}j$xG{PQOqpSkNSqe?a!UKb8mRP
z<BpZ^Yb at R}!tV*&=&Kg*Ydw3$*0|0492a=&E$mU#-<brQ`y@=$WvKm=A7U@2_kei`
zD{wSI^cDB5zR?xWIB$cJ5&Axc^{Z<6ll{T6oeHc|WoEa6rP!NmRfDVC#7c+_ukvE?
zsA=Gm3Nug{Y(E`%npJs?{lVtav9->(CccMG_}f11_HF-th3`XC%DKq at jo9g&R!2$>
zCT8)+mq#jWn4mEumz_*?g}Bz2-@(W??4HKOC8oOS#D2+VaWs`QQN9RH%o(s1T+Ne1
zf9TPxe7vJAG1Vx!PD=W1mna?jQ>AsQB`6ViBElK*TP;CLxiZ1Kk9dTdv@(uE>ccrl
z)=T^jY?toCc4;QIOPON31W)&OYMtxoK{P|W%*~b6b*~C;F}y*)5W5_yH=ej<R~`PM
z+50x(DB(1J(d at mfc2$_2gPk=2NZKD1uYk^bqz5{G;|p<KvM<G};~@pL2=)979D0qt
z6g1aS#+j`90uZZBWaPOn`$8NC&tAW)9qCJb&%W=N<2u(87ZDdVTEVl%pNY)`U#tCD
z?N(DUGvjXJtF<W3+qIoa*3z$Q;U;Eg{L1v@yj!alU#93tF?#VV^Pk?b2}J>$ShYfr
z75%)L9dGaisfxX2s$6Vjlb4!{clC}aaF&g1M#hPZA0J>5H){2w(LSqbLPR0_@#~*#
z^Pmw1?-HuED&uKqOTYXu8J)h6l?#D>QGN+MVU5ix&`p4Y(z2|eMB#w|ZVK`e;>GAg
z7v_|JJNh}WBrI4(-^GR#s>Kw7)!;<;?0)Xf0|N?5eU^#%9#VC}ml=7<kpVANMHRLT
zz#H4j{60`T>Ss1+wm)ndkaVuY+SG-eEIg|uooB`P3CFX=-4$OutxhjEwN^%u-=8CR
zwZ=EOqT+`+PKW+aKec}YJ@~MF0i(#p9|Na4cj$EpPHpAy%YS?mPSs)bahqB5f>oWV
zls;*A(|j5tr#<iXr^-}O-Y}Ol;b2^GLAfd_Sb0!uu|R=MnNXfwfL7Ot+5HX-kndC*
zv%}EeIRhsJ-dSaFV#Z=O9#+wiJ`k0^Qg(|{W%BjWD!*@HMt(W)>77%$C<ZTV`xaNF
z4NH5mYAsTs;_NV43poxGuc<;O(uluZbu<u9bIX{aSK>ngJA8IL!b?F|5?*DS3WVzb
z- at r8DcdWb)IljRwBB7F$sw;~(4u%&}@|fQfbpl$)vZK<-6|`U)JtK~}cT-xG*r;n8
zWL>7eudQGWRw0_3HNQK;NZHT?eJSgR1s4<;HTpM>>)OjAdtEY(J)`JhA8W`K&OjqP
z*7UsGfArTa3zIU*zi{G-(_QaD4QiuA&jQ|vO1)s{#fA9w;$l}+mM-2?`TXL#oT!{N
z at E-6uV{gm3+3x1;#AP1LS?^OR^BmT+Iy`DT^!T2H?SkvYn=Vk<uY1_Vmcf8ZXj1`i
zJ_KZ@<B32Uk&AziLyI^1LQ96+2#M^nk(+0gZQflqrRwM=^QN_%hmWbAxVmol-lKcW
zd)C$s-#aC{Y{NK_8tU9sWCnZ3ZNSr+ebnCS8GA%(fVEWb?9h?=ILPUn-G`ZF2RLrF
zgS-|k_LiJ5V5>B|SSI{JmD5{*oIRh;X)&l#=u%(&vrFK1%w~>367PlP at kBaj$jE|5
zIL<qYMn0EaBD*-W6=|lNK3iqQ9SV1&D*;)G{iG_{dO&y`3EQaQgv^_MYVoD at a0o_G
z+j@OxK5t--74Ob?>urO7{*LP%x_prauBI&dJG^<oPf-QV@E`XRO~2^G28UT(mHMXG
zk>0l{a|rhr`I;lcLp*zJr5<+A^wimwd)7y5jSgv(pPG(^OYu|n8YPes`oHIOR%#!;
z3GTQ^Yp<V}N9^+)ef+V?-k4JoTbwQ4<TZEAslw>t_RiB++5h&s7AhVVPO0eI>9H%I
z4dFhky{x|XusRY;j-mXMPtm~J<T|tU(t)@r6}g?AUE&?9VnaEvjJ4>vxgv3?Yq`1H
z6(MWDM5K1IvkP+F)wJLyth_}}u{5U?Yyh_aP0zwui at eJPCi3d^=h5kE^~$uIvZ|qY
zi<;ta<zo$X_Nr>jE}L-e>{aa@;!QVFsCX%x2PJ}Z<<kg52GN5*&ib4^WG7nLvomb4
zV$aTA-g6r}+?V`*BQ~03)^e|rotYC;&xDVggy-7+2~E0p6DTP0N`sdM`U<U#r9bK3
zkihd>a!L$8M&D+lts}D2$S2?;JmX=fHL<BiS8IVMH8Edv`b;jKj(yD2h#uAq_Hu5g
z_7kL}dbY~`$TlB;sGX;jZ@`9&9g~_1N3I2KtF`BlmOEOyY^&V6w+wID#2#n2Ra|5z
z$aTUc{t)gk^SQ~DX6x%?Uj*J*WZRCUvApxzAMRD#Xm7d8B|P1dA}o!Voq%wWtyFcw
zrwNN#*Lm%OaJ9kxh|V*FBYgwk?h(~VuY{k_UW7h<T~Y>pe&CHT-!B~W9#HlidNJ<Y
zB$4+_Jm=mw(dsTTRu({;)=?L-W4z%}6L?i!00Wx{YZ7PsDOUHe#13XzlY86&*^m0C
z{=m)h2M#<h9;tv?s{wgaWEgydx8(n-iXZ$Jf9@{Nvpl=p_U9zoA!-xl?-?DdLomeE
z4mUR}YL!B(uiX_=wz*$b-xgEylI9|9L(5mnwV|SNKnHyx>N%m>!6aT*5LR0$EjXY2
zr9Id788I{}q6<A<`JZRIY{*#D8UMdH{v`3Qsd+ot?M`%03h4K%Y at wVhY{r;z-Rvrp
z@giOjw_L`C^}6|-XsGCYVqj%Fk^&XWw~L<-&O5ZVF4ipExhnDI*>c6UvZ-`L8NObh
zO`cnUSHOc|o!=fc8()`(U+rH0{-NL_S+~(EN=q*J`-JxrKDu}6Jz_`awfB3es-zBA
zM^i1c at pdS<t&|5(%k1wwNuOBo-71I`hUV%L|M%3eiq@|Eeh*Q>BM5>2XAtmfuwZ`?
zO3#0<5q|Oeg9u2PtcM$musYf6SQe07M=!&|=zmzBE9<YKyF?3^*vC;74K9fd#jBBZ
z4cEsSTn(%Al;a*(OIKqBaTA;$%1<adzr3xO{nsQ-SszdS(&JP`0sGiMokOu9@Ru0s
z^IvaE_Z3Aiiz<Kud;zZ~%HDaZpt(zQ2bxP7Rw}iXbyD-Pk=GgqD3S9nhib*Tz>37d
z|6bx5 at TIyM{B6!O+I}Ls!0++#{PM#qXcaY4 at -t63m=ilQnPdGWSjA@}5ALIX)!D}W
za=mrVDK)S#qKkFUkOp%0 at l9v?CB!s`HuR-M)X}VsT>2)k(RT`%q+RgWpg&z0JsB#y
z;7y*9dwVY5Qy^=ao=?9Ou0Or3UDM7Rb3JXMjh}m<maVHB!;x?)>lYpu^e|k`1P6Eh
zfVndo&ZhOep;Nxu1GOPLaaeCXm*psGbP@|g*0!S2d2+%@ET-fM(soc=FR$%vSCrH`
zfUjNw#Haa8yV|)<;(C&qihK45P}T_UJN10?E|;Ef-sRTw&0cB85TAJ$v?b-u#`9+5
zd9(if&q((_Z!w;?7|&bu=h-XRc-~?>Z!w;??CM0r#^No29>9`|nL&J>qUG#BTfvJY
za2Hf^`wC<<*R`*ZhHs%q-%a3)taxH?6xfA&@E+P&<%cTwVzD}j9F2Tt?2_<yq!QR5
zXe9;h7GedgmLx5Nv=BWl#LL>6Co7`O-f+DoBch7EPPh!VU3mVa1^czD6N;1?NI$tr
z-BdV84JsV01{X#s{=JIS*T1qR{6Za4zOjdve4$zkeFIzf_+}-k_e`A8Upp~2QNFQ+
zFtaiIO>1L#Vxj6%N-yhZt=%_u-?7(nUi%9?&`<(e8*juC>ant&N<aegRu17WK2t*|
z0oh(-ETP^v%ifz%?wjT4OIXzq+ECdT+gKlHL()8E!-L|(1nuGCCY_5AUEsJLp+c5R
zUyB$hI<g_f35S}(_)-_KrY4!)i-{d*GDT~rYz}9VRlYxX1R)TFKo9~!2m~Pzgg_7i
zK?npP5QIPw0zn7_ArOQ>5CTC61R)TFKo9~!2m~Pzgg_7iK?npP5QIPw0zn7_ArOQ>
z5CTC61R)TFKo9~!2>jn6 at I-c2+Pp<$$BZ49o;GGo+C6vQb9c_z?DX-O>0|HCoVzgZ
zX*G4ql*E|0sWX0cXUzEcg!r*)_}uK=%&hE~v?-}G9+*BgZCYBN;oQ&7&HAyVDGy9d
zdvy8()6-HPcpxQp at _oH~$Bm6iN{ShKXZKT5WcrjT-8tXOdSvFq-C5&%K6QUe%Jhe4
zPXF%Ff9je4%aqhd(;l8Yb6Q&JjFf-rt|g&osmUoRy~!IBvm_?w`^^oc(Y`>G_5`AV
z_XqBKzAuK?WaVbg&5p6%bpvQ(?y~h!@r&jx%3GM1K3m0SW-d(2%X%tL#Xm7WYd&ZG
z2$8f!bNqR;7cC+pDNkfA%1h6CGH{!jo|kUq<SgKEz09H;Qs>Rh8*e0kSBYM&UVmPC
z#&1=8#)91Jxj8ESKe96N7A%zO!bNiz<Vwc;`B}Nt>o1Wu=O65CXuT?p(93*Po_v8|
znJqEnuo%}!u6jBBtYWxbnquV1#bm^9;VR|KZ_8P|Lb&-Wi5W+XagF5~MlhSNS_+kV
zN#4n|`-m}OW4P+|`HRaV`pb=M)HMBvgG-=X3}p!lXT04<;5!~9B~WfW<p^qjcPT!e
zxP+O6K)J6eN6^!_=trQwS=>oEjLdsa^M at a;@3)lEzgMX~TqXQyeNP(onJF{NANt3T
z7C2&zNIqAieON!CkIF5f`v|nJoD`$n%|s>W-zQf&0_D~amva0^YoR}=IPL?7<jJv-
zpvO^X<#<Q_?Jzy+KLzTm;a1AY|KoTU_$aop>OLe-!VcqVWV}0^<ok>px#;gQuD~R4
OwB``o8 at S`Dm-}BDn0Sf+

literal 0
HcmV?d00001

diff --git a/board/arcturus/aarch64-ucls1012a/rootfs/lib/firmware/ppfe_tmu_ls1012a.elf b/board/arcturus/aarch64-ucls1012a/rootfs/lib/firmware/ppfe_tmu_ls1012a.elf
new file mode 100755
index 0000000000000000000000000000000000000000..3e26ab81bf78fab0c3ece43ab0021ab23f1db81b
GIT binary patch
literal 11492
zcmeHNdr(}}8UOC?65ib9v3nskESd<IF>K;MSa8{!j7f<dCv<A;w2o6CgoI3!kOu1H
zy>}Nv2m>sNnusy at AiGW**cnYHBqn<yA#Bo^5VbRQ#>yTZGcsCr+K%;A-TuxltHwX7
z_V0U`-#Ono=li~M&hI?#a_)7mec-2pPN1)Yjv65g_~W6NXzAa`Kyi at rkQP!Zr9|q<
z7*Uvy3XyUcC|V9{qk{ZA1o#nlBfsFA`V3@s^U${waeTWzkM|-9O0rP|=*O+?LO}}}
z0~!Mw0~!Mw0~!Mw0~!Mw0~!Mw0~!Mw0~!P0%Ruyh>{a+*`+wtm9sPd_OA&s!CBHA=
zcM8HfU=y$gR}KldN0`O^!31y#xCo2_BLMCT^yh*708DkbV-QdtvCoUz3%4O11FpbV
zHqyT$Ed)@nGmfIkQJ9Vz0C*e44aR6ZfL2Enfg~UqfS1ulKrUbbU_E*}a0jp$AWFG^
z{rww$@zDCbHEUO|LEZo)JgNJP*BOB<AcgcdJ>maYcOvZ>&8H2Mg91Icq3Y+8gE~Tf
z9Z*AB&=}Ad&=}Ad&=}Ad&=}Ad&=}Ad&=}Ad&=~lU3>fjAKAqB)49ZY4DO1U!EX717
z#Y|>JB1w6Vt`JMUVt9|PDNMNb9ILU at YdXY6MmL+vQIB%E_R?_W at LOlMoc)9e=i-5*
zOn9{bIKzbVmB3p}xUdEIgy{nDz)_}C3xG4M#*qkguo^iT=nTXMj;aOfnOJ-FZA_qR
zj4Uq?h=`x?dF+-k!RBU^+w19?rimlM(8&JXF4R4J(sSpFoy#EgNo4zgj<VF!#g50A
z&U+wVWJxO*o0S0%OLXL%_t-x-v|JFWb=>9nLil%32)4?*4O_VniBz<6^K6Z4#9(vV
z+#?OU+xEomY2B;e>)t0Y$}vFe6&3BjnGNZ*>JGhJ-azj1I^W}{Z4bKC$9=C9v<>JP
zy?#<s)K{Q&!soGGfW?9Gxg{x~KKpFh9NIXCniijE&pj_vOXwIe-{barZV%137%fcj
zorWK at _qq#yPIEsQE}y5o&U!3_@xJ-X^0~XWgqrL#<qh!G%e|G&`b3sy&s9aA1%55>
zhUrfkN~m_eMa~jhjB4D`8r5O+lU&KAK1JPp1Pc=)BZ#%UhPNF0nXk?IPuS+FC*BP&
zJq at oN$h86`s(9X_iscH0ky|N+)ovn4XUtsz50`R>k$VDZS-=zMjFg=7d4gfJ3$hO0
zq0eX2^28i%S$on0>D4*fT<P;Lv7$fdlE2cmBR|ekDvpo4=IG!!OLG*-mN{}(LN^DV
z?cQ!iiz;AWNiFh1$NLo@$ont5bYGw at hwBA85nr~s?R#{GcuRZ@+3&KseMh|QzHEoz
z_jI5`cE%lIqHI<BB5TVr9+q#5<^vrlNwP1bmMP`bG5cQOOPgDso2J(UUCWr$=AH^m
zPWh`Wiff$}OGmPd)51hJuBG(KSOQk32h!M>0a6R3i(@)Tn6k><c8kruBuP@tE^-H5
zEN!JK|Egd=xuvkZ5o>P4t!vH_k9o<!7~6nMro3?C`PO^uFXg3UkDBSO*0XKc^nbM1
z9f&{BelYo9hcoe`aOjOJ7ZZzzXY^$ud9EINGWcBS^WfCdKY`vTY-^eSJnW`v%)-PK
zi>K+TzP^2P^5%{$iN&(6#j%dujw_?WCG`Djf^Z{HLKL`6ba-r<f}V*U^$?M~@1pVD
zuyD4ftv0T<b)$ZxyG|InJHp>F at Z68yN^G at 9WQuoDK?YlOD9l!MhNkIqOUX+WSJ^6`
zWxz9=R+?A*hY6wLDji};CY&b|x(mmNRD5OR_&nGtFz~T^w|kGkIS=-fH59l*H>Yv`
zcDpXLt;Ss|j3n6Hn2ki?X|#Eq?_Wt&EmH)^ida--7M6CZRfwHxHD+t4+Q{cj#oWQ-
zF~De6m=frhzY at Ou?tahZ`%3JrkQAe063VtyzhlSvzTwV_51FAvo|-uFwppRaSYpMq
z%-DJ4#S|7-QZ_cs;_h8r{KC0TmROc^ZYxfie;FEsuAou=)KGg1TiF<0^z?cLE1s;^
z`3##ClfqIQeM~oQ8|)nCyS7)tOx@@aKK5J8I=|K2&P0Ee$;FI*k)`{qq(qkCw@67t
zGBXZY&3fdlQZi)OY=A6FDUhqoageK|RLIrl1(2(yG{}wSc*u>C$i$%#GY<Bn%*oOr
zXAF5z;|y(|JcB-<ht?jXPhnp@DUny?b2O!REh_Fl<u8R#$sN*1&&^xL^mo{#N$vh_
zGe0p>`3NENQzFHWooh)(oW at 5Rv<;<2M{80rT95GYV8406pg*gXWej>uhY+i#!z>GO
zC*ponJ2OM>f{!Ff{iY*BvPnSCtI_i+b27_DZO5r at 34CD0I^_FJ-JCfl4puYcDG%ok
zUM(1<m1RQCgslmw38{os@>j#k&vGE=plsog2=q_RP8OlnAHc}u-tRKPIlL`1OJRBw
zeH4D at FYwblS8vyy5~qbR=j1aedxV#HJdvkcOXy*8PkzW-<7<1~TXaX at +_&@w7nClM
zEoD1KvppAmI~*U4hryjoH;B48zE@eH_uxcN*BcVywCQF^Ww}h~O2YH-T*a^Nj6)hI
zDU|;l6y$w|UGlamMIFM)yk6=VNOR21(72M{I-5|uj{1UO>nB-GdWt33C;53Mpo5Z=
ziKX(4Xs?c(DGg<Q^uFoTMruLY7~7qEHN5Yh@bVRIF=UY%kQ>o6oNCq at mQZ?WCOqb3
zwB%vb%Cjk at m-u;Z$*kDs>7Gqpd3`$mvNOU&A4-pR4zXoE{;Wx~SK}87r0hQGIN5z?
z8(VhrAJcSQiCaGI3MM!{GdxO%JvRzkr)k`kKfpCDnfNU*ncqHb7^k8*rt__z5#>p&
zX6&x+MHL at V7fUVq4c9L^9Qp0=jCT+k?|_^Ah9-M8wPz8vu~jEep!99J{_VMdcRZ<c
zdwoOpIXpp!JQebX!M4(YvK{iXqt4(lI?P7A6D-yKPEpUOb0&P%DSQf>5!r&cRps&O
z=yTM*F_ez;jPxleyU5GSB06WkdCvAa=2)713_B)|>ATaQa~~6KDA+~0fynbW_gPlx
zI}j9Dp?W}W2--^Tfc^<DUqx%UhDQXWi9%nOUvgmvhEbjf^x-V)_NL`0vQ^$(mSTS-
z-{2L;odFSywt~|y47*};x^r`V^|q!J%U9e}TfKaF^@?Siw(e@)LzVa4SDsf`x&EQM
z@`{T}i&hX7H8nIf?`p2yNJTrh*KenyN9*gF8+TFBCgiGj);BfRHvhh9KD(u{d0uMT
zRNGuTFK^r0Ts$vsY>KHiHN-TVYwLc?-R^4I+PH&?>KeCiuiw#(N8*nNc!PsCVEp at 2
z9#bB`zd8Ln;O$Q&q$B1Ucq_z1<Qv$+s2qtS){t@lF6#jWdO*Y}l1PYsJj-okde1=*
z;QC(&-Y&;Iz`UN2N0biGIv^If4i651>*3>Cp#gdTJpjZ)%-{VeNC413;WYFBS`$-3
z8uRxc<oR~_kl~he+-EH0%?pnpo!2v<J_``?P!<a@f83VqQ8-ewlyfXa#Ap=L`yH}e
fZ+WzMX%$k=eJt?07&yoCVQCG7y|En9NL&8}_rK*E

literal 0
HcmV?d00001

diff --git a/board/arcturus/aarch64-ucls1012a/ucls1012a.its b/board/arcturus/aarch64-ucls1012a/ucls1012a.its
new file mode 100644
index 000000000..9aed66f42
--- /dev/null
+++ b/board/arcturus/aarch64-ucls1012a/ucls1012a.its
@@ -0,0 +1,52 @@
+/*
+ * Copyright (C) 2017, Arcturus Networks Inc.
+ *
+ * This file is licensed under the terms of the GNU General Public
+ * License version 2.  This program is licensed "as is" without any
+ * warranty of any kind, whether express or implied.
+ */
+
+/dts-v1/;
+
+/ {
+	description = "Image file for the Arcturus uCLS1012A Linux Kernel";
+	#address-cells = <1>;
+
+	images {
+		kernel {
+			description = "Linux kernel";
+			data = /incbin/("../../../output/images/Image");
+			type = "kernel";
+			arch = "arm64";
+			os = "linux";
+			compression = "none";
+			load = <0x80080000>;
+			entry = <0x80080000>;
+		};
+		fdt {
+			description = "Flattened Device Tree Blob";
+			data = /incbin/("../../../output/images/arc-ucls1012a.dtb");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "none";
+			load = <0x90000000>;
+		};
+		ramdisk {
+			description = "Ramdisk";
+                        data = /incbin/("../../../output/images/rootfs.cpio.gz");
+			type = "ramdisk";
+			arch = "arm64";
+			os = "linux";
+			compression = "gzip";
+		};
+	};
+
+	configurations {
+		default = "config";
+		config {
+			kernel = "kernel";
+			fdt = "fdt";
+			ramdisk = "ramdisk";
+		};
+	};
+};
diff --git a/configs/arcturus_ucls1012a_defconfig b/configs/arcturus_ucls1012a_defconfig
new file mode 100644
index 000000000..b8b1c1fa8
--- /dev/null
+++ b/configs/arcturus_ucls1012a_defconfig
@@ -0,0 +1,22 @@
+BR2_aarch64=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TARGET_GENERIC_HOSTNAME="ucls1012a"
+BR2_TARGET_GENERIC_ISSUE="Welcome to uCLS1012A-SOM"
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_OVERLAY="board/arcturus/aarch64-ucls1012a/rootfs"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/arcturus/aarch64-ucls1012a/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="https://www.arcturusnetworks.com/OSS/kernel-ucls1012a.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="ucls1012a"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="arcturus/arc-ucls1012a"
+BR2_TARGET_ROOTFS_CPIO=y
+BR2_TARGET_ROOTFS_CPIO_GZIP=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="https://www.arcturusnetworks.com/OSS/u-boot-ucls1012a.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="UCLS1012A_QSPI"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
-- 
2.11.0
