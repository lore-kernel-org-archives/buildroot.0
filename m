Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4073C433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 03:24:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6408160F25
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 03:24:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6408160F25
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1B11606C8;
	Sun, 24 Oct 2021 03:24:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gDskRVhQIdzG; Sun, 24 Oct 2021 03:24:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28A99605CA;
	Sun, 24 Oct 2021 03:24:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DF2CB1BF2F7
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 03:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8508402C0
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 03:24:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=yahoo.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OwFFoQ-mHtSb for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 03:24:44 +0000 (UTC)
X-Greylist: delayed 00:10:01 by SQLgrey-1.8.0
Received: from sonic317-21.consmr.mail.gq1.yahoo.com
 (sonic317-21.consmr.mail.gq1.yahoo.com [98.137.66.147])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 85110402A7
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 03:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1635045884; bh=JSPbrgL2mERlkI/7igWPIYILrp6RQAbrS1NrTRK3IGo=;
 h=Date:From:To:Cc:Subject:References:From:Subject:Reply-To;
 b=D+ChwAu+GAFs1v2JpkqByj78gqN1SxLAj4uWh3MOmLqsYH7oP7Ys2DOjiqlcmx2rv1y2gb3dpzowDUuBrpUU0Ht9ef9uZ0G9hb/newLNEQVNLNjV1DLP/VyFjSOjkpcstzMAcZXTUn3VFth2mF4unyFID7f4tau8vIyHyykzthxejKmhm29LQBuK36P9YwNb4t2wKHnrSlVEVCSYhty3SQMwnYjs0y7UgM+OqvYjkQ7wQGBKr+gaBsHpB/f8Eg5Cb+Wl0797K4ps4KbTLSlZ1cOOVJvWf5peL75FZ8J0tA0WLjNETxV6nLNZ0vNNPbt7LoEQQJX4wW5cyQW4Qf5xLg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1635045884; bh=uSc4twLih9LogRP9R/ChCT8+vVFaSfGBHSEDrUO6etv=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=Z1tksLM61QHHpxLbGuCdXtxdzDeWewbJGn7794Qk9FXXUclWxRioCEvUMCEp3wFOc4slPxN10YdK3/1hpeMkLKmmmWKjXlSK0l5s3JJ6Yjc9G9l9tpK3G0wZkAE6ovJceJJeQGqg+m0yQaytxq1RTV46QnPK4L3goL/VSU0XFC2/Zb2qL8NVmYixpK1KzO+TjKbhq/xUkEX+2ASl/OLvbyrQCPy+M90NiXc7CMoYMwO/yzVMQdE5T0Nh7w6p+Dwn/MrV6lIZt7rnj9T0qtO0DTzcmHsm61aAJiraMWFlwJZFOX/UwEGNjXCAH1jlnrq79Q8lYTvxeAg/HIXUSI0mMQ==
X-YMail-OSG: g79qiYMVM1kJOiPj4AgA35LDHtVR2cyWnkFEL313svhqK41XabkJxBDK0HjrKUm
 gRfTqN_AFaNcaOduDz.oRL_xZJAWGy.XpbGMhIe84r7ooq5p_tlLpK8Pufc.lw8ME9AbxYJU0IVR
 b2_BeZSB_Hx_GyxyY.0CMoN_w.aIt1x6jQAye.U7HWmP5U1bdojMBCkoxTJenqNyeUGHJkwoXkW4
 VcekQxdpTEFAHWuL_v0xKVGQyilM.wHCUGXJKGPwSP_ccs0wgGEfOsDjwmj7KF0Bo4Py3TdI8lUZ
 DpnX5In0a147cSoX3de88m5lTrmc2wbyTZoPNlSdqg8KHiB2mpz9_SgyTEWYFnYaaoCVtlHrYN97
 ccuVwvAt7UEc7hQYRD5MX7vb4j0nExw3ZjPD3XArttqoptEk7bokwisH6wECALSCif8l4vLRzT1k
 dcY15aIVLH5kHZv1Bs4CTONMHfX1BS7DHt.hzhmmLCdYGbzky_B30nxcoca.cs7GE5X.odUULCS_
 8TDR.emuAGHCa._DyKvahSWVDwpuHtdxuZuuD_Te4Itq1S1h0lu1_trmiRb3TeRd4rfUWmKQHbwa
 aZyYHOFHGpDsycTl_B5d0vy4GhlVBP9R8wAtZHg6TUj_iWJcrNq5q9SNE7Li5giqJ.yJpLI12.E4
 ifH4dS47q245uJbWgkFPJdCfnRNQWhJXsbFGyYdR.JB5gu5P5wP1.esTOk5dayW9gZsyYL4ZxUJd
 i8kZUEbx2jxs3WNMovVzm.g3rbnGGjLkbHk8CMfBMnGKFRA1bcAYd1Dfp5LuKPuAPXdU_kLw7k1s
 3AuJYAN1Qn7Q2TEcIfys13nYO_bEicqTDAl3yyKJNK2gSfsOfRZrARsPVXvD6Ub78HRwM_eRKZEY
 4M4Vjs6rb8bm6liWaJGBwq1dOl01wavjOO5iJSrOYLrPuCoIQ_wrKxvPLFW0fxG2zTvtrN4QPFOG
 Ooj7LkR_66xqchqKmk2DGzw6zwICiFW8JWTjy39Mo94AsAtNvS7.z4QIFR39JAoUSzYBZnFFM5ol
 SONwsffXAMO89ZR4tqyFTcbaljl2KnuaPbBZ0vdiweGWw02UAML1Tp.TqIb5rBWIqbT2PZePPTTa
 ccQ.r7ibGu7cczmsQmFz4dmzJ1e8wWFMRXHthfA6KRPtZTdwQbVN6dXmo3UV67B6n8lZIVKEXCGm
 9vnSxc2z8BSAxVMugjT0.PiJK09TTiQKaL1s5fGPTpgJsfGfU_OGLvge_fEb11qJM5PpBszA3DZl
 5G1TbtgcUmzRyrs3v1bXYlLd42Ba8zIJpUCZzwk6QZwzvoLZp7BdUEgN0.sS6Tb.BrAEm0nnIvM_
 A.8HDp1hjmk5FL7z_101QL2luGe4JacdSrR10YBqZTlb5KI4UwxN.KDqBta0lorOhFV6FqLLT29u
 nuKdcCKhPgRCAl.Q8SNK7bywROdZw7SbBtfR2yjaqxCUHyA3HNcsrP3BAIyFfswgujtEYWlmBbdo
 tAqIFQfgtp1QQj2Y6zeqcNup.TXH16SZa863MJwYdeIYA2shd5blqYmdRNbFmWAqOGs_hezfMuB.
 UwIFiK_CeFP6d9aziwNl9UyZOP7alqa.0dqcG1T1lCJGUkSj0cZdbTPkxWiW8nmP7c9yMUreQKLt
 tZ7jGGeSe5D19cMkE77NZJoEu_ulz9jixSzjQgq39v9L207ZpVFhD8RB7t6B9NUVq57MMvMwnf9t
 0x0dQKwdrE3D0oFDQKH59VmsTeHvGgGPmh.VuSmZg1nwXRsMOKWVK19Bvxk.cD90lyzvafGxfCuQ
 0gR2Yan2e8_r6w2xB9.QxdOMh2SM4bkuKikoIfv7088823eIWNPlZMFxj0XscyAVHuyKm6n6ZGwD
 MqKW0aOkCnBOiPdOuU8HCd8PrQe4y5HUOh_BIna0nYsgfvyEFMg1.hdwRhBlrO1Eq8w3YUHvusBQ
 _gZHP9RNWsJL4okvxkbnSojn59ivVoF1Q3S3E3IC1OqzabZClDX1gLIQph9C8k074.QU2lLXmxHC
 NOV00sbiDZwMJFUwq2qWbt9Wjxf2O.Hsvlvp0BlpIlYoo81xFeFaRwH_2tqHFGzpNHzPLjvEgq9p
 7GROZkoxjxuPeKqDZCowLVJyD6buvguG8srymvisa4lRC.dI7pCv5iHoTLwLUz5.OX2y3fzZdQI8
 nea0tS_3pON6DD7662IdE32N0UtlbPeh8pXReVl3SFUTTFn0NW3aqJ8gXlO.pgqfIhrHv2McDajY
 XhfubO1z0v7dBM3nY8IBaDx.uPo5343fKz9A-
X-Sonic-MF: <tallubko@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic317.consmr.mail.gq1.yahoo.com with HTTP; Sun, 24 Oct 2021 03:24:44 +0000
Date: Sun, 24 Oct 2021 03:14:38 +0000 (UTC)
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <278071935.475100.1635045278560@mail.yahoo.com>
MIME-Version: 1.0
References: <278071935.475100.1635045278560.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.19198 YMailNorrin
Subject: [Buildroot] [PATCH v2 1/1] package/chipsec: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Tal Lubko via buildroot <buildroot@buildroot.org>
Reply-To: Tal Lubko <tallubko@yahoo.com>
Cc: "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
Content-Type: multipart/mixed; boundary="===============3607356895927055679=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3607356895927055679==
Content-Type: multipart/alternative; 
	boundary="----=_Part_475099_167021435.1635045278556"

------=_Part_475099_167021435.1635045278556
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi
The new patch includes the following modifications based on=C2=A0Arnout com=
ments (arnout@mind.be)- extend modules search to match py, pyo and pyc
- fix dependencies- remove setuptools from runtime (unnecessary)- adding do=
cumentation
Regarding CHIPSEC_ENV =3D KSRC=3D$(LINUX_DIR):I thought that adding: CHIPSE=
C_MAKE_ENV =3D $(LINUX_MAKE_FLAGS)will do the job (I used racehound as a re=
ference) but it hasn't.I'm not sure what's the difference between CHIPSEC_E=
NV and CHIPSEC_MAKE_ENV butCHIPSEC_ENV worked (LKM was built against the co=
rrect kernel) and CHIPSEC_MAKE_ENVhasn't.
and in addition
-=C2=A0move the package from libraries-->security to security
- adding host-nasm to=C2=A0dependencies- package version bump to 1.7.2
Regards,Tal
Signed-off-by: Tal Lubko <tallubko@yahoo.com>---=C2=A0DEVELOPERS=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++=C2=A0package/Config.=
in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 1 +=C2=A0...es-search-to-match-.py-.=
pyo-and-.pyc.patch | 27 ++++++++++++++=C2=A0package/chipsec/Config.in=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 37 =
+++++++++++++++++++=C2=A0package/chipsec/chipsec.hash=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++=C2=A0package/chipsec=
/chipsec.mk=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 28 ++++++++++++++=C2=A06 files changed, 99 insertions(+)=C2=A0crea=
te mode 100644 package/chipsec/0001-extend-modules-search-to-match-.py-.pyo=
-and-.pyc.patch=C2=A0create mode 100644 package/chipsec/Config.in=C2=A0crea=
te mode 100644 package/chipsec/chipsec.hash=C2=A0create mode 100644 package=
/chipsec/chipsec.mk
diff --git a/DEVELOPERS b/DEVELOPERSindex f864f7ef47..615a272c68 100644--- =
a/DEVELOPERS+++ b/DEVELOPERS@@ -2585,6 +2585,9 @@ F: package/python-influxd=
b/=C2=A0N: Sven Oliver Moll <svolli@svolli.de>=C2=A0F: package/most/=C2=A0+=
N: Tal Lubko <tallubko@yahoo.com>+F: package/chipsec/+=C2=A0N: Theo Debrouw=
ere <t.debrouwere@televic.com>=C2=A0F: board/beagleboardx15/=C2=A0F: config=
s/beagleboardx15_defconfigdiff --git a/package/Config.in b/package/Config.i=
nindex d40eb9dabc..e8bb2a5dc4 100644--- a/package/Config.in+++ b/package/Co=
nfig.in@@ -2397,6 +2397,7 @@ endmenu=C2=A0menu "Security"=C2=A0 source "pac=
kage/apparmor/Config.in"=C2=A0 source "package/checkpolicy/Config.in"+ sour=
ce "package/chipsec/Config.in"=C2=A0 source "package/ima-evm-utils/Config.i=
n"=C2=A0 source "package/optee-benchmark/Config.in"=C2=A0 source "package/o=
ptee-client/Config.in"diff --git a/package/chipsec/0001-extend-modules-sear=
ch-to-match-.py-.pyo-and-.pyc.patch b/package/chipsec/0001-extend-modules-s=
earch-to-match-.py-.pyo-and-.pyc.patchnew file mode 100644index 0000000000.=
.104097fa0e--- /dev/null+++ b/package/chipsec/0001-extend-modules-search-to=
-match-.py-.pyo-and-.pyc.patch@@ -0,0 +1,27 @@+From 5b5a70690b1761e77a595a6=
7f4685eb11f0c8c9c Mon Sep 17 00:00:00 2001+From: Tal Lubko <tallubko@yahoo.=
com>+Date: Sat, 23 Oct 2021 22:23:24 +0300+Subject: [PATCH 1/1] extend chip=
sec_main search to both py and pyc++[Upstream: https://github.com/chipsec/c=
hipsec/pull/1289]+Signed-off-by: Tal Lubko <tallubko@yahoo.com>+---+ chipse=
c_main.py | 2 +-+ 1 file changed, 1 insertion(+), 1 deletion(-)++diff --git=
 a/chipsec_main.py b/chipsec_main.py+index 1aa46ea..8e6f327 100755+--- a/ch=
ipsec_main.py++++ b/chipsec_main.py+@@ -215,7 +215,7 @@ class ChipsecMain:+=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while len(sub=
dirs) > 0:+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0subdirs.pop()+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
for modx in mod_fnames:+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if fnmatch.fnmatch( modx, '*.py' ) and not fnmatch.fnmatch( modx, '_=
_init__.py' ):++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if =
fnmatch.fnmatch( modx, '*.py*' ) and not fnmatch.fnmatch( modx, '__init__.p=
y*' ):+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0self.load_module( os.path.join( dirname, modx ), self._module_arg=
v )+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.Loaded_Modules.sort()+=C2=A0+--=
=C2=A0+2.17.1+diff --git a/package/chipsec/Config.in b/package/chipsec/Conf=
ig.innew file mode 100644index 0000000000..839204301e--- /dev/null+++ b/pac=
kage/chipsec/Config.in@@ -0,0 +1,37 @@+config BR2_PACKAGE_CHIPSEC+ bool "ch=
ipsec"+ depends on !BR2_PACKAGE_PYTHON # python3+ depends on BR2_USE_WCHAR =
# python3+ depends on BR2_TOOLCHAIN_HAS_THREADS # python3+ depends on BR2_U=
SE_MMU # python3+ depends on !BR2_STATIC_LIBS # python3+ depends on BR2_i38=
6 || BR2_x86_64 # supported only on x86/x86_64+ depends on BR2_LINUX_KERNEL=
+ select BR2_PACKAGE_PYTHON3++ help+ =C2=A0 CHIPSEC is a framework for anal=
yzing the security of PC+ =C2=A0 platforms including hardware, system firmw=
are (BIOS/UEFI),+ =C2=A0 and platform components.=C2=A0++ =C2=A0 https://gi=
thub.com/chipsec/chipsec++comment "chipsec needs a toolchain w/ wchar, thre=
ads, dynamic library"+ depends on BR2_USE_MMU+ depends on BR2_i386 || BR2_x=
86_64+ depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATI=
C_LIBS++comment "chipsec needs a Linux kernel to be built"+ depends on BR2_=
USE_MMU+ depends on BR2_i386 || BR2_x86_64+ depends on !BR2_LINUX_KERNEL++c=
omment "chipsec is not compatible with python"+ depends on BR2_USE_MMU+ dep=
ends on BR2_i386 || BR2_x86_64+ depends on BR2_PACKAGE_PYTHON++comment "chi=
psec depends on python3"+ depends on BR2_USE_MMU+ depends on BR2_i386 || BR=
2_x86_64+ depends on !BR2_PACKAGE_PYTHON3diff --git a/package/chipsec/chips=
ec.hash b/package/chipsec/chipsec.hashnew file mode 100644index 0000000000.=
.05095f2292--- /dev/null+++ b/package/chipsec/chipsec.hash@@ -0,0 +1,3 @@+#=
 Locally calculated+sha256=C2=A0 6806770cdde9633af2e2395fa1e6d769aaab45f54e=
602a246ed78a02ce238362=C2=A0 chipsec-1.7.2.tar.gz+sha256=C2=A0 4c2ca80f4d36=
75a53a216a64d67e7b411a81a6e958defd248c6f1ecf44dc6607=C2=A0 COPYINGdiff --gi=
t a/package/chipsec/chipsec.mk b/package/chipsec/chipsec.mknew file mode 10=
0644index 0000000000..7ff927f2b4--- /dev/null+++ b/package/chipsec/chipsec.=
mk@@ -0,0 +1,28 @@+########################################################=
########################+#+# chipsec+#+####################################=
############################################++CHIPSEC_VERSION =3D 1.7.2+CHI=
PSEC_SITE =3D $(call github,chipsec,chipsec,$(CHIPSEC_VERSION))+CHIPSEC_SET=
UP_TYPE =3D setuptools+CHIPSEC_LICENSE =3D GPL-2.0+CHIPSEC_LICENSE_FILES =
=3D LICENSE+CHIPSEC_DEPENDENCIES =3D linux host-nasm++# needed in order to =
build chipsec's LKM against Buildroot's kernel+CHIPSEC_ENV =3D KSRC=3D$(LIN=
UX_DIR)++# build command according to chipsec's manual (chipsec-manual.pdf)=
+CHIPSEC_BUILD_OPTS =3D build_ext -i++define CHIPSEC_INSTALL_LKM+ # chipsec=
's scripts search chipsec.ko in a non-standart location+ $(INSTALL) -m 0644=
 -D $(@D)/chipsec/helper/linux/chipsec.ko \+ $(TARGET_DIR)/usr/lib/python$(=
PYTHON3_VERSION_MAJOR)/site-packages/chipsec/helper/linux+endef++CHIPSEC_PO=
ST_INSTALL_TARGET_HOOKS +=3D CHIPSEC_INSTALL_LKM++$(eval $(python-package))=
--=C2=A02.17.1



------=_Part_475099_167021435.1635045278556
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div class=3D"ydp4afed93eyahoo-style-wrap" style=
=3D"font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:16px=
;"><div dir=3D"ltr" data-setdir=3D"false">Hi</div><div dir=3D"ltr" data-set=
dir=3D"false"><br></div><div dir=3D"ltr" data-setdir=3D"false"><span>The ne=
w patch includes the following modifications based on&nbsp;<span>Arnout com=
ments (<span>arnout@mind.be</span>)</span></span></div><div dir=3D"ltr" dat=
a-setdir=3D"false">- extend modules search to match py, pyo and pyc<br></di=
v><div dir=3D"ltr" data-setdir=3D"false"><span>- fix dependencies</span></d=
iv><div dir=3D"ltr" data-setdir=3D"false"><span>- remove <span>setuptools f=
rom runtime (unnecessary)</span></span></div><div dir=3D"ltr" data-setdir=
=3D"false">- adding documentation</div><div dir=3D"ltr" data-setdir=3D"fals=
e"><br></div><div dir=3D"ltr" data-setdir=3D"false"><div><div>Regarding CHI=
PSEC_ENV =3D KSRC=3D$(LINUX_DIR):</div><div>I thought that adding: CHIPSEC_=
MAKE_ENV =3D $(LINUX_MAKE_FLAGS)</div><div>will do the job (I used racehoun=
d as a reference) but it hasn't.</div><div>I'm not sure what's the differen=
ce between CHIPSEC_ENV and CHIPSEC_MAKE_ENV but</div><div>CHIPSEC_ENV worke=
d (LKM was built against the correct kernel) and CHIPSEC_MAKE_ENV</div><div=
>hasn't.</div><div><br></div></div></div><div dir=3D"ltr" data-setdir=3D"fa=
lse">and in addition<br></div><div dir=3D"ltr" data-setdir=3D"false"><div><=
div dir=3D"ltr" data-setdir=3D"false" style=3D"color: rgb(0, 0, 0); font-fa=
mily: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 16px;">-&nbs=
p;move the package from libraries--&gt;security to security<br></div><div d=
ir=3D"ltr" data-setdir=3D"false" style=3D"color: rgb(0, 0, 0); font-family:=
 Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 16px;">- adding h=
ost-nasm to&nbsp;dependencies</div></div><div dir=3D"ltr" data-setdir=3D"fa=
lse" style=3D"color: rgb(0, 0, 0); font-family: Helvetica Neue, Helvetica, =
Arial, sans-serif; font-size: 16px;">- package version bump to 1.7.2</div><=
div dir=3D"ltr" data-setdir=3D"false" style=3D"color: rgb(0, 0, 0); font-fa=
mily: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 16px;"><br><=
/div><div dir=3D"ltr" data-setdir=3D"false" style=3D"color: rgb(0, 0, 0); f=
ont-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-size: 16px;"=
>Regards,</div><div dir=3D"ltr" data-setdir=3D"false" style=3D"color: rgb(0=
, 0, 0); font-family: Helvetica Neue, Helvetica, Arial, sans-serif; font-si=
ze: 16px;">Tal</div><div dir=3D"ltr" data-setdir=3D"false" style=3D"color: =
rgb(0, 0, 0); font-family: Helvetica Neue, Helvetica, Arial, sans-serif; fo=
nt-size: 16px;"><br></div><div dir=3D"ltr" data-setdir=3D"false" style=3D"c=
olor: rgb(0, 0, 0); font-family: Helvetica Neue, Helvetica, Arial, sans-ser=
if; font-size: 16px;"><div><div>Signed-off-by: Tal Lubko &lt;tallubko@yahoo=
.com&gt;</div><div>---</div><div>&nbsp;DEVELOPERS&nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; |&nbsp; 3 ++</div><div>&nbsp;package/Config.in&nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;|&nbsp; 1 +</div><div>&nbsp;...es-search-to-match-=
.py-.pyo-and-.pyc.patch | 27 ++++++++++++++</div><div>&nbsp;package/chipsec=
/Config.in&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp;| 37 +++++++++++++++++++</div><div>&nbsp;package/chipsec/chipsec=
.hash&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; |&nbsp;=
 3 ++</div><div>&nbsp;package/chipsec/chipsec.mk&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 28 ++++++++++++++</div><div>&n=
bsp;6 files changed, 99 insertions(+)</div><div>&nbsp;create mode 100644 pa=
ckage/chipsec/0001-extend-modules-search-to-match-.py-.pyo-and-.pyc.patch</=
div><div>&nbsp;create mode 100644 package/chipsec/Config.in</div><div>&nbsp=
;create mode 100644 package/chipsec/chipsec.hash</div><div>&nbsp;create mod=
e 100644 package/chipsec/chipsec.mk</div><div><br></div><div>diff --git a/D=
EVELOPERS b/DEVELOPERS</div><div>index f864f7ef47..615a272c68 100644</div><=
div>--- a/DEVELOPERS</div><div>+++ b/DEVELOPERS</div><div>@@ -2585,6 +2585,=
9 @@ F:<span style=3D"white-space: pre-wrap;">=09</span>package/python-infl=
uxdb/</div><div>&nbsp;N:<span style=3D"white-space: pre-wrap;">=09</span>Sv=
en Oliver Moll &lt;svolli@svolli.de&gt;</div><div>&nbsp;F:<span style=3D"wh=
ite-space: pre-wrap;">=09</span>package/most/</div><div>&nbsp;</div><div>+N=
:<span style=3D"white-space: pre-wrap;">=09</span>Tal Lubko &lt;tallubko@ya=
hoo.com&gt;</div><div>+F:<span style=3D"white-space: pre-wrap;">=09</span>p=
ackage/chipsec/</div><div>+</div><div>&nbsp;N:<span style=3D"white-space: p=
re-wrap;">=09</span>Theo Debrouwere &lt;t.debrouwere@televic.com&gt;</div><=
div>&nbsp;F:<span style=3D"white-space: pre-wrap;">=09</span>board/beaglebo=
ardx15/</div><div>&nbsp;F:<span style=3D"white-space: pre-wrap;">=09</span>=
configs/beagleboardx15_defconfig</div><div>diff --git a/package/Config.in b=
/package/Config.in</div><div>index d40eb9dabc..e8bb2a5dc4 100644</div><div>=
--- a/package/Config.in</div><div>+++ b/package/Config.in</div><div>@@ -239=
7,6 +2397,7 @@ endmenu</div><div>&nbsp;menu "Security"</div><div>&nbsp;<spa=
n style=3D"white-space: pre-wrap;">=09</span>source "package/apparmor/Confi=
g.in"</div><div>&nbsp;<span style=3D"white-space: pre-wrap;">=09</span>sour=
ce "package/checkpolicy/Config.in"</div><div>+<span style=3D"white-space: p=
re-wrap;">=09</span>source "package/chipsec/Config.in"</div><div>&nbsp;<spa=
n style=3D"white-space: pre-wrap;">=09</span>source "package/ima-evm-utils/=
Config.in"</div><div>&nbsp;<span style=3D"white-space: pre-wrap;">=09</span=
>source "package/optee-benchmark/Config.in"</div><div>&nbsp;<span style=3D"=
white-space: pre-wrap;">=09</span>source "package/optee-client/Config.in"</=
div><div>diff --git a/package/chipsec/0001-extend-modules-search-to-match-.=
py-.pyo-and-.pyc.patch b/package/chipsec/0001-extend-modules-search-to-matc=
h-.py-.pyo-and-.pyc.patch</div><div>new file mode 100644</div><div>index 00=
00000000..104097fa0e</div><div>--- /dev/null</div><div>+++ b/package/chipse=
c/0001-extend-modules-search-to-match-.py-.pyo-and-.pyc.patch</div><div>@@ =
-0,0 +1,27 @@</div><div>+From 5b5a70690b1761e77a595a67f4685eb11f0c8c9c Mon =
Sep 17 00:00:00 2001</div><div>+From: Tal Lubko &lt;tallubko@yahoo.com&gt;<=
/div><div>+Date: Sat, 23 Oct 2021 22:23:24 +0300</div><div>+Subject: [PATCH=
 1/1] extend chipsec_main search to both py and pyc</div><div>+</div><div>+=
[Upstream: https://github.com/chipsec/chipsec/pull/1289]</div><div>+Signed-=
off-by: Tal Lubko &lt;tallubko@yahoo.com&gt;</div><div>+---</div><div>+ chi=
psec_main.py | 2 +-</div><div>+ 1 file changed, 1 insertion(+), 1 deletion(=
-)</div><div>+</div><div>+diff --git a/chipsec_main.py b/chipsec_main.py</d=
iv><div>+index 1aa46ea..8e6f327 100755</div><div>+--- a/chipsec_main.py</di=
v><div>++++ b/chipsec_main.py</div><div>+@@ -215,7 +215,7 @@ class ChipsecM=
ain:</div><div>+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;while len(subdirs) &gt; 0:</div><div>+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;subdirs.pop()</div><div>+&nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;for modx in mod_fnames:</div><div>+=
-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if fnmatch.fnmatch=
( modx, '*.py' ) and not fnmatch.fnmatch( modx, '__init__.py' ):</div><div>=
++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if fnmatch.fnmatc=
h( modx, '*.py*' ) and not fnmatch.fnmatch( modx, '__init__.py*' ):</div><d=
iv>+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp;self.load_module( os.path.join( dirname, modx ), self._module_argv )</=
div><div>+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.Loaded_Modules.sort()</div=
><div>+&nbsp;</div><div>+--&nbsp;</div><div>+2.17.1</div><div>+</div><div>d=
iff --git a/package/chipsec/Config.in b/package/chipsec/Config.in</div><div=
>new file mode 100644</div><div>index 0000000000..839204301e</div><div>--- =
/dev/null</div><div>+++ b/package/chipsec/Config.in</div><div>@@ -0,0 +1,37=
 @@</div><div>+config BR2_PACKAGE_CHIPSEC</div><div>+<span style=3D"white-s=
pace: pre-wrap;">=09</span>bool "chipsec"</div><div>+<span style=3D"white-s=
pace: pre-wrap;">=09</span>depends on !BR2_PACKAGE_PYTHON # python3</div><d=
iv>+<span style=3D"white-space: pre-wrap;">=09</span>depends on BR2_USE_WCH=
AR # python3</div><div>+<span style=3D"white-space: pre-wrap;">=09</span>de=
pends on BR2_TOOLCHAIN_HAS_THREADS # python3</div><div>+<span style=3D"whit=
e-space: pre-wrap;">=09</span>depends on BR2_USE_MMU # python3</div><div>+<=
span style=3D"white-space: pre-wrap;">=09</span>depends on !BR2_STATIC_LIBS=
 # python3</div><div>+<span style=3D"white-space: pre-wrap;">=09</span>depe=
nds on BR2_i386 || BR2_x86_64 # supported only on x86/x86_64</div><div>+<sp=
an style=3D"white-space: pre-wrap;">=09</span>depends on BR2_LINUX_KERNEL</=
div><div>+<span style=3D"white-space: pre-wrap;">=09</span>select BR2_PACKA=
GE_PYTHON3</div><div>+</div><div>+<span style=3D"white-space: pre-wrap;">=
=09</span>help</div><div>+<span style=3D"white-space: pre-wrap;">=09</span>=
&nbsp; CHIPSEC is a framework for analyzing the security of PC</div><div>+<=
span style=3D"white-space: pre-wrap;">=09</span>&nbsp; platforms including =
hardware, system firmware (BIOS/UEFI),</div><div>+<span style=3D"white-spac=
e: pre-wrap;">=09</span>&nbsp; and platform components.&nbsp;</div><div>+</=
div><div>+<span style=3D"white-space: pre-wrap;">=09</span>&nbsp; https://g=
ithub.com/chipsec/chipsec</div><div>+</div><div>+comment "chipsec needs a t=
oolchain w/ wchar, threads, dynamic library"</div><div>+<span style=3D"whit=
e-space: pre-wrap;">=09</span>depends on BR2_USE_MMU</div><div>+<span style=
=3D"white-space: pre-wrap;">=09</span>depends on BR2_i386 || BR2_x86_64</di=
v><div>+<span style=3D"white-space: pre-wrap;">=09</span>depends on !BR2_US=
E_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS</div><div>+</div><=
div>+comment "chipsec needs a Linux kernel to be built"</div><div>+<span st=
yle=3D"white-space: pre-wrap;">=09</span>depends on BR2_USE_MMU</div><div>+=
<span style=3D"white-space: pre-wrap;">=09</span>depends on BR2_i386 || BR2=
_x86_64</div><div>+<span style=3D"white-space: pre-wrap;">=09</span>depends=
 on !BR2_LINUX_KERNEL</div><div>+</div><div>+comment "chipsec is not compat=
ible with python"</div><div>+<span style=3D"white-space: pre-wrap;">=09</sp=
an>depends on BR2_USE_MMU</div><div>+<span style=3D"white-space: pre-wrap;"=
>=09</span>depends on BR2_i386 || BR2_x86_64</div><div>+<span style=3D"whit=
e-space: pre-wrap;">=09</span>depends on BR2_PACKAGE_PYTHON</div><div>+</di=
v><div>+comment "chipsec depends on python3"</div><div>+<span style=3D"whit=
e-space: pre-wrap;">=09</span>depends on BR2_USE_MMU</div><div>+<span style=
=3D"white-space: pre-wrap;">=09</span>depends on BR2_i386 || BR2_x86_64</di=
v><div>+<span style=3D"white-space: pre-wrap;">=09</span>depends on !BR2_PA=
CKAGE_PYTHON3</div><div>diff --git a/package/chipsec/chipsec.hash b/package=
/chipsec/chipsec.hash</div><div>new file mode 100644</div><div>index 000000=
0000..05095f2292</div><div>--- /dev/null</div><div>+++ b/package/chipsec/ch=
ipsec.hash</div><div>@@ -0,0 +1,3 @@</div><div>+# Locally calculated</div><=
div>+sha256&nbsp; 6806770cdde9633af2e2395fa1e6d769aaab45f54e602a246ed78a02c=
e238362&nbsp; chipsec-1.7.2.tar.gz</div><div>+sha256&nbsp; 4c2ca80f4d3675a5=
3a216a64d67e7b411a81a6e958defd248c6f1ecf44dc6607&nbsp; COPYING</div><div>di=
ff --git a/package/chipsec/chipsec.mk b/package/chipsec/chipsec.mk</div><di=
v>new file mode 100644</div><div>index 0000000000..7ff927f2b4</div><div>---=
 /dev/null</div><div>+++ b/package/chipsec/chipsec.mk</div><div>@@ -0,0 +1,=
28 @@</div><div>+##########################################################=
######################</div><div>+#</div><div>+# chipsec</div><div>+#</div>=
<div>+#####################################################################=
###########</div><div>+</div><div>+CHIPSEC_VERSION =3D 1.7.2</div><div>+CHI=
PSEC_SITE =3D $(call github,chipsec,chipsec,$(CHIPSEC_VERSION))</div><div>+=
CHIPSEC_SETUP_TYPE =3D setuptools</div><div>+CHIPSEC_LICENSE =3D GPL-2.0</d=
iv><div>+CHIPSEC_LICENSE_FILES =3D LICENSE</div><div>+CHIPSEC_DEPENDENCIES =
=3D linux host-nasm</div><div>+</div><div>+# needed in order to build chips=
ec's LKM against Buildroot's kernel</div><div>+CHIPSEC_ENV =3D KSRC=3D$(LIN=
UX_DIR)</div><div>+</div><div>+# build command according to chipsec's manua=
l (chipsec-manual.pdf)</div><div>+CHIPSEC_BUILD_OPTS =3D build_ext -i</div>=
<div>+</div><div>+define CHIPSEC_INSTALL_LKM</div><div>+<span style=3D"whit=
e-space: pre-wrap;">=09</span># chipsec's scripts search chipsec.ko in a no=
n-standart location</div><div>+<span style=3D"white-space: pre-wrap;">=09</=
span>$(INSTALL) -m 0644 -D $(@D)/chipsec/helper/linux/chipsec.ko \</div><di=
v>+<span style=3D"white-space: pre-wrap;">=09=09</span>$(TARGET_DIR)/usr/li=
b/python$(PYTHON3_VERSION_MAJOR)/site-packages/chipsec/helper/linux</div><d=
iv>+endef</div><div>+</div><div>+CHIPSEC_POST_INSTALL_TARGET_HOOKS +=3D CHI=
PSEC_INSTALL_LKM</div><div>+</div><div>+$(eval $(python-package))</div><div=
>--&nbsp;</div><div>2.17.1</div><div><br></div></div><br></div></div><div d=
ir=3D"ltr" data-setdir=3D"false"><span><br></span></div></div></body></html=
>
------=_Part_475099_167021435.1635045278556--

--===============3607356895927055679==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3607356895927055679==--
