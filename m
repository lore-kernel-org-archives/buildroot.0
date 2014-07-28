From: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Date: Mon, 28 Jul 2014 18:33:38 +0200
Subject: [Buildroot] [PATCH v3 3/3] midori: bump to version 0.5.8
In-Reply-To: <1406565218-12653-1-git-send-email-hadrien.boutteville@gmail.com>
References: <1406565218-12653-1-git-send-email-hadrien.boutteville@gmail.com>
Message-ID: <1406565218-12653-4-git-send-email-hadrien.boutteville@gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net

Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
Changes v1 -> v2:
  - fix typo

Changes v2 -> v3:
  - fix the need of librsvg for the host
---
 package/midori/Config.in                           |  15 +++--
 package/midori/blocked.png                         | Bin 0 -> 522 bytes
 package/midori/disabled.png                        | Bin 0 -> 510 bytes
 package/midori/enabled.png                         | Bin 0 -> 639 bytes
 package/midori/logo-shade.png                      | Bin 0 -> 23862 bytes
 .../midori-0001-remove-libnotify-dependency.patch  |  27 +++++++++
 .../midori-0002-do-not-use-rsvg-convert.patch      |  39 ++++++++++++
 package/midori/midori.mk                           |  66 ++++++++++++---------
 8 files changed, 114 insertions(+), 33 deletions(-)
 create mode 100644 package/midori/blocked.png
 create mode 100644 package/midori/disabled.png
 create mode 100644 package/midori/enabled.png
 create mode 100644 package/midori/logo-shade.png
 create mode 100644 package/midori/midori-0001-remove-libnotify-dependency.patch
 create mode 100644 package/midori/midori-0002-do-not-use-rsvg-convert.patch

diff --git a/package/midori/Config.in b/package/midori/Config.in
index c3b5a1b..821b306 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -1,20 +1,23 @@
 config BR2_PACKAGE_MIDORI
 	bool "midori"
 	select BR2_PACKAGE_WEBKIT
-	select BR2_PACKAGE_LIBSEXY
+	select BR2_PACKAGE_LIBSOUP
+	select BR2_PACKAGE_LIBSOUP_GNOME
+	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	depends on BR2_PACKAGE_LIBGTK2
+	depends on BR2_PACKAGE_LIBGTK2 || BR2_PACKAGE_LIBGTK3
 	depends on BR2_INSTALL_LIBSTDCPP # webkit
 	depends on BR2_TOOLCHAIN_HAS_THREADS # webkit -> enchant -> libglib2
-	depends on BR2_USE_WCHAR	 # webkit
+	depends on BR2_USE_WCHAR # webkit, libsoup -> libglib2
 	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
 	help
 	  Midori is a lightweight web browser based on WebKit
 
 	  http://software.twotoasts.de/?page=midori
 
-comment "midori needs libgtk2 and a toolchain w/ C++, wchar, threads"
+comment "midori needs libgtk2 or libgtk3 and a toolchain w/ C++, wchar, threads"
 	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_LIBGTK2
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!(BR2_PACKAGE_LIBGTK2 || BR2_PACKAGE_LIBGTK3)
diff --git a/package/midori/blocked.png b/package/midori/blocked.png
new file mode 100644
index 0000000000000000000000000000000000000000..c21a154260de039ff862b3a88120f39e14c870f8
GIT binary patch
literal 522
zcmV+l0`>igP)<h;3K|Lk000e1NJLTq000mG000mO1^@s6AM^iV00006VoOIv0RI60
z0RN!9r;`8x0l!H^K~y-6rP4WQR8bVh@!y%52$HyfiV{J~pkNUT!MI=wv3AKwCXgbH
z+G!&QA}Cl0LIf at Bf{_rM;D$CL;#LGfQbtTGVuGL;h#)VMYcVg$WU=x#m-Ei|{qH;X
zyWt-z-LpwaJ7_W%Wj|Ka#R_B97MaU9i#7S@Ke(&O^(gzk0+3!S`KC?Mg$r1ZX}lFS
zO4`waU+9;N*lr>^&DH@!K44!CofYm#u0 at ZZ3*$6-EIHJ0_-OR#DCNa2BwSSRAi8~7
zGFQnt$-%rDK^Jz{Tk{gK=y7w|eXKQWP;v^Ha3(4S(vWQ4TgbIDD5XKo4dx9pPjmB(
za55?eQdJ9zxhDsNPbetqfHY`_%zGS_Oe#1M70*EC074jV{DT+uWA&x`_9`019*is6
zAKgAK&ZRHkUoOU2wN2(T*5Nmrg*TED^GW1sb>bDKg|?`eDnOJ?3RiPrGe(pgTV~#g
z;aqbiDyAAoV8Sgt$*VRsn-|Q(T7~D>iiaw0&-a!*<y6%o^A7F8S94A)O6H896=P}+
zM{hlW6@UduJ^SO!T94H9Hkwxj<dCAwC7f4(q5YcNh_c#h`u|#g0S#l0Q*|oAdH?_b
M07*qoM6N<$f?P`ECjbBd

literal 0
HcmV?d00001

diff --git a/package/midori/disabled.png b/package/midori/disabled.png
new file mode 100644
index 0000000000000000000000000000000000000000..a1c8d45c27e4dcfb267e5587969d99cf46509bba
GIT binary patch
literal 510
zcmV<a0RjGrP)<h;3K|Lk000e1NJLTq000mG000mO1^@s6AM^iV00006VoOIv0RI60
z0RN!9r;`8x0kcU&K~y-6t<pJYRACea;P1T|M?&HPBFGe41{D<(9OAfO3bA&Hc7mz2
zw6Spk1J*Vcc7lz_h(WAG#0?CQmw_OOXrYA&32r1LQIn8o@%{{NCfa$s`*Y6u&%NhH
z{!znhh}jJb)T?~|8!l>nsIzg2OE`;Cc>ax>G1t2IvO?e~#dbO)`XbI_Ev8eRN354Q
z>A+OP^@!RO?|WH{AYmAlAi9`xV>JUi`LR4sfk7Nt{yAl657lDmw`OlHEOEEOr at YMq
z=deGtHJQ_G4M4(NlFivvuV_oCC8P=SBb*8Ng at hT119le0QQC8&>q<Pp3Cu<u@8;H6
zwu?gGGz8uvo~IhfoADBdF%fg9n}_g=ePQ|I4S|$Lq3KWP!Vq>~yujWrlHBt8Lwt`L
zF}`L~%sZ^XoNSb5C5|m85uEkn38ok6>|rv73KO^*1lv(-<4B%dXAABG%#|J{n>L;j
zCk%#-kJc&Y$mN7L3F!#;(%c0%o$?qRKY1a$yw548QqnlfzKr at R4(<vGtPseF+{V!s
zhxbdI&XXG{<ZC-KALzqne8bm>iyt}JO8zhP2jyUZXwB?JD*ylh07*qoM6N<$f|r2i
AJOBUy

literal 0
HcmV?d00001

diff --git a/package/midori/enabled.png b/package/midori/enabled.png
new file mode 100644
index 0000000000000000000000000000000000000000..c46668af8f76b126f6ddd223e3e9cd4dd72424ee
GIT binary patch
literal 639
zcmV-_0)YLAP)<h;3K|Lk000e1NJLTq000mG000mO1^@s6AM^iV00006VoOIv0RI60
z0RN!9r;`8x0yIfPK~y-6rIJrb6mb;CKW}zs9Cb~hBG{n3NkN6)DiJ$W6evh7LXd|g
z|J9`~oucgEElMb%jZE+ou@$acMs+bIx`e0Npi>Zq5fmC*J2N}`Iy5`1W~Y9aAH3iD
ze12aZPx!~_xxvP=?X&{eMsYE7if`-n$=bq^J8U)s>w>5Z0d`n+L2vq|Kl&ua*S`dv
zBbW^dyG4{F!Z~0Au%gNf5orQ#1>(Rm!ZiuVEH8QQ=SC<Q01XNIrNA46OF$i}V?oJl
z&JB9qGXri%%=4N-7Jx>S5jA+*xYeEqFvA!-09E9?VH)?csb3$fV+OW84B8%M&Y&b!
z*%=AK+s_TSSE|9}RchV1Jp~*Gd=VYY_WP6Fw`{+{8sR7kfO%+&`Up<b=*F#V2p6O*
z$FlwYWOAH15Cbh#33vw>j$5-2petRw%@unA<RHQlW$nxkxj6vOs@V^SLOv3R>Qewz
zQ(bARO(b{)>;m#e$=EwH<iD;YQ#AD_v^<Xle#x2uR)Ag+nFkVz&IKi}eR{a~p#pcO
zodZA;SQe~_NHBY*umo~B+>3gIjML;Feteqm75M0FXFC$y1w>RX&h!_)RL_96&+eGO
zbeOZn{ZY3m`gx)*VFl$!AX@|;WCz^qmA6%^oE#_an)W<GEAR=U+$&{NF)}~`SS&hT
z$Fn{P>k1-?WlsS;s~(hx#ageg8U~217362}cApIH2gR6=um|L)3ZqVwcQ$tdcWwWF
ZpWn~W&Evb)r0M_w002ovPDHLkV1lr|6ubZc

literal 0
HcmV?d00001

diff --git a/package/midori/logo-shade.png b/package/midori/logo-shade.png
new file mode 100644
index 0000000000000000000000000000000000000000..f23bec1ff5609c0138e8592d5558de0975fc5f51
GIT binary patch
literal 23862
zcmXtg2Rxix_x0#q^xlIAqqnF*29Y2UM)YosE_#$`(OZb#OOOnrj2Z-q5*dPsZj=b3
z6D=X+J9FRvckkTtyY8IlJm>7Q_gZVOBmSYjHWfJ=IRpZs(zy$J1cBhmfWNFriNSxN
z*jp_J{~)%zuMLCz!~I#(RrL}A;eqJD)QtiQcDkMx at SB?MUn<e2nL9cfBWkghUHjX<
z@<~C?h_^<M5z{mH*=t|<A|u6<#D$jeKPSGf<-_NTA{A~FiX<Od6Q*o3w9L)?E_0oL
zYIyPDy=U{|J=)O=Z8*~;HnX81?$b%g?cys+-=d_rFG+v<(S;kfG^B))!amDAc%CwB
z*dCU7UD*7+e?$jafy&QjcAhXW*BS88knY)dc}WQAeAOSAK|stQ8CM-`O)-*k|GLGA
zc?k7*XpB;C6b16V7(vKaqux0d1$MC<J;zYOny{aPc#-%KJxoIm-bD6piIvXglGiQF
zziu82LPP~z6PX8QsPAvP7lI*VsN!K|1U>o?^SGb=Ne#>dCKNr}-<@UkCbD*C(HjZ5
z{U0>wNeKhgV9?Ba?t*0_d6n+DjBk||G&{1giTHKWt*DkK5KI&ldOS!wYK~hxt*xz|
zHc9Tq$&Ys-^_)Fr!q#&kbPXm at 4@7DG7-6KK?Z2zbulKEfrJpoHmu`<bE|8UE#-T!=
zuCWk##l*4L4<GPFM+?%(@Q_^NI)18LRBV^j6<8ElOR)Urv^jT~Et~*$+`RwntmDDX
zQn$7Ag%)^I^+IX$jPnUUVJiU-$ZvAmP<LP7<L<NF`Kn(WFw#7=hfb8#)c%;pPKuuU
zkcDf at nh?IpE@838qy|s?-wFIW|Hh}Mvzvp}a6?hufkAV1J?xTp`O32KXNYV<o9i%w
z4<Ns9m}Yg)O;5|O|A>e#AtRK931|MQMx7f%xO$QTck#!pu+`qrDPYF}12eb#?HcGk
z3jcewCN-Dx%-Yc(D=nDhaNG<r#5+?QbJGLwH?vOqmGjvi_I6Dl8E!yE2jd>DF`3;k
zsR6D&UF>5xp>8^VQ%g&vWK4WK*)8}xb=ZS@>BkDiqi2&OT!A)U)1vZlPgv%AV<cRL
z+QLBkAjfz!&xQZ)vDlLmN0G*U#C@VQK5ZPe1s?KgX=xSQ>L(2se}g)2kBEraD7eLQ
zO=FA at pG2qP5v|_DceI!TWzW_<>nMI5 at GYMYjMTB?U%%oHuo%JnGesVI9e&qzkYeqq
z62|{64+*<1C6)eNwAqUe7im<d`%B`xbIseDjnFfCgWHJjHWBx%?%cnR;rz}>9?gRZ
z2x^Gdz{?i59;mpV{Q|SLQ}m0;e#Zx*I=!?MHn-PXfO`|0G$Y~WyAw^ZaY%?7hnjZ9
z7g3DVhZPCFG}5`bxv{A!V$GY~QIf@@s~@5%+I%<Zj3!&~P8et}o6Cg$eTR+Yu#>9O
zlTzLa`Ryf?jZrajmQR<AnVK?&@zFll;01pt#9vS9_Ek(qJB at xnKiT$=x@3h|+a-lo
zc6a~N_NO)?dk*%2;>EoRV-!jevdjy)glJ^m^3>_M7Z##gTyf?k#aeJXjO%foRdi+U
zB7QqfD~o-x2vcI1w1kA$_?HObcp8}qh&1D$j~_qY)`ZpJA9PDhY%jvs&27e!3~6@>
zxvnjpVm3FOaidJXwM09nNe-kq=bb*$G<a`R?NPx6_CpV|Q@N)KsRMCO*Fz^iI>>TI
zh(SY!O;d(VHYqH(_vUoE<S8d4?9cDj)Uf$`0f}aJNb^eG1nx8pGKnNKUhBa~zDzsr
z@Dm%DDe%g)xT}-Sq2RArIIuZU_2g(>Pe~&S at 4!@VLbcgxwCH7ug-IrDq#!boE*^G`
zwkt;R)CF>zf;o8k;__KjYwLBk<g%_VPOCa})#o+uTfwI_Se99S+EA<XR}YTQ&WZzm
zouiUzWYq6S-MTeXEA-hl4#^$<k1V@|d8jez^wi(i*SDmr3+v1DRrpT`*T$E^k87Ch
zUD8=n`<<838Y^|&K|gu5TS&gKf%m4mBbB>DbfCp|?%2lg%_)hOgSx!Bnqqf%*C&`4
zTV?|NKAbDv@;oU{AMf|X`1p9;&U~x*{tn|56Zo><Na>x}th?#QihMzw_B#TQ0<uRV
zA2*Il(P*D9nLkEgX6h3%7M+2#8>7YAr4N@?h7I`6y=2%fr!V%qi!XRio`bi*KKXsH
z@=);QQ(5~Rs+>2pJ|Qy?cxcofKW0``QlgEA2`jWvwR&JbyfLhjP*E8Pj$4Htm(C_!
zmA#xc-UgxfjVM+19GSSZ|8FU&VcHhak=C4GNWfzM^XE at BC#M^Vii*o;9a(>&n4dp|
z^a~ZE!LeSvqddZL5rypt2*V6Nf29SEK}n^8 at 6WNzbp9^do^8D2TTk6|(rJ>lHlUK#
z at IU%#m^H7hZ#OME{FBdUnDIg+=;Ht0LAPbC(L at TqR(SO0+h at Cm-&#89&*J0c6rZ|j
z8jQ`(#=m_l26kd$BC{+VnHO`kF}nKq&rv7)U>)svEP3>YrG0G2v_D0%mKu1v;N6Nx
zwJ6jTez-hA;7yKB`TKlR6BAKjGY1pQcfBsp{R$NQ$Y-I`du6m>3FY!Hk43Bw6PhNb
zjYq*67$wifYh6OPh!5`FVqrcC>iW64sU8p at 4-T*e#g=OxLWgH?V8H8pADOPcw_jzE
zO;YG<6X-J+8=G(?`>{{B5ekfiCsEFG+wnhbA-C7QJ#jSE0$cE|qXTUE3Q9l==3|~R
zTu}8;X!+Y4!?vIk;Zb7&D(T(Ye<ekV)<y)p$jF2=T|sLZ5xZ_uo}E5P0UZtS{h**A
z3+4v83jD|Djd$QnxD5y?s;)edgmg0}_7|-@^+EFz>MaYuF+w$)K(F}hcWj4s|Flrq
zQ-Xt=$Se*fk-eM3=pm`1lDs;YYVYftv9bFA9Nr?8;8Xs>_iwedNb`CasW}y!^t09i
z=*II`9{Tiw^aC|(B28oxMVZ8FHkc67s%JS)Fy&S{gVO{RvuNu<TW-qP?+~<lE?v2a
zQgXhL2T6#-UhWe&!GQ<lHVH`!@1GFW<KttS!|(k_clYMdWCRbN1KRX8ioAQta|oY<
zm9 at 9QelSo_m=Q0e63pDT+=HWz5FCn@r^n;k<^TueLpmv_-N>`~$*@?gNoSyB**LPl
zg_AK+^VNhiL!u_AGG;E9hC&QpzkcXgbOmK at eEX*Z+fNu=9sSj5dO#0m)W*ujX7+{U
z!Vls}H0E&@*lR=6)zt;YdeZ;h4))waELK-AN~1K~M&g$I$FER%kA<GY)xoEcSIqH0
zRSpCHhEK|qGvOA94&8NTtq<GBuV<IT-qSQ#he25=6 at AhKL7DpGAoXd@n}?4O9}hRB
z&*=!XDTk6jC0Lu5pmQi~D9j+^+O+-Bl^Jd%hKsZPY_7oNh-t`gm0K at rYhq+8o!O*v
zDH~^@3H`Z(3<+gC4CJPJ(BQStj0MV1z4vZ0-O`2a)9h6!fjIl=jYD6-!58_EzhdDh
z{weT;<df4=KDzi@J`sYS5NI%)fVSrq@%KeVMYB>e!NEKJX~0#z!$f;&1!cO3MeIKB
zy)T@(WduKQhgf}PF~?i(mepfV8eFyR4z8t<>5UxTs|{i4 at g(@!>;vsyN(H6QZYW)V
z(K&?_f<k>Eo5iwscUg&lSgBu2-o&jK*v1+;3w{7lmjmn at avT}m{ORKR9^m~}40ojH
z{QKZf$koap_9Is`pTR>}aMmBe;Y-!1tvdYWw=ZpyN<p>+dxG?AEfkl~e6vu-u-wgV
znng<<4V|uEJ9^4-`xys#N_~*dZN9SBfz?B9^U!k0U4A-Hrx-JqRxdEB#ryc-w}mdF
z0aAm6_xAQCgDg}mc}h_)$@qrh$NuiFpS#T`>;mVqbzD{!)7z_m@}7%*xLG44e3BY&
zySTbu1ftJwtU4l*NN)R``x5V&tMF>#`|YOjY)fTT-Wa)n)WQupAcibl*;HWfU3aZ{
z4#fbNk`;B8SGjV$Inm~|5;=MQqO{W46AQ|;q4APX4sY7sPFiV?cdVi0_`gLV`%y#k
zq--x>d<|SZByf1Bs9T1WufM<DY@;KiNVu$hawZP_5JzRzxq5rkjo$v(Iazc?4_TaF
zTKZ>7d%STYSNDBvoGQ8N;_APFni8^X^iWP=`tdV}Cqb2~X+mnPNdx{${dGNQ-<z4{
zP=;k|Qq!#Qsi^_Sn^x`KL^t#c>c6RH#TD_F$;*B|K6H_kkvUc!m?=K$e4MrB7#bRy
z{XBY#pF=sY9<zP&{#wsGo);0o2_{WQTH_iMgET%9ktvgSHJ<Q?LJqUS06p9aI(|Lb
z6Gq!pES&JG6p{b-hs=<}uhICQp`H7W;U|ue_fW#x-lu;L2g}<n_Ed6aorW@-GaOm(
zXF+>^tzj&SV~pk!GW4rNGqvxgKli#dJQ-~t62dX6a#k?uKQoBed6Oyevga2Wkq-_r
z2Oad10Bqvf`t-GXcwDJ0H1--dwIh0VX?V at Mn<~6I0dBwmwS32b$r43#7_}y#P<N{)
zz-h=b-wRacYHDtNLZ#deu$O+3vh!L2;j*W6?r^Z??Xciik8WzhC&T#5ti6}LwjsPo
zs=>7D+REkS<=tr`h^1>KFE?1M>X^Z}AHP=Iw_M7~z^viQs0wFib8{x<5)Nk^OyNW;
zD()%T?}%PrUjDQF^E^@sl%p$9(%=I#BFR%y1NF8ai3^kh-qtXVu+T?NA^BepJx)qa
z4o#9AXx1FsII>;)oN3bN5Wju-TRNBW>!!^9Z#l3kEiH0l7|BBY)m*2dhP?j2*C3vo
z`}^G<xF_5SJg_l=PkKrWSRtCSBx6SM<?YAIG~1r6YMH8EFPjXfX^OD{0nKi|vkGHa
zecC;}-JifHQt!L@=y7ySMy+nugmR(9#zCNR9E{ImI%su(s`KCjh4FJ4lI64Wi;LSg
zKTGaN1Aruo`K1mKmopR5p=<HLCV;98kw{o-;ZO~^#ZOq9lDn&YDmnaZ#YC+4 at K1<I
zvkN1WxYZ8o1tU2TNYnRcKYJ5KslWZw40{gB&nnn?<Hb{ZkO3qB_#6h?d*=0Xtkf@^
zpA*0SE3&psXy$$B1*aZmQq7 at -*t95NEwzHza(HWb`Kl%C7!TrZyd;j1$`ZFu0g$YN
z?K)=T$VUUgJir0~_v0)$9Ikw};M3-}ot1eMDp#oguafky(jC6E8A=<Po=4@)6!EM!
zP-I at EADMc!G)Pj_aX-c5khPO%pBs~Kc at C`5TaO2y5$K$vqV-M27M@1vb-H-3cu&EX
zy%P^^y9-!l*(P<B1K`aqTC7{ogG0>a&U3AJzAUvTL0vNq_9Pmm!5dpFSado+cm^|g
zMks^}uYTTT{58MM&)wbr&zT~YBHd#$RGYqRxw-?!Av+!+s@!Kkj?&U-ag#TedR--;
z6STXB?I>;uk?M`)r;Bf^bpFRI=)x1K%I&|mU at GV8&X0tB6C|u1VCCSTyqDg at -QyW~
zJ$?cpo at UqScg8f^SugOUIi;9_9_6oqCBOCTZ`)=LCvB*qL5B6__BQ*fV(Bth`p}Q<
zxStq_hW at t|6+}t_d*8Yq=zU`)jxL#$h=+Y&gQybOL{FZ at e6+2x?&flL&${DQ`4G+s
zo&pY53&CZ;M;ylg?s6LjyA^sa^QHK<=c%Z0`0coUJ8mXZ-3^eVyR~4&#5S)rR=il|
zTRr8Ext^Cy-W+mh%#OPv?{TetKMg{EBu^F;<OYhza`tI@4<1~9Idn_Rq31zm*-_g7
z$gY1jid!4GeJFdx2kaUKp~bonvr0=#uR(qrO1qYi3$=JIdAMZ9(ljZq_CyeP%dmx#
z(1y~4SI9A?^V@>$G-<FSnr7m;4%pzgZyA%9DOoQZS;vtX+vi7rl#8COvnHjc=7(aQ
zK<bkE?QVeK>v>41IbO`q&;KLt`G}Yb2netThrjZE4467C$Z(plV^%L+BX4Q_^%hNI
z4Fd+i(8MI~S4{+Ny{XcDAabKD3bII(I;dA&tX4d0J7JA?KrX$V4K<BSW|ud+cglig
zhy9?BG<F2sg@jf`1Lpa>|NG2c{>YQ<X&;g=Cu1`1U-*0sKS6?XhZ`Csl`oGc5cgp+
z12Y%kkK4lE9luB_#eU~OC|R*I`0tw4nAj>n-PW&OkEy{xtbn{iGhW4NPodXzGZCEl
zxn|b}<T&48M;{$6NGp|9RhG<BHVCErw>Z|tFoEm2PQxDdp9uonKu9NMJ>VC*FO_Ri
zj at k;dX_=3v-JYub2*RiRivVG*R&Js6Z+Y0UqR75|lI`Z#3X`s&=2gb43aV8Q5h>Z$
z8P{n at y#hMByw}K6IF%5_zIF8D)!z?)pS9@=nt-}@$U_ at Sp!N+ZYENn2;->!K!L_qL
zNrcIgAdJ6)d8?pM&$t9z!iR6LP};2yB)_HnIRegMUf%b;kY0lQB3%eh4#4Ga<6-^#
z>BmPM0sE?7{J;UBq at uc14zIIA+>IA&gxZ5i|J?bpg>WQFrD-CURBAi3haF2m`#$sQ
zd_cjg>+Sl<2eFtC)zmj{Ztht*bRL{a5QO_|e8JW6$|<_>07lKHaBJ)0KY9iDcfc7j
zkN at duTQ)YoePVZUx|=c#z<-2f<rxn>lbHYu8(WYXd{P|W#C<K4laq6%-ZpCWNc28l
z7}`|*M#FVP)q~=JcAt%5v426O4}Vt#Dtm-EbwVIOm&(=MyHR#q2CYg%Y6B={%3^nr
zu>!5L#+ZeJT;?SyLJ*oOSNHeXZ8^7@<+gaM&G3KNg9KLX?c&t4v$Jk(2dTo<acypQ
zRxYk9y71{7Q|@?JedvY1wtbh at 8PvXphj2t7CML#TYT!Mk4SM#h&6Fd5$U#C@7Ty3x
z0>VO5Q<KRvZrYV-W-AG-aK7Z}`>U&~R1?*-5@=LZ6gHhd^kv+$f#LI_A}+VZ&e=n*
zU_q`An!HGAY1gc7f*$Lh4{dD#P5t+?u52KaynOkRG4<t0?Bij`^6$e{M1K;CeK!uh
zNWP^fW8zP{TZ2dn&5x7IGhLdWPo!d(Ym at RdBQ=YD3M7EJmqR~pe{g7)Ie7UfN!E4h
zmP;mFT3@c%M&gqw0$>-3Z3GH->;>>E{&YMch1C4uPCo3LJK}O{vbw=#Qh55UHmMnr
z4nN%!h&8dz7KQ}zY$spd(?8 at quo;V?i%<*ikXh}Erw1WamRn&8sY at JOUHYz=W}^-g
zG`p<cg|cqbRT at 7TE-(XHH_eMF=pzN~kp8@Ua>~kom0-ubkjnWUF#s at Jr{DU0!{MKt
zoSfIFVABu!<2$oxr;!BHlsGH#zF|`^;6CKH5ac6I4k%_V?(B2(^OoIWwx#X5d}%*(
z{3NYCPE`P+0Mpabj<uDyo1mcu$FerX(TA#dbWjw*EN0P at EA2E4)uSJG1?Ptcyz!aD
zyy)sn$f7NxYiWP*ba%eJ)~lL at jE$B|ebq5A at OOV+Whf_8p13~%loOSDDJ{KX4CG*j
zUNvFemJFIJ`fh-FQ{8w_B!l)fn`kOt0w6V at O`pFl7UWX7ftkm6lpuo0qj3@RJ47|R
zZs$f0X(_4tDsQgtRZ*og_w%8wnS?SM+}HywaioTZhIgx6orKc(b#Ul`_3hVAU3y)7
zmKiW^n7L}ajXL6nlnVLF=p{fQKUC`FTX2T9(R^6*&6z!XQp{7<njiYW)l~%GiO-gt
z-84XDp{J*3#0EPP+9!1=toHR0S_Q5UNz1!|MP*JMjLuPjfyE;@kj=^YL<qrwv3Gvk
z7B?{x8l-tq9E!fkczzx0>t&XRr3nyQAd at Pc@?YoE)z>%fVzB20EWQo(p{lCt at SEX-
zT-ps~`yIaq6WzXH4!*Rz%1ODoj4?yd0hXy+^H at g=)bE`)LxW)tFJk-26;=2ftxJ$o
zz<altRV?V0KJ5AZJ5bNmQNYaHyxs05nD~R+mrc1fZfS9gG>QFOYwy&0Ifse={iEyY
z7^%s2WW_}kpx~Itm8tb(8~~90q(YzEsysK3)!=o*zRT>$IreaoG?wEAd%vddniu0#
z^mHJj8SvORz{ob*ReKA;aNYRJywcmC{O@(_s}8yd#FK*cvd~jWPREC3Fh?54Twa{r
zzovZ9LxR_NO;A2d+_aI9UCzyGxF5=t$imHCmrJ>h{nR*IIIav}`<n<s*zq8sw`hwS
zv<vFOnPz~F$>X_6p;Z~kSKeRj`M4QJS30w>v)?Iw7{0XM>Nd&#^hP?r9+|p%xREd;
zK<3s&^@GDfrdbUDZUUv?Q-dqO+aOt^?mecI&PazS_pVG-J;=uv|9N~E7}C8)Pr7Fd
z-dz?*G}j@91VRO098jnPAdM&(2s0(7P~=rQPiTzo@#X5CqEP4V12g{8+gPa~EC=%j
z;fhy|NcmGB0-{w$-V0!U1w)I~yhzYWrq2M3pcIU`!tcQWTf_+4pj2+Z9j(2+eE=z4
z>NGD at CK1#I_v>Yz1QMB_<F(3X-uYGAM>jT`q%_cgoPeRqEh-u~8olj_*i1EohlWC#
zs`acp^jQF?qP})5EF$hS*Hm1GPR?WD=g${gKqmkb4pye(8vXb)pcI9wAG-&@SvJ9M
za^2&*B;oLCW7`v#`&39j+^_&`*bn+pm}a#PtOG2JUSq9tH01)=sJS7vT0d7b>oR~(
zN;Y|D$aq%Z*B|A9fdM84 at uC4Tt+SLep${4a;oxMp68v_}kr)!t`LI5c&nYqlP~+<A
zDv%sfI7anY>@AL@<4JLZiB&#`vPYz!5)zC90QBR`wo+E>19Fu>+=!2lZ>&2qL27vj
zgJf}^pKhPzKt1P^Ly$6;+k6Yv`0JH#Vunx#^Vg1%y*$cX6I7b(|0laAWjVu+*FnW{
z`S)_!3Xz}qKA`0&@lBwqwl)bkxLe5T9Uw{%4e4NIm6`I!gZXt_tg?MhF=2#)i4;-2
zJOG*P&Gf{YjoK|H53a7D<ns#(WRxnL!<4!H#ejf-4C^wogX*OWF+7y&`Lldm0-ZeK
z;9k0B&#v-Yh3kP2`5cak0mwxGSwtd2W!U;d&#)Vx3~RDl#WSNM2N=x_;EXt;oLhBR
z4wx7Bk9W85h)GD~K?M2b6j<|Oq~tsocLLGR4-cRG at LrE`YhU($#FvItRaXM!DbUSr
zX9@2(*L2?@)fWzzR8_U2r(&t4p(Jka`->}JK}}sem|yID&jnRMC4H7DdFq_AFhoa5
z{A4NgOrhl^Q5)K3N{^B&X%n12`DvC8a5N0yCkBvfIi}s-YxinQ(F18d%;ZFX>A|~1
zTi_rOd&_!a-$hqHu45C;7c84TJ2{zr7SuWb=pvx3-1rAv;0fQgI(POWP30x)$13q&
zUUsrY!1%^XQCl?Og<7tx_5foL1O*3kDzxVEIM;qybzveW;!p|t=EX_dCBl_@8{=a+
zf-5y(Dk2ao#HotN<F|dFPI4w^Z)Q5SMMNO=@$~qRKrr+%9`<Lc&EzMWZ*li=`?UY#
zhr@^mRGtsuI7iu3?%N(FF&eOcY^j6&8G?zpNVlmB%Y9Q-%YG;Y0TcjN0g;a|YGZjH
zHE;`>jY5$@&RA>V3`79zYxC1Jgf0fnelVieNpB14Uut_oFkNRYZ|48*q0rxM3+Aa;
z!-%z|_}r&;l`WNkBZ6=o8DB38m*yf#t(ZAxnp<ABX@z3QAoEF6L0wimGYwJI<X0X5
z$j{7}jQ9^p+>u~u>Xd8;5<A!}Eetv2*^~XnuC;10qJRU?WzYtgVgs*pZYLOsunkX-
z5ZYA<@C#n-H>SCo94dktyQZoAGkYBLa(I@|&!?rWy)E|pHa9r1Tf6$js_s8sqy|*K
z0{lX-=;|s5BH&6}Ec=37mwMGU$rf~tOx}mImrol|D49`GK9?*}C)#Zo<Z{h+d`c?V
z2gE@;+{kVhuYF&96V)hv;h1gX?fup3vx5CjyM@?|tr1;-0f9mkD|zZ9p|C#*&?Nw_
zDZ36gSF~alw=OGCsPRAA;lvD0gIvKimIfINpk4uz3;5sWT{fj`jBQ9r=U)Ht>Y)i!
z0N;o4a_!`+U7~>*cF>!1efz619w*1AJ4pQ*O=`%_4Sf(Ctc0t!nSJ9QYh#<>>e8qu
z_DQluB~;YZ#Ezy{#JX{&LJS`OaOa>!2W at 895*NXGKph<+jKAFwe70BBE{2M~1%@02
z&Ad^G+<wA^{5~03*|oU?m+EO3J}#_ at nA87Si~AA=GVIi`KwqQQE<$)b+sp)_oyp#A
zrE^}c&IU7h82uiFD}D-x!gp3q&dck7+1Pm7w*#=$_N2W0W8l3U?8~9V2_{eylI=@J
zjP=5()P|9@FFn>l>BVL_LJ1!P{R6B7;qiBgsRQq`4^BS-Io}$QblEg}2B0l2k{S?X
z0>aJ7Lqyp=3=m<Z^BJPJIM6~gg^0_Wv6DwX&&gCbV8Aq>?Hb|$W?>U$2lVe>?8OJR
z0<dPrpc6sZ)087>-a>h{6xO|JXAEVMl#+Us)-|BtQ9wn1=f2>}V*CR{xnJo+Qt_bi
zM7Km%T3a`_8ZkC0vxq8(HPGtQk`Ke{=?JWQla|YAahVEZkiXz69*qTK-YV)RM6gNe
z19$>`<Jdefe%ApGuMJaY2W&z-Jb<N^f;cLLAHoJ7=GSRdzODv`TfFlfLe4VVHO!EK
zwR;#78*5Eaq|WmHy#P9};_G}9FN2j773)Eu53WBR9^4I_)wtzeI at G94{;i=zfG*w|
za$sBT_pF;+$$zIl^m@j*ifmpEo^)~AB>N5!CA1!lBtbD{>uy|V)8DDcyi at 9&ofo|<
zAHk1s2zwBnV;r2L5I-T=WFhvrJ5mnlhf)yh=jxPWAap^jw~$mAA0^fi8e{eNz}qt?
zWnJn47F9|%4F#!#1n(~aWa9Gmg0EzCm&&LuMeT2&+h;y6)i}w)IbSv&n30G4)T&qE
zx@L7;#yq?D1qNf`<gD$eOhOz6b!DAhU^|~q2=S&H!%xav#A?+4>z3w^JfrNHxA`he
zfM82}YuPb1zUU}`8o#;fQIJ$BIiPi)N at M%p7~;%Hm0Yb=CmV_Z+ET}^7(qpjX?X%G
zL~MJqkEv?(8YShza#y7mfVz8M5NPZ0q0pQj-Ik{~tlN5V(?G=Ur9L?u?TFs;8+LUi
z?;mkaAt8UQ<B%1LiUTa5z$5{cZhph<TaGE&K#rq227v}MpENIHO6=Emvot9@>Z5-^
z2uuvz^y8i%9nzo at hS%F2F-+R?_SvtaN7jy3Hh+|TT%a<QkCc;>JG}|H)Y_h^v)=zS
z;SS=-)*c}Mnz(Bw1C!N{lPxl%2nYyb`kj;S at ukI8Ol)>XMVqkNQ;HbZcy*S$#RF1%
zczBq%1zGi))e0pu<4X&a506crs<mjRyPqxA9Qq!>ff#0Khy|yX$HLedfBaAB&S}HZ
zVSml5`w-8_XcJQ&njRcnC;Lm#yb208<BA|(xfSwc)%y!V<~E|~ZAZs^T7)2A{C=`_
zU#N}mo8Cji{MsZG70+{O6Hz$6oNolbyal-*Iv*Sy+~9##)Xta4dhIW*b-l&}*>7hs
zEy7cFUO)D~K0r5l)HbxAYsc<8$-D#*YB7j^K*vnZ3h`TdA9^B5yod(|WaB$G7n!{3
zNpkFTo)82r!8UJ8z&8OBV$AL9i<-Rn0-G3XXGbH5c5#dt)ID>EFM(Zz8Uz>Ve|fQb
za{0CML%PZb3~XRn^D{ra3F-r at 2P%^035V)@K}x!E*3bsGSt(q>W~`?CJ#?o%>*AM!
zC=#+BWAd%0q`9dnBr>jLyEe^{6_iRemiYCzf`;6BVWa at FR%{{w(y=XKC~Ba0iH{=C
zVMI2~nP*SCtlZ|Bh8mph0t{VEbyY0t$JX&XWN#wx+_~d<y{whBcD~Uuako?um@YQ^
zk|Ys-cqJqyOSeDJ7?h<|6<?#Kew)s}Ne{7dKIsB&yaB*>IQ9k2%cd-cJD!-08Nq8U
z)d6~1eCs at S<9{1$X<2!8Dt7nHnW1R@h6fKuYI+!=!mo2Kt~6~_t$hBoTr@&$Sp~94
z((|ah2nhK=jsjhBY+>S^Q2+b>W at E}+58U4s09fEBM^<9KJ3BreF<C8Y`uFVN+*c#<
z2eLO-X7%l5pr-K2{a;oOM5UBSj;J7496eGZ`;JMre}1h2?Kji4LF#`{D!ap^fT>AW
z&@i7V4~4RZ)T?{yIR~P!_<bNk-xcLMlW<KBs*N>1P(JK)-lITCf}D0H_;M%}Z^q%I
z3-}J$<vn~W=DJ}jgjXl^!oP?kvx;u7HX{f{K_4VK&Z??aE6WiOsL4}9PjBzWo8(TI
z-lIRP-=qs?yTihEGfI8Zfg!>r?-Y1MtVk&O8+wu^J3t<TnzsyRx`f#X!lV=wOwrAb
zh$n&BJ)F%jSzcs3%uX8EGREJ5rSaAi$a^68Qqs4Wjgw1Vx*k#IWvxr~;x2y>P&Mj6
z_X at AxVzd!RYc=MrUozJd0fz6iwX3x9npx{q{rAtvatt_V0AsC#_?p{8tvXo%5pMK*
z`&Dmz=YTY?_u8BHWna;+9=(Y}q4tRmJop+H@&p*jZ7<JH0HGGMz*54Vzj^Z}CWusN
z$9u7Xxo#_R{Uqog3$c%kxtSSInLLmqFCG=@qd&5&ddE}B$xXu@6f^HNgBRWg97_y>
zxp`O90LO`rPfy>iTj5K;o$Bj at -RTdiT?|8^*i>{~2Q@$u>xlcQ666ZX45z%viEMR+
z2f<|I8Odv*gvFO%Rp|SHJOV_ at E<^a_62#`|60JQYu6+uGKUZ1Dp5aSH1%=rc!3mZ#
z0uR~$!)p&Gn#83Bd^24DK59vHx^d&iwp7<HacAWEVc@Zc*o5Kx>RyoUrA)KJNP5g!
z?JX>C1Esa$*=5kY-koIRD-%$&c0BN#?Lgi7YXEUQnfk9qCUsvx?F<;k*njB^Qq+}z
z&T^NW4Ev)uMy|C~^jutA&l<ogB9gken9eM+kj~D%ICWsYQKmQun%<m{KVK9sj7x at b
z1c4okd0!Xhl|c76jj)YkajxQ_(DSskG;eVX3Z+U|vPBSW_$C9`lByw{<`YdMfkX at 2
zCtpsceWdk?hx<O~^(T7y*egCHQfCJg5&t)oaw`Prb2cJWRtfo&u7|d@wA9-vPaxse
zcNmG>y}Z0~`E|O%X!8*0h6<o{I59d))O_76Gb~<f*oJMT31bR4r)%lWgkM##S4uK=
zpo7ygkCgZ3_(0u>&z-Er3#@8(0$IQqFb<HY&{@B!LrcIvSIA#-#2nh^>_xgGD<)ff
z5WpeJ+$LZ7WG)er*onwWl*<XU=}s&)_5p1FtNH5DAGd6zgH-Ojx=Mcvy$Ll~7FH;A
zFzU+}eJs-g?6_iOW#tN(IXb4akj8z)kWSD!>82y5?@0n$Ic~!n?4qlq8w8Bt?puYz
z)D(H=m-}J=QUpWyh)LEZ+2?<&h8G5H17zx4trUSmwS``^c**(!|HyKqhR4$T<f@{e
z&&XMsaO*^Xv4(xzDI~Y`PbCLV at qa&soVFy|Xq9A(n#X|t%R943$zniSLF8A8ac^yH
zH8N=9Dz4S#&rB1jzjjQQ9g|su$zRcdoVPimrj336)tP|X@gj&1u1bJWg(e;*AtzVa
z3ME~};PNcV!CeU!<u=!8u?gpO0ut&^?(XjS44UoSJz{zj=PdT`X1zp!+y%9M&jDWZ
z?ck?-GKOQ;*9LOdUWG>p1doQ#B#`3ZiSWS8vo2X6+5w1;_AA0ouiJU}p%6nGwi*bT
z%NI-k-mlz=l01C`5!b7lm;l`qZP>Al{SGvIKB+;5b_ntzsiD5oxhtumKZk66iG;^Q
z at x3AI00=%uOjc=C)u4ZeKU$_E_^G at xHxJAxKT;6$YY^|}so^X*>a{j*s>O9fPb{0`
zILAHR-TQ%x?X^D4iuNSK4}2kcYO^W6p2+(^c@&x?>Feib3p&bg_gXvI`92&U%Y5Bz
zI$&DwrN1qmbLzXf*X?6D21+UyUr^>^9 at u|#Q$702J))y}*Z#L=&E&bd#K0!z_cNiO
zA9QAbbpv#)nw41>#o8^Xf#yfm{O{|{8uC0cOiLrvf9xFK?&2}?>zKyf8idM;VI7f-
z-W}EA*38NICTIFMQs5TzIr#h=D65v1mY~Zci4#M`W4iJ~RK+#8h;NA^lNvsoA;Bp7
z&()_#f$}>Ol(6otKwG}dlZ~0BlNn%Xahr_<2n#qN8ijL}23X3*g>a at CEY`BYZ7l?Z
zBx>cGzt=5Zh|yOKAaAHZt{!^o0V)H!we6$47JAQsuL6j5?&eYe0RcB!|Io`DR2%+^
z5&ub-a7IbBzM;U^0og~Rkfu#hlkR6-wcOu8sx+KFo&oNwAKnVucDlef0<c66a6kbK
z__=wjhr(%>!~hL>^w{EJ3Q{KFF8`wj=$Zy8 at 9H3`gq3m7Nh<eqTLI9~&G9--Jx9tk
z6Wtt(K!up0vU%yNxQiT9W=rN{Oa8(rpPHO(3;O*)JdcsoA7JUU5(nKtFkj$*zzsh)
zXVwrTsS-yDb_Rg1 at 4TNQC}ff4b%FgNd$WYw2_+y;Za_XSMgx&@*X+tnXT?Pkh<0jn
z`F_guLYQ9#_eqCCtfMt-_a5lbFlgq|OVv%AAF91)jU%0PV*(@c9Xb#c#imD;VC@U>
z#7O6WA?+Nm)53EEC<ZG>f7(WQJ;XMEuopSH;RDxQPc-g&*!T$qRogU2PqdDGCanxG
zgc|LisPWi{(1H^I!>f(TK+Wnkk+_h{=;dR~5?FG5Ohog<nG&_$UaFAc_1NNg&K$|I
zK#=RyTT54w*GdWsLzh;)AAn6097c0vpDxgVD$o>sKK!&mpA>2oMSM#LiEGLwpSs3q
z at R}>(gXarb_{M{y58Qr_Uoo4A8VE7G(67>r9C9oWn*}YjUeo#%Y!~Rrc=GXK`Q~uF
zHE!#PrkMR!E4?^U(A`IRde+6)l;vm0sU(s(ta<fnbhM2vDe)oEU0+m7S}W1$3FF*>
zA3t7s5m{(W$Rs5tmDJYOzQzBIxXD27GjhAX%SeI6KE)gf`(Z_?2cMiKFfrWo10r(G
z&5K6fieLB<7r?Xz8hFn?t|WNw_(wgO)f9Y5J7tpTRq8<Stb3`DW$x<oLIAQqVLpMy
zCQlh(36}HGJ~WLZ#Yuc?-oRcWYsy`zJybF5Acd$TCbJkIQpYI&UXCiK=&~^%;|e+G
zou(US>XHTe&JWdRa`}u8ri2a7cfj_KIH|=WJ<jfmWz&l}QuSU(66aqsCl%w#RsMiL
zXeIf+CKvko`8_drs*tpf+$u#01N9L=cr%|V{Wst2e0>>k2AP?eoVe6U9_3u0D4L1c
z#*N01%BO(IJ(e2S6FGZ_oynb{eW>)~=qdOJB}A(6K)RQ#5B0vIP-PE=hAk7@<hKZl
zo`+i*h|;!S2giJAJh%&urth_Ru|0!A$xTA0f=W%GU)*n<1u7r>2?0I?@JSh%0|^Ag
zZ-Ys}MIBB3c^^1VCs{A~H!a$y+lbsjtHVh~FZiM72*`nf*KjSo6~%A2Dn`}?7&IfG
z7 at vPY%}VEwkn~TTan6%Fi;XKmZE=S61uU@~WVo at wWoX9Rz3ZOf<mUZv!64^zmOhNz
zo&mHZ!}%L8(2l{s`O+{AuY9QVwWLTEAx*!_Z%h!_wV1~!Vtl~C27&RZ@gQje>F~A0
zoJt=GvENw*IcmmJt!l~i%}1eY(HiQ?D at 2jRz0s5#-+Fp_lD);vn3{kkiHEjJ(=)m7
zRPBQzJt-Rrv&)#+&n~3tn1kt+0K`$=F$=->>*2jY3c|>N9#pjP9IEn;X#oAQkHS*v
z*>_wjn>hRLn-oQCGEtOg3SG>iWOHL<WBQPJ43}>D*!;Zf+6y1B6%GA5JV>5<(${Nj
z${bcZ7q_!Oi?!0V@Z|W|YgC6}DpzgHq>bh_LAZ2~cpg&|kSy^Ih`VGvhak3vWQ57F
z6s-E68bkE={ctE^iyhLG5v;;M{^Z&m&7B8eavzh~nnG0fbsvStJu}@u5xAd~qw<Xt
z2d8EkNZDwZp-n@vTtP^fXT;6_=*b6`i(KzIOyjU6inm5OqD1luZw#0Xo*<FlL{n%`
z-5HpcWhV+{H(IGS7XGQxP2r>ImP}2QM-06LFA~-V`J2ATX0<&G)4Ib$^NqK2uTq^V
zFO&k1fU9diDb)@yE-fYs;_e<RfmLMyIK7nQodA2dLiW+)W2+y{U;3WAM3g*vqBEAl
zE;`28bX_|o5YlPv32X+b;|hD~CQkV3_Ny@^k^}l|oOd3N0S)jB@)LR%WNyy>IMKbl
zXazr_<e6<!J1=r}kUMO_iZU5kjk~6qMa>+1{}O?^4n|+0mF{^s_64|<md411MgGfF
zc%7XK+n^c;1h8}d<BGfM=0iuy#=-^a$;fMmk7HOuUqVr~WL44<w{R$3e9!htp28p}
z*u6AL8u0&F1x%<hQ_|yyr<Aa^=Yz_LNC~@E*43gmHq(}|qHMc<i-LU4O|sU*|K%W-
z5a<3*)*m4=6V42x4R0)DyHiR7B!k at 5CH2yWG_!gUB@s7A?3)wPK&=?&zB3`?uC}lD
z0n0#2NU`!L#;2^VZa*(~HRI)1%OKD1j56bbcX^O*fkY!E8JLU?GAIuceTdG^2#y-v
zxZ~<tJ-a$u>YOJu4d%%K)_W`d6U!<y2%~0Jwb`4!%IxEKq>}Wcd655pb{AH8PcEE@
z5bSmKR#$0l?Z{5UzFJ#8Zq>hL-RMcdka2=2ZykeafMewrc;h{*dvw!xZ!!KVM^PD|
z#I8D_P-f4pMN5Rp|98GEpT?8^mtjgwpb3T7 at bN4#Ug`WgA(2`4Diq;xOLLDWz}b+O
zVCA`23B?>-T!K%GH61N)@#yvZkp%zmk(Dvi8qzdPuE6qE8GE{T=sGF0D**W{Y+OD#
z`ri!%z#k+<7m_4FEdn1POzZ0Dk)4^1WgL*Q(QXP7)wJdJbct1YT$)~Yx&;I);PZc+
z=|iSz0MO?P&|+6mxM^XaKEb0ycb0J at 3VTP~L}8ILQVS+7*7`znz_FB;Hle?4?F^m{
zy5~Tw986&*B?RvWVlVnNSswo4@7Zq|@8#b(&!LS|0$LRs+ZR6IT#Jcs{kChGn<ot<
zMOF?2+bn$}N*0%si&-a2bkdJIGgn8*=Im2drl<?4HkD`fN?KN(K!>Y3y3O?76WNH8
z at fAiH0*YjiJLf(ht`q8Itu;=uLiV^3wPr|wYgfExPL9B<nm<v9DB<!NTI=LU9UQFX
z@Z8HDV3{v#txv;!C80ekNfP)5jDA?)tIICyks|XDMn)F}YpyphugMeEG9~J>+P9!{
zjlr>GRLWL+=)BW6N_pJ-NCT3Sy~bZwyT+uG-skA}&CXw%gW6|bJ|EzU|6o{Fiou-Y
z!@3RuLVT5l&t7zCjuh@!nHkMvH4J%Qs-_5QD=PXMn}N^h$#+74z+}z>xKc at QtyOL9
z*v-|u>HLIxV=oRU at 8c&C>810lW*;s0Mp;5WQ<H%enoKV_+`FUVvp&pe2S^-Iap<Y(
zee=RVE>e7TmE}i6F~U0O6=h~N#y|l{_4u3A>QJ6VhYy%SmgX903Ev9XTZpWCgGvBR
zn>^L5oC+Q!3^a0{nXsE6t1iyZp`IyOkZ{QsEl=81&@?q0`5PD2Te4Pl7g)xQMz^Pr
zO=r<J7xdJxe{d}X*5z_wsEwSX6HqrtwF=RYny7l!w&gcM&6ynZCJuJcqik2~!-DsK
zywmPhr?yP!(LdUgwnB&?N{-9g6#afv={2LeE3i|$(G>$fJ3x)^T$Q=50mq%&R$y7}
zixPt;&an_1?J)>gI|tKsu8 at cB;H?}bxq#ieKatsQT4JEyeO_+Dy3#;fA8hrC=xd^+
zGcOd%Md2ga-&bzsH6 at 2k(Nh}3pSCJ};P59qGm;<u0KkBOYaD*VK>4LF)~tPWu6{S2
zkPr1{rdo~LYMWA`X{^zz?u=pd2^CSYlZN8MQ1zpW%dFc6(oSDk%nWhRA4mq9_T<|;
z`YiUiLmAWsJ`{U1Ld^xAfq{C>TQ*aa`7hz(Z&n**Dd+z7_Nw<`#>d!ev5m8Cv&qRP
z!boF!yiMQpq9Ak!2(FnX=a-xIE_s6QroTLzbEhLEq--se99TXK1Rv1AD|KcAW+#9W
z at 4o#;)5&BemoFQ1_euXKL~RIxPPsvd5=E#Mk9sfc{~RxW_m=uULsG-BKpxBJBm;19
zgHyQ|B%qTH(02lGhTm}eAX+Qdd3_sVV`ujPIh5K?O{r#^Bsv+qb!dW|WRj`A(Dwv1
z7l1viEWi|5W-sUsCOY!d`EeO9%T=oQ>u at X(+`z>N+e>3wC8B06M#8+x%NN@{5PrQ0
zU)QlMJzVUqagTx9E`HW$z((28vLjJL1ZJz}t_jc;?jA#*n`#9yURk2fN&Qh5n+XyS
z;U6ty;4YhQ;u|nPjhPd$NlS#-;RGq~pgAE?>?fe8!paTyGTxg43xu2F9O2)#%oYAJ
zY0%J-J=VeS(x!P_;-%6(#z>{{4>dxHRf3JrPJk5+cz*5=4kOU;fR1WS=U?!O^AUL2
zcKx!|4nN`X+%M^YHmsgaWxes^u|Tm-vq&aVLg=3pV0V|RF|h&!YHb at i<q!_VFnSif
z5lRs8s4W3+7ki;3caKzJAjOL_kSQKG9=?j|&`n1_zCTtoV3g!f2y|T&u`eSVM|!66
z@GZifmi%^_&I(O@)g5KEBuY{^92A3|B+RVUp5|hcn=IkT_KDfMMbLo;y~gdgrf98J
zvY|*B*By`}GcTSsB*vA)nUo^sRNpEcJ$ExlLOwH1{#q28q>-tfng#d5e63Tp%Cl<G
z8l?{>>@OBRY#hP;Xp(YJaD{uCqn#{m1x_{kPv5bVsm&^-4TkcRp^SXYpD4wBs#jS3
zTJdfYO7S(RL3+SslHjO}-D?d%*M(w$Wtt2o684{P26EAbH&*I(^^JbsC4&xr`V{w8
zfRU7NY;w|ZlMPVT&vNR3Ou$=T<h3u>eQh%dBjyWAzgR}!5<^bbf2nzw4|Z}aG!(e*
zvx+rFkcBrB9??r{N0-2<nOB`&@DH_=-1IUTLq#wK7*5Dos@o^!dMucfnYJp-`pE+S
zFt|*>pxMwojW%_?5>Cb(q8E1OTZ_M|{)WDb9ALjw&9A&yS;W0GHHB!W<jEhAvt%Z%
zn|2j(_60pwrSCalYQVQ-{&6_W9kycvDll87n=;ySNp+r8mQ2lb5*2GxJ$da9$c^vn
z0s^uN*B at sgeC40sh`^H;{j#tB8Pv;_&8p&cZ|;0av<1};=^UU at dv})Nf3r$lN2Z{R
zWuY=6fKX+GCQBlo<{LJcxG7TfrubD(2Yk_WU&dzSsgo}ZrgS)e8zJrq^WhHRI-%tk
z0r&f|RDZb1RkLrC1Lr+aBWtbnV(&!H at S<r~Y|*62tNJg(QIkt^SQY`oxSu2oB*og6
z=16@rr=DTs8`U!A55$y$ZvYR_6L1#@D{HJRNUmN@>A#@IC)GIi7Ff78_|M4J4W^m$
zCa*p9^))*4Lq|Qh_rtrrQiQeMu+r9{@XzHl%(YBJaETFx(uJcQ!#Bn69{AFc#{M^C
zQ=8#Ku*jD{wP{?FdX5lzB}#Q`#n#2;bN!X)BnqA-HHBjsZbqa^OnC->lj7cg3_a+0
z0m-<8|5|`%(#cdy<N34~>`g4V%(L^kC~o)cpZSD!gG*o2p=!iY>X?(Tk<&kqDXJ?B
z0_^#Cy>c#=14>1Z%6mo?gd;BDUthcHn48b4oKvKaZsfl`O`28&w&<9tS<t!@T~g8*
z6OO_@^C1Rj0d#4SYUzi|oe4)?kF>x8(6f=_jZmMZ8F0mMsw>;f%nX{1d5xOO2;D$M
z6#g~^`ghPl2*_=rDg9K>OGfOP;SbTKB%M>>B2dhcezc!)2Y~F=qlE^1DRCS=@)4}+
zA{X~JZkp6&l$c(=II;NhmBAAY2K4PkE>;}_S>3nR6olHWB0-)wuc7FUKY^TZCg^i?
zyA>|)t<oCIO8?3^&ZGg*Pn75;96l*J^TQd9)t$MCl5u&}?l44$!E;*iFs4=lcuFf$
zj#uX^{lX0s2uLSWf<Lg2zWZB0tsZ<(HSrEFr22v`UvDhXb4ypSeB1kOdf((-!?yg)
zUXOrez#7X*M#D}{P88mG>e(e_W<FdD_4a7xY~1o-YrkRK`b#F?uSWz4)T at cmuIlQ<
z?U@hQ8cM6W>8wG=A0AQz=?f&{Q83s$1$Ys6-8 at s?L?l9Bxz^dtupdCkg;~Ap0qEA&
z>0gqvdamzC?lsr5-<D3JVQKM;BzgfvM<Na7_0a1SX6VbDz~E0n0NQ-E7opbk%UD{?
z#3{2crNkM)sxbd9V97Pzqt8$W3PwRtIR%^j@K@$(x5xq4LRNQ;jZGzzxZkD~^&Lt!
z4i0^vUb5OHDOlx-;kDJYmP`T8hnTe+qnD|+wm_dOey1W|>U?T=hU04{s)Dq#Sb_?(
zgDK7|i7nSb7M}$yAw&m0`L1y+Fs1g)v;Mqa*8Fdh_E=?QrSI*dheCam&DXOrvRHq#
zi>>@K#2Bj?X3cx4(JxZ!E>KveAsJY at 9(wc($Jyo}8NhKw(6|v^mfTGEaH7K2tgvzO
z718q!)0;c*@_~k^_3rRvSMb?Z{z1WA&|43~Q!^DwZoOVzxJwsg!YBiW`xS2)LutzG
zW!V7RODj2)`AV2qcU5OL<0qf|J`D2K#Hq(EN_)U$)+0?z^UYel;ft!+$s4f-!<d8v
zxtD&#2cfZmh6h;WF70oy)jtwq$a|ZMkgcCMdi&hquWtG)&w0g&#Rk0axRh-35@)vT
zH~U#7rp;po3^Hjn5(wPU#}leS&kbxG&5|>(c`KCv!OK2BKY!L2icfGa(*GX7dGnj#
zE0^`jHNqnJv${-d_DLdE&PKYkv$I2fD!B7zxxE7%TUuOLdyfp)3<+Nayw&wM3SLa3
z$m|!FcLjXU5J`&@xsn5LU6IeS!XUM^<SVdEa^wGwsikLm_$Ze7n2Gg-P9zq4&50Lv
z6FI{0apfrstKJ}Ww1&l?C<D3PiNqTwMlbn6a6Ov(NwMlH|56BqV*>Yk0eT4OAh=7e
zL=XLM+^j2^t#vew1CJcxM=G0c0maO6B_4O*gKuHvvyI>LWvoT_Gwjdaqm$5!)An=6
zEDL>b9<Yxy^{d*S4f_Xdi$8}`jQkw(SPRq`JC<aNvGwz~L$>1aF11XkWpz=@=Q`vs
zxA_f;-i12Ti6-uBa~RCxiHuSq+h at +YJW}<E!B6QMj7<oP*kgi@saa4U(>k7tfV*mo
zVn03B^KUp3QAx-qxTx<ud+7h<5n;YS3g~B{7>bLE#4hr{{*kML<Y9Cz-KB>GeW at ht
z!br6I?+epm$L9r049i8)qDHxIh(dv{61ILUPxDnxPd?4q{N4vcT?*0wG~G;YEBSDs
znAV7L{7>ul2R0E3>YxE}1Co(B3!vJb&X&Kcxl06sPL)gD=iSKD|K95VHZDG&88~ml
z<`m;~_6|f?>>ai50qky>t#PgB3ps_sE{hqu=Q>jBjCfy#2PzYA7^vLx5>IPS(0- at b
zt*{3_05HW+ZO?{yy()?_fPiG35j1>API<zSt%Vr64;ntq9RoORaeOD7gEsWbln&G@
zw&V>8rF1>@@fc*IMyASH at bOoua%82vAk8wpjNSxHqel~T=`2NpuKqqP7g$Q at w>$5c
z<orRcJ`e0GM`O+cGLn+LyZC^y&R5p5f4@$+YZWL}5JW`@<m7-d^<^$_9k4|?M_16k
z^0dZoiq*@LG8w`FZOw_JG>`h(%g$01_N<y^(vU2B-Ku~|X3;B(Mkb&kzeXwSs&m})
zS2Qq(tDE0w_@ojbMw`hf(_<v-W!h=w*>CTxPi7|F|9zo;ERZI0or^1V(D*10SSA1S
zxLv%?FO+5aUZnKcAcH@=F<=7#5qDErAi9}zpxjGkqh23UmP)$3|0IIsd$!KyZ|?-!
z53=Xa#DLv5tig|tdXKj0{rmSf`Gh+(fp{V<s__}DXDwj_+(4R6M#MOLo_@s@uPCg1
zeErFa_Y{{uR*znZK-DU~5HA3|jK#1_z>Sq6iH99J1D&W%LR}~*M%a}9X<b(b=6&~4
zp#;$YpOBD+*Sbzd@W}*0f_qRQWFs_;Q*E}e5@^H=nk_xUsg<?0$=ieWCxY_l-=CLY
z$x@>c4myX3R!!nL&K)zSZ1L at sUqrN_PrzMZYaX}yW$ZlowG7efPCDgb8MFyyUXy~R
zT|>!cIuz<1^kAkSqrKbG7+dH~DFGq%v9F}kxp+f0LhpD_20QW!ynZw1D()KKZ3`}W
z*ywH(A994|j?YJzbwAJNm`!DWG!7g}oMX9JSy%#7E(qmrUQnon{664?IAOZL4Nt0o
znS5{wy<?HsoHXw#xYRe(h82vHG?v|_9HVUlPDNLUYVFxNxbQIhEFp{7DJRtBz$7}z
zR8HjO3YO*kk?XhgXhAQgjzUkt8#j{kZs`NVm*XD&t?<2a!>l!Ne4&d(U~*`YF6tSk
zU#NL~_^oHtakhrCo{?$p154<$k%RV00#MD2IcA<~pLzn7Wy;)KDQ>TDYI-_=q6e=_
z7I=kx`eZ at 1$aoFtlhy+PbW}!kMT3OaQkXQq;TE3KR4xjI at FzB^FtS&TN!5qL|KY36
zYI`Xb`txTI50h#I2X}bnS;OHNd>11U$EjU6V)a#8?&}n~glE;M*!NC2m!XU9lg{q$
zZnxY0_iTlbz%(-|IpAB>T%Z~{*MQnfzj$*)!#IpbD-toK at seN1gq?ziu=cbepAvUL
zU~e0C{O8{OyalOYFBKeq8&cwSAe at a^0T=mGEE)d0SiRyEsE*e#_u<n`3M!hzl4uFK
zr;9J12L|54rSgT5@o|IlH=Yv-Wg%G?gw%Fh)9tw5S^#<fwsjq7xiNZIHGr~$+wuE1
zJL>aTyo6(jWn$- at 8C#(;hX-E79YYWh#MH+pCx^+=J}eUfz?a1xuFp)ZH-Wp$JLnn<
zC_iYV?a#n%CN+)%mEYZ_7Kt3_AZbo}a)0c3G=h5|rxroeZt+DIQ{TO=8u2lQ33rMN
zlN!3m%%v3-T`C3Y99itawQNn`<po-yqq;O(Ae3<T#)1Cn*E^(UCxD~3K(U}<wz){3
z)Ue;T`UIQ%KC|y at w+szw2x<6RyFvvYVqifBwiga?Uzsi*d~W4!HqqU2^;KW(6$(at
zOD^a5(AApCxve`Pa|iI0ro4tPki^IqaDjr-e&^cp6b&uT<Nw&){D at L~DzO|~^_`d&
z0ck7gyzr1bFRpYJ{33+ech;T@ZU3)@GY^OIecSk0E3#)BWf$4XPGoB$5?^IxElY;%
zk|k+Kl3mv9L?T<Zi6L8r>`V5>l4Lhh4HDjKe#h(ZhrgaN&;302eO=f2IZxZ~4A!wa
z`Lo~EpU|5%+4~Y_4jcq8zOKat1R#O`4ZObbNiN_<n%nccUmEjg=J)!+s&)25KGij@
zWM{;#fkL|Ss_kB^ZFGEbu?KCgs?`6+I^b9%`l!SXz05Eyyv|n=UnZaJ|FUyo2$%X$
z^qIo;(>AwtL-PiZvW=I;Bzm at I@8`6L)bT!Hy7YSxT%8`=W#pYP&9srdwM&~VM3Ktl
zh9<F7$j&Lbb2Ai2&ndm!WQe+xK|q?{^ql?;bn=}LEjJ_reBr&7WyZc2(zTolsNONx
zJo36ch}`q`Wdm3IT6IQh>V@<$M!~<(j99gsz7WhAI1&%e4{*`fqf}iWW@@H55DW?{
z1~GH&@{P(!k5-@jP6@(C_w`=X3fgWU`;x9}R=bGniK&^!N1|Nz8l7AXZ);=2$%Cc(
z8~GTTOSN)|pHmNIBqE0^C|qXJWf})e(dcUhGQU_tFfpLvtvyjyP;hVxWFE@#%4u<M
zJrW1k*?>zr35f{9eu4-I$UulFcF_2fZI%AUyh?bT+RBA{hS>3$YcUWxiS$Kwn2D5D
zi~j%N8KrE8X<zu+hL}0gvNcYQVj){h(P{YQ?{VeEG<^*840D_{ItQ5qhz**ka=NbQ
z`Z#o-n!QD)ne6_(#L~!q76mAY%kIoh)AP#8?oCIZVh)BmzHCdTt?=|A#~vPCwh#=X
zd5W8(;sE#$Yx-93hlkiUl#POyJoBlz&Sp&%QK?!nqwkxp#$T5H>`RuFSaZXd?((a*
zFJ}|mh&yXo-VYq<l06JO?;a#T?1ANuy?Tz)`qgWwoT6vhjseQpLih$uY(q!K*iw)z
z<W0bT`?ILmTFSnN6t?-!xNr_&?T;n%r%D3CL{Hm%@$TujS=D(Tmem4}FE4N4=2w+`
z;=y)TSJz9|tk;xv+soiR;-lR<yIjMQZUhM@;4A$fA%Tn85c%D^4b925F}-}cbRI9j
zr`j6rbB#3|3oF)~Ayq)`X&c{Utq0#7En6C|zLYq?DN656ArJ?2jSs&zJ?7EaZDrb8
z;5(YAsEB*%scc135R_f*eRwR!S!L_2>u+^Sh!HA*+nvSFb#khoI!DF3V_87)+s^*c
z%$S~dXh~}XghB-BCcL&rWLIuCfg|<bZl^{^qLF$8Jkg%x7o<>Pr-mOBx?%OCo?EcV
zUol2qnxcdru))ASAYiK3FgxzjRtwdS1sQbvAE!0&u*UUN{gXo+cC0=seDj7J)BwB}
z+wMG5P&iO+c7Q~ip2--BGi)DnHX20O7D%D+X*{ON-an#;h%3d##R~YodjjG&a1(H*
z(rm4LzALMR%Ap!`UpzpCR#sNxW#ew-cLE*&!3%<1Cy|&*eV9*c!gO21LL$WUVs@+i
zO8wJYgCMK_!v>j0O~sPop-xBBFLLC1=n57Fdc7&_8a!NFa|6pJsgWtR;I2EG2Id27
zfP4Hb2O4uV;Oh}|C)E4sVoXvN@#pdKPb<DkQp9!MB<Wh}pG=iv2l?`a at Y`29IB48f
z<Wh~qPJs*r)*#q{J?X}^lhOmmZp1Y@L%p$qLLlTe8vCKVsSnReF4}EMfJ`GE1TQZV
z`PZ^zLKN}ONHn&jxY%LMSwKI6LTKkLwf#x*acZtDl~*kOG8c!#&Hw1zwtNJ6B!eR(
z_Iq^&cxKZd8uEfLn#bWLeHC<dbb5tn4vWT+%1C2e<R^c%!v!-*QZ?$gI6|Xn%tta5
zJ>Ip+JZ=$M`>fu0_>&=N%DoIN1j9~e)e=1vrnK6TiBJ9C`S*q<G{v_=&cI8=67>lS
zwlS{YdFMM!h#nc4{4vy@<L`2>2(noB^po#tQy3x3mKIujmu0;O*y6d>Yq;&3n}d!H
z>!b1khSP@$izs*0r at tb4^*Q0{6fG6Q15)m at V;j;<{DxnhaMbTW#sI(j`>J=2)#jUS
z|LH6o=i$yD7?lK3w$Lz3)`Elz3OdSvZ)8g2tOJ*uY21Gf;AJf%pZbT>azAlKRCOkw
zUBph&r7U>eepmadR9^LF!_ at Sj#EFj^HMI7<gWC!{;L~GJJq~Fu&KkZ_H<U>Gu*^E<
zDf<-U2&#&sy5Uz14LoGP^LMsgWtRhCR6Hvy%ZjE94mx<Tx}RTZsIT_~?}wK)8_PV5
zzZjCyih`%;RK8Jw(_L-vdt!YKc&z1k<BrZxi<YqZj9l`tv6<rvwnwNxhSUyxNr?+P
zi`$sIn-Gf|bw!%Y7!|+lekVt*JE6+TE>|ql{fucNfDCoi(BWwrCsmowOiXZvhfDB|
z6`3#IhX-4kqhHx~J$2|Qf1y}6QTcwAxG_+}IncVjMHu!SntKkeEW~N>0)oV1p2GQW
z^lHMXVfl at H1jos4fDzz0C!4KP%FA##cDz-&z-oa%0hkkrRhit5fs!4%A{ZB!FDOOj
z!mz8Yw9>rX3LgT+3_&5fQWtvQlT at xa18cf;ZZdpejHsWr5scrpM>y=~-+_=KppYw)
z&VuI+geTQ4>uX!Soe0b~r+`0BP_fQ&z))xYPXNA9Z<Gp}ga=ZuSpX^`TM{jN!2|m*
zLP)e!P~qjNB4Kzl;}Bxg;n&gVa(o_4BN-~wz%$}$nGVy2`gdy)S=`7<(mT{Wmz<j-
z;^ZsXy9L?6u*Rpkw)8EH8~nvB_*bG)0i2W-r-L!kDx?QxXHo5L1vHct)_&&zEOKsj
z|593g8+hI!r!SS#jpUM1PIPX%(rmpaHnXBz9+yiIoF^7^EVnc$wP&&SEA!5r3Cmqv
z<$|xTpWj-OyPs(ZVN3-VmL~=viJw6)IJgWmm2GPz>E~+CsMs<L{th7*yiqbF?nVVL
z0smOl96DZJn5CRN9r9ymp9eDomyfl;AjlP+-0W;lyPeGC(GpJNf_nvc8FQ%rQ|yAk
zvECZ7relSQthd-yy=p)OB$SiOI@4<c9cGu!THV7Z!R~)@=>bgDA*(G;)pr=Fc^nxG
zwI1Y}PzAX3XQ_6gJLc}bFGe!QOG%WKlw8~K;q}9+!!7nXXn`s(wmz+;_g@%9Gw?{=
zRJi`A2MPzC;>QupHRj>VaTG}mT;N@^s`GrZHi2z!F0a1tYeC||(LoeZaar+E!21x;
zx)#O_QU06wrCzl_4OZAKmL?)xs0Ey=+aXR4O3o2WZ|GS!L;B%Bs^ux!IBs!)>x&OP
z{j-n_mN4}kCRkLT5k~6-VR-g*)8%LS0MP2I`#Jm4VK45q#zO{vYByeRBOli^|1>P$
zXE0VIIqz8~od^ob<b74})#vSBG%A}VBz2#0Ca{wH)yNC7IPbepa<i(xJJBg{Y|ah3
zkbi_@&Rhaczn0h58alWhp*;FvDxY>vh5p9hq0#)J$;q60|DSf&waze1i$8c*@VD7X
z-nrpK-bhk;8Bo&6M2*DHbC5-#l-RO&U?z#VM`w9SfO<pvKK|<+#9*1I^22RmzsD&f
z&k~bA_8*$O8!u__4i5MHvx=U%X1Nszd0+~O6jJzhck{U7;%|`WA>(btNZQ#^GBN$-
zzPfe`O+nfusA{2zqn3#SOMQ3ay9Ily7Sg0 at --b@Fd=JBRaB06{hCr{9A7Lq9d#(z9
zD at J2MoRg!f^60Aihv_go at Vh?v3X3&n7v_k1d_q&-qYt1bw@=vBp at W(Q4lo9<cEnUo
zmX?+Mw+K`x1Tw&VXLo5?`RNZ4bzvYdjkB>k9vzYT&%Y_#k6f6YB~EovPt#CkpRg&E
zm%Nr?l9p6%X~FAya at 6c5dOz{)+LRk%3^Pm`L_apGJ$9quMv8MrP2q;Eb<H`#l#lfn
zeW#cc*_5B<MKnDxJ6)xVKv9KG(5kxk;)s_XAx2(bUw7G`vT8fHy0fv=6aS+5 at SvZV
zNleQ$NuU(y-(vz89g9zp)#j|3Zs8K at -!rO6(rgq0GKvQ8{MypGd(qe3%S(pHO5Xt%
ze57nSK5*~;ZKA1m{d_}tIV0qN6cb}rmWoPCLkaHB3GU}3sy6|KJbU(RRk?li!PMFx
z(y2@Q47v1EXF!NtidfcsqmUpx4~G=ZsByu&t)5nk^l&;PDPv=To9<cUruW(7l#(3u
zt7~hvwbRCEbn*^UWUEa}7z2-K=rE=_dA;-8X-0cjSIM=Df~yeGa^!GAdzgChR*ac8
z<&$9Zl*OB<8mW=`urS)MkBE&lM~#3w`Ky)R^S;`z0+{QzH0_zwr+fWtT%Dai0wBE2
zaNZ;Qc!ID%vc6V=F!PWjwn%x2nVN$3DMbi>sRg4vGRDry>8f7P&xe8m75Vu>wK5oo
zXlW;N^3!bupN5ddq*z*7&fmw=9X^8VAY+`TJ`7^27qgslGBPe- at LwvX=vU#z?#@@K
zguP4$f^mM{RwN5S4=>uo$$Bgymrtd7?oWVj#B$-}n01}!tGOoBTw)Jp)Tg{j-)!yJ
ziAnb}4(9zm$89c=p<8+R*Qj0&iuKzbcC^bOZ^C0^W5>DdJsd4}T95I4S3BG^G(n?V
z-D_Q(<$0G*kB*Mg>;Vfg`1Nb1SKpT}U+U9WUx&g!VRNDAd#YY^Wh3ye&8NKXF<1|t
zvXf22QrpOmq??F8Bma{MT9H?0d)Z6SXE{NkbS_|GU|`^u*!zWZu_yuIwm?;md8h|o
zx95?3$%;cX*9AbyXVFXGrF!8-4;;0Onp)}Vi&ObS;pyo}_~<0732||8o7!owacjS~
zDbz|_C(S+709;pita3vfgTY*omCft2NeVw)|FuU-=9lctqqksG+wKx_qzF8w+41Xz
zSY&Y&vf|4y%(kD_*VpGY%)jxw3t#by-k_3_l4CE+*+e}EpVP+)1*+WN+jf8)Aj7v6
ze6c7&joWKkh{-|BnEAr)!67HN{jusYIb;l^$mkj~@Fsp1Mj3~SMbhAVWIJqR(`*zo
zY-Q8*ZzOnvJGJ!Sd9+NOl{6FuN$3(Y0SF6%a@a~bZ3ehOBk6$>>+$7~6j4y4gQ&M$
zL3!Y}fx at P!q(maXVC5Vz5`^u*i>>`!Px+5aD4=PdzWVOKDkmogn*#bnQ&kl!oVw;`
zJbSWGf=_HNr1tdxmeOL*HY at Sf#NSYl2}R}?6cltW-gl$*40_{(3WZr;N_(WLl!;Eh
zmqRVu+&luP=)fN`8GS`XMZrT(k`FcR3C6c{bzL=7N_%TUS6y8VE{6&;$@KaIbQB~@
zQa^3A3cxU(2-&)1-K(xO`-)wYpZNl8Y_u$otv?48jzpAM)|O}Fk8FTb7VO!QyJsg>
z9(>Dww0SNnrP4J#FC4yoX67Tfg&%GcudQ8jB;9+UCGkROHgM!_?Q|Ssw>aUCX$d=M
z#p55Uon@}>`#x*4MbC7q=-S&00oGtn$HOuYdfDz)8<Y3X@k9zW;;%jIo%X?Q4(maa
zT+j^xPd#97sZA>7q^2NeH^6eo3ym<sw-FK&x>9-kTV~tJ19JF+!>`LS8X9CHmX(K>
zJtCX57pNO~%5*Y+Y0zYDYrgFU<cn$$+-s>?s3ynQSYTV{;NXzI$62NbWfD30A*p{(
zjXIY%_*<wDivULy=!kTDLH~a0WB-eSDuEor$$9>EFYe9`C1N&U1My#E)8(7o&9k$8
zTsPH>b(yK_2<~-+O@%be2Hy=NU`5IO@&`KrBaZVzZly#pRdl6eykptxPj;;xF+B4R
zE-DNy^Tz1NsHmikhe`;p%5a at D0(bbI+FF;B)`OAcc(-i9JPpKuuFf8c8ADT3Aio;7
zcj@cOrnQ43Q<};l1hfF)Ny}Up{$Y>cF>a=q`>ezWJKNft at tr$yz#b%QhFvjkUtgDm
zq>Eot%(w4G9~6VURSUs>0p2B)uvDzr<{(u_&_d)4EPBIA`OQA|n;f%bVNw6PEM#C{
z@I7HUo0WPV49-jM<tCsO<xO<h;|~sr9v;3N;o{-~`?4+00_`V{#~xh#IKS0>Q*(ce
zTQ4EoV$*QQI9%H4%4@*vF|uj5skUOQG+Zjp=6oCGJ(at^iRq(Kv$8&c{ouY&Ru*Cq
zsAt&#y&RYnaz&s>(tJxqHEr=@%1ad%WfhaI61*NOh9^X{YwPO5%_PI%cWwNgJr;YL
zfloC){B{gV at H}y{TDReiKk^D^4eQ*_evWzePMWtv*^m?J@?|O{508Re$_55y+zu21
z<gp|Vg#Ix$Pf>**cB2d!>Q>CudD)-0UtdCG;t#b%UQf5UJ5rO=U3qaCa8jLl+PW3e
zxqvTPjT&dEhZJJ_&R9IfzliXuUyq;nVV<_l2e-|ejc!vz{wCeC3#zJ7cs%|?(*)`_
zV{qXw+;c{1N(|f<iY>w5>w6zAOI+yaXC3+l8?GPD{+u7IgaE1??BzSM9VDs>&TZ+a
zPgSzEMHAk9PYNC$gR%h(uklx3GgIlDXlWvmNC(a)`15`)YFa3bry&X4F+bIVZ_(1y
z9=;Mi7}eseLFYoUGDnL#Vt_(ycPd7PHtG|cA(SPfV0RZ!?Zc$@{mA^~0WT4FuN-Wy
zsquDx{HU$o`FYwa*84DeeC;3yd46BMhf_v_dds>f$x(v!a&+YZz((OS^{=JtbISyY
zjXN`nTFi{vw$mo+sRnP at bz^>e%T-Cf`yR>~5jq at DX{CqoN1yt13-)Fc;|>E!KX<iQ
z5nC7C6bdB~!IN_yRg!$G>+5QbQ>~@w2U;Tt-8f#tXO*B6EemFrM{I(5&EEY%Lo+kC
zKb-r>4OQM<2Q}UuO8+F8F`C@1A**hDH`kg-UQk5duKT(6z{cv7CN+nF?br<(#B7+N
zFZ-S#m4Aje77$Oya^DL|BhVD&2<tIX`UlI9L=e*yMWgx`7;HjiNMJmV%U1TXLk+|v
z!=595H7F?PI<!~n_UkIA%nU5-eo%anKK_x|UGUrHVe0P##8(6|qKLai2XWo(udywn
z*yC>(WiYp3eFs;Dee`wKA+g}xfhGFni`XnnI0oC8S%ArEP+oe32xPl<N4_kcdXRqZ
zd<g$(5U(N$Cwv}!(c!F-g$_7_IE5<#&Q;95m&)dt>4207ZEjrn49w7o?{T;*rso*X
zWLXZ<lo_0$rW~!3tfiQ^f>NbeZ!gmo!o5I5vkh at 0juta>AdFe)uO{OesXY2ABt#0h
zrU<Xlo7I2zW{HQcNJWzU=hz&n?3QfGw)V;rtNnU{WKUuUe`Z|g0ufyNmV}3a7cXA<
acC_=hL|V7tcPs><BlNBqqRO>xLjDg+r#rF$

literal 0
HcmV?d00001

diff --git a/package/midori/midori-0001-remove-libnotify-dependency.patch b/package/midori/midori-0001-remove-libnotify-dependency.patch
new file mode 100644
index 0000000..edd1e17
--- /dev/null
+++ b/package/midori/midori-0001-remove-libnotify-dependency.patch
@@ -0,0 +1,27 @@
+Remove the libnotify dependency.
+
+For now there is no libnotify package in Buildroot and this feature does not
+seem necessary.
+
+Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
+
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -143,16 +143,7 @@
+     endif ()
+ endif ()
+ 
+-if (WIN32)
+-    add_definitions("-DLIBNOTIFY_VERSION=\"No\"")
+-else ()
+-    pkg_check_modules(NOTIFY REQUIRED libnotify)
+-    add_definitions("-DLIBNOTIFY_VERSION=\"${NOTIFY_VERSION}\"")
+-    add_definitions("-DHAVE_LIBNOTIFY")
+-    set(OPTS_INCLUDE_DIRS "${OPTS_INCLUDE_DIRS};${NOTIFY_INCLUDE_DIRS}")
+-    set(OPTS_LIBRARIES "${OPTS_LIBRARIES};${NOTIFY_LIBRARIES}")
+-    set(PKGS ${PKGS} libnotify)
+-endif ()
++add_definitions("-DLIBNOTIFY_VERSION=\"No\"")
+ 
+ option(USE_GTK3 "Use GTK+3" OFF)
+ option(HALF_BRO_INCOM_WEBKIT2 "Serve as a guniea pig" OFF)
diff --git a/package/midori/midori-0002-do-not-use-rsvg-convert.patch b/package/midori/midori-0002-do-not-use-rsvg-convert.patch
new file mode 100644
index 0000000..8cbb5ea
--- /dev/null
+++ b/package/midori/midori-0002-do-not-use-rsvg-convert.patch
@@ -0,0 +1,39 @@
+Fix the need of librsvg for the host.
+
+Midori install script uses rsvg-convert to convert some SVG images to PNG. So,
+we need to build librsvg for the host but this requires to build some heavy
+other packages like Cairo and Pango for the host. Therefore, we hack the build
+to remove the use of rsvg-convert and we copy prerendered PNGs to the target.
+
+Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
+
+--- a/data/CMakeLists.txt
++++ b/data/CMakeLists.txt
+@@ -1,10 +1,5 @@
+ # Copyright (C) 2013 Christian Dywan <christian@twotoasts.de>
+ 
+-include(FindConvert)
+-if (NOT CONVERT_FOUND)
+-    message(FATAL_ERROR "rsvg-convert not found")
+-endif ()
+-
+ include(FindIntltool)
+ if (NOT INTLTOOL_MERGE_FOUND)
+     message(FATAL_ERROR "intltool-merge not found")
+@@ -28,16 +23,6 @@
+             string(REPLACE ".appdata.xml.in" "" DESKTOP_ID ${FILE})
+             INTLTOOL_MERGE_APPDATA (${DESKTOP_ID} po)
+         endif ()
+-    elseif (${FILE} MATCHES "\\.svg$")
+-        string(REPLACE ".svg" "" IMG_ID ${FILE})
+-        string (FIND ${FILE} "/" IS_DIR)
+-        if (IS_DIR GREATER -1)
+-            string(REPLACE "/" ";" DIR_LIST ${FILE})
+-            LIST(GET DIR_LIST 0 S_DIR)
+-            SVG2PNG (${IMG_ID} "${CMAKE_INSTALL_DATADIR}/midori/res/${S_DIR}")
+-        else ()
+-            SVG2PNG (${IMG_ID} "${CMAKE_INSTALL_DATADIR}/midori/res/")
+-        endif()
+     # These are being handled in add_executable for the "midori" binary
+     elseif (${FILE} MATCHES "\\.ico$")
+     elseif (${FILE} MATCHES "\\.rc$")
diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index d55f5f1..66df56a 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -4,45 +4,57 @@
 #
 ################################################################################
 
-MIDORI_VERSION_MAJOR = 0.4
-MIDORI_VERSION = $(MIDORI_VERSION_MAJOR).6
-MIDORI_SOURCE = midori-$(MIDORI_VERSION).tar.bz2
-MIDORI_SITE = http://archive.xfce.org/src/apps/midori/$(MIDORI_VERSION_MAJOR)/
+MIDORI_VERSION = 0.5.8
+MIDORI_SOURCE = midori_$(MIDORI_VERSION)_all_.tar.bz2
+MIDORI_SITE = http://midori-browser.org/downloads/
 MIDORI_LICENSE = LGPLv2.1+
 MIDORI_LICENSE_FILES = COPYING
 MIDORI_DEPENDENCIES = \
 	host-intltool \
 	host-pkgconf \
 	host-vala \
-	host-python \
-	libgtk2 \
-	libsexy \
+	libsoup \
+	sqlite \
+	libxml2 \
 	webkit \
-	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) \
-	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
+	$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
 
-ifneq ($(BR2_PACKAGE_XORG7),y)
-define MIDORI_WITHOUT_X11
-	$(SED) "s/check_pkg ('x11')/#check_pkg ('x11')/" $(@D)/wscript
-endef
+MIDORI_CONF_OPT = -DUSE_ZEITGEIST=OFF
+
+ifeq ($(BR2_PACKAGE_LIBGTK3),y)
+# The actual WebKit logic in Buildroot enable webkit2 when WebKit uses GTK+3
+MIDORI_CONF_OPT += \
+	-DUSE_GTK3=ON \
+	-DHALF_BRO_INCOM_WEBKIT2=ON
+MIDORI_DEPENDENCIES += libgtk3
+else
+MIDORI_DEPENDENCIES += libgtk2
 endif
 
-define MIDORI_CONFIGURE_CMDS
-	$(MIDORI_WITHOUT_X11)
-	(cd $(@D); \
-		$(TARGET_CONFIGURE_OPTS)	\
-		$(HOST_DIR)/usr/bin/python2 ./waf configure \
-		--prefix=/usr			\
-		--disable-libnotify		\
-       )
+define MIDORI_EXTRACT_CMDS
+	$(call suitable-extractor,$(MIDORI_SOURCE)) $(DL_DIR)/$(MIDORI_SOURCE) \
+		| $(TAR) $(TAR_STRIP_COMPONENTS)=0 -C $(@D) $(TAR_OPTIONS) -
 endef
 
-define MIDORI_BUILD_CMDS
-       (cd $(@D); $(HOST_DIR)/usr/bin/python2 ./waf build -j $(PARALLEL_JOBS))
+# Midori install script uses rsvg-convert to convert some SVG images to PNG. So,
+# we need to build librsvg for the host but this requires to build some heavy
+# other packages like Cairo and Pango for the host. Therefore, we hack the build
+# to remove the use of rsvg-convert and we copy prerendered PNGs to the target.
+define MIDORI_INSTALL_PNG
+	$(RM) $(TARGET_DIR)/usr/share/midori/res/logo-shade.svg
+	$(INSTALL) -D -m 0644 package/midori/logo-shade.png \
+		$(TARGET_DIR)/usr/share/midori/res/logo-shade.png
+	$(RM) $(TARGET_DIR)/usr/share/midori/res/adblock/blocked.svg
+	$(INSTALL) -D -m 0644 package/midori/blocked.png \
+		$(TARGET_DIR)/usr/share/midori/res/adblock/blocked.png
+	$(RM) $(TARGET_DIR)/usr/share/midori/res/adblock/enabled.svg
+	$(INSTALL) -D -m 0644 package/midori/enabled.png \
+		$(TARGET_DIR)/usr/share/midori/res/adblock/enabled.png
+	$(RM) $(TARGET_DIR)/usr/share/midori/res/adblock/disabled.svg
+	$(INSTALL) -D -m 0644 package/midori/disabled.png \
+		$(TARGET_DIR)/usr/share/midori/res/adblock/disabled.png
 endef
 
-define MIDORI_INSTALL_TARGET_CMDS
-       (cd $(@D); $(HOST_DIR)/usr/bin/python2 ./waf --destdir=$(TARGET_DIR) install)
-endef
+MIDORI_POST_INSTALL_TARGET_HOOKS += MIDORI_INSTALL_PNG
 
-$(eval $(generic-package))
+$(eval $(cmake-package))
-- 
2.0.1
