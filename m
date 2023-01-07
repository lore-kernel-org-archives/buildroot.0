Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264F6C54EBC
	for <buildroot@archiver.kernel.org>; Sat,  7 Jan 2023 18:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 850EA81E3B;
	Sat,  7 Jan 2023 18:10:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 850EA81E3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vx49iGizDVXx; Sat,  7 Jan 2023 18:10:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDF4381E33;
	Sat,  7 Jan 2023 18:09:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BDF4381E33
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6D5EB1BF3F0
 for <buildroot@lists.busybox.net>; Sat,  7 Jan 2023 18:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48E9F60EA6
 for <buildroot@lists.busybox.net>; Sat,  7 Jan 2023 18:09:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48E9F60EA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W3FDmS65rqGE for <buildroot@lists.busybox.net>;
 Sat,  7 Jan 2023 18:09:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E63760EFE
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E63760EFE
 for <buildroot@buildroot.org>; Sat,  7 Jan 2023 18:09:57 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so3298176wms.2
 for <buildroot@buildroot.org>; Sat, 07 Jan 2023 10:09:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:date:message-id:subject:mime-version:from:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p2MvtLtI4UpJHoouK2r623S8zjQeuQ4ABYFAXNki+Yw=;
 b=EMz6B8mzsAOjpYYreg15CQ7owivbiwWrh0takrCoPho4SrhOpklKQPFJ4AhfQRTM2k
 lMDxqQfYOQvc9W1Iw2Y5mA819GwmXrWwaASygT530Ual0Vkgk5fnnRfA/FU6OVcLkV5t
 Hf0DBe+iod4ImoVfFQ7cUjkguSGBcpb/NWYEXxI9aVjuAJPNVbeWDNtnV4rwdSyfQZ5/
 SsnbV/cFhyMduk21nQPYjJg6omDrRngPgNNsUqoU0TWQ0jwVVc5jVtweC2DrWt9w0F5Y
 Jg5itdZlrR4DsZPtx/7YCs7mYEVMloXZVsSTNscyfiGS5EoyurkMSyggrSQyfXXI6t+p
 QZvA==
X-Gm-Message-State: AFqh2kpM6ECSnxGxgJ6wBkwPdBPByHzHS6KF2AaPXlA/8B2Ch/iNacCa
 uxZl0sBj8QPo/052UCW21Lpo9hnwr/I=
X-Google-Smtp-Source: AMrXdXtHaZr6fq7F2n4znklWrxm7xNSAzZy4ADxCx7zqSYkYR1+ixhJeLOH/Pmo1NvSo0k506U49cQ==
X-Received: by 2002:a7b:c39a:0:b0:3d2:640:c4e5 with SMTP id
 s26-20020a7bc39a000000b003d20640c4e5mr40737892wmj.8.1673114995244; 
 Sat, 07 Jan 2023 10:09:55 -0800 (PST)
Received: from smtpclient.apple (bzq-79-177-216-44.red.bezeqint.net.
 [79.177.216.44]) by smtp.gmail.com with ESMTPSA id
 h8-20020a05600c350800b003d990372dd5sm11512981wmq.20.2023.01.07.10.09.54
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 07 Jan 2023 10:09:54 -0800 (PST)
From: Sagi Mor <sagimor6@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.300.101.1.3\))
Message-Id: <5DD722F6-F9EE-4517-9E55-5A61BB01F196@gmail.com>
Date: Sat, 7 Jan 2023 20:09:43 +0200
To: buildroot@buildroot.org
X-Mailer: Apple Mail (2.3731.300.101.1.3)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:date:message-id:subject:mime-version:from:from:to:cc:subject
 :date:message-id:reply-to;
 bh=p2MvtLtI4UpJHoouK2r623S8zjQeuQ4ABYFAXNki+Yw=;
 b=B7/hgD1DYxPU3sqhvOv+7/CSyIva+xfVTWpvD3hPyWDn/PSLxA0YYbml+PZIi7I1j3
 Jm14I4emuJVUejJDrdeLrK2fH4C72VMA2duNyxRmK+uyqNPXI6O9aAnSwQ6AlUilxrUd
 RCROmUGVbYyp3LD5y3i5QUAZb1+nuxC6S7kfT8PtBkmgXssB2zvEA6KaAci27GxXJlP0
 oORMKYga88IdfehkBMAvFKcge0l8mG6PGPkfp3G6XSjEUzKOA+KHW43IH2xOAimxM6Lh
 qPG+G9WCupUqb8fnNOsVO9C0ukBMOP69xIB1ARP1BNylQ6XMF0fcMq/f+pKI3+wOotqc
 mn0A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=B7/hgD1D
Subject: [Buildroot] [PATCH] toolchain/toolchain-wrapper: make gcc --help -v
 work correctly
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
Content-Type: multipart/mixed; boundary="===============0430801336004947738=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============0430801336004947738==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_02DB0DF6-DCDD-48A4-90A4-4106294D4E88"


--Apple-Mail=_02DB0DF6-DCDD-48A4-90A4-4106294D4E88
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii

make "gcc --help -v" display all the options, some packages depend on this
https://bugs.busybox.net/show_bug.cgi?id=15231

Signed-off-by: Sagi Mor <sagimor6@gmail.com>
---
 toolchain/toolchain-wrapper.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 37b24dd24a..85d592ad2d 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -498,6 +498,17 @@ int main(int argc, char **argv)
 		}
 	}
 
+	/* drop all non forwards args if --help is specified */
+	for (i = 1; i < argc; i++) {
+		if (!strcmp(argv[i], "--help")) {
+			cur = args + 1;
+#ifdef BR_CCACHE
+			cur++;
+#endif
+			break;
+		}
+	}
+
 	/* append forward args */
 	memcpy(cur, &argv[1], sizeof(char *) * (argc - 1));
 	cur += argc - 1;
-- 
2.34.1


--Apple-Mail=_02DB0DF6-DCDD-48A4-90A4-4106294D4E88
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;"><div>make "gcc =
--help -v" display all the options, some packages depend on =
this</div><div><a =
href=3D"https://bugs.busybox.net/show_bug.cgi?id=3D15231">https://bugs.bus=
ybox.net/show_bug.cgi?id=3D15231</a></div><div><br></div><div>Signed-off-b=
y: Sagi Mor =
&lt;sagimor6@gmail.com&gt;</div><div>---</div><div>&nbsp;toolchain/toolcha=
in-wrapper.c | 11 +++++++++++</div><div>&nbsp;1 file changed, 11 =
insertions(+)</div><div><br></div><div>diff --git =
a/toolchain/toolchain-wrapper.c =
b/toolchain/toolchain-wrapper.c</div><div>index 37b24dd24a..85d592ad2d =
100644</div><div>--- a/toolchain/toolchain-wrapper.c</div><div>+++ =
b/toolchain/toolchain-wrapper.c</div><div>@@ -498,6 +498,17 @@ int =
main(int argc, char **argv)</div><div>&nbsp;<span class=3D"Apple-tab-span"=
 style=3D"white-space:pre">		</span>}</div><div>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>}</div><div>&nbsp;</div><div>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>/* drop all non forwards args if =
--help is specified */</div><div>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>for (i =3D 1; i &lt; argc; i++) =
{</div><div>+<span class=3D"Apple-tab-span" style=3D"white-space:pre">		=
</span>if (!strcmp(argv[i], "--help")) {</div><div>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">			=
</span>cur =3D args + 1;</div><div>+#ifdef BR_CCACHE</div><div>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">			=
</span>cur++;</div><div>+#endif</div><div>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">			=
</span>break;</div><div>+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">		</span>}</div><div>+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>}</div><div>+</div><div>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>/* append forward args =
*/</div><div>&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>memcpy(cur, &amp;argv[1], =
sizeof(char *) * (argc - 1));</div><div>&nbsp;<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>cur +=3D =
argc - =
1;</div><div>--&nbsp;</div><div>2.34.1</div><div><br></div></body></html>=

--Apple-Mail=_02DB0DF6-DCDD-48A4-90A4-4106294D4E88--

--===============0430801336004947738==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0430801336004947738==--
