Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13EA1E8FDAC
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 18:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 391F64072F;
	Fri, 26 Dec 2025 18:00:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1KXlYbynT4q3; Fri, 26 Dec 2025 18:00:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A79E84070B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766772002;
	bh=aMJKNieNiz/wTOvozbJrALz6bN4s/eCUazU1r0ktwy0=;
	h=From:Date:References:Cc:In-Reply-To:To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Kmayn9JaJi9i900+UPujwLTtul2C87PybjOBOyGMVHtFB2zH69Y/q5nCn++r6guMw
	 rFd5Uadbqnw9P+/wtrKM/yHp8Csl3DPAfGo75+ZJdw1uslNk6hz9wdOIWpBFAhyxxj
	 wGgWG3jZKj6k+7Kt6Ao5Ck4o3FKEI3fh5/rIivdtcyOqQZCxRC+2TiQUSIwAlyGygl
	 hfNZWmqsoI9jJ9T4qebFhZoSVmF9My4CLBe9gUMPyB9yA3gn+xL85qUmzcvpke+568
	 e5En2uca7Lq4huajpQzoJ1B7K2qMI402KdltuDDLA5Ll/0ZeF4InALmuBMWo1ooKW3
	 VCTEtd6QdBwCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A79E84070B;
	Fri, 26 Dec 2025 18:00:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2545AEC
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1631A4070B
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 18:00:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vb4HbcJ66mLA for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 17:59:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.56;
 helo=smtpcmd0756.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 750F8406FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 750F8406FC
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 750F8406FC
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 17:59:56 +0000 (UTC)
Received: from smtpclient.apple ([81.56.223.57]) by Aruba SMTP with ESMTPSA
 id ZC6SvhMn0lGpsZC6TvJeUm; Fri, 26 Dec 2025 18:59:53 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Fri, 26 Dec 2025 18:59:52 +0100
Message-Id: <0AED6F82-A812-4B62-9E96-C04F980CC463@benettiengineering.com>
References: <20251226174623.2006300-1-dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Petr Vorel <petr.vorel@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
In-Reply-To: <20251226174623.2006300-1-dario.binacchi@amarulasolutions.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
X-Mailer: iPhone Mail (23C55)
X-CMAE-Envelope: MS4xfPCT2fvr16Lhdm/qgUMJ/n74sRtgeKk61Hmg1d/mB+w39BpUGXXdf4To2eXU/EiYfZuxKXNRI5UbB3+qgc+h1etto8XiXKTK4o5AC5pkDW1xUXj2x4TP
 qJp4POCsoXZK8Tym9dwMX13IsQIRh4mqzkMSKZ8D/XDMqeLNB5wlUki+t8RfOaHfiZ574mKwaz6kdKNj3w9Na2Z5JL2LUhq5+TyAEMfASkxxUyZxH9NC2VhA
 DJKzZOwW7uj6zPxRBzK6rPT7+ckUZ4LXl8o2LTEvldMEOpblXcRy3R7gLdan/6GfFHY7e0oFT01jDUYNP+G225+5tFNwBHYqcR8rxL2wH4pzwAem35MFk5SY
 HYrxl1BBprI9+9ZeNJzA2xa1CGiJjJYg6TERZtsjHV4BeBeeK6g=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1766771993; bh=qV6TcePuydK/4V6mkyJG44wObpMdg6Gg/CKvDsRUIRM=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=EN95g49YMbRb7348MblrLNDTTsdFhkWp423CHWl+SlmdMqyEuFtjtGn2bLun7Ny0q
 3mZOVO1pxmqZ7EBjZXser+OzwMjcm8LaVpNyXUJC26iyW8n032nMxryIa2QQhNN3Qq
 SRXMz98JcDWpX8Z9wasgCY+rkYg5oEev8Ns9A1ottjVdRs/TPD5ZWigPDQpaGVtUhD
 yvyg3NgctOh1iQ7pmDeykBHCAma0o1zyB3Uvl3kog+bm0VJaetre1Ai/82WuhsyIAo
 90a8vkDJSGU6yVI+00/VohAw8VYh5W0VepjWihypeIKk5brps7wYjp/yn3SOPkl+nd
 OWb0CEh0y+SNg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=EN95g49Y
Subject: Re: [Buildroot] [PATCH 1/1] package/libtirpc: add option for RPC
 Database support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3114380904077877173=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============3114380904077877173==
Content-Type: multipart/alternative; boundary=Apple-Mail-EF481762-5FC9-4751-B9DE-0EC74BC08338
Content-Transfer-Encoding: 7bit


--Apple-Mail-EF481762-5FC9-4751-B9DE-0EC74BC08338
Content-Type: multipart/related;
	type="text/html";
	boundary=Apple-Mail-04FBF0C9-EFC0-4E7D-ABE5-D73B46153644
Content-Transfer-Encoding: 7bit


--Apple-Mail-04FBF0C9-EFC0-4E7D-ABE5-D73B46153644
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html class=3D"apple-mail-supports-explicit-dark-mode"><head><meta http-equi=
v=3D"content-type" content=3D"text/html; charset=3Dutf-8"></head><body dir=3D=
"auto">Hi Dario,<div><br></div><div>I=E2=80=99ve already sent a patch for th=
is:</div><div><div style=3D"display: block;" class=3D""><div style=3D"-webki=
t-user-select: all; -webkit-user-drag: element; display: inline-block;" clas=
s=3D"apple-rich-link" draggable=3D"true" role=3D"link" data-url=3D"https://l=
ore.kernel.org/buildroot/20251214170654.GD193459@pevik/"><a style=3D"border-=
radius:10px;font-family:-apple-system, Helvetica, Arial, sans-serif;display:=
block;-webkit-user-select:none;width:228px;user-select:none;-webkit-user-mod=
ify:read-only;user-modify:read-only;overflow:hidden;text-decoration:none;" c=
lass=3D"lp-rich-link" rel=3D"nofollow" href=3D"https://lore.kernel.org/build=
root/20251214170654.GD193459@pevik/" dir=3D"ltr" role=3D"button" draggable=3D=
"false" width=3D"228"><table style=3D"table-layout:fixed;border-collapse:col=
lapse;width:228px;background-color:#8B6045;font-family:-apple-system, Helvet=
ica, Arial, sans-serif;" class=3D"lp-rich-link-emailBaseTable" cellpadding=3D=
"0" cellspacing=3D"0" border=3D"0" width=3D"228"><tbody><tr><td vertical-ali=
gn=3D"center" align=3D"center"><img style=3D"width:228px;filter:brightness(0=
.97);height:228px;" width=3D"228" height=3D"228" draggable=3D"false" class=3D=
"lp-rich-link-mediaImage" alt=3D"pensive.webp" src=3D"cid:B9A10E04-247F-4EE3=
-A156-989C0FE233DD"></td></tr><tr><td vertical-align=3D"center"><table bgcol=
or=3D"#8B6045" cellpadding=3D"0" cellspacing=3D"0" width=3D"228" style=3D"ta=
ble-layout:fixed;font-family:-apple-system, Helvetica, Arial, sans-serif;bac=
kground-color:rgba(139, 96, 69, 1);-apple-color-filter:initial;" class=3D"lp=
-rich-link-captionBar"><tbody><tr><td style=3D"padding:8px 0px 8px 0px;" cla=
ss=3D"lp-rich-link-captionBar-textStackItem"><div style=3D"max-width:100%;ma=
rgin:0px 16px 0px 16px;overflow:hidden;" class=3D"lp-rich-link-captionBar-te=
xtStack"><div style=3D"word-wrap:break-word;font-weight:500;font-size:12px;o=
verflow:hidden;text-overflow:ellipsis;text-align:left;" class=3D"lp-rich-lin=
k-captionBar-textStack-topCaption-leading"><a rel=3D"nofollow" href=3D"https=
://lore.kernel.org/buildroot/20251214170654.GD193459@pevik/" style=3D"text-d=
ecoration: none" draggable=3D"false"><font color=3D"#FFFFFF" style=3D"color:=
 rgba(255, 255, 255, 1);">Controllo se sei un robot...</font></a></div><div s=
tyle=3D"word-wrap:break-word;font-weight:400;font-size:11px;overflow:hidden;=
text-overflow:ellipsis;text-align:left;" class=3D"lp-rich-link-captionBar-te=
xtStack-bottomCaption-leading"><a rel=3D"nofollow" href=3D"https://lore.kern=
el.org/buildroot/20251214170654.GD193459@pevik/" style=3D"text-decoration: n=
one" draggable=3D"false"><font color=3D"#FFFFFF" style=3D"color: rgba(235, 2=
35, 245, 0.6);">lore.kernel.org</font></a></div></div></td></tr></tbody></ta=
ble></td></tr></tbody></table></a></div></div><br></div><div><br></div><div>=
Could you please review and double check it?</div><div><br></div><div>Best r=
egards<br id=3D"lineBreakAtBeginningOfSignature"><div dir=3D"ltr">Giulio Ben=
etti</div><div dir=3D"ltr"><br><blockquote type=3D"cite">Il giorno 26 dic 20=
25, alle ore 18:46, Dario Binacchi &lt;dario.binacchi@amarulasolutions.com&g=
t; ha scritto:<br><br></blockquote></div><blockquote type=3D"cite"><div dir=3D=
"ltr">=EF=BB=BF<span>Commit 7cea8ad66aec ("Add conditional version script su=
pport") broke</span><br><span>backward compatibility for the RPC database in=
terfaces, and indeed the</span><br><span>build of xinetd fails with the foll=
owing errors:</span><br><span></span><br><span>buildroot/output/per-package/=
xinetd/host/bin/../lib/gcc/x86_64-buildroot-linux-uclibc/14.3.0/../../../../=
x86_64-buildroot-linux-uclibc/bin/ld: confparse.o: in function `cnf_get':</s=
pan><br><span>buildroot/build/xinetd-2.3.15/xinetd/buildroot/build/xinetd-2.=
3.15/xinetd/confparse.c:990:(.text+0x34c): undefined reference to `endrpcent=
'</span><br><span>buildroot/output/per-package/xinetd/host/bin/../lib/gcc/x8=
6_64-buildroot-linux-uclibc/14.3.0/../../../../x86_64-buildroot-linux-uclibc=
/bin/ld: confparse.o: in function `check_entry':</span><br><span>buildroot/b=
uild/xinetd-2.3.15/xinetd/buildroot/build/xinetd-2.3.15/xinetd/confparse.c:7=
52:(.text+0xeed): undefined reference to `getrpcbyname'</span><br><span>coll=
ect2: error: ld returned 1 exit status</span><br><span></span><br><span>Fixe=
s: 3f3d6e43de9b ("package/libtirpc: bump to version 1.3.7")</span><br><span>=
Signed-off-by: Dario Binacchi &lt;dario.binacchi@amarulasolutions.com&gt;</s=
pan><br><span>---</span><br><span> package/libtirpc/Config.in &nbsp;&nbsp;| 6=
 ++++++</span><br><span> package/libtirpc/libtirpc.mk | 8 ++++++++</span><br=
><span> 2 files changed, 14 insertions(+)</span><br><span></span><br><span>d=
iff --git a/package/libtirpc/Config.in b/package/libtirpc/Config.in</span><b=
r><span>index 31f1636ef5fd..e7ab2d9c1136 100644</span><br><span>--- a/packag=
e/libtirpc/Config.in</span><br><span>+++ b/package/libtirpc/Config.in</span>=
<br><span>@@ -16,6 +16,12 @@ config BR2_PACKAGE_LIBTIRPC_GSS</span><br><span=
>  &nbsp; &nbsp;help</span><br><span>  &nbsp; &nbsp; &nbsp;Enable GSSAPI sup=
port</span><br><span></span><br><span>+config BR2_PACKAGE_LIBTIRPC_RPCDB</sp=
an><br><span>+ &nbsp; &nbsp;bool "rpcdb"</span><br><span>+ &nbsp; &nbsp;defa=
ult y</span><br><span>+ &nbsp; &nbsp;help</span><br><span>+ &nbsp; &nbsp; &n=
bsp;Enable RPC Database support</span><br><span>+</span><br><span> comment "=
libtirpc needs a toolchain w/ threads"</span><br><span>  &nbsp; &nbsp;depend=
s on !BR2_TOOLCHAIN_HAS_THREADS</span><br><span></span><br><span>diff --git a=
/package/libtirpc/libtirpc.mk b/package/libtirpc/libtirpc.mk</span><br><span=
>index ab159545614a..a764526aaf1f 100644</span><br><span>--- a/package/libti=
rpc/libtirpc.mk</span><br><span>+++ b/package/libtirpc/libtirpc.mk</span><br=
><span>@@ -25,5 +25,13 @@ LIBTIRPC_CONF_OPTS +=3D --disable-gssapi</span><br=
><span> endif</span><br><span> HOST_LIBTIRPC_CONF_OPTS =3D --disable-gssapi<=
/span><br><span></span><br><span>+ifeq ($(BR2_PACKAGE_LIBTIRPC_RPCDB),y)</sp=
an><br><span>+LIBTIRPC_CONF_OPTS +=3D --enable-rpcdb</span><br><span>+HOST_L=
IBTIRPC_CONF_OPTS +=3D --enable-rpcdb</span><br><span>+else</span><br><span>=
+LIBTIRPC_CONF_OPTS +=3D --disable-rpcdb</span><br><span>+HOST_LIBTIRPC_CONF_=
OPTS +=3D --disable-rpcdb</span><br><span>+endif</span><br><span>+</span><br=
><span> $(eval $(autotools-package))</span><br><span> $(eval $(host-autotool=
s-package))</span><br><span>-- </span><br><span>2.43.0</span><br><span></spa=
n><br></div></blockquote></div></body></html>=

--Apple-Mail-04FBF0C9-EFC0-4E7D-ABE5-D73B46153644
Content-Type: image/webp;
	name=pensive.webp;
	x-apple-part-url=B9A10E04-247F-4EE3-A156-989C0FE233DD
Content-Disposition: inline;
	filename=pensive.webp
Content-Transfer-Encoding: base64
Content-Id: <B9A10E04-247F-4EE3-A156-989C0FE233DD>

UklGRuBwAABXRUJQVlA4WAoAAAAQAAAA/wEA/wEAQUxQSCoUAAABHAVt2zAtf9p3QxARE4CWUzyk
vGMAgUfUjhoddeAV4sQbtl2I22bbtkZgyxhTwGGqw2VmZojLzMzMDFevchsoc6CMYSyGejUMDZMd
NsZ2hLPWD8sjaUaac/XXFRETIDmS7UiIzMZLjlgCs7VUnx1J///3btMRMQH0f///3/+3/2//3/6/
/X/7//b/f5Eb3qzsnNy8/PyA91+3QO+TLnnyo+9m/L1i487G5uCGKS8em/UvmJFXXnHA6Xe99uXf
u6IsCfO2EUd38f6blXPswz8v3lgXZklhZPPESq8qeY44r9gdBCpOunVaSGy65L69fXp0TEtsWiDz
ZZ3yeVVjhMW+3DzrOEOLPhCJPJjZCk94dHwNi/35f3d1USFjm7DwORnL8O89OizObb4noEBnsYhI
9T6ZqcMVo1fFxNHm4qu96jNR4m7pkXE8pUd+2szifP68p6E7ga3xZFZuZvGd8NnKsKTJbSPKVKdz
XRsyu2PmCAy+a7Ep6XRNZY7i9GloS34yMkTWxXPqWNJsZGoXvalotMBjijKA77AX1rCk463X5tro
kpv6a0KfBgvCI9PfMUuikq55mt82Rq25uacidKmzIvJD97TW6+H5pqTzzVfapQ8LP6YIBdutSXX/
tOXt+toeSfvfFNvjbBHZFSDyFOeqgGdlArL+oDR1+JfbJQPyouNs8ZSYItcQ3VU9e5AG0NhEJHhy
Gso58EdTMmTTNTk2mCoiMtmfWycy0acBN3IiUneHkW6OnNEkmTPydV7KSptbbeo4MCwSu1wDesYS
EnNYx3SSfdQ3LJl18aGpellaRw871RRTFhZC5y03iMhYn5jwukHpo2JmSDJuw/mpKd8RR567TWSd
hA9HLntC+LehfqIxSRCpuz+QFoyD3m+STBx7MScVl8fizR8lrb9F7jAW4S8L6JakiPzVKQ3kvxmR
DM2/FyXPmCfxI9vixHoBV9QiIrLu3kPN5MiWB/Mc1u7B1ZK5efY+SbuS2xCOI48DR9PF3C4iS3Yk
SWRad4+D/AcskMxeta+RnOIVkvBv2cDdJNIkIsJJkx2PeB3TZUyzZPodFybnumhi9Z2AK9kiqf/z
MK8j8i/cIi6wvtKXhG41ksR7gaNzzNRJ43sBB5ROj4grDN2UmPdTSWa1D7ic320gsvrKLJtl3VQn
brH5Fn8ihzUmhQ8Hjo4x7SDmqgpbdZhninuMXJVA4U5J7hPI0SMRO4jUDetlG/8Vq8VVNt3otfSS
JHkSdDmT2BYie24rsEf+MFNcZvPJVgYGk1XvRY5Kf7CJmEvu8tpgv7ksrrPmtLa6bZRk8znQUdm0
qD1EZP3QohR5rwyLG93QN55npCR/InaU95xpFwkvuyklBaP3iDtd2y3OzeEUNBVjR8YwtouIrL+9
wkhWr5/Ftf6cTUT710gKo4eCd2BIbN34Ta/kDNgo7tUcZVD2IkklX4Wdb6LYvfnLc/wJec7cJG42
dm32x5Lat6AzXmfbiUj91VmGJeOUFnG3LffGUvQHdBeFxJnbRp3pacu4KyhulyXFjX7kZolzd9ze
LbuV/4aouH0+CLlJDhLZ9csNeUT3xsT934PcrVEniUjDy7eEBcAfkcv5wGEipiC4Ihs4Mp4KOwzD
LZ2RI+OA7fjVDYCOqNfLNeiFjgSPqMMn9SZ0fC585On7iImcPIQf0cAwdO9qQNcgdJM0IL8Zn5ZU
rNYAYyc85qpUNGoA/Q2PxFIRLdSAD/BJKffTgLuxO1IDTmLoztCAshh0F2kANSAn16vACujuVIHp
0D2oAqOge1IFXoDueRW4AboXVOBoRu4ZFSiPIfeEChgbkHtEBWgkcnfqwBkM3LU6UN6EG1+oA/nL
gTtTB3zjMwd6HKED9GLm0NPsowSnMGzRQiUoaIZtt0cJaEJGQYrVpIU3MWqT1GBIcybR8l01KFuN
2iNqYPwIGleqAQ0FLXSkHvh2YFY/UA/oPcy2lCvC6RHIlmYpQqcayMaSJn4C2fWq0DUCGPdSBZoE
WJ2hCzcANoN0sXPIHsjHbOUdZaA37AAGiNWbtaG4zgZmmmdrg+fbVMzfjkT31Qaq5BR4GixSh8DS
DERr8w11oEoz8/R+H+ljyUqoIp0Vgl4CimUZaWT7BpxEhqsEPcNAnaMT/WuAmqgT3tFAmY95NILK
WnCS6JEqQa8kA1fkN79KDNmTBF/5KY9GeL4BSmoHa0T+VqRkrEchjotBFR2qEE+JxICSeQX6MEew
Ns9Sh64hsGRdiTbczWjJ/crg/V3gXuTThU7VSRne8Lm6sH9TUnqkL9leqArnm4DxRarwmiD+rSrM
cUPU09RDEbKDKUOBiKAY+UgRDuOUmbqrix7cJpjHztODT0CTr9TAP9MNUVJzmRYULXVDRd+jBeXV
KUMLMvGjWQEl6LMnZVtpqNRtPZXgGHaS+LGzlOBuwX2UErwPXEO+DvwFHJ+mAkZD6vBF3lSBIk7d
YjTjR79ma0A3sTXf+PzPFOvnm4o0oMhOzHAz0l8DKGgjR+9TgZ+hm6EClzNyLdka0HUbcjxEA3xf
IyeVGkB9o6kCZx5QAXqGU7TwmkYM04GKGrtZ+ZMOGA8xbrN1gGgabuu14KAQbE2GEtA9EdRiJVrg
+RI1PlALqM8m0ORCNaDBDaDdoweeu03M/qsHRK8wZB9qQuFPkI3XBMr+jQGbpQrUbQlgf+sClczD
a7EyUNd/4FqhDVQ4Hq1l6kD+zxir+fpA2Q80QTVHIYiO2cpAzVAJ6v2RidO3OkHGvTi9qxR0Dk7/
1YpKSDg59/6bluTLtOJ0mPgorTgeJrOTVlTC1OLRiutg2kxaeW/moLt5avGse+O0n9ViWOZof6Ra
jInHmYwmHlGLqfEy4LUhJwnOV4v5GaN93lct1qMUzNUKY7sNOGLqM5m00ldvg918Iipb4RvUIrfZ
ccqypWA3tSje4ziEiVhaXqAWnUP2YZWy9Za+96pFrzAuPEcsLjuI1LKfjVYjTHhEW5HJxaSXgx2n
7Lf/icNrHhpokGLuH4HFHPS2iLQsvy2HdPOwKCwrjIt37nr98HakncfFYPmcKJBDCnq6aQcEMze/
1o+U9CJ2GIq0/PLujYO9pKbXi8My8g0o6l2vQZr6QDxOjZKMyTbzUNLVj+NwOpsUQ2z/hpR1XDxJ
KRFBolohlnNbWztqy0I7fExGGRDBKotvGNpSGyfFbOGMOokDajqRsvojdvi4rt0Ru4MXkLZ2YBtw
FrUx9k3JTkFBpxKPRhwoWK7vS0nuft+UmqgZa1n51R0DtOEix7GCxlqOpeR6LguKxdi4zrrwYDpq
nB/0Jaf310GxvvGlwwxF+CJN0dQoSqrRd70kzssv7+xVAs/8NNV05IDknFcjSeWt48/SgaL16Y5W
JhvJyLp2jySdV1zdzcCv53Y7kKrVaC9K5sMhSWWs+qV8+A5oAmJbbhKynzcl1Zvv7gje6aYdZOan
kvCUKannDUOwe06QrClIxHjCFFtGXvQg9zsU4YEJeC6LiV0/8ONWvMcVcUxkSAKXRsS2kStxO5dd
0bl7OlsbtFNsvCYHtvcFyu89lnqsEzvz9ajlzkHCnFZIVr0fi71/94FWXo0CizScm0OW7zFttqkY
tEOjKIjI4jyyXLFNbN7SDbQXBMhfsy15fxVbshWzH2aeNUh857HieVZsz/tiNoCR+ICs7tfogAMw
u0WQfMBK183igL0hM0ZDcbaVD8SBZgVk/jVIcC8L54ScEO4J2WmC5C5PW3s1iBPrOyNmbILiG2r7
Q3FkdSlCORWHHDq4xIhjFPbud4ZAeXNbF4WdsSofnryjfmxmZo6serRzoOzWhWGTGYrw/m10rRZn
zvWic8H/otJ28+9bWOCs6trGq6ZDxhCmvnYleQYRBV5lSRCQuf54R8fEoTdB0uPZ35evXPTjyYbx
fkTcOSc9RXELZotDzQGA7DW8SeJGRz/EkvnJcTIPiXdV1BkxqTLwOLeGpW1T8F1Ecbs3iSM5IqMJ
Td8DTYL1s3GMd8SpfD0axnMsWIePj1O62zF7DkHjrN0C9q7SVv6Z4tjqdmAMiAjan1DrM9k5wwnM
zwXtSK84E8Wx0T5g5NbCNZ1anxBzzp8E5tUM18OtClaJc59C4xeB+5lWlREH3QhGzm683mn1qzj4
fDD6hvD6kYjONJ10NBgHRdBimUEUmCsO5v5gnBDDax3RQc1OCueDcQpcIlHDGCVO/ofA3DeCl/Qb
FHbU62hkbQHslrfEyXwKGjQlrYEmn650VFMuHKPS2t8XTRpijlrgg+PZtEYYOsqAY2has/Q2gjMv
rCuxgXjQcl35ywPIN6rC1xOgT6jKrh6InKoqvwQQKY0qCt9GkM5MW5chO0owuZLTFfjxAmHaqSFd
hR+N+4OSMzdt+TkrGxRjuJaYRxGqx5hKMplg9a7SEbMSF7qOVWRpATB9dmpIdB8CtmiFhvxAyBoT
FMQ8ERq6Q0E+82JTEVOP7R0IW2OVegw3wKFhCPE4Em3vQuhWmhkEcs1E84E8fC3B23+30zip8afI
u6IMH98qhMgTO58Afsxp5n5iINQxpBg7+xPEs/TCvMzA6HkXRTdjCORTXVS3wR4olQXdE700nkAw
f+memn3DwOkTnZheRDAfIg5/NmV9OcFs/OY0U4MnGTBlfygaGbqRcD4/IiKsDTwiC6feVeJO6Y0/
9xLMuX+JRi7JI5wfiWrEzELC+SQWhdxSTji3XyP2x5/FPQjndrPFgVcV6LKqNwE9UhxBEbpuriCc
fXfEEuGMclGDHySgL4xK4tAGfCHnDB9Oxqk7JaMnoIfd+xPO+zeIywZqC7GImFcSzgeuFWWMiIi8
STj3WSsOpw2q43gscRfl4zRolbiH+XdPr4vbE8wVi0UJ2dru4wjmo3eJRsQuIZQDV+4Q22OL9a9y
UPKNMkUll+cQyOetFhtjxN99GwYRxr6HWTBn29behHHRZyHRyeoDCePu08XVU9jsMsL47CrRCfP9
9gTxgDERUYng8lu9BPHh20Qn+bR8wrj9GrEhls0zCOQeDXawnK8ilEv+SSc4UdcLJuObdGLljx6Y
6FqlqP5gHwOlwhqdEAmN3s/AiO7WCpG6C0DqWqUWYt6JEd1ogbVBzLsx8kxrwxR9DA2CiE6IteJd
IYWQBzHyfyUijY+/yXaYds3FiHI28z9XdKgSjYx2w4hue6Msa7y4RMSQB0Aig05pcQty/uk1ibrV
CKQUUNXJpf4TGJIKd+/rEuVOY50wT7OJcl+OJdTIGiD3+0TGMy0J1MwWFRxmFNF5piV+a5u7oY2x
VtH+a63MP7TJ3fT5h1fUfVFb9QdUxnRgmVnU7hMzDr/kfUl0cJFb5Lku3Gqmh+YpwSS7yDh+jsjm
vtQ+pAHbRT7wiyhv7PhCoks4A6HHKpFbHSMKENFn0ua/RgSNSfgYz4god0Fb5m/rblvXKhT4Aed9
67WtfMkeEMYPzq/tSrYbRefswSD7LoK+239hIFGkHXR0PwyZuQK6vWpggEQDkcudLwoYy0fu2qgG
LCTgu28VDRwGXGCyuP5ZgTkUuAuD7q/EraW4dW6StnHuPII96xtRQJbJhPtZMVfEKE5CB+G2d52k
01FXzOJ2X0ywe74XFfwtG7e7IjowKwDbwSHRwd+yUTP+ECX82Qta1pusBW8S6CcExTqXQEvk4zNB
671O2uZW7pdlBa7IwSxnirhtqCpSSZjfH0kjNBElsYhMysXsxKikT2YXRfPCDgR51lJJmxB9soZs
83sQ5LlfiTtnyXeJwSZOxkd+wvwmSZezm/RJeY4wr6hOE/yiHZIl9UnMClYIoH9JchZmj8QQIXI2
FkF2SFDcOZuS8gOEeKflYlvECApanYdY1seih3wPIf4AK8JYP2IDt4oa8peFBHjuRlHD6EsE+SsC
IRWEvzrBD9khIQyudGb91A6Eed/t4ur5KjezTLhscIAw930mOvgnwf5QVAmi3VE7qVFsjTFyHWgd
G0QNRhuQ5U4UPfhfLmSXmnaztrYMsSH1ooh8LGCe78TVU428AdjJoSSYnDz0+JI6qvDqsEMS52Dy
CD35rFDuCdcDksRgvbiogs9Hq/e6ZEx0YxTyJljGSkli/TUM3Wy0NibjucniwitpKcGKnuXEgsdE
3FhytiYPgVVQndioCxi8qgBW9EJC9R2GC3jRQ8Hqw4mM8f6BV8K3gUWPJTK0oB6+sWhlLbe23X8Z
w7cMLbrVEl9Bfwj8LT60jPlWqos7xfCLlaNF+9ZZ+M53huDPQ+HyvmfhInoyw6DJHXBR8bo26vJo
QoY5nSbMffCiylC8N8i/y9UUztb+JsCzZsQJHkgnMmYxtnQXYtSjqtWKIhoJWnPYSlMfyOgmFpER
ZKwVzLc2WuBnCPPCWSJ8APWsdxf0sfgfC4uzQaOynVLroWND7qLRv9/jNvhagv0e+Y7oegZt7kVt
/RjALXve7USfC+i/l0firW9PwJf1JW8LatN81XH4YgM5IjpeUB/vmdoq+hKh/zBs39A7LCKz8uC7
H7YP6U4RWdCV4DfWuyCog628QDeK1O5HCnhm0P0UfQtdxjXHGRpA94cSikLEQ+ns2K2kg8arCa3H
aAgde0OhElDhBLYWm5iO0CMSID/pYc4Ua2vfSUOEnrUGqWLX39jKy+lI0R0eXaCiBRb42I/SFkoE
Lydt7D6V22jqOCpdocSO83zqQGW/m/FWF36TrpTcdjRpZLt3Oc4fgR+B4Th/9iWdzH6xUYRljOdn
YGIsEh7fkbTSODMoIkMJmCiL8PMBUsyKaRzMpp9wWW/KjqtJN72P/kT0Ay7TYlsrDOUgTznRV7gM
69GbVPQzXG4mJR2Oy2Fa8iwsTQEtuR+WN0hLr0fFrFCTs1HZlKUmh6My2asmFQzKK6SmBVFQTtET
2opJc5aifInJO+SyAVZQOCCQXAAAECYBnQEqAAIAAj5RJpBGI6IhoSRUClhwCgllbvxwOajADX9A
gbW/QcP26Tg/93/ePSp457n/jf3vze9kPUHnKedfwP/i+535v/7L9gPdH/VP9l7AX9f/yH/G9s3o
m8wH7N/tv7sv+y/eL3Y/2v/aewB/XP8/6dHsjf5z/u+wh/N/9d/5fXp/eD4bv7R/4f3c9qb/4ewB
67XSb9Of7v+UnvP+O/nX+L/un+K/3P+G9Sfxf5n+6/17/Kf5/++//D33P5nv3+h/yf+7/0Xqf/Gf
sl+O/uH7g/4H95/up/Ff8z/DeKPy7/u/UF/Iv51/mPy9/v/7ie7nsTLaf9f1Bffj63/qP8F/lf+z
/ifSg/1v8z6m/XT/a/3f8sPsB/nH9N/0f96/db/E////ufhH/L8Ez75/rv21+AH+Y/2v/k/4z/Pf
t79Ov9P/4v9N/s/3S9un6Z/l//L/n/gR/m39r/5n+H/z3/u/1////9P3i///3Bfub//PdG/aX/+E
lTDuXiMfKCAUw7l4jHyggFMO5eIx8oIBTDuXiMfKCAUw7l4jHyggFMO5eIx8oIBTDuXiMfKCAUw7
l4jHyggFMO5eIx8oGAd7M8RjuzUXN2dJA3SFcl1LyQVHeZMRj5QQCmHcuKjjq8vRxw2xrFw9axiU
H24kyf+Mfwmi8ff1paPnF0zxZ+no2dpMUZwzMNpTHZewncvEY+UEAPMyTIGvHYSqfQ47e1nIMo4N
xIFBTjVsjz93puGeEi5VWx4Qs8C6M87ghHNMvBk0mwWViiDI45Dp4RDK+ehDn6u+DqCAUudM5udI
E7xYlvMo/F6olv1RlByg+cdEW8LtEEb/X/hIxYtshvB33U53PA5G85NWiekpiZFenPDJ3LxGPk4d
5rxSsp1101BHn1yA4dmNGmo8FyF79ypGdx6KtV5otyuwMfu8w2l6Q8qH9ufH3d0LyYiGTuXiMfKB
GUU1Px7EpXfd6sTk9A4RJLovmlCWh1v3hUWwyafdVjfqyjWPOp/6u+DqCAI+GftMupLiSxLA/EQm
WE1a1PSSuruOnzRtXU89TI/9IduNSTDNKUE0QCmHcvEY+TcyFoxjtCoNQ6vArt6R9bI7EBGKKJ7R
Ogii/K4KXVfkKOMvxQ1npVJKdfQwWa1nDeKEQVdZaRld7PmHcvEY+UEASBGZ8Fhx/KlVkSIFwpzY
Dzo0cl6Eb9lzgTZhOGwoMYWpFuzgnQDnyMmBGWsPLIqHzJiMfKCAUwzWXNe2tIiv1+Oatb6k+cot
6rYEm89ddzbLWw3zqxvXaarSw+ZQQCmHcvEYRnZoir5NeMUhNKusZScUWzsoMB2MV2U2KKBav9fY
ubLX0w/fdwrm/sEx5qRKsTR3sBHQzBpvi2CTP6u+DqCAUwzEhwbEo4tpcVIHIQdxBDuUtzSUeCXb
932RZZL85PE5RRGF8F0/fR/7ax85I4d38UJP4GaOfZYKjAblWc46ggFMO5eIcCWs7juK4VTWXzgO
5S2qD5mITT1HuHyRXuqG5iMnIqLt87oVHuBbaba1m8PPIUMvpyfxhGfLaig5M8ISduxx5G/3O4yO
rHDrSlF6IB9vg6ggFMO5eCPzbS2lRgP5LMfQybSdeR75KokXJFF5VcN+he5fHElbILj6tewwEI4s
VAuadMOJ4FkbqFm6eTIn4YLBTbqH86ObNDl68U+HcvEYRMU0M1HO/eUksUENBW58kLAtX1Z6Fxdl
Z4z2tzSDw6XeqhDLWnigMWeb1bHU5ff17wUhRJA79qT0PaKLXNha+yqpQxN0haNrBBK1riLGtk8l
8f2MvmM2L3XVQQCmHct955qzR1i6o/r5iQgu1n5T8qDoZbJIDsRcUGfp0Tpb9CHCRAhmzNTvBJJr
2i5AmXKh4tmW/8B2YjkEs5MJMHXxUK1u9Nw7U0SXW9WcNRtCozR0hvIZnw7l4hoo44GG/8Q6rHCy
hBJIUPMLHYrlYve50ilaE2YQbwiPASJSj53dlGfx9xpk+7OJNVMD87M7qG1FN2MqPQSZIuYZ/IXt
2Vz/lsQirvfBfFihoT1j08m0MH8UCdy8Rj5OVFoPs1U6RJbXvH9ZgRQUdV5+eE9bYx9waGMWAlsv
f5sw3I6heEvEUlgm8YRy+eILlkBwJn+GrHMaGEdin3lWf9QYegizzAKYdy8FmEqoUJcVF+FsQYIK
c72Wnb44Xk/7v7hei5JiJPYyV1TmsSd/G6zfmwHrNwgavGOhWFMu7+Wi98h3zAdVEHJnFMh8QxBn
OR6YfAjhl3wdQG+eQfLB7A4qRAiqbzXAKIaPxfpgD8uveAbVqwZnjgXzWe1gR9DCwfDwZtX3ec7Z
TKiaw1lpJCoEm3R7Wo+jsFnF/IpqD3p/JAEqPX4SfJMfdQQCmHcvAaVHQ7pj91acIJou3/aCbXT3
o0AUgmW/R+KqoyXzspHjGrFWmpPTQYkNK4JcSyAxVnTmqEgv1TVB1SyzRqOKtuTMwpSPqUpcfjcI
y+xeV8MD2rvg6ggFEGwqEEZmB7z4xW85PrONQpMd1WMlndcfc3pwUk1Wg/Igo5CsjwXS6pTpc/WY
kCA3WhaUDpWXsvp+uV4UVMgLnSWntVc/XrR/q74OoIBPjuL2xiaw1eFFLaL4Wy3BX1lqXqM8CS+E
bjCI8ZJD14WZc5M7bZKVZfRfF8/Fb6EbWrSD7xAQ0zNmO+oNeEPbHNc8c8f6u+DqCAJIrTQr/O4O
ifLOIwaihmqt5YuGzX7Is/C38KR7PIcG/UJDuDjMM2Ez04oyZ2swRxMxRJgpGJ9l4SLPpOr4mAUu
He7FM9uZthqs4E5n1AvvEHyggFMOwZbUGRYpBoPjy4opdzU6TPX6MDu6z//4WQemesh4v/CvddK2
57p0O9I9XiLO64l8/ycfceP7FcILcxEjUTRe8ZHyggFMOxedvUpNGRQyF6ZpyavmsFfbZWExxgD8
F0mQSuaMkvDhsRRNHKdVqQQhk7dWjh4Is/QJqaZEPsXRYHZo4Zd8HUEARlnQI/A0GCkRtTLI23ws
i6NX4eki45Ky2P4F4xqt7/lwCAU4wJh99mH4Tn771ODhhD7j9M7MX1s8MncvEY+UK8LjsdFOiNsN
bsVXBtVxogECvhNnMv6DoMAKK2XgTApYSAtANWh7U1XKrvf9IeBR4KGTuXgAAP79wvAAAAAAAAAA
AA4H9ytVjFBfrd13HTFU04QhudAYQ4ov3xWG4KJQr9Y5tg1hurTlsVJEw0JmnH9JVTLdJ7BxmoSP
dez/2ZKdX4oFwwoQ6iyah///xem5hJ8Dd1syaMwxu8HdK/bfJGJzpkB8FTIwwe+9DeAEx28r5tm2
Dg/kLco+Xy/tildAzHxUMM1RO6H3LoZslwlvzeTfQBPzjQaoycUR3vEabwK1tR3qBvHTlRC2ebck
sHw1JHvQGXH+Rng76RfooULy8QXxEHkGMXnq5aEdFmnec4f2UwNQ4gSSkuIfPsVMMgDbO6SZnUmu
ExRvCaER2ALIa0NIHK448HtYwy7ziswBT8kPZv/ocdtyy24/deb+KVWfaQ6+/8/JnHy1hVUeaJsh
jCWlOu+KleYYcm6rpOCSq9ta6nUiP7n9W+/nocFnVMQu84vbJhTRhwWX8eAN6bs9ouJi9Eb/Sr0M
fI9VF6uFLeZ5CZs5Ol6APSi5vysY2i/tYF97RhK4bzpp42s+xTSqym09e41FOIppBq5u7duq1BSq
9ZeJju4RfhPMCb/hG4pGh23Zf/+NkxeWd+tCI4Stj00Ik3rwVNE6Sn4+oEmkm8Sx4Q1xf/LSZcJe
uRp8AXCjAQ5vIOMuSsa24NEzBnYk2Y6WNYdpfZlrcCQL932Rht/7zZInjesTZtkJf3O3y4ZfCTGn
8ybzDUwohrRjw56X3grmB4YaFNaW1aY1Kjv/oU+u5SX299No5SduJTiPeBwfLTeM35X0MvL6BtMr
7qJ7+UCQr/mqbLixeuf5kivkTJ2/v/+NDuqDUKrVuwRYiIWWMzanzcUC5GmYpxWMBptSnJrN5nG7
j0HAZPMsxfbGaLYDTG9fIXCT/ugVPxw/AliOYY73a7eQs/x8L4AD2fVVfR35A+mtrR6LcLmjnlOd
maKGElYgO/tKJvArcEW+eN2VbKLaxZLNdeNe3aa0pVpNO2CCCr2CBVHPJIiT/yNcj6x4Xoeow31t
ydTxGEWpDj/5uErwFkgBDV2ahX7+8/NRV6HTD9htWNmzhUEgjGhlZUU3wc2x4OT4McB7nZcKdYfX
zDmjkb29QDBhrjLRYiTBVuQDNo27iLJkO6l+XygfR4hi2WJP2mcbOgsPfAQhhe1dwz2yqzIsFFug
ZGnPdmEYlxU9nnhT/qSnvYuTHaZ2luUVHhErXvMwFp2IY1nwntUyMe8wM7xLsw2DLY7Zm+mbhfbU
3Y3/wnjyoadPUC2UrlO8HK2ePoe8sYs0sJFwLxAWVbhMl+5GLJVFypkS+D6hVqRsJxW6sXIqO4C4
2xhyajr6IsBL3mJoSsk3FiJzJBiYDlOS2PeAAEaZ3L61Dz6dJaOTBIz6lNuJypaLjN4lMcd3r7Fk
b8T5RdR4sbyTeM0qnipsfJ8Qtr8Ta2wEgWOnWA0IPcnnz4ObkkYLtpLh6PKBqnSUnlRZCIWEiDPQ
n62l3WD5y7ZYl4PAJdyVd1TV+Jpvtn0TKFFQZBqZaXZ5lWeKg0OlAu4Xrku8SrK7yl4Q8bgjV+dT
yKvObs7jCxt+YmkzElDMLmN5QHK6cGYRuEwEwJD66HQ/xgaX9nNL4lWpZRvlhEXCopB73/GELA3x
IlmfgQLzuT4k/vLBUzpFCq0nd5Iu7u8y4+DCvh60Mqqb2yNXwWnexUHO3K6QUed6/5Adc/qyyEYZ
Edz8bmoCqfv9BQC1X8lhFPYDp3nLdk7v5D5+r5m6zSvzh1pQaZ0bCcx6XXw/bUjv4BcKDgCTHrxi
FZvBr2sYvijCXiH1LldPnwdomOx1t7H3RnvRsKnWJyp4JFJt9J01uMaSWVy0+hpvGDSFcnVrzNHL
Yb3RhUltojOs8bZRNYzh7WO58lQn9HF2TJTsgIkp3Ugdv+1o1EhHwgMykYCNLUM0gmNVJjgRAoV9
Gr/luRCSR3MCzuD2OeWxia1fybOyXqhecUhF+NdLDzGo+tJ4MTpmHDF6cG1cMjJNXJEmenk+ELTk
AG90MjjnnY1TegnYY6kZddGJDMaIk+fchys13DEs0d1TTFP0/w79t+lMmf8goOw47uSTGhvhGM8M
S+iDOCRTAjoaeERLCvZpKbvbh6VsR6C7JLO60sKjZNE2TI3wI0VJPkTaPOs5r4OC0NkcbqA20tWN
lX8lY23T3npAVHQVcv8TKraNGWTmOwfgq5gd2179rOAxWuEtXGGpQfoVramaOQPOLY/qKAmF6XLV
u55AM3y0URz6pEHGniw3CigDbKmk7Z1kPXYoCDI78iWwXt5rzRaW/7VpBlHSXqM18J/mbpV2FUlr
UWLt8N3ZoH7g8uvRe2Nx/pTLfYygNTXFPoS5fO/8S/nezugHr/+81F2H92yhvSSZnR6Zl6PIxgAz
WeDLdzcepjQ3mROm+Usz/JpaYxj0qhfO1UR0jxPOAfyepKUe4RlLMP+PDq9rqK3cSBdsQkML1sY+
k0iSaobaJYUii7TY/dJaDJN1jwb59waVlCv3qzQhl4d+XdGhp8A2amEIwuT/9lOJMWj4tGBI/00u
c3V9IEe2os0RDJaWNvQPW80QGE6Cw9VgYoHLh6eZQijd1mniPPVYU2Gr8T48BEoOs2C4rhF+h0AA
AhiDvYOQS9IRAyZpjZn0gpZgI8d+aCcriWR1yAx2qLN0pTodyN0QEZYg+6Ap/QTk1iRuNEAh5Cn5
AEDPvOXk7VZCWJvLW7bxYil73vMMIoxHnKC62MZ+QZstO/Z1EaSJTUGmLzHjh+cacvxNzkNwpdFp
Q2MBxspMfZnMe4Lud0mVUWr7T6I2dc40hoY2ImguXIl9Hj/8Tailbj3/jOxXlMT/XwOUsfM/AEWO
KY0L/qiiRulay1xE0AfMBnKTt3rmalHGOQItyZ91NOZV3EY/zsI2o9YhMk0VOgTyORx0R3OmLCbj
fdjq7UOMc9FWaQWkd2ikShcfhHg6FcFCWwJWk2kVZNiBmzn4A6bp3lTq8YZxokz9VcYRjkp+6iBz
WClyOV4tFamJONiQN+ia8Yd3xh7poWGc2hvfbe6kTKsOCSBXHCEHqTdssdSKisB9aWpAuakh+sRi
SeqmfLwsD/RBB6pPl7CS3QacPLvMXxDqTW5pVPOhQDT/CgbYlKYw0ENin5LsuT4nJdxCf3nsPRU6
HBdrCTCJu66vjbQID5xAGKeH9C6/cWeKYILHMOiUhO2r0KdQiUCqEU22tgjD661rublwOwr+Pu4x
LuYhExG2U1bixR+a+rmNWlwKuCfmxXnu63d1cRmyZcMqgivQjmNJt5MMF3JTSrSFN9Os9GstJg7x
HcpY/K9c6nil+/hYyMH251Ej5KAfmwCN4XY53ZNak61sB4qcHoxqQnZ7SH60NgZWdt0B63ClGEr0
FU3b0HGm2VTzVl9EbO/j7nh3kUaHTISLDS/j39QIwVT0SdTu4Xj+35nEdc2Vn29C5hz4jLApRnr7
fjXT+NfPkxo3TFLLFSvCNB78jzcJLnZXFWDuofhwuo5babOO5pMLHb1Ua5thf6dL/I8WSeDsXXVd
UrIalGeEi5VrDZVuelRyJWBI1JwWzLn1S8CZ18Ncekj8ZM8LRuHlsNeTi7rD61cB+fo7sgO7O3iK
eAL05brMZI/mN3wDYWgHlZIf4MSHbQpMqnvOc1YqOcernMt0AA+EYPMm+eDWIMVD4Z2WtGerKsNQ
nmWdLNKikLaLUMTqWndgIge4tUgJNDxPw5y0beRURWdoOPBvSiSICKfTRh9kp+xfCD+3+wOOS1Ds
2Fnj8FLx/KwUGZvfaVkK/Uz6t9SEH+d2cT1/m/kZ9p66URXI0lVQKOuSX2ScZspzQgGUoQuqPucf
wAZ6S2T+6oRbHnU+mjArEkLJTRX8LdSVynkvxpok8msAVvoeiyGuOypOqcyT98AJpUKLE+sXYotC
Cuyeeq5WIwaCABOAAAEvwo5r4KPeY+dIdt/fAZ9/JFrgNrGzf8uDhaFWJPyS+nh7B/CoS0tlqVqy
fyIrIqV2j3tMomJdDn4duQ8dJcM/XaIeQKQCTaEHMF6ea77SO3iGX7hjNJ0VY/QX4ovX0zuYBJVa
AtsCb+9Ba1SdeIWFOC9ySBFIUsgKYkIYGdEDLJtComY2ihWldAA2EG/sl9PO+Sf7QwxHA/eyRcJS
HuODQL34hiyp/tbm/h/EYbVNlFvdmiwdXpfgATcoBTfnF81QqIfaxR9nUK94XtTuVkJrb+Sj2+r3
nPoZnOSQFMajEcpsTUiLilRCf9+y5vG6kgyEARL6d1VeEu8S3rg98tsiPd8LH1sht0/sZmHosuJD
ZfmuHLvottxGK6lh4I37Ld67J4uC5kmptDsPh2VJ+GcmkKXwYUAKE5MCMzTVPIV2X7/DKEHlFVw5
apVoINO9cT76ZwNLE8DaFQV6sTBcaH9OObQc7fCoTGlTS8pvh9zpPIgNOZRepGWGI9lciKlnMwq8
3Db0cYVz8yIskbcek5cOkkICmrWpm//R+TCQNRiUf4J0smVjW9z7MgaZqxlush3wfE19dxVSXKTK
2jEwYf31QDsYwYXHGZdd+5Rw50Y9+9hP8k3Zn70Hv/qm1tgWXZaBZ9s4v5/6qTVWF8TcyPreGe50
hdIqYpew2HA8ropDJYy1NTBilbZmbREuuAON7QnrtVXt4eRO3ONTOO5473VSx4NHjL8KyMGpH2Qy
3DWQaNolr9r3TG8ghRJC0Eb166Rv6aDlwRHBI8iyfF5UwEmCrugVRubv5GvsI3qgocz6V80F/H7x
pL1jqYkRTsBxdgpqKpFGiH1kYI9b6kpYIQACQU9n1pmmJW5jYGL8ayxEQMNdaHEhYyX/WaZpwPW7
akVrj1/D46K6kUaOjo5H69KQnbkGI0ZykdkWxhKFY8q1Z4fTUiXWakqJGcxr4y7zqnm+rkSIy7VE
LSRzC9IX6acMn3zfmTnzTaHLocrsgKWsVRFVysQ1WXoV68WNuMlf+Trv3wWLCDr6VEqo/X0c8KkK
K+soluyvfWDclhhm3yQIGAATpOR6iq8yLkmYedhLqZsdkH3WqlfU3gfQkklAyBQU0+/ygLMCmw0E
gi9DEjfHtisD2A2r2XszsujUWgLmD34H1Bu3uluIZElRUtk7MaP4rezVpcQa8/n5EfHs7Z1PORXD
fOHWCrw3ak0Rjk5lawq+dL94S25h9wiXBBCJJ2zxO+T+5e1Ht69ErSUeEbQEZz9NUM621GU8R0vp
obyXRa+25nhCKj8QMMNojsaNub+VKu7YU4abN91IFvSVfcSSwBjyM4orGyEmhxCEWc4XxxOP9bbj
vc6gdp6yCjdldO/XXsQNh79OU10bmkp58IEbylBrZIsiIRRpxTrBDGvr3N4aNhiOLOsVYoBBNYro
I/Mz8hh7WvEw2iD4lyK0kRXEWkAQToyFHWnT9cDPV1Clbj4UH9autUJStMvE36iUFiM2WguW0YAx
tgZEH4dQ02s4RH2dnYl7PrSBYKhjVEC65rCdyGeHNQQnv7J5oC+Un/+aQUywRzTJkegIITnYnfs7
LDYoDjdR+W13mUjeu5x5Ln1gt3SbB4Pvp/FNOEyBxOFDHdVOe7X0aO8xN5dvW4Tdp+458RGcaeyE
dga5+M/8ozH8BDgqAEQ9GDh/Bc3hteBHH4g19u1ejISLZVaI4d9BmQrFZMON82z6wjD21f7LTdmA
bOjkaymXG9axHfnfKfdSEERpkJ1rz0NuZurNRH3mdoFiaLUTLYDT/89960pYal5zJBh09n9uBNGi
0LvdMA649I+PJie6QfeVsaJpoBvuLnaXkfLH/1b9hz+CJDHXMWefaDY88jpGlMfgd7R4WWziCpkt
Wij7o+TIZ2q214pxRW0Q4qhEYJMfHnsm6BSpVaCIrqZYR1XDElOi1JO4zmu/i1eh3clkpbMsqASo
rc+uOgWlCTBRQIaoGlLQB9FMf74+v+v4lt5UUsGDWj+GoYot3vzDjWDqCRWlqwR7wD9vZaiIabS7
bisSPkW+igxqmV70BZPKjpXR8VEfbfIh6BiqZ+wF8umHKI+btFqZo184vePDqngsIsQMv3Sr1I3P
iF6BHgUzOZ8RF/VuqS87lzNHgiAVd0rUlBX7XZ/uWgf1sIYlfOo8xuv0q8zAqDEeZbmPPB0PpHHZ
MCBR9xyp2IFdjh2fu7jNesxGrGf1ArBNHhPbb/XQhjFoNU1z2pPEJlWKGerNBMmYhhdjfbgwwxRF
dTr6WDSp4iwok+VLF5LgtBNyOEezUc/gF97HRwqtIv7zsEoDf7nsTYtJYwkwSHoEEtrrJSfUFOCR
M4e20uxKDc3NgNKC5nfy8GOESOw1Je6A2jzHLxqmGndyr4o9pnuNrOFGQ+5wsM5eHRdJZXi07DOQ
gunvt8uHXAjT8ikV8yIQ0pSSJccrGU37K0OG0Dbv+VXHiUL8wzHUFVXwyarrOIQbfaquzFmpIQnD
u1RN/tSAevFvmEKMSudlNt9qn+/IK0ORtESZebImagkGQjx2CXC2BEgR1OZLF1cbEBbk6IvEf4zC
ADZjUSLSKKcT5pwfB1QA2xMoV89WSgUH8kdPBOIKNLUO/VhvpmIG2Gn+/LNhuT8XnZrpurDLnfpg
VrF9ewKyMLDGZ6YtDneD0Vkn9F1xpO056BJw61FRr4bXYIn2jR67ijmtnZp/6Ya2OzWYngwlCEKw
H9qzn7xdU/BG0AlG+HZTqP+WEm54C/sVHF8EGkrwU3d906pfvJetfBThRp2m5R7UEOrTJfA3pbNu
RdEU+zl17Oa0f0AxNAQmhVZD9OuAxrdnm68Bm9UlfVrI43q/0JA7RMQjp1LCbY3gLLMAR+NiGLTw
8IHge3DV7iicJA7fmpQKTQAPjXIwJ1fpM1AE1xdMOjKgXuK52oS94t2ejC9yQJpXJlBx3EM8qhSP
yERn7+qPh/mH35mMaHeNo/TbdSFO/vvrOAo27xoACZa1XN3b1l+PibR3JPBBM9Z4RS+S3NBfmk6p
GQWaOZceH8aHZNX7kQFp4z0cEPXLhLq3YwhYf/8uN8jUGTSxB474QBbpX0PzY3AU5KxAnOcRhK2s
97hcb2/RhUEGiyOPhPWLbIRjQWJfPArhK7MCWNUAqjHdWkyy52TMgC5hH1V5EKhlh97yhMr2CNIi
DmUFr90nXgke6Z0WLV1cpRcxMmYJMiqN56cFI26xllDnwsKfyEid3baUnkoaOcgs7pkM/fRROg1L
pA1O8UZN4Yz+XlvGgvfmGfbgbVXc8kCRwtKOTa1BqjXDig3vayoGvGKsH+lsm8NvC/6ev9EW0naV
O08c20DQq2OZZzssE/RcSPaJTUn8UksukaKHu3mx/YVdkqISd2EVt6ll5hC9L2kwgOQwSC6XaXej
HdmPVU7+TqIDMae6arSEwE26vVvwZ/m9eV+gUkb6BBNr+H7+2+teAlNWoB6uOA1ga/U73BXCGPyr
vcEBBN0e0J4B+aCThFK/axpW+SfyD0x1SprbgVESZ6L0VLKKuxar/YqCB2aENatASYIc4pp1SyhU
4OdXAGZi+Spkb7pC+4p/1hqGuwHWwYWJODs9vUa1/jlRNhb3Ztiaa+jRiKDHSgDpFIsVquAD7C7u
PgPldZv+0YNOLpCxdxAFHMaKHs24NtByqfrhvU5pHisLADewtTo3w1q8hoRS4j4q/Yc3k/WSJPLJ
6FRqbLOrsO+hUKfahyVcRxIJeBdWm1UdaEmMeRke7vxAiAlSujNlEa7hvobTgbwV1R0Rsfjgx8LE
W8bxxGornz7Gl/Jlvfxa5mwcYzcfKIiiANX/G2pNLGramSDNYue0ZNbKZYv42g2Su+ay6ZmqcxfO
eZmrgMJslKbZGm/x0jT/fmASkDy4ztIM3p9MYkjCdjN6Brvl0PUznmmwwh7fygX0nUiPCBcywOSI
ASh7mzP6nb+aomL6nv8KMRufcgM8JjDz2003wWqeKrLzm1crc7VLHFnz4OvqYsfoda2+f6Y8GfjI
bg0eJ/AT/eT6Mutodq2XU1CxYlxLTTu87OqSZ8c+ORLGxG21hJrM51IXZ3eUt7YwWioh2EUf7GrG
BYSQPTMB7bbd+EflmQVTF1Y59vwt5lgyTDwjAyx4XXcHZBRanyodskUwTyys3lwpE4tJSJHZ6djW
CCRglpPuriEGW2GRJvAvbv0T8uI936w0Dyt9AK988giySxih1EDq9glWmXjkX06bhjO2iPbqY1yC
YhnlZYicj68fLCeplO6A18tFmYvG9yTi8z2v1vzGmmv5TEvkSB7Dcpg34lF2DPniduAUVcf+oPqk
bBcitm0eiFUrhrsi2IPh5gvpTiNz0nm9R0GI1AFzr5M4VSfZPcvHHm9gTAseOe4VugKDUGc3efTV
55XkRz6Tq35iMHE6l5On3plp11pcWlxf2fdpMOEvH1QHMnIWeos+UQPJ+0dpl9DG4IW6hXpAimk8
40xxZrpXxM9r/8D4nJC0+TaPLQTtVKO1p6tJISsItRgmhTtRUItWrq/45CbNzlKtwYKZr+qPp3/z
WvNo1Y4wDsVs22mE6grBDDYyWHdkofBdqkifXFXENfN+xclBtZiYZcWYjEhBaLWQI5Sd4KnfQ3gz
m6rNAbT5SpYIn/0DA6LMxS0x380JXYJRNZjt7os1jUWmF5ZcVSbCbRbPPCs8oTTWzXuAlOuOMxgb
40YjCZu0t4ODvx8tLvV7N2VkwYzpqpbjhLuFMT589B0jXUzTLg7JGwuoTjBNw1KHp3e6oCY3Lmdq
6Hnb6QhZbyynmfX8Wd+7hbWM3AV8/G+9p8QgvSS25hrIFh93Sh8d7MZRHzfw4ftYAPmXBPNjlC6v
MGcwiCkO5u3SZv6lwNE3icGV8adPlcakq1EmiQBDGrg4jI2PKrNVPsDoKeMIXo1Sj31FkoifrBPg
d2OedQNBtAFFp6F1OP8qksTHhEszC54RVJoHkl9npj5x31fI25vxSIHgpDfta1IZbIP4pe3ZZvFk
jIN9JEzAoHSGtMQIPCnHc5dvBQk3iw5paeDcYEdDv6xADJxkSjfkakrIOpOYez5azqnR8aDXfwng
RjE6NKZX2pCFwY/eNAZhQg52cvwWJNAkBltYZHXVX8PnjaMLK1IpxyoWMNKXmBtxd6ZJx5g5urdy
CGLenT1HN3oI3mAIblUkT9XYj17i1tX9CDuChPtLW+PrddaZkOcyP2dPl+fBnb2GIzYkSv5DeDVN
IJj9NcNPyryZxc7iRaH4cbgy37HO0e9E5wxXil+0yDNaVFQ/64vw/RFstGBk21fCL3DXT8tlZFz7
JXK6I9vdNCvQqK2CtrQcAnoXH+/eMvGvUz1DMscJcjJmS4S5rK/jLfpNTvONuqoONGABNQf466SX
v/iiFRuYQdR21KkUVY5ojhhsUVpVDrNwvZ0xFvQWAK5H8lfr8j3VSfjDzveQKqJ8wd9sTd/rSBat
SLrDUZhiJZ7XI06iwQ/d8Fkul/YXTx93vaISsPNj4pMT1ay43cIVuyaQVk8SfandgstcA/Df5YPy
lVlktQyzAgZPQNLwvcMOEMRGT0TR3Z5KgiFZnvKVnSvqh5B3heaXdh7eDrJmcIcoCFs0jm76iLfs
Ms24ayOVLjdvVuMwvixyeJRFIm7iRG46V7gEgQlXh7e+R4q/MuMCFGTLe0Jrly/yl8Fkk3LDP7nf
im0B8T3RUj5kCHmuYB5SK+oVPiUxiZSU4aJnRecXGKRQ3dabve573kS+703ysP2g6kZqwxgLUJat
miy8gOFqtm1DBZUgv0qIuoNLMGyljMca+kWHb1pYIm/P4aqf9r1GNQXUm0NX9T+IwItFQ6Sm6bYi
eitg+XMViMvzIeu+rxXulN95q26u0BLvRo9WceJO/DiKfs2pr/RPByd2GkizMWcXAqMnfxIc51ZY
MBFWU4DLt07PirHnwHnQeBjLfgtAnJT8fWbgJN6q6iccFnK6Gk/7jVgAu9x5RgLCCtsnpVE7zPLR
tX4NmtNJF9ynLmHSyM0hol4kS53IhsgpKhCHuolmM2moZHn3Tv3HKARAJF9y5d4AG0rAD5asKa1Z
Z+EfolrGLKLlJDi5kyVlhv00K+gWduMnSYkzDHgANGeBIvjSW1vFdtF2HlK+fJamjPiPIUslfN6/
OYfVw+4jovWAZgf2cYLsgjdLcen5XPJJgOHXfb+pX1Bduxu/5CfVdJLZrDcWrtSA/cm+ORLxkn29
5eHZBRShrCaNEmiRtLmh3+gOVa0fnUPMeKDUji55keRzJ1GBjrkrvULCjIR9mifTUVFvnNBfuolp
0subu8Irf+pKrO6/Q3tvzbE4b3wlnEo9rZF73NczHhufilv96MeMTmSWrhGjl+eNCJ/HvHQbsr6Q
6d+5r7BllFPC4RpGxiGOKRFud2znNuVB9DMObAbYf6qvkR+4XnT2s3DXko4wb6QpvH/Que7k3Vn/
wGdL2HRSpJvloWf7d68C9+u1D+D3kJ5TUfqb9z7wTe2O5Bb0cdjqPanSlVCJ5ASO1FC8oMO/n1PR
H2DBVAUSZoRFOFWmH7yOSAc9sUXCsOMjMVMN/LxqOG2AKhvVLQhRKuA74+S3psD5QKTyTb77uHdT
OByygm44BE0yOhYIy+nNQXb5eWUwmuclKIqUONDzqFUQ5uzlxORYtKPh2o2ZxhHTVg3l4PN8YrlZ
3xu6SKqdS19HOSojgz+ZdbRC88hZ5m5TGDU41UPimoNnyKBakYd90doV7Oxnj6X8yd/wz2VL7hjW
kx8mYlwR4zqfgcpRpdtXhFD+kci1M8W4axzSXFnBYpDF7AdDo1Mmdshu25n1HF5wVxZZfBQCBcug
sOY6w9PfUgCoffinzL7kL1GqzQRad3dY6/W5lq8LBfnxjuCsPfxGobupE91AZl5XKgF2w+yD5j+P
FTtpltJsw/w/7vrX7v3oFRcaYMqXin8rmixgtaoZaBvqVL3Tfpo9EdsbHcSm5Rt74pRocqDVBjon
Zc9W/P6BxZk61kK6MN5XSWG4711x+nd7ySaF8f5rb7EoKRMNo393pPJ0+JuIpXD9kp3YbUWL+lLH
XtdKsHjCsL+uu6qbDMeplinF3wfZIr73EZf/kA1yw0XurQna7ruSVj1R5UCmP9BiOPil8VmBwD6b
XLR8+ifzF0AupwZ97nGs+GUl+Cb3tDIhzOQfrUfyY/nYBei6nDpqU1MpmrSB7rikIaluhbQOuRNe
f1k+I2cBF4/DrrFwn72b/mOILLU7H3aivWTyx09b0zEnUFP38F2Vee8qp9ZbMFzCc+gPMvI2ObOM
B7mzHyQSVeAHDp6/F0FP4+jG6Bi+ak+mwG5MHBVoGBadx2itMGxmRlv1WNnevZho/+RelLeL47j1
LE8Ne7TvBHY5D0pb0znb8NbgOppErlsDS6MgQdmdku8g2EF0JSvvzWBzBadgXrdDKJgh7ZbVJ3LC
oVlMRynChZ4mRjuK4P0lJJjLSpK1Z42c+zMuSmopDo7Kzgv6BbJN5jrnHI62c5jIZBESLv4HU+Ix
WZBPZHbPlg3EcaKwTOCoTByYUqVcSKH8GSBbxhbJscFMOds9PtZ4DS/COVx/432CadtDi3d8DKn0
suf2sMHPAs3bQmMOYrFQgVnIhkFBWBTyCZRwFsds/QzcClwAJ7WdAqlo8KDSjhRkDtGlSItvbV1G
iyAXL0ViQqU8aH/dMqLJLraPBqK2duOSmMx3MFDdmqRSgYiZVOSrl5mMQlx100wPJPh6UsiLJJpe
T1Msx0nP9i+4kNjMZ48R3G0/bZA1dBXzcJeDfdrrwmZO51GuClD+54jjhxeOVQsf5dSynLCOvNf5
3B0ZYMnnCVuo7U+xyGOXaYE83a008oXxU8+5tI9xytnF+EaCtS8M3qmSN8IQBv1SdXRkHWnDTMSI
BaJjrCn3bU67+ixc0hd4tIzyfgM5hrQZ08UjyNbezVNYix/hCsnAat+qbmhHbL/73XZ5qQJbfdhY
+gHF7+odXc746oMo7OPzKEgNqgzSI9Xs+VFYPDnBe6RCZoui5y3EcYhxECtRbSyFYKoUyanoCmPr
CiAi06F3E0PHXQN/6KCr4BVnzww1l7Upktfa+gFDYcCRtRC4c9zv5vRftTx5I7pfpcy1rj5AujBX
dCt2YNdxKJBVWG4JEmsjD3gRmwM6gHFbHfUJ07ck3ABEeBmYZywac4XvLbhABGgThCcchFmcg3Da
8TVKFhAzkot6/ZKwlxnL1uT8PWeLRemAWx7ibqOGVhVF7z5PycURTr/UtTod5VIVoBNbh8cRXnjI
GyrF8NLetXvs268kiaBa5zipg653GdeMfw+5a0BuN1CaJ/mcm2+4IRDuFYCq1aDdfqboikJGpff5
jCbuvTumTy+22frGR++qEPwZtEjJ0bFf1AJYCdgPV1iwu9qivEjSJNvZrCKDGhFDua1AtIX0NMfc
K5w/0GiSpYOfm4coF4FHx7I6Ti4QtxLVXcLnCtz4Bw0uT3XQuHrj15u36mTlO0GMxc/NPwmBOdDp
dbNTHH1m6GOc1jzEJUcr3vpdikSTuvgQfj/J+Rde9jd+jXdL0c4OTnQQ3PehRvwZav5On7hxwmL2
UhC56w7jIh+RqVXfPiW2PbHk31uQTsz3Euzt0MZhtDQq13V+grNgmYW+WH1GhFUV3WC9wlZ466zf
7kMk3oLzzTvirQrA1BP/pA/0doFKqqdaUkawkSPws5/pwuEcBa4u3PzW8UrzJxitTniwihTPEqeg
Ik0VIuhdJXE5+6U0RtDPbxfAhrmp9QyrL19PjGR4uBtPd7zNDYQAYJSfEAIKV0NRfVyt8d4zbOCQ
5eHo+XtRzBHFJFOt8oF7SYOrUMtkOuShzjF9uMOGljVmGBuBzaIwvyw/BaxAGACrtQCmZbWGqNRA
Ob2dHpZt+cilfND9glf6RJPKyFNBk2Wj0G6pjS6GPrl3lX3mgR1Df4lE+DuBWmj0/DBLe7aoCIIr
UIDvrAtcOjSTyr1iauTpVPS/sKsUN0UnDH4ogyZMt4oG5MxXqjh4edeEGR4Am3l+MgqUOQt63ZWm
4jPVfPQMbfmW9Z/0HbJVYsiwywBAM3Q+m/jBzZD8YXpExDNJ72qpGKs/KDwwisF9N586hoThtZId
8hBJG1xUmBTnbgsj8ElEZMIqVK3A+udqjjqdxne81snUhFxFllUEXexZo1WMhHpKeAaXMJi3qOJq
kim+oZWpFtZjg04oISRf/Pyr8YwdOqjJJpSdYm1lOgUGg0ZWgVrEnsS2vMbS73B4842prx9fkpJe
PdqH8evYwoV9xcofqL7IoCZg4jr6XQ6DRc9ol8VQag9zVmpm6Zd/8Euf5I/BQVr/erOzikP+DQB+
JXAYXM534b2f/k/JDxfnxu2Ub0VPVDwvesVTABnRb5Tx7SEuqPt723BtL3gEeuUr8e9p0QssRpXj
WYLQDodBcm172GSsldZGKZj6nR/TkgzDW7tNP3eH+Iuem72wR3E+FKVsBpinboy4/r37Za06hRgt
tnmkvCHfLZlnnMvh+JOwFItaIaJFXimy37d15Lp1ByoRJZCm5e1TJBC23Q0C+QlzwOIwCfiG0Sa2
6TdNCia7g2n9DUBEn0cUVi+xBgaTZY4LIhwDZ+53xHyYpERmUTdAl9rDk3oG9kPtHkOi+9eAvf1r
DIWYD2Z2kEjz24tEWjaD0OXnbd13LFO++OSlSx8D7sLp1oleHEF0PBRZB/iwu7YnRf3Wy6hXtP25
xBK+bi6NyiCiPLgRI9g3hHfJv+ZOT+P7t+kDxPHW8qXdjthosgW1ijN3EkYypNyvZaYEQgsy48pr
qf2Yho7Tsb7qc99qVwg0mbcYchH3GoeO7uiFVlva8LpdA5dOfUd2G4omN1mdpHHr1Gq6r0qlRo/L
MlDUiinFEvNmyrGsWTKe7wGiNBsnuPzC+vIj6rarhM742KKPDuY53JWjh2nr10iJOGExzk5/9eE3
XeA0LJog1BhDFpKo1eYJN+mbunkp9S+CwA8rkcYDuJ/icLpOSadeXR+gT65hwzGCFQ9U2f5DKCCR
cY63gfhwxIrxDA+NjY864iCMiDZh34MY0UfBMX4cF+aIkdTFF24j7BI+4D5QNkTvmXS5fYzs8Iol
Cxr5nOScV7WUPO6SNpACu4ph29YeKJT4vYgz6fx8cTOzDhMB2F/mgC00EX6Uo+tviAKzZWg5ywy+
qv2Ix7bOgS87w5JLaPg7MLue3UFXGzXBpEe7MhH8VKyYkk8mIJ+z1UfGvZRkjX9gdBco0O1biT0X
YQKUR629xRK7hmsIJZZSGXrzFbQwOxnQzsO1Qc+AEQmDNsz5xMErw/x57JUlqHv7ANh62QcvhM6N
i6aPTmsQRQmqsPBYePTBY8ljOn0NGhyLV803L04Xd8eq76MRvj8Th1X8iup39NIqFpxhKydePGli
9LS0CEjibtalABn7Z0Icn+nNSIesXeEg3H94uSWwbA1Hjrgkxzkdci8D7Cw3eTTGh9amg5brjngu
gctpy2gU5U3ZSdyMvakT3S8rh5ytNqFhtE8VV96OCdfIuRXMW/JS+1i/cynkelvaWxH28FxaYSbe
2wimmYr/wFlVchMslHom5PsPoTO1h2RjRB8sSP5PtG9431omyuSswOiFLtNfbw32TWRkkPiGM4su
Mg0UMG3T0Di23zSpx9vz+HkS/nEZgJX78JuHneTRmG6jb5BZNwl3hMUCAGNQZL9zXlkB9zhIXWXX
SmaEA56oHJPOUHI69+VvtObR8aYzDRINzMPIjzjES7TAeaVC3GX/U7QNSbSOlLtXudG70J7vxYdi
t+oayFIBmEI/pPtzD+/4ihl/FZ3KpS9K5aHHEDtPSiK4DAAL/tYRz60Qkc5wSoB6JlrrljkcT5co
iNZZs6pHdUd672/wmc8CEEHYUcU8laknqXN8hJsdRpVv1FKIppRlITUt3V93Q0Mkt9ik1zQLcBbM
RcPzLLtRu/q/KOyXWbsG8gV0iTxLoyXu2FpoEGWouxZWJqx/23/Iqxo8MzunWvs+JdO34ILxRmMN
Dx+JucXRNpaiPTUa6iPsmJjqEKDdjIIruc8so6QtxyLuOzw7qvwHq9RjZxYUSMhJkrgabiDyeRud
DpK5m3c1Ut1uDruFqvg+eXKYkHw9ncF1bEhcKVffAYE4vp6BE4hmgqFRQ+semVPScMBbEDFAnnLG
MMOLFgLLuA08ssWIM5OSM4BhqIdhr3bQkSdEGrQ2VspP++IPoJNQmA/EJsEdpQSDbCQV7jPeCJh8
quzFtBQEuItxG6dZrqja/IiTSVlQ/MxlukCy3uef61glQlg2YdCgXvRbJ36pvnVjkWuyMGd6Mb1L
LPgAZoR2PbwXcH4y97WCcSQgN6UQ9dCfOjsU4iQURKjSF31MhkEoI5uAAuiUcr3MmBDsas1gorhS
134NnvR16nt0O5cdOLoqrniZwi3d+3+nY5ja1sttndQal/VJ7z+k0rhAgvMB7BW9kiEYfQ8TbS2X
TlCAZ6ebutK/U8pn8XLS+VodOCq2wzoMTIpHBXi/SsU+dDxw03UR0/HShmRLROQlujZCT4p1zppj
VTNPhIFcyMyLEeLSN/eiCkp33zH+3Zo8TpRm7RJ7EsCzaICYiuNr55g+EySQHhYEX8dr5Jk7M+ZG
IsuHP0piVm1Oa4qn2HL6auD50rDk4BH+hvEIUMRmjZbqT9PRyd/yXYZr3De+h4VtO0kwLEARHh+l
nqs+w2ly7aH0M89JWL1/67twoelW48R6R/350rOU5XYthfTTAAqIC/OmDCpt3jzJtWxZvcMaNpig
Ywl8jQ3Psian+hLkbOhIWDwlM902hcxtL2AgjR25LfR07Ps+sw1wGJ5EN7gfgAcEfsNei29qAflO
pAN1RKNKaLNYJFtf2dOlWABaF0WPvAPPrYJPMCwQjRgHkVBIAohrT44lCr9EU4tn02blZQn3E/QT
hwmQQp7+8bsVliBMaxknKe9KZBMA67EMB3zhzrSzehC/n3SERHcJMFjoBd6yRK36xZ/q/XQIbAhX
soQIiHYxkLrHAROmLLG87sTUeI3JcpXoDTWT3IS9LHRGuYhGmHE4wIhzzoqL0GvhCGOJQIATs0YG
+WyyD007D51UAbX4opvc65bWpIqrvRdg8nblqaJuSZbJwEHf7y9/DTZUZhsGv9EBRueU0kkFKVHF
2mDySAJnkynAv5AP+IuZHpxaRn18YvnUamdvcSxXnxATVbxSwaDNf1Ng2r35HZBB3WLSPFm9OEfg
TYAZ33lA9Gj31W0Tmgi/jJ2FPveg4oR7KqLqayPqegfrRMN/4H/kXQVjbQh11bKBH/YdmpVRbgdx
Mwox9ASe+wGazvX2iHPXS1igo+y9p2DbzI9R6ku1I+uylQRIxHjQW4yHoQEnYJneM7hf+KBAUhmw
fFfnJ+7SC/YBXibZjEh14dOXJXUx2Rvq/lNrVDbosJRSks1E/zEO3IVeYE9Y97qGm8a2gJtTN29Q
9MtaJdZgtCdfClunCYEVGGF2kapyEkUvHdS7G3jqG3BZkSLcej7AJ1wHgXWBekKTEXYf40lseQhA
dMPvcAL7MIHjLEnfi9dlbSq0UOAD8ksrkxM9SBJFChuKkqtbXouocZDcVQnesvTOcx1GE1LyK2Gg
q0Pf6gZPxaHN0gv3cwiJl2Cdi0ZFiWGxPK5AVngtEx6Lltr/y1vyf2qCEPNE77iJiez4CGMBvQi6
uVCQgEgkIyZpBkVwcfY4Vqpr3rCRUm/FlMpW8Thgm7S9PVH/D1Tq9oce2TcjucgCau2eKyKi1bSB
jB85zgyRamAi2xhB8257wnzcaj9R2CNAraoVSVSATPA3gYst+S/aMs7NEEPGTSysKENew3aarcq8
9r5Bbem+4WqetU95E6CGgOYSH+60YWt8RARmuwKQpkqELbZaEhkbB1+3VXhm+mMRdMyTG9Xdcdj5
+KUvZHuIqYWwW4Tlt2oHk07rlXDxUT9Or+JxMqPIVOxrdIXrS4u7UV2QcEK6O4flRLkcy/FIhzIH
udRBD/i6FNyzjbpNyAFfX259TjR/VET+oMhgplfDpxoJsXZpedisJAxqHyRaiLFdSwg+q0vHD2YS
XDOP4HVhQjD8sEEI0kukWFLd+ml7mFWj04JHpzrvTctfvn9Cgut4oF8A7wgUaHABv9CIFIS0G/8z
McTdFaHgNz2wh0SxPQ7qVgZdcvnuPe0EPQoNZ7FgWuwK8HjFJXwtw+i6Ux4Qu4K0ZTwnpYEg8iye
nzmV04QL53UjhgoryWTDLpStwOa4bTREqwzraYbi89f5X0NX5VBE/BGMySMlOEh9RGWYd9qsCdWB
OoWRfxZtKWp0nzJaUWLWBCLwtRcdA//vTdY4HtPJliwCWZpveKcdKc2IPoB2Lb8WjTcT2dMjlGeV
Gf8pa92qSR05DWBfS6klx2Qns6gLPNRh9hdh5E/EOd/BmzkyRJSRvnAPZJ3+B4uMqyEJI1bbEteJ
gQcCoUkJSQPppTL5s22JyapjdlhOBTWzFiVD2wkR1g61alklLHbNvc7APSgSK9TxZp9XHqIVFKPX
w6Kjl2UfqEiUCYuDyssHJ4CnyxjxTuZGzHVVrRc0uitrqHcV+iTIMsFYWmZki0ekawPbskzY6caN
VCN24yASDAprjp+y0EfSSUcy1HEwCfmL9stdNBmAfaxAueXoRcN+kMnUibG6gg0n5ixFp6y5EOkU
dFYCUKNUkld+aec1i0n08FoXp4Zri6/kbKeFLvIFeOW2kbhTTfYAQpnnq1waYFx13DAghN8XPoJ0
JSM2oWyfd1SUpZaJYs7TOIqYI0AIbWzjGsuSVuuzIBHDCLTSd1bnQ9a+WHHK0IB1I3YBboASBP+D
Kja+CTlXqLAtI7zW9Eit3CU2MiA9nVOAm61Z9paXU16abB3iTLjjib/uGDTKySpYGLpZX9XwvH5l
+CoPYMOSJ4qRhEazqVNyB0erlFB6fnmUgtrskhAc+qzjcQzKMvHx1FuS8QQWMM9YY0a7V/2mnALP
sETqY1cXcBCkcpwcvfy0nDeDh0PjuwPEv3QOzpT33a14lwlJ4Owy1uf1kXbUnzBAtTP/hDchPXtA
YnYWaP6vFAxB4RFUO0p7/QzRVSfv1gZYhJNyrUYafCNaAL3OKZt/dJ9CIIJI7MibL5FKqfdKUsIJ
eM1b6SwAVFGnNx9M2wwcef+T6YGsjcv/RCG6wnTxjDEPLnwtB1Qe07wyaHwaDuaT1y1i9ZShBp/A
HItGoIHrbtK5hVno1one+8e8FlT28WWjbOaO6SFYtaD8nm3tDAxDgFeT+FB1V7UulR00XdOL3r8d
mKn3cBOo7G3XeoFO70lN9nBWbsVTcSdginyYEQ3aEgCyUcLMWNsHATE189uijHCBCwT1+xT0KlAb
slv/h1VJLpt40iCAgTO35Cb48hkSvLgt8n0/ZuRTi/zGfm7WLHlAXWLyDfqCboYxcVk3SEte0ReF
LPoq2AV+m1LP03Kaw+w3g+ONrcoW9IocbaleMqg3BG1pbreeyhBXfnyAx4ttzZUZhxE8dKCzPrKx
iQxKw0woMLUr5o0FEDkHoMQXK94ago5SAzU+9/SsZFsnGoB8Br34L1us8U2Zf6sDvfcyLAmMHd4j
99+BaBizWFbaakDXWc+/B5WXhlePJLvE5M+B096DcjPqKbNyrZpGRWBErYpHqw2EKCHpvhamRnrQ
eoeZIILt93zmpiFlTRq3VXs0yajx/L88hg2PNYu6uRBvRP1gcSZVCk7EfDueJMDrYPjdS75jDpcc
BE1L5g9pyy1gxTF48fxXMaeTd6UK+Me25BF4bjzTzgMlJSsnEtgbMGNpr1Zs7Gn13LjcpVlZUTez
xbwDnao1GRjlLBGzYOcXD43z35RTNOHRXDpu5duYCrRvvEuwQSPoTII1i3d+pv0OnW97f5zdrG0S
0fwAhr8DNTWXFUVQS/URErRM9ZQ6Jsp+lfEOAvWpZK/0Ag5Zu0RNxCZ+eQo82+XAbRGwaHdQEaeh
31dT1NbCKBL+Xot8cpTI9YbGb7mDNsJMEdCUkBMhbPQw1H/Ds7GkNjvlqzcrlgDYJspdWQzr1sqM
Vy8djON1rEIEVkSakRxK2zIW7YdFqzKyLBLOwzyWGR2V0xSNo0leb41Hgr/fpMK7N+SvG57U6C7f
Q01LnCvZ7e6qeXD2Uxw27aDOv7JLuhZo68plMDW8LIiUb4smf++pccKlk8Iwqw8HwKhDubsLbzBn
sberPfdYq1sbAkW6Lsyx4bnKuhjF1SS7ZWN+NWci8U4pomQyG4G2oKnSxCkoIS5OrZWvT50Gx+Kb
CIYBFPWyLWkStKacIyscHmWLCXzwC+xEJm08Uh0SYSPWn6nwrwOOK9EbCgayKhPmdyCDE9czoBMQ
I6Msv4FQzo3D6MJZAAn6Iy5deal4LjEl+zroMQjmklQCfm6eXPw29hurJF8r3QCGOTZcwUa/3ShM
AeuxNgEaHrywHv+Wj5+isH7Z0Ng2emx3kkUicvcQC3ESLWZpvM3m0FdYUkIZE92pbSe9OuA+f7ZZ
T5nQ6MOnHTpefjiDH4aPx8xFaFymiNWhb20jB7nORaWN4m5NEizyimGrkoP/EHR/Q+DzNjlmDwN0
m9b+x+xWNVMHdjYVUmTtjV92TMvwePwmv7jCIY+3SMHf/8AcXmS8KfAcPNbTFg6PmWdCeQgc7V9v
WJEZJIEWBjQw7VYz5wF06K7Qe64Z+e8sqLD7CUo+SwiDd/HZMqhj8ezStLHQcLL/F6ipgz161Icd
Pv8V9yHr7QaipwMYjb/DWVJ+jknU3LhaoqpgvWQEwLoyYGEutLVk/molB2P8F/RUzEQmAX6+7Fc9
rBSO3XhyscXOdqetrNGCVnT0ug8mkClUzNa38hDNSSPenF7vGkiBOMLZi+cSdb2m70JVTIoWqfx2
na8NOkC+Jpac6bVlFQ1xgvRqsbOqePnhAS5nHiU0spm/Nr96JmCgCoYJUjQdVsw5PP6wOgavab93
Zbp9mNFaW9atCq9oHEkvTex0oMckbrV2AOk+elAVwMff/BWEmgUE5LJG75YgBi9Rx+pab8C3G3MZ
J/6LJQA7xdxawJfgaz8lPhq9NjQ4H/Un6RM2pN/gRgENl7eiOPaNHwP6XYpZscsTrB93f+bgo0ZE
vTz2Iis0xw/4Rk+JEf8bi84DJD/qUwIS1W1pL+WZYTouAX/5tnRdWwhGJB095EWnhw0XaF/x2Lvi
CurbyxiGtbjmqg1tT7yxaVQ7PWOVb9BBJAXk4wbaZTlEUNgTKsJvedwjqXlQxFRpducNGObMAjl5
lskk7RHAjZHocT+0ndbNurFOgjVsyeKi7wrmpREmw5p05TyaxJVH29794DSfvtgu+EFyz7aF75tT
MTzxslJhLOZCNUwYIHA+VypvEQMrs6peQc9CO1BR6ImP7k5Q5hSlI5tkI+59uOd63C4z/b58lnOq
tfiOYukc8mrNpBBMhghdUtCkjWapr/aI4WOPlRoKWKGOaD1S4kInVbFkiQxEt87ZW5UaBooMqK8t
y/qQfd4GNEIRYYh+OOz7ufa5nGJ5F2vPGpjZMloSnUBCtXHNK6qeEVTwqigYSQ4GxvvkO5LZGpcq
7IrvYaM04/izXCOq+OBDSqS3pW0Htj1at7XN+48WnFyZRDdF70jMf+D/nDkR5LT3JVkpg9/2zdC7
mjVZsRXH00khKebNnnUZFGGUqCN1OxS3D+5x2JPgzbbgi0dPj37zkiyGSU+SBrGtKGz8FqlKGIL1
QTHpUDbSUM5GrXa5ms7EgqE8PG8cN3G9MH0FLJfUfbVHzS9WAzzF8p3qzyYZEVb3hH2olHGpn61p
XC4ysoLbUsVmdBk9CPByYVVH8y5QMcAAqps5OsBDuGpubNZIxZ/4056/8I2A8FEb6es5Ra+uabNL
/H760O5X5rZIhGpj3Pkex0uTIjKttlUKziMlyhaf5CQZ2wnC3kH4e5WyNA1zfggh1mdRYw0CX6SL
kGVKGCS5VNJx2pHWWCcpPLq7eRxVZHs6a68Uf9WWWU15rksPFjxikn4DWwt4P431rLu+KYzFpqiW
8Yj/j0ykzMQ/rLhIt2JbbXMvkBaY0VoZ2z0keqZqJj/J8fG4EwQcKpHIBQtW2fRzF4oLRDv271as
TmhDV+5KMJNM5TA7baOGQNAq+GadmUHcV84Ku5E8TyEUhFB1P/aW67soK97fmwYKyT/QUpeVWIyq
aGWPBEzwVSqg1VenYVabEpFpf7VFMzFXeq10mMvm04Gt2ydS9mvpjSFs9OqDSQCBQ+Z8h70rHlXF
LRMjuQgpGB8QPhML3ZBZK0ATdAeG8KIMG9yg7L59WV4l4UjZ23MF3zHPZijkm6cWkdYxowzlpAyH
x7wrFLP/54MIRB7DDpVVjiy9+j1ko/4lSjOyDgSknV3aR9sIEDs2tqiPUDc8hIwAgNbWg7zXoZCb
fm9ZZknvwnN4zEsJrrsfmzY5r91XzeJYegpE/vnT+VZN3/slAv4iMhshe+vLrz8frCboAOwBuA+g
PX+urL+T99FtzCOHk1h0Ru+Ey7z1zcrh/FBsoXpO91ajiRY9YnK9PUj7gUzI5XnYm8oBsSGUbz83
ijMkpRRM0o3F0sR2EKesS2YKpI8EtnL18nz34Y734l1Bx54L7nIihlZyWdvhP8DgJ5vc5Mg5jWxE
WzVn2yk/NZZj8DnrEMZe1fgdqrmkgMWm2sKmHrNMeQcIWhqG5U5a1rR/ODMYQ26SLB9wkzgKOYCA
OYlTuKFB1VLMLZsY5w+BvT5YAKYXnrdyEa5k1RVovkR2Kp5FNA91NoglNyIGM0gxNl6cmSqQYMr9
2JvqY3qU2n6TMWn1qyAW42l2nclnDdDmdCCMQx74mDi6g8+rxvactBX/55+9h41UNiSEHn21vFSR
g80gZj8CnI3Ampo17ozU+fKhc0y5YaGx5n/fHfQ2K2H0Zcgkm7pyh/cjIWzqtKAEdPezmvkDHlcv
Teau6wnNs0soS+kkwIQeLCDYU/nMEfILWi1Qihcl7A5JrNUfFABHDp56k0AtV2NBJQtaYcKEBZzH
aHHvGEupbRyG5u+ThkNcatr+Pu6XOKpFUDh4zEPPa96xfKOekFOcNLn8l5KNwwuH1NA/V0y9GsFx
S6KWjEVpy2MSGgs95li1xQZ9gX0F+2KKzRW3W60hZpssZo7wDfiHpjwuqshyhkDW5EHFONAvPNlS
O6vW2YE88u9k6q6ZcYezTmR2r19aEib0BzuuEis7obEy+1vEJKAtTHSJ3qlB7HanB7sRdGx0xxxI
rKv2PgPOHLMFFgpRWwTiDHfG8KgdcC8Rwia9BO+33Yk6oJXkqHbg+vCiu2d1anajoNTznoyttrj0
mvIrYJTRHPw2X5UtHZ83R/xE1W1XT4KFq5V0yfXqIXQF3deOB46mXpO0KGcq8LLk5i1irDlzvbP9
bUFAGoS4XJkWTbzswfz85kuTOLuNqql4Jsdl2F8Faga9EA9bohVWkqno38U8T/klsCgwQhkKCnaJ
iztntnGLbcay6lKSSY3vGdaXkkPE8aJL2J3KoFXnifLXPZk6QBNRZA+fW+szxGLkfCKMQSE18RXq
uiYLhQw3sDcznqUz4x4ESTICxPxjH1cO+WUZclBusFBS3IH8Ve5gf/BWVGbaTVyDQokcz5hyipui
ZJMT1Igt9B2tRuf+pJMh7W+Z1YBFw6vQGkbvttSze42Q2v115wgxCKD2pNK+t3TH2L27DmqclDd6
8VXkylNqeXgmdorT4u2eZI87giGIJ3uT+T/3ZO8uvz+BuOGN4P0O9awa7IZLdWGtfKvXUqNW+tAs
H/7yfokA6q0CJmG41mlZPPo7pnb9lbCPrNrOqnus/2U312dnwpkkogs/XOQdPegxcD1o2gIOz8Sr
3DZL22scLO3MHbqcd7BpNJMG9Z8kYgzADOUkcu9d4o/lcuo0gWX5kbGuXXKjKZIHtIaL0oujniwu
zwgKCErtyELCeUGCco7XD8vQlmEkEMSPjZkn53HpwvOvc9zBXFmfFh6y6BxQdHqyxPEIno9AQ3oU
I9JJgHn+njBE/3AYjoLmQo0MRm8kWNDT9bIHN9LnqNxv3w32aSTBSVH0sHOeAydP9CUpiKw/uAZT
83FYGntKb/mne/OoVttuO2FJzdylfpQjVycWEb+y1WPeFRfoKQYPmcXguQ5I3JpTwm/oxeLUyUDO
WX94OWChtf2VogfeBNrlTJGW6PdNS6pycvni3cP6UmZLzsyRmHk4BoYuBVax3fr9DnggJV0aWcYs
eAwznSwURtqYnFRby1mI5bLJ+c0EqVxsj1DZlgsnVBvb6oIqvHP0yCrs/mbnAC0wmk9fyGXaAOM1
MUcn6oZ2NTIzOC20ImkzAqxtgbKEwn7LfEcEOqul1YgJjWgMaKOIaHBW5m/E6FIr/uyhmYfPCTsV
5q5pbBZw2f12woE067yD57sEqLkTm7nzQE9CyvH7gC3sJWbh2Wk60+c9jjAHvUejaSIQq1dThyDx
oOF2bPCC+Lf35sahDuyp8rKMeid3/za/ivt+ZEUX+NkyVIswCa+8QEhWtwi6cTAnaMA3GJ2X9CFf
PA4qI6QDZiaJs6ec6GgO3kXfrkV/A9ctlOuI+djkCPFmh9TYzQnRSHMrv9q6XLuco7wmpI5c4uBr
R2eCFCg7AGDCHurP93KRc8keP8vocltkLKMX9JvpYYgTpdjiuZf1HATmDXESiMOlBwHTVkrkQ7Ks
S6ruFQ9ckl256dA4bPNUydlkL/MHC+3ox9ZI0XDTpss+HTCchU3DvEg/IK/+O3PfIfuQycbcaTne
tLumPU7iHARrNF56IKfNbs1UPTqWdqSacsSoMR3G/ttjOoUW9yT4fk31LNTrB1blHkDWfZZdCKla
ldyYsOUbjUqtb02he0+dz3U4qOkuA/3z7uu0nBIzfnVLbggJKLzPws3pMewkU4VvMoZMm5d4Blzx
jrUjY/GXta4L0e2hhc8Ji2ER8FQbd28ALH8GJGE6LLuRth/FyZ006l+vwOsy/hUTvdWEpAVZ1yNn
KL28ka1+7cWI0dk/LMaF0718O/wgONvoQAMhEruWMDU0cj2V9xYgWTebAMRDvR5AfacYclC3JhGV
zSGolM4BVj9kQksr/kKY2ls5Q8+gkWZ2kWNtgUHJ0ieBXI2se0Gfg0BtO80S8/XGAVpSVAjGqcpG
yihI8mOhHaiOoqViYaZB4/XgaUaeIV7H7ezYyBfMhM11qjIBgkmrFR3d5+Y0nMwrSQ7jfOPXcQrs
SSwbn0SSPOUmroupUhhBchTjz98PyxaeRJRh+Hu8IWqxiYQ2fwwOehu013yd8D0E/8LQ1wdLxLAi
OlPoLz4LWMs5jCONCMIzwhaZZCY9janEb4zk0UQ/IB32nWAEHjzMEtuO6w0yBpMqRk0iqk0FuHRt
DVgRYYOYSTgtpUVV8PsLLSF4hfGFLCXXbvqJgKBBxj8638Pf+BLFmZnnOkxIhjglAoQZHfPCHam6
HjBuj65Kqd8HxBU/640XB6uAsZIofKVG6G5a0q51sv0US7Edo4BJp7jK5gBI9y9zrrIPNkT1BJkH
uuRWvlFDmiFjDW66ETUN/l9L2AVLga4oC3Hb+jpYfmrJu3yeDxueDYtgRp20fyk0zBuafqwxFVFM
XC2sdXr2ciGUH9ZTmpxu8IBICOfyX5YtWY4nClPtWbC/cLjUMqi4XIRHR9k7OAywoQc+QW5rNWPK
h7blu0onqV2a4xirJRwzPPLEEz4D2TDbQEXtU1cu9/yQ3KlVIEPRmC4U//82ky76uoswHKcP7Vx+
1UOAbcX6+yZMonWhBegv/h7/l3xalnun2knWZ4B+P3FDJ6vHxuayEX0IgoGE2XZwVr9FFMWVHKzV
X509ktIgelmOybes5NIx4YaM4VgonaFMedmniji/omJ2+p2IeFlrMEaYChFmf2+DtybX5CgycAji
FFTo/EiWznTWJvFyxtJBIOCnHkRS/5B2cZ+ZXuey7jditWfHfXIrzEBX1a5IRZv+yKP1O+RRtyYo
ImVbhJzyBQzxYkFSzEvL796adgivWJlzW08JHlEmede4gbnysd5mJI5iR8E8Y2BKhPkSI0g6wHbm
25dPHPbIvJ3hN4CrezZyECeRE/q40+yCc+2TLToLoicWXzP3SUCDYbx9+k0avj/zcuRMzrnqjjmd
7FoOOi2UNdkP2ubvxmheWAMql7UsvXYKxONzyDwS4Ylpu8FS0HSrM1GbLRaC5Ji6usA0hn83ojPb
LUiMIcQzrwW5AOSwd+eTZNq1fNhU08srEqdoXBvZrpz/hOefOq40qSPBxKCOhPWuYyZXc9L/rfyb
ZpmNuo0iBPncGD6/xG7Ly+p5owqHfNotdXccSadcFmOjO18TrWh6uDQbf/gFfYsk94MJa4Zu/mso
ZOPe2id4qiIVbqbRBjoFj8jEbbjsV4dtFLa0SI02YmboIVHKNDFR19kCD0CXSUpKg0Up0M7DrSaT
gzQ8Wkpe/mTez8A5J7+9MUTO0ZKugj8e95/GcbzvqPdpJ0z/WG0RgbDwyhxnNgPRlIKHDvXLYEk6
UeVnABDNh0F8ZH5dXLbu28tbS/mvY7N8/r2+GN0BPJIRc6C/zRRkY0T22sGrr1YXwcvu0S+ziSJR
2EBfmPxEv05LruBN+vd9W3kIyjyA6fTdOYEkKP05d8kI8V8TF+/1tWEt9CauNxS+gDTi7VssER6l
8brYtcn0LDxn3jRxnw1orra0Kx6/OSz/EtkVAGY/NaZfOQvX6AtwAsu64CkrbIuSSN0FWDg/Yw+w
oOXqL5AwOymuES8Ds2wmzr3Mt4e08Hrg6aJFJhblfu5hQwbT36sXFQvDIwADmRo2RRjq0f448CJi
2ndbVzofJfJ0K/L55m9aJzEYH58SfpPbr1uIwc8Qnfa+4tWDkk6FR+JF3NZ+bKGkEQ9S5NHb7/ni
5nxEOzH5rWpCsW99j1hJkx3+Dpc70bTc++5sjD3YApPgOdz2zYKnSIKqigf220CGxqDrJ8KwnuDl
QEMMfZEz33avjYXwRDMJ7ojP4BJHkHDVrM1UIUSajcH8WjR9UvoFaHszO9yz90lEPpMKWcBgZN6j
dE0Asj4jtjGznfA+ePEurHwJ1voc0fSHCSzR0pK4BXw8yz2XoAJWFVf02Qr8o56PzxI+I6KwMxFw
fO63AcSBRiO93f6FOFG3eXDlWssyERYtF2ALcIYGgLAV3RV74Wkot1lyIqfnUrW2FV1VzrVr2lDS
RatnFYll6TaSL8XENAkgvVdaE2c3cjrFAlM2Uv/BfNl6t6GlPuEf3jZrkUltcZs3LjiL/mEbHzhu
S+XBCPlnLkKsH7o2t2YOKD33xA09LCfM9z5rwWuYekImZhaCzSu//SFNN+4w6q4GxxKMU7gEuZrO
5ZlW+osvG7exSWeK0uI2PU6teOWemuZefy4yw/4ziWfisnou3M3SqqXl+A3UI7T21yH+SRtv8Omv
Sz/TNiHsYgWTQs1IHan8h/phTYKIq+Np13fPEgxme8uZrn3Hz7w0Dws+tohtn1OCqtgNz4vRNWqK
fxy/P5nsEhj10pdNIro3H56jPqWF404s7KMdzrgYLLXYmB/561LDoP68vtn2axhsyDNE2sI8L8fB
9ezIgBr3INEPOWsd8D5PKqUabs40ZuEhivMGD9l1CtNEhK40Q9fHu36Lw8l7I/LULqsqWcJOLiLV
l09Ar/5EL2jP8ZQd9BdkTU8sCFlv3znA+JCrl/6aCZ8Xf7FIwoiBsVLKwACuWme/l0ZogpA2Cbwu
86u85b2S2nLKAR0Iy1XIRAdb68U8gz80cC+C169oJ85NQSlCLRQE1+JDPEU+DdoJYeDGAjsDMwNC
tvZGVxceCmTDsLJ6rl+pF2pHYGmdqzlLtPOt1aKIkTy5QmGZMcGfxVsDXtRg77+dt72vbsAp1bMu
8R/x4VMSimxq/UUjE9Zxf1qIoOOY1JJkW1J7epaWNdZwcBwUIm15rK/MrsOx+6nkjncPwWzxfXd+
Q10L4mLQY1PnAFeeR9ytKsG3lqZxk65HOsr1cgUR8+VjXCgKos+emQoB6BiEDly57mUq/KsKzhCo
9VvcCrdSXiniqBsnGASHo75hLaDefcJBbP7IZmOtuN+9s2IXDqfKX7GxzQr+JaChA1pSe8mo/Zb4
XPXG0I2lG/spUIbgq5LOeDMjACYInzOnLurEm1M/d9teRiwLrpLus/fzpveqfvLhcX5BpI9I5Nq2
l1sFPvpYXY3tHJcQFCV1lT/2J0fxfUB397tciVHa4R5X6N0QJlDLg5N2aeifgVF085VsavOoq5WM
Tdk88gQTfFdJvlGWcvmCfUzUKRfJUZS3VUq1fs5Ec9xtgJbrlZm7dY4yIFrny7rzdkhukva8ySaX
C5LdxqV66dfhX/nfCLJP4V1MJ06rgyQHrQXwPht58iK8oLyycOquYDMRnrrmCCbh6RlHLaTENGnU
JfJJUW8OxaS71slw7DogsNW9whNVrXdzF433nh6m7duFw9uE/0jS/IWVS+a7WQcJCxJl21Q7s41I
N3pLpozGl/8LXSUbVxtOdqKOc0YTeuFg7Jus6v3agsdBM2Gp68AsQFF6v/6tcJX6YfYFtaldQppz
aV2SIMzY2ayt9R+csfWnKq5G7D0NyWczeyrgeCSQkqCuI8rxXUPtn1H/t0ar8VwvuwkdV5hh4XHD
U8dwLzoHZmMHzCSra04x7nOrtVYTwC+3nizstZNHYzmf4ccPjsIFWKy2VVGnlhVbegAY0I1fW+Zs
EvYeoJWcl7IDIJQZM8rYyaV55d7++kokOpH1iU4MPPcfCZvtFB9IRsIPmU7Ez/8spndp+AFUCW3D
vf5pFlnoz9jPFG7APF3XwDhV/YtyKO2hMuJzOPTp/5T/LWTxELxIp0v4WtMXr7LnN9/9I9EGLnfm
vAwR7vq4mv91IUDYkSpsx7jQu4DIvMFzrJ8rM98rlYhxT7bcF4oC60yuQtoE3APxzr5sUvR/RkLA
LikPXwYIn8jh/6g3T1HXGLf3xEXqLacaU+egMhs2ZOErTigx7ZG54zxRZyLT9ARtBuVCu5Cd05UP
a4/PYPyfNRAjSANe9H3aGudNyQtYEuEzwoLgrJXQmK/WmiT1USt+eyu7v/sY/r63HvB+uAWH5ohv
AwMZfUlN7hstc3wJR6EHuEYk79Fh+/sSScMotKAI4Fz1KY0lTGXLWpr3NdqVe5OgipVU5HWMb7Mg
rzPrFqpmrKqxeL8BBHLNE/dXbppqUgtzIlR7GT0pI+Q03ku8bdjQbhCA7lwGU25imUVUOMy+jfHp
57Gcfr+Fh7SEX037ngi0trPh0It4lBOZKnfwqrVS/Xr8xnU+8onOFj0r+rH6ZEDVdzNQeucPRddf
I16QFkqJvVpKsoXYMzR0K7jIMkIJ5jB788uzfpxR/eSVkoqpMObXRc8VyrjH0ojdUi2rpSDtK0DK
nUfO4A4seiFMyI6gnwwFkvwaSQqz5IhU8q1IfmPrjlciPS7BQDy5hil8fTkIPQDI6i6nqthvxFNt
+q9syAxpcER1lp6lFaTKt7t2pUwuTlgQngq4wX6qWiQQD2WmeNh3KvGSTRSO28IGWAIeOPXzGcHx
UAAAAAA=

--Apple-Mail-04FBF0C9-EFC0-4E7D-ABE5-D73B46153644--

--Apple-Mail-EF481762-5FC9-4751-B9DE-0EC74BC08338--

--===============3114380904077877173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3114380904077877173==--
