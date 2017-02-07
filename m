From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  7 Feb 2017 12:36:00 +0100
Subject: [Buildroot] [PATCH 2/5] support/testing: add core tests
In-Reply-To: <1486467363-19881-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1486467363-19881-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1486467363-19881-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

This commit adds a few Buildroot "core" tests, testing functionalities
such as:

 - post-build and post-image scripts
 - root filesystem overlays
 - timezone support

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/testing/tests/core/__init__.py             |   0
 support/testing/tests/core/post-build.sh           |  10 ++++
 support/testing/tests/core/post-image.sh           |  10 ++++
 .../testing/tests/core/rootfs-overlay1/test-file1  | Bin 0 -> 4096 bytes
 .../tests/core/rootfs-overlay2/etc/test-file2      | Bin 0 -> 8192 bytes
 support/testing/tests/core/test_post_scripts.py    |  36 +++++++++++
 support/testing/tests/core/test_rootfs_overlay.py  |  27 +++++++++
 support/testing/tests/core/test_timezone.py        |  66 +++++++++++++++++++++
 8 files changed, 149 insertions(+)
 create mode 100644 support/testing/tests/core/__init__.py
 create mode 100755 support/testing/tests/core/post-build.sh
 create mode 100755 support/testing/tests/core/post-image.sh
 create mode 100644 support/testing/tests/core/rootfs-overlay1/test-file1
 create mode 100644 support/testing/tests/core/rootfs-overlay2/etc/test-file2
 create mode 100644 support/testing/tests/core/test_post_scripts.py
 create mode 100644 support/testing/tests/core/test_rootfs_overlay.py
 create mode 100644 support/testing/tests/core/test_timezone.py

diff --git a/support/testing/tests/core/__init__.py b/support/testing/tests/core/__init__.py
new file mode 100644
index 0000000..e69de29
diff --git a/support/testing/tests/core/post-build.sh b/support/testing/tests/core/post-build.sh
new file mode 100755
index 0000000..fbea726
--- /dev/null
+++ b/support/testing/tests/core/post-build.sh
@@ -0,0 +1,10 @@
+#!/bin/sh
+echo $1 > ${BUILD_DIR}/post-build.log
+echo $2 >> ${BUILD_DIR}/post-build.log
+echo $3 >> ${BUILD_DIR}/post-build.log
+echo ${TARGET_DIR}  >> ${BUILD_DIR}/post-build.log
+echo ${BUILD_DIR}   >> ${BUILD_DIR}/post-build.log
+echo ${HOST_DIR}    >> ${BUILD_DIR}/post-build.log
+echo ${STAGING_DIR} >> ${BUILD_DIR}/post-build.log
+echo ${BINARIES_DIR}  >> ${BUILD_DIR}/post-build.log
+echo ${BR2_CONFIG}  >> ${BUILD_DIR}/post-build.log
diff --git a/support/testing/tests/core/post-image.sh b/support/testing/tests/core/post-image.sh
new file mode 100755
index 0000000..5856c0f
--- /dev/null
+++ b/support/testing/tests/core/post-image.sh
@@ -0,0 +1,10 @@
+#!/bin/sh
+echo $1 > ${BUILD_DIR}/post-image.log
+echo $2 >> ${BUILD_DIR}/post-image.log
+echo $3 >> ${BUILD_DIR}/post-image.log
+echo ${TARGET_DIR}  >> ${BUILD_DIR}/post-image.log
+echo ${BUILD_DIR}   >> ${BUILD_DIR}/post-image.log
+echo ${HOST_DIR}    >> ${BUILD_DIR}/post-image.log
+echo ${STAGING_DIR} >> ${BUILD_DIR}/post-image.log
+echo ${BINARIES_DIR}  >> ${BUILD_DIR}/post-image.log
+echo ${BR2_CONFIG}  >> ${BUILD_DIR}/post-image.log
diff --git a/support/testing/tests/core/rootfs-overlay1/test-file1 b/support/testing/tests/core/rootfs-overlay1/test-file1
new file mode 100644
index 0000000000000000000000000000000000000000..19f4220f2c6a1bdbd927637d19867b7d04ff5752
GIT binary patch
literal 4096
zcmV+b5dZJLh5%0erUIG?ui=pzQ*dtx%8BVBkmb`@#KxT3$@S==e)~Kz at 8$8?C9JM<
zgZ}g(q`BIWGUM)Mw!eGZ|BkfMYV2E+f-x$|bq~~pEXwsYpqRPO%P@v;(j<=1ez;5#
zZ~WjJvTLT0wZO3%`?A#ZG(ddm$u!2O>52n83+sWg#{-UbkKNBEmF)k*txQiMz&WpU
z*tHG}E!J3qC3rOv$sdbB-vAIszFfqhx6^8XeGad0G}07gs~yQO{gn~5j*NRU6X7hv
zWEU)MCx^1FW6Q#CKPc$`uxWlKi?FYlqU_T*By54Qv5pEG+ib)$Xq^Ne1zDIPUhYFr
zjuQ7{>WZ{|Y#Z8|NuZvEkJz*$ox#7 at b%m^q at dQ1}$dt4L?&bReNv?I)BDPBCUS;XH
z_($(8&H>s~xkxk)&T{IpGCyIzZ}0Y};hL!bxz<Aifng8?&621|1(|`&)ZA1mr>eql
z%SpO{Su_7iB3CGp`ds&oAu8#e9zD4OBLn9*^p|6K3Pod6x^1-%;HR$PnLMzSk1kgV
z0fP5W#^0kHP%V_#CG at X61t=n)YHYhPHqC`C$lyC$gIpqAxZ)VOy+kf#+YcscV%Gog
z==vpqA)C7#+U1{^&F%y9VsY({(wUl+rYn=&_nAnC0YuSpWJeVup~^4mW&8XFiE@$7
zeUotq=@_z(mZ~GPdq`xB13s)L321UgM at mg>%>M*DpXW<H^OV^0tOHYSfn&EaKwj_8
zn#!puZKY^b2P>J)w`|JXIXYK!?o1ppD40v&YzeeMpwAkSnjUUj+Om-NvDw6B)86}b
zCzU0UBWd(!5{6<<LlQ*Jj at 4jY9m~U@dL)<f_2}vo%6^=#Uv@(NNvS!dvuNxpN9jDy
zs3FTTfm>Q^MQ3Pm<W~uP6mD7{QA=49tU#Z|)VR;N10|MstCZ~WU3p%?;@+exe9uWV
z*0Si%3e9wLVJ&NRORA{lX-C{ITALQRfDXkwrZ)MylD)p=iU&ix5EycTe~bSXxs=-r
z&h|_6UrKb|#(Hjv9 at Ivu`AC_W6&Jg*;$@#?TNmn8+xJrcmg4J}SLV1R3I=fXj~SIF
z2WiZIo-MNW92lXCZf{<S89PkD8n#U%Bp!`Y7qx4`2@j<ybDI)+v~;UP!+@!sqVuQ1
zir-nbKfy3d^q|$$iSal7R)$aon7+*~cakQ8Y;EKfnoe?(&J&c)m0+f)8AC{*>NNg?
zejL2R%F{YMaAWjdIDE#$<^O(Q45&mb;|TB;C2Pt5Hm%MaE1gK)Acf$H?{@a>8HDwj
zS&h~nC9QlwS}l8_0l^T`i0zaBT>M;prsY<xB^$Rb`txSCYw-L70IEUn9L$>rhX1id
ztuSX48b9@<o)_psforxjf!)7W!8gZ3>L69}DIN`6?;4li_?G>bmM at U`HO0WEDqg2%
zKB1pE^<8{h)5v9g_fKY&fA@7ehHKM}J2v+)l}rCZ{z7=JN;)R}_d#47Rd%mbJT`C@
zO>U^WJHbm|$@fY}jwS`HZvL~cjEBP(m4WbLpurwTKWu5g?Tq9FtL1eZ3TkJ}N=i05
z3_}Yf8s9b%eB-9Djw`Xq;~`$1pyWPl2eSl|vo7))Ddc^Cx)V|n at 2t=>Z#6A!z_Q!&
zX}R)0myqn#kv4QaA`thIf at 3t4PmpH@#|HO0St_Apxk`<-RdB9?D+qf7GFjH+XCV*q
z@{jt?KvB!x3@-~qj|u(Jf<B#w4c|FDk8a1qo7DS2$purn$y&Pdi`>D}@O`ezC;&_$
zfF}rS$g+o-ZFh%3=^fVXmp%6s+L4z<JWtclq{%mjSIcqDZ7X-R_r>$`v8YwORrw$a
z- at XzBlZqplC6+BF36Mo(j4k8-^+mJ9NJC5u<^O2axNSSGKC@rxbSvn2alR~+O=rL^
z&wSZZNnUXn%|M_A{gT%ds*0C2CjUw@>2*!lX5wvL<*OcLI#;#)f7}?uqP|a687Nwb
z=v(DykeahZ@c1_!F_=c4PVEP)3r1fvCUqO_91tP4>t_<%QG8+d4mIQ7mpoT%V=-gX
z8y_^6#{~y+?%pz#Sf00D&htcuF1{L4fYd0h<+Uk*FgLYpMLE3u!D*h(qR~xDT=#s@
zM}9m@GK(GkDPpnr<Xz<K&T=zo2YPvn*Na_KPU^7oZo;{%qYchmlrQh=tt7!-xjqYc
zL2`_N^zx#tJSzQQ43fa65&0RbJ1Oimo_DNiXrr?=wyh{TbC~fBJf3H?FB8b1>{FD!
zDY%h>Ote*=zK3(oqxzHabdZq;dNzyy7e<p+3MAZJTGm+Q#`ddlr$)xKc1rYI5;54V
zN@t>ADqB*qF3(YAFp^fBJ{4-u+*d>9Ava^jB0C at X^S at ze9Z8_#Hs?!t6ATMXxab>d
z5toWlca^E>+l!pMB at Ew#<ZBv6?KjG<OSN!_sCVd)AN$de{J}txABcqQhsqvnOi-nH
z>;;AShN4EH_1WWn03ePHa|Fr1GvgiyKkMl>LivQfA7cfGdaJCDu9A)qU68)5-(^tw
z$3+dk08mW}8dnK6&5&&2`)(0EV_3cH5B+f0sv&IPAp$*suown%3EK&(%Hj6`Tl$`=
z{6Vv9eg_VB|KAoQ$m&AIV{iy3jwB7*mkTcITX;tDF at fO!mcSkbt_Y)?XQ)h;o6XQ6
z`O3SifmMlLaKrAy<Jr-2SX6nN7KyL_R}R|axuYIxYUts<I&w>&YHYcL9WR9&-o_U2
zpbhVjLulU7TYRinD5wMikEUba*E^u2f837y)GSqT3n4tmh9m4eZG8DtB2l;K4hIE#
z<uzDE&n1>auHPm_u5>TttBecwv+mJIUQQ^ve9dcfG*9VskfB1LAMky~${Hy5k*vZz
zA(wC7k_4^9^}f^g3#WP6J_+;pjyRW_k>7Od%o3umlCnsb6d<3t86<KO5F&8104ms(
zL+(xUU=6aUwz%J>&9&kW{@SqFl|7n`sGi~4t$6w#`PK>nr;xQjSLnau3 at w9T*;Ku?
z`yqAz_OP!kJeQZugm<B<BY}^bg=?(EmUKdI;pR(!Gj`JCJN!_G!T5H=j}r@png=}y
zR!0#NzlTo9I<!<CH#NT!a>y?K?>+`<{Y)4bs&91CAji{B?6f)ut(Ag;BuD;Fhd73q
zGzVe29ZBhX8D>*%pvBRNm*~}`3-D(S0CIQwpxQ-`-ulxWGI5aQxepumvzec<7ue;9
z1yEIR>4|<r>2RByi=e>6)aO-A0FK`jO-(50le<n^*T?`F<cG$vg9I|CZLhvSqFQ7&
z^JwGyqVT!AZgj&iAZ9-o3|e6-s;V~M|9y{q#0rylZLG^V$IIo~Ny)AUJXFHl(`t69
zIMoVi>Pu|Dr;8lRU$j5IobSCrZEZHyLy(Xts_D4+@=I~KPNzl0^+MUjef3VlwT!v{
z(!tV);VkrUbB2gDJXqRv!z)@_05vtrW!&eVuE0{|v$U))mM?T}w_x_2cFm;xk3~mj
z07H1{K$%c0QdvU4Z#^Ss@*Z{(4%5F`9sG>23cqvVS$5WP_klIzIz7;~^aKx6VZ$?p
z%BoJ1+STV~-PvS6c#mLKw2grzF#mH48E25jY>F~D&&a?(*b5{a?p}T-IQ*?W=b~$e
z?7QCLlPp0XCH6|?=lJ8pRxLH?Q)OWb at lzs^6QwN$R;+;{$}+2B52f3iuo2pauz}0t
zyJRb{m5H?(MAS(x+b7wZ(?(AWR;(2CvIYn7GwNA_CZS~y+Ss`w6(F{#>@gA-(Lk9b
zw($>0=oFcT&dWY+frZ&vQwo<5Z&_BWa#16A0g!z<msJ>RRAU2d>TkrzSkI>HeNaiR
zp3>R$w8}jWfE2ekBAKn-w{**c&P{+`$Ms0rMp?(}X*!oRA9R`vf7&q{+wo7V#-W<X
z@fd(z<~L(c;35_)>)9v>hkKO|&_P14q<4DQ*05MW-C-dpiZ|v>j>aucVMQ5GMO#c~
zus}1!PrYg;>C=Z3aD?+V#c%FIRE$J|t=^%VbJ79sb+M-9<V5MTR%IL2<bheCuHu8M
zqnNq{nv+8WUTE%9P0VAq<s&9!^)rJ&Okxi*UybNP|7C}|C&6|LobnroKa7zERx!t&
zNo!dp*%C!pVVcVBL&UMO>ksCkdh$V5Dar{*6%c8Wc+1|^&yX!>VKD5*H3Mi?k<c?N
z0BkXzdyELV2R!ABw(=g{8E6nptL5r6!+dc$633BZz~Lno90d8ax1eDe`TMFZ%@C}F
z9Jl3T-f&-M@$*5LAEmv7pB;X=`Y#SL`JX>yf at EH2Bf=Syv1%>=mco~&ZEJXBWRcFv
z9Je%vRStQ-ws~PxeWIOna8HtkX_xcL+uJ_W?lS)WOiT{{+IF5{`YV>Xd0BFn*8FWj
zEejeLjo&Ypol5|g<M_)n-s7$`Y<G9U{dnAQMimf%lU<%~j)<Rn8DIzpH^uI}rvdR0
z$Nqk7lwnpFe%g)Z_AtPe<a?CwBIWt%DoImpm*KdxPbmBYMLcQ3L<gZRi46GK-OCZ7
z^`V6JG#n%W{1L^B%jWO_%QKs$Hl9C0+upPJ6b5^9=yUSriHDKb8_`&=<8~|zYALWy
zh_#lOC$RGr_JO%+9tpLfshpEamHipfEC#P`oA&NSGpOA?SZ<3-BdrHI&`slrY|E=V
z(E-xMTMOp2l0~ddb9^L~c#H})Rg;Bq>MKrjsM4JOAHcM3oibOOdho at EpTws|JnO+X
zNPmsIg?zx!wlm-Qs9_g*++m;laFYOP{{RGseZTjFz4HA6`diVlhd^W|raX@$t}@<#
zQZe)L>QZ(dW$(e)%1Q{CCD{_iBv)h#A;T$Z>}IUnNlMn_Qd3c_J~8yE=Pd_lzUu(F
ze@%|1GwXq96U$-8AINpXaC*hcxU%Y^G8`;C`&Tmvhd30p^V&SbMkwS9b&(W2b0rlS
zxckLp9YB<3{nCDT1gQdLky?uCY;Ch?N$Ee!avymbEY|M^R(^cWWe@`DZzd)=JLH5~
z8+RE*(RF5R+s?Ywjyc&74$bS5bIy&b%~@t}Hw62c^Ft}_{FGci8k#-+|93%>v=zI0
zPAIGax8Vxq+4us8oc6gb4r_MByH3!@sqkDZxR4XZiRmUHZ*fxTCb#^)(h8_?;(9-A
zuee1D;K)!Q-8h(}73$Wck!nr1x&)V`|EHlDcg{}|hH*4qW6B~Fj)|sjI%*eo$N{(|
zAsmU`%E(q>%@ggi$)x${jLmsBLHz1Pm;|Q~FB=Fsa5X))yuX!rIH(5{jIewiNY?iz
zAR+tqc6hpAUMrVa*O#qOo6Hx=Z6jtQ$bL(y;Y=u~h2pEL1PA42BOy!*DMwNO{5*aH
yd72ypwr~zUn!(0u`mVHL_09fxtD!&;2{0oQv?aNzEh2fT7Xn_FK9_17BKHGZI1GRQ

literal 0
HcmV?d00001

diff --git a/support/testing/tests/core/rootfs-overlay2/etc/test-file2 b/support/testing/tests/core/rootfs-overlay2/etc/test-file2
new file mode 100644
index 0000000000000000000000000000000000000000..c9488dff0f6435f9dee3a8ac10daa990d459c718
GIT binary patch
literal 8192
zcmV+bAphT`=ZRSOtwRO%f-ZHlb7n2&a0Zq$4CTxrv)!=BU5zokcvSluU$5e%M-1&#
z6s{iRJ$&+MDE};loza`X`c?dXsac}S%!xi5|GOoAM-D3?ryn(C0{Ie2ua{pVsPA&t
zM9ew*#SBcMavA^tGDU8UCYCWHCgt7yEj?up?d1Gb074GAprMC#vJUO2V^2=(<@DM4
z0PiQ5#|T&al~I6BZ-*KwQdSxsAZi`VX2m}T4sO0@nUqgI6Y3)1XWUex>3rjrvuJj`
z$xaB(i6o2>A;_7VbQeiILXvPpPLEBz+WTus84$201|3JmZMSp&pbdKmp4Wp at X~&Kx
z(ALdi7|oA`IKmztSI2pbDGs7NSr-KXL*8Ua^Aq_zR0Z^8X7if;vEf~`0-d=Q=9s`J
z7bR4i36<VoXgJiaIq|bJhCl6U%HLFT_Ur+9LD&ntWtxG@kOdOH9Jg=c4Or|}^#wDf
za0E2#iFFG`g=ki6FeNDJ<$;Y(<-uMPIo}@O{!9L>Em{={BitO)i7b;NA0SdzW*$wd
z!_K^x20YPFBFTuNcDBNUpo~>0L*%+^S|{YaV`a_xCe&mYE7d9P*i0wqx0V+0+>qB&
z7$)vlc?~x28po=Q&&Dp3suM6-=xKMg>;Wtr{1iE{UZ8VdcHvXPlbZTwX*dS|Z>cC;
zmm6dTQ<c_!rTK&FWXCZwh~lY}h!NgA@IT3DKyqyVx{Dxt8P>oKy|!&oy3gei8OK>#
zQymAVKGf8A>Mr!pv|ZNlcTc6DxPk0C$^k({JP0xlML5&kQLismies<w4GPxDEOB7R
zyozBVGY!);IO+TxK5~M~M`HfKNVpwK7W{z-UohFN8h$1&R$o5Ek-h+`lt<TQfx6XY
zXYURxHxGLV2!G?QsBH2U#VuOur(_bEelc57V_uaPOHl3s(jvlAqY`({Rl8$fT?2<C
zk<><7UTD+mCoNo0J@mA`Q7?<~shOiMvuD=TuT&V`@*b#<z_qKx#*=>Rb`y7b;8o)*
zRK2O6$#AaccEezP{@hfi$VGsWqNCJcRFdKWAAxOqJENkkPzOITq}NV3dBydbsoUiW
zO at GT7YHKx;NGAOW_joRw)@OMpc^P}a`rQigvT)5VBldfCPC1M}`&YO-t2|#&v=p?U
zBh7_>+w7^Svetg~2QpW7Ji$-pW#rL+>=n=~>dss3t*}iMxPC8M8OR~vLQ|HK(Ti8O
zf`Nu&Oj`w#FLq*$m-)8I2<3lEeSeSp5X8@h_Io+W9B*@bQSQV?$*-)c#y)Wfk>;y7
zGP7M{tt>z`uzM7`&}D6~%FPIlbYYb?BXsblO(8ZZ5r91hMIx+$#(tuyq*Q}#faClZ
zMC!+8{m#>ejyGzGV>~?V?X*Q>tr!19+uhe)=MgU|^GmcJ<h8Wfay<XRVU7v8;A1fd
zat7io%?Pq6p^DQp^wT>Vd(2a=j3dp*U_*$m8~}>kPpWx6hFg*h(mcf*#vW6~b?vPV
zh;!oyO+N!eWIA7KM_JVG-7%#0S8gRV99&>mx_7FrGtum7dI6&2;SSrPbGNxv6|3k#
zt{=Y2{<69=NIrLW7CnXbb$PCeK&Lsa?7$l2Uz~8PQ)<oGhBV&V`-TU?p%L5Y@!vW%
z!>%ez{QnKn5scQG8gQ6Yx`I5%odSr$jS?J1rQ)#zA?2ZnY5mxpOfV<LHn!C8tKdZq
zcBE*QYk55&o2+-o28ZvUT?m-LYM`)niDUJ=;HiJ-ZaMIW_R?7$K@v@s$xO^O4+j&4
zLZ~%M4=E)4*=;5;>esp3rd at Cy@=>m982KPKx!Ey_;xgmxH>C8?wISPa!MCO#iVbDC
z0WdDwa5RQA5V2Rgtk4UI6c6%OsIVWcQH(~*Q`JiiSBPVE;^Yj!A%Xe_egi#q%M%}(
zJ3NGlsEvbg^2;U(9u!`IM1db4POV7_l9-il>v_jzyU7blqiKjCeP}p=$HnsFG*Nt?
zwpY4&U=1M*8H9i^frF%Tuhlw@`X1+?FUf$Iudz*w!j_|vI^2r5 at S~5N`_i`DT3=Pe
zH3pA%6(HQGMT%QJ+z?fEJsr5`QH6l09<Q>pXs6G&>fBVye&-vkRgl+nV4`DKkTq7S
z{Rk)`jX*(YOVuwL!QDE6idTqnx{VVM>k*>$42gs{ETsrgb7P%{e~cs<Z1vWgXvTC?
zTAX>r?`yWuJ1BWt8}#tfW3Z-<40y4 at iHv-RDD~^Q*vq+xd_}_x{CG~vkyY&!(joUF
zT&y{nxv4;mnE;N!91*;be_*VI`$OO)XvFO6&7DW8RZSa{iLVE*Su6DO|0v3zc7yu+
zV$~;?df(W_L2Mw+@v5_a1fj~~Up7%sqU3`ySi7o&RpHrm3T0RV1px>6_E~xlQ-N;=
z1X15xD;lUL_Wzc!slKun{7ddRg)rk2w3)EvfoxQf)Rl57e5=ksJ5;qjY1&P~+UkJ5
zKds_^zJtf+)#ud4fn5(NoQxoi5#&2w<Wpcr(jIjjoHL}WG(bwNQP(6Md%AJ#N}BGS
zqBT3rGZpwWBSZ0taV*$2qCT&){C6rq!4T)NoOH7{QtH`4O@0-c{j2#^ObDILu$kED
zN{!xwap%5+U?}9>*+^{L?ZE1Dg&zg2;^ws7{aG`b`%X=@Vw~(SRqm(WszFVFehha!
z;>;|5OmM|MY6QJV=dfF_h)K^A$Qr91YiShT-ChTTp*#RZZJ3!k34K^~1iS&;R@|p|
zTQ_n6nui(=52kZ|9aAeI5P4$K(2$)02(mNvB=#wdquVz&Ew_mq05FwjDTlq-1y>y{
za=VX1Zut$NoGWJp_*uB|5+d^2a90UL1Zjs7D*_K->_su%*5XD8WM at o5$Kz at _2;4b+
ze6RS`LUL5=(|wf2cpCPqIt at UY%%+VYcw2$q2rD5neWQD(#W1xaIzI(vwzymh)?(cI
zJU5f+6{Tg(anU(}m0rbk|5p at GLJ{=j7GqUS;xq9Kd_)PPVZJ^Q!WiJe+Ky~yS9rDD
zV89v*)w`YRU|us?h#iGRMJ1eB2f5zh+l^lnh8C^WPuQ+XLjI4i^y=radipVf_-E17
zDipgs>EXmZB!@sn^9U1uhz!pqnrU%?BE{yW6pL9EASgt39y2BRRlU6QU=H6a&07J1
zg5EonMmy$YI)Wh at 5;4o4x`4DYI~=t#r8K*bAja$M8dfe=-RZpGaGlbiK at H(XG*S6Y
zkI73W2GjKiED}i5)gzdZ<YGl-k5rt^aOJdXUtw$t$*h9-fZ=21RB+(D6atmoe|Kuc
zCLjyYD8eFYS}J9#c?JEN(Z0;F!AKoeQ{5DXlf(_dMruYzQPq&k28iPAX<@>i>=!mc
zNc=ziAAMVt&>S~B=6TyQbZSBjhM!U{N6s{#%;|;DkN|>OWl;$#&yv80L$f9n`lRJt
z6&45h>2?5W at w%Bvk5biurrkuUgT($KM+A_#V1+MPl(o2jFtI;^GWuvpN{gkAPY)ht
z at eyV_rFj66MZdKS0zgGJKhc=YrG58pB`kK at P)L9iBVM^CZJJ}vX*Cp2J1bBuEbL!e
zx+c+=w&5Lm&@6ZXKGu2mw0&U}yb2%G+RT1DAy>1*3}a1SdLfr~d020js1>b0;s at 9Z
zy5M<xgreQ#JD-cAijKm~OUmh)SO3hfapYt&nj}b73&!FoUo|{J{r|C}Oz|4@J<#F{
zw-OxV4Ht=%xS-NovbhyT#o+Tw>V-DN7<Z0_H`8Z(4<~ZCg%c~5BEdVQV^B|lTAM0M
zI%r1<{2}RP?z at 5C9*UNxu_bzt2}0humHQQIs60bkj8(I7=7O=-DR`wheun=%j;tXH
zK(XhANHx<2M4~Q}zw|<%)e_tACW!gUoZ+FCW#xQFOq(ua+}gCmEpI%uUehOxfc4Bf
zizH;Y^?j$CV3XXX^u01u1(&h9<3-oRqj!OC6JmNFb75Q(dlLtgLa4j<k-II4INp1J
z0fr?B=Wf01;F$QYj$x%+xNnyXXZPOO&@EC*rKr@Mns3HJ<i)zYDZp3jhaeO<!_DEo
z%vu^cHda{;KQW4?xvUEI3$HZ6yb@#N?m>gu{&MfZ0XEauhKh?vfoVxXz$60j^^pmw
zi7)BbE8%6XHA^jhYJ++4Cu4P&`)4v{cqw7~>SuJK%7G+t^a*o(pEKX~+%7lqQGXWg
zIf7p<vE`K2zLY3|O$V!j85Th+3mtC=pQc~}bHY`V2t6^Q1ba6?!(9DS(WcgDsIE_U
zPE&e_Pxyu*{^G0nMHrq6ZFWkfvI6>Y{>{9gawBIG)(1999(Nhuq_C71EZ+dx)QIRS
zmafB{`GzjaXs`~En at 8Gcf^GwMFs(oSYL`LNoE5<uASb2xu9(-x!SNYB;T=EqNl<H<
zVy`)P1KfdIK<Y@x_s%CLqA_do6Mx$C{AAqkM9}^MO)&%i>af{279aKw$8Rvukv_1d
zl at KG;x=)<!6r3eY_S*+5M^jW}k-kfcZ<3B|x9g=aK6yd{G!{pNQ*Opxz!nj&5@~lT
z+=UEq+yW7cu!4PtUN>b|BgasX6MR$ZBrSYcr}KmcP}g^Ktzv2h+)XgrU!Fa}9M_zl
z^IJ~Ky0-o=L4W^96JTf(&>4oxYstn+lBB|Uca^12BP+Gx9N{vZ+&{=agpSG%m$4M7
zhY-J0hHP=6R45!ucrbT`491Vq?-LmS2OR)WKg5 at H*`}V~l0Lrcd{9d*C<vcuvdyt{
znk&J%k_e7c)O`QHXu-UKCW)$O1VpKXkzNsTxoqk}tu|L&j<ZB*FUn`_izz+#cpvQX
z=YZUpG7&}!7M#Vc7cTnNRF3g9BDFX+I(1yfBAa0~ssSzcP+{f>(f;sz_Dva=EF1Xp
zY{C`8pVa}5j13bijK7$1K?T35&d?PEs(jZ&LLf`a-lN!GeU5vOr&rBL at DnUBYt&&t
zCC+6-hx$&AH)fi5nn7_YZA{%w`VpwNj4;3u at 61jR`bhylw3l<f&WTw%=U9WApV|YT
zhqP1C;i(IrWJWi~{fZ7-RRwB|X8(M22Alt!_}IxAWp++`=Jv(BR|NYW2te$oh}}F3
zKyW%ngm5;r4_Zl4_m=$qVRY#F;d*kkt;XX`JPOl`bb4NfWVegazL~y-Wck0chmZ(|
zDFsm3$DGZ<UVeW^arr~Tb=T<4!o<2OV|us(2mb%glTtm+UU?fdL$o-q+TN5Nj3(`Q
z{B($i<fj`iU2NrZa7Is4*U8;N(9Y{f!Th+4Sw5oVM55TE%?5d%JuG$p(}BsnFjnZA
z6CJfPIEvmg&jL at _#-cN#7{=5XAQ9U_(n0r8`t-j_am#nX&#hN6{#_iK2d}$LKzH&{
zrnOt%%fSU2g+l%)g;9jvtgY7bY6lyH$8TC%I0{MRG{{02`Y!nUJyXEoJHQ8{ZisI`
zouXin1arhSK7WR@V7a0H0v{EQ728*XE%SA81Ek(+2gh<X^PqBs^%m_9ozEE~MoRV=
zU7gNSYRX(G;Hyb~iWC1hm9V9oWdIc+v{~!kZz39<5?|i<Q?AB8zUfhDz$E<VufI&j
zN1w-`NgcQwswa=GfCr>szees|Y!4Q$4^NzcxTO(OF7c#iJ7~-$PIXA{eQ^$&UYPN^
zM*K@~Yk-wm$a%k<IM|1p_;Lrv$?sGR<`&Q0B}dIW(dpLZLbF&zWb-F#pzeUU%L0@L
zdPYtFf7}Ci+iEwu6%?)RU~_>YOW{f86Z}J%_dty#P4%)f%Bf^+0fMrk<{-v6Bz4d2
ztsubH995<**xzK8*qOjs(wDdfuCZi@uCp@^bM5ut1n6$uOa^Mokq}9KkU$jLcZgAK
z9NGuTO*VRTLl4X6{0oD2>@CG$`v5K8g-Cnt|DUkl9%2OY(p;;P=_ at v7qM8Y~@ZQ-5
zF!wvWH6gm*G<vQo>JI|$IGd3GB3$AAAcYbJb1IBX0D at h&o-sj`6k-M+v&cQPi^XzU
zyQb=2nHYpR%kEgy3ux4CF%+nM?Lpvg8pL at s_Ey0@43`$gU}#Rnb%+Ce0X#)PEJ9S4
zj&ywF6m7ds;RmbHir%xY6tess+~J-KQM+)!cQm;-7*NZ)_=H;KOd at n*ve=WTGoL&7
z+(}IOu0{5b%PfAnhc42+oW2tAii1LJBmetz8QV01gATnf+v&%W>xj{ov2qEjkFMfB
z(`3B<<f<m<jS5_usC}%y9tN43RWc1MmcI_2Lw}`hGVm`RHhlkQrX>*=UEvxQ-9#c)
zs14=wmCnrIV#uQM&w=}FT$VT)xO%|LnlRed at F)2&zT0B37 at e4KCz(g4E{&AT2AA)Q
zT6LLy!l634+;_cOevHYlIxRGT!0H_xtLY1LvW(%?wuq+jUGT3Qr<dMNs4V<{=&JE}
zWZ<5Nv|~e=`}g?!N*z$S8MIFML0jV{1?(#{Bz@D>MXHW8GQ6 at S5E&SY=}lq^NNk+v
zR}Y=8ZBrZC|7+`7lsIRS(`A$#I2!FO_Kt7*FM&6G|Kt#{%)q(@U6XHs at BV4~UF#ar
zDz8K4Q)<BY`sEs$Z4iOVWM2S+zI(cv#?QS>fi`AGS8*9a&>$^t7gyf2&|AnH??U$H
zv|Y2bk!IXLc^Niyg81_KRN+3|x#KpOX7;ajdx|@$gt8nC(o5Z?;{6uuW=T%4)wH_i
z at r-Yt@K0$CAvm)7b_Vz<1Vy_YY#zAP<XaC}&~sR`R56qAN4DPhKrX|f)gOW4lRN*g
z>@y_K^CRElZURDT`-9s0*omQW2Rcl)cVodC>Pt_6D>-Fs{~O(6i}2~u5BN4sq|$kl
zpZJSANbX;pI9t9;VD&JsfrWr7>-MHV1hi_k0Hd|0$2B<>(F5%y`Bi+Ix&F-&sFAh)
zwsInf`G?uJB5)|f{cDVUcEo$`R`xq1olE?#7-;v;gzv_A*Z$zlC197rz^(XHA0%(<
z_lY>KQAJVWUVQ>QBfOzuuDP-FsMUKJiNy}IlM$|GII39W7;=pk&`X3U++K5OU%n5P
z=zhYuj~IBq>fEak?+4!;f3}_RN+H4|2We9mLw(VwIDREs at nQBSO`^h;wkYFzrP-RK
z_IB?cvgi*}tc5mF+e|A4v#bJgz5gfVLhH3KPdf=i^QK*=P#^NDI3r79{c|jFyG**H
zJ5tGJk?9sJAC`qLDi<0~O;v64PEr?XT4-BAS?G~69l+Znl@IXF6Da|4myfbm>V?!|
zLy%ViMHE<Bp|#)~XHJ3?<v(sA@sLx$)oYE&=mKh?Bu6WK1vQyK-kjs2{GJ}yxrSaz
z<-%*if-cdp$>*`ti%08<uq|_R6TjeltI(@2#*GD3V!pi?vZBmq)~U}30h3CAYNY7F
zs2<ado*rhPM?{5*jNP9XKy=nuRCGP)%tXi at VNClorQ(*c^%rDELk}?d(6mV7aHoQf
z+=ja9(V9S}zytmiovkR3Dr at o=?%+!yoL@8TW$0U`(X}d+qyf4bDSbrHuS>jM`M^}i
zOB}|Pb0Bs~WTU#7xDo}#hCodPx9-#BkPG8f2#gY;2Pt7)3a_!F=2u*ra5zC47c>@H
zgk~$&1GRR1yDfMV#kjDu`#qzCyYp%m^mqRYJL4E|g46O=4+>WtBS=o|2OcV|<gme$
z#ET^uvA(<eA;GP)GCO!uwA+-yflia@1X%+n<qA=rVuS_o>O;aLP7o&r>0a~CRF;>I
z!w$88N}VZVF{rk%Dq6(*m9CU29D0KBM0-=*WsdORa{wisBg8E;muJu0^?{nsw1NPz
zXKs$vOVY~xZoQ<vJn;hh)gmZB=5cqCRo#LsHJp$+Gla>dg<R|E>&a)bPl-NJPzy&W
zT67B|;S3A?C6eP9u2Smdo;yM=T&!;23O5bvZw>DO9y7Iz!$KrJ<%>9hOuIc=If+H7
z8eKm_Ot+~jH}1N}pscgz=nc at gGR{^nuvZo-cJvwLDHN{na3(Wi20~zRjT#~-zI^Tc
z{$wnlP&pNp=ZIN7-C0G2O at GyaS`x!m{5j#~5b^<`PBFU4^Dm!=;x<|dt=GW@<PLUs
z_agC~k)Gz8R!icGNh(6H4!;ch@tyylizpul7|a&FtFLoQcie6_(69d0=YD=Dh7>TQ
z4+o_)d|J!0L+i`q(6DObos9LKjtr;dx93x?**zi_PVVye at +FT7c#72zJEC at IIRecm
zIkTC(Hk&X`2jubpByY#0znG<K*$&JRRTf=Y;LLp at Ymvmuv6KLz7p8Jna)<kXUii*%
z`$7Rl_d0`YbKMDC9+i{z0CsPVGp^v%FA at YMt6Im{6e|s at JJ82v8DSD{!QM@nUSB)+
zXf-P6c%iCp2B2Z;H!AeVB~;%IH!Tt7ezMXSaXO|SmpH41gF5jw)r3u$uMvcd`5Wj*
z4;&d%7NOX~>71ihU*OW)09(f3<C)QYn9ffQAGo!AZ<}`vZkM<d^}`Ke3)Od~L*vS1
zghA7#VT}mAsEuTXnpwd8^#{aX^cXWk*w{py|4H}-?-Ksh0UnhKB9w8<7=ZKt&Ncv)
z#3?fWdHIX)HE)K=y$$=ORF&Re!fo&Rcr~vg14@ToT?pp1J643SK9h}p8A;PiBLTQX
z1JReAKO&$<Z^p+m1gU+3aGO9GYhH#=<g2rim&|b-jA>Vrrvi29=W=(_r5BTsEG$4#
zv8`$PQ-JN)ft}*i&XQ`SRSnmNC6=_^uIZ-YZ8cM8A0=W*E?N!l%%GWqNUMvOH3dFE
zsM{<daNA7YJIxmX1#mQ7mK8Hdv01#b4}l(_^02w)Pa;b9=uw3t&rS>I3Kb>@G<zn9
zDd*f)zp<ax`gkbR_K7XZGg`+YGF6c?uVZsyJ@wZs0_P|9MN*T*j<eOr!{@{t{S$Tl
z_aI}J75?F=0dw;MPAK+%&1dS7UZ}}$J`co6GXHpz;+NrC;a5s%H6&`a9#bl{3F^rz
zAvzxOvUz>TW8-Pq92_#_T#GxMi@}HHu$mTz((9_Mr^_;?5jNTb1xVnB4f&JlE=LaU
zz>%$P=hh)bIQ6gCS4cpy at EW6emkoMLX!`h7m!+N*BU-KCu`V<lf;GC=4F{|Zs+h=%
z?dP^#-e;d+4|UUIf7BK$!fS*h8zJThVZdg!&U%nDQ@|9fD7aY+Q&{Sl=AqJV$Oi~4
zWgJLsf98Y!1xtr4(Q=^GKi%lB^f<_@{792f==|pA5;{^tNeX7#W^)jlKlbx^)v;%d
z=~lU6=Xhdp`-<kFVS{5%tpP_Xt!WX$XHQ-;7$mr?eUYs06>ts1fjCH at b1g3R?viAn
zLli0+0s;IWcVxaAx&R8p4ah1D^6Kq5<ZxQk6F3L<-)Zr^v@Su<lF`2?lo<>y>xPck
zQ2TRO5dQKaN at V%c*I8}vjW28+jTX(8ygch%fkfipsOWKdW|}X%V<hgjp}n%-Kf#eS
z735U<M7{@mbztMzKdqp~nDW!}j}pPq<9LLmBxIA}4^kz$y5dBfX)R8gj);-<S%eP>
z%wg|ykHG<z-_v&BysDn$tDQ?X8~nsgH^b8_Y6^WmOgWo$`E9cR5b%FPWK)+cshU_9
zn~57LOesB&rKU1e*VSpL&x?A>e)`X21o)6|bjdzybFdg}pIl<fRyq;l`&0t=+pH@m
zUqW4tLP46(u0>%NOtCef5ABjgyuM$i{Bilo?AsTBaX8MQST|neFEe2`W(@_(ma9eC
zy*vv^DeiIBA{as<mg+7(6wDSO;`JIh%TcI`zb!#nVIZdP;G1=hw`-KvVNNbs8csW!
zY#Kf`Y=5CwS!p~~E;-K&5wAu$_C4+_67j+=6J#@WcN7~oI?Wyxe?apLznS-L(-)@U
zz?|-^3z74R2HF}3oQD?3(QY$3O%H(*gG|Aq7s@YxRfAYLdz<{+v->+N5rb|I`u`14
z#?S5gH_F$oziYab<|uy$Jyc+$ODDmh+yOd&wpC~gVmogB^4$0_i7@>=1)#l{w6d1E
zc+1Q!=Tv&}6~U!}Kqk9 at XH7z5t8mD-x^={<l1E*ZxwZ%QKG}gTnWamljY_5}$9*5^
zJt4gdk>cVZQ+ at c?&Q&oKYP{9IH6(ZK#N7Od%Xk}3Tp_vt)1B2mc`IL|w8*qI#!yN-
z!NaV}NoMq7Nb^em+$)U4ikS5V at SO0+*@wR|;OR8;m3%PqFH^U~cw;p-?R3*-9l(xL
zJw2=(+B{8}_alo!lylNU_{`fI-t-GFMT_>)(8h*|@sAjd3}5x1juwehUYIgLZza>5
zAAVAJ;3FzegIdWNAq>@+>n8q!TjPkB%ZK?x3!&U=X)O=3T2|v<wGvg$)6t)s{|uI<
zI?e+M)>kd^Z%<Ki!37Ol#_EAORLvJ(rws)6G}U&Ir8}Tts+7=Z7`rtJ0UvAlgmIE>
zfOzN$_fOyPeS{%CH#o|hcIf`jWk^z#9<@n at N~rZcmApQ^m<c{Ol3~VM%uN%(BB+-!
zBGBZqL9#6ceG8e4$IU0(uY(Y5?6X9G1D)nr8F%H)+m?NDVrjR<jEG<YeY<oSvq*uV
zcpONjqYkPi@K!d6HFVpo8>co)ai^P)-^-!H)(aVCgCfh<g(q@W-pEa-Y$9%&?TSXO
zcaNB*->744Y!-sVb7Q}ySmfjcuna_BX!zdiu2tq7vr#kMhrkbV5sAvZRTYOp!c=-7
za4pgoql&GElYzE&CGw;Q3l&y}qx&ljRN8PaJ@&IBOiJSr!R3 at k(sMz5eEp|J5Sp!4
z8bYOol|CIWXG`A|l$=%I{4h;Ut1{GT$BL+llrFnY3X(#A<eaVuBnp#_@HblWgn?H=
mc#N<=BgLV1-)U!8j}zr`9=5D9AA!_osZSLWra6pxTf7y>1=ySb

literal 0
HcmV?d00001

diff --git a/support/testing/tests/core/test_post_scripts.py b/support/testing/tests/core/test_post_scripts.py
new file mode 100644
index 0000000..1485f28
--- /dev/null
+++ b/support/testing/tests/core/test_post_scripts.py
@@ -0,0 +1,36 @@
+import os
+
+import infra.basetest
+
+class TestPostScripts(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+"""
+BR2_INIT_NONE=y
+BR2_SYSTEM_BIN_SH_NONE=y
+# BR2_PACKAGE_BUSYBOX is not set
+BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="{}"
+BR2_ROOTFS_POST_SCRIPT_ARGS="foobar baz"
+""".format(infra.filepath("tests/core/post-build.sh"),
+           infra.filepath("tests/core/post-image.sh"))
+
+    # TODO
+    def check_post_log_file(self, path, what):
+        with open(path, "r") as f:
+            lines = f.read().splitlines()
+        self.assertEqual(lines[0], os.path.join(self.builddir, what))
+        self.assertEqual(lines[1], "foobar")
+        self.assertEqual(lines[2], "baz")
+        self.assertEqual(lines[3], os.path.join(self.builddir, "target"))
+        self.assertEqual(lines[4], os.path.join(self.builddir, "build"))
+        self.assertEqual(lines[5], os.path.join(self.builddir, "host"))
+        staging = os.readlink(os.path.join(self.builddir, "staging"))
+        self.assertEqual(lines[6], staging)
+        self.assertEqual(lines[7], os.path.join(self.builddir, "images"))
+        self.assertEqual(lines[8], os.path.join(self.builddir, ".config"))
+
+    def test_run(self):
+        f = os.path.join(self.builddir, "build", "post-build.log")
+        self.check_post_log_file(f, "target")
+        f = os.path.join(self.builddir, "build", "post-image.log")
+        self.check_post_log_file(f, "images")
diff --git a/support/testing/tests/core/test_rootfs_overlay.py b/support/testing/tests/core/test_rootfs_overlay.py
new file mode 100644
index 0000000..42d890b
--- /dev/null
+++ b/support/testing/tests/core/test_rootfs_overlay.py
@@ -0,0 +1,27 @@
+import os
+import subprocess
+
+import infra.basetest
+
+def compare_file(file1, file2):
+    return subprocess.call(["cmp", file1, file2])
+
+class TestRootfsOverlay(infra.basetest.BRTest):
+
+    rootfs_overlay_path = infra.filepath("tests/core/rootfs-overlay")
+    rootfs_overlay = "BR2_ROOTFS_OVERLAY=\"{0}1 {0}2\"".format(rootfs_overlay_path)
+
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+            infra.basetest.MINIMAL_CONFIG + \
+            rootfs_overlay
+
+    def test_run(self):
+        target_file = os.path.join(self.builddir, "target", "test-file1")
+        overlay_file = "{}1/test-file1".format(self.rootfs_overlay_path)
+        ret = compare_file(overlay_file, target_file)
+        self.assertEqual(ret, 0)
+
+        target_file = os.path.join(self.builddir, "target", "etc", "test-file2")
+        overlay_file = "{}2/etc/test-file2".format(self.rootfs_overlay_path)
+        ret = compare_file(overlay_file, target_file)
+        self.assertEqual(ret, 0)
diff --git a/support/testing/tests/core/test_timezone.py b/support/testing/tests/core/test_timezone.py
new file mode 100644
index 0000000..51cf912
--- /dev/null
+++ b/support/testing/tests/core/test_timezone.py
@@ -0,0 +1,66 @@
+import os
+
+import infra.basetest
+
+def boot_armv5_cpio(emulator, builddir):
+        img = os.path.join(builddir, "images", "rootfs.cpio")
+        emulator.boot(arch="armv5", kernel="builtin",
+                      options=["-initrd", img])
+        emulator.login("root")
+
+class TestNoTimezone(infra.basetest.BRTest):
+    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
+             """
+# BR2_TARGET_TZ_INFO is not set
+BR2_TARGET_ROOTFS_CPIO=y
+# BR2_TARGET_ROOTFS_TAR is not set
+"""
+
+    def test_run(self):
+        boot_armv5_cpio(self.emulator, self.builddir)
+        tz, _ = self.emulator.run("TZ=UTC date +%Z")
+        self.assertEqual(tz[0].strip(), "UTC")
+        tz, _ = self.emulator.run("TZ=America/Los_Angeles date +%Z")
+        self.assertEqual(tz[0].strip(), "UTC")
+
+class TestGlibcAllTimezone(infra.basetest.BRTest):
+    config = """
+BR2_arm=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TARGET_TZ_INFO=y
+BR2_TARGET_ROOTFS_CPIO=y
+# BR2_TARGET_ROOTFS_TAR is not set
+"""
+
+    def test_run(self):
+        boot_armv5_cpio(self.emulator, self.builddir)
+        tz, _ = self.emulator.run("date +%Z")
+        self.assertEqual(tz[0].strip(), "UTC")
+        tz, _ = self.emulator.run("TZ=UTC date +%Z")
+        self.assertEqual(tz[0].strip(), "UTC")
+        tz, _ = self.emulator.run("TZ=America/Los_Angeles date +%Z")
+        self.assertEqual(tz[0].strip(), "PST")
+        tz, _ = self.emulator.run("TZ=Europe/Paris date +%Z")
+        self.assertEqual(tz[0].strip(), "CET")
+
+class TestGlibcNonDefaultLimitedTimezone(infra.basetest.BRTest):
+    config = """
+BR2_arm=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TARGET_TZ_INFO=y
+BR2_TARGET_TZ_ZONELIST="northamerica"
+BR2_TARGET_LOCALTIME="America/New_York"
+BR2_TARGET_ROOTFS_CPIO=y
+# BR2_TARGET_ROOTFS_TAR is not set
+"""
+
+    def test_run(self):
+        boot_armv5_cpio(self.emulator, self.builddir)
+        tz, _ = self.emulator.run("date +%Z")
+        self.assertEqual(tz[0].strip(), "EST")
+        tz, _ = self.emulator.run("TZ=UTC date +%Z")
+        self.assertEqual(tz[0].strip(), "UTC")
+        tz, _ = self.emulator.run("TZ=America/Los_Angeles date +%Z")
+        self.assertEqual(tz[0].strip(), "PST")
+        tz, _ = self.emulator.run("TZ=Europe/Paris date +%Z")
+        self.assertEqual(tz[0].strip(), "Europe")
-- 
2.7.4
