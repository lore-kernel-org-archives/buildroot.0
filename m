Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B03F3D5FB
	for <buildroot@archiver.kernel.org>; Sun, 29 Mar 2026 15:47:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0C1C360A52;
	Sun, 29 Mar 2026 15:47:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oNHr4y6loVCo; Sun, 29 Mar 2026 15:47:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 129D460A41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774799264;
	bh=8PmnM8gB4exdvKPIQt6VI47Pc6On3rKBjsu1WXvbyo0=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J7o+C6iUJEsVv6BvS4Lf3Q55q7UdjyCtG4WFIXa504JrLgcqBFmHXdcruuTHXKvFK
	 sLV04ex0t2paedKX5ss6DeSNWuIJIhI5d7zTuO7mJix/AZHIKBFYXIzBfysnANPk7i
	 BOHZqeyhhN3j6LZV8OQ4+MHtGnmgzY2TUithrDCRnyrbETWJXWm4KuRQ6Ur9FYHrYi
	 k6U2WsD/WxUZjAlQIF6pmGF7QQo59A1KwJ3y6Bazh3ZRxHuHqJWrkcKPKdCWb6hQzW
	 xN5AYQb//WLn0VI/BBJTDmcXSIWu9W7Vfvox4RsEOEpoEtW6+OKOhO09zsSLcEI5/B
	 AZN2cz50ARs9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 129D460A41;
	Sun, 29 Mar 2026 15:47:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C76E82EB
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 15:47:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B833C40188
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 15:47:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mxLK9SYemrcX for <buildroot@buildroot.org>;
 Sun, 29 Mar 2026 15:47:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f29; helo=mail-qv1-xf29.google.com;
 envelope-from=a.p.dicarlo@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B26D3401A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B26D3401A4
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com
 [IPv6:2607:f8b0:4864:20::f29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B26D3401A4
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 15:47:38 +0000 (UTC)
Received: by mail-qv1-xf29.google.com with SMTP id
 6a1803df08f44-89cdd75e424so38345576d6.2
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 08:47:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774799256; x=1775404056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LPlrR9xX76FUN5ufckzTuMiTglDMB83YXRwl3yxx2V4=;
 b=qybptJGjONnldsQzOxGEEt84wwyoJ6ksLAmobneFCcMg8ku8C8opvdMEj3/EYVTEMZ
 FG+9ZSM2bN3m3QbnmJpbQ7JG9F3SY6gX4T7lvPGmbz8lvX8wCRq22TBn5yn8Xp5qeTnq
 4Ns4CR2I1LtaUR2MKeE0bwONQBPwln6cBlSq5fPQvvcw0ZtizwOlWUVc5pT8odQho9az
 VJ0ej1QeejznRVevQSmaTA9/nRnpiMXlRvfzCT5wvWvClwjlD4vMyUg/qeBYZ2x52eT+
 LzY+QXUR3CqurZqf0qjvCkwjNJUcmospF9qlsdZpkHIwFfT4amzvLAgMf/135HmgRI6k
 fJjw==
X-Gm-Message-State: AOJu0YzPJORHghgr8rUkR9VxCbTM/9bylqj6AlVnrDaOQXWejfc5Aatl
 KHOClEEH3aieAkA/SA28nr+s7Xf9vB1aXaZMwStITGAmXEbdk3C4ZM1MB4pVvgXG
X-Gm-Gg: ATEYQzzNSYLTR0rTZlVybBomNUhzWltQgKcxr9yPkNPSVqSRYND12089uwz7eMrXsCo
 JFwadPmuZrHYneCrpB9XHv0a/KIswW56YrZtlfAVE41uTODRjxwcmMcZSqrYMlVXnlsmgyGbzso
 9XaeWWLU+ObmnTFxehLJXcW3Df6+WuZVCxCf6UIbaqt/UlibVGBmSBU7S6z3sPwh/xIAxUcs6f3
 ia658LIi6bjNnRZT/3cp7g6EU9V3e0Sop0mM14UZQDgGp8GCR6QfGvmH9BJcKmaJ502bhcDq8Vw
 iApmVScdvSXI+8mKvzbi/adqhkFBfJ409wEebEKD0jXfEPPt1xR2ONSaTt+iW42En8l5YTkZWhl
 qdY4+g5yOluQVnj/fGzK7Og2RhT3eJlPdXMCS91pXWsodigMSLiwEfzwRYv0LIVccrQ8maIE4Y1
 hkXM9mR9arNSIcRc8gLkBp
X-Received: by 2002:a05:622a:1b89:b0:509:820:58d7 with SMTP id
 d75a77b69052e-50ba39792eemr117689581cf.52.1774799256267; 
 Sun, 29 Mar 2026 08:47:36 -0700 (PDT)
Received: from adicarlo.nyc ([67.245.157.254])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-50bb2c678cfsm42980681cf.2.2026.03.29.08.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2026 08:47:34 -0700 (PDT)
Received: from yogur.coo (yogur.coo [192.168.7.134])
 by adicarlo.nyc (Postfix) with ESMTP id 54624A9804F;
 Sun, 29 Mar 2026 11:47:34 -0400 (EDT)
Received: by yogur.coo (Postfix, from userid 1000)
 id 0E0868A; Sun, 29 Mar 2026 11:47:34 -0400 (EDT)
From: Adam Di Carlo <a.p.dicarlo@gmail.com>
To: buildroot@buildroot.org
Cc: Adam Di Carlo <a.p.dicarlo@gmail.com>
Date: Sun, 29 Mar 2026 11:47:07 -0400
Message-ID: <20260329154709.539516-2-a.p.dicarlo@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260329154709.539516-1-a.p.dicarlo@gmail.com>
References: <20260319022906.47253-1-a.p.dicarlo@gmail.com>
 <20260329154709.539516-1-a.p.dicarlo@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774799256; x=1775404056; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LPlrR9xX76FUN5ufckzTuMiTglDMB83YXRwl3yxx2V4=;
 b=Ih/6TUBBquzk/PVimQblJVpG/APnOWTaBS7IgKQT5wOY/MGGQ49smX4GnBpr15ybUD
 5Ob3sVfbmPXxgIKWiB07d3P5sTrNSZ9rY1lOKoeFxca7lbVRv4QigiLnAuV9c5lAbx+f
 54CnTMl84ePDXR6OAiQBWaJ44IlAyQMyxY8kDKcEQpebYZ7HobhP0qX87D98eVQkqLB0
 KcLJoIoAzr94G94p75c5htJxC14Dxfzq+Ipl4OFG+afd4rhxV4VyKrjXwc9a0n2eprAK
 QzpQHeYVIXv2HeccHceb1htNUIdifUMRs1oYx02102+g84sW55qkMh2arB0ueA01Ivfn
 +jQw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Ih/6TUBB
Subject: [Buildroot] [PATCH v2 1/3] package/gst1-plugins-base: if libdrm is
 enabled, make use of it
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This formalizes the relation between the configuration option, now
automatically aka randomly set, depending on the state of
libdrm (BR2_PACKAGE_LIBDRM).  Since that host dependency was not
previously noted, configure would sometimes choose one way or another,
but usually without.

Signed-off-by: Adam Di Carlo <a.p.dicarlo@gmail.com>
---
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index adfb407386..467e15414b 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -47,6 +47,13 @@ else
 GST1_PLUGINS_BASE_CONF_OPTS += -Dintrospection=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
+GST1_PLUGINS_BASE_CONF_OPTS += -Ddrm=enabled
+GST1_PLUGINS_BASE_DEPENDENCIES += libdrm
+else
+GST1_PLUGINS_BASE_CONF_OPTS += -Ddrm=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_ORC),y)
 GST1_PLUGINS_BASE_DEPENDENCIES += orc
 GST1_PLUGINS_BASE_CONF_OPTS += -Dorc=enabled
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
