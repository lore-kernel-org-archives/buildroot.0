Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA5EE8FDA7
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 15:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59AA24043A;
	Fri, 26 Dec 2025 15:00:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LFPuvfVkx6AH; Fri, 26 Dec 2025 15:00:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B2A3402B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766761216;
	bh=ggUjqJMAFIidVi2MgLWchY3UO+G1M+cZoyRWoSP9CJk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=L9ZfDvDObrT9Fooanp+dlsqKCEXL3yaw4hS38Rw+B34aEzlhNzLXNZt6qaIhVno/1
	 ZGXQTEWSyjQtfgyMKelo53j+mtynxqQq1npo6f+zNQzDbAGFAc1MuszN02RAQXR5Ss
	 yI1ekJA9Dm19N8wFZREv56GiAolUrg14FUYWG2EPHmEygkVXDxPCZYrimNepqCufYx
	 anQNcxaUWa3WS9wcM+W6FHx8hB+2EasDdi7KePfEvWRx2JVwyqEsD3yKpiPtr8DPmK
	 GlGjAFgDxN1diYK5QeajIgNEAHQmIAYh7EgZaS29lYlf1PT/PTzpLDnSMOLN+VExYR
	 v/YGMLm6v+Zow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B2A3402B1;
	Fri, 26 Dec 2025 15:00:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 278C5B9
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 15:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0EF9E812D9
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 15:00:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yaUqWdncARs3 for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 15:00:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6120C81236
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6120C81236
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6120C81236
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 15:00:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id E86661A2440
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 15:00:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A752A606E4;
 Fri, 26 Dec 2025 15:00:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 04CB8103C8C77; Fri, 26 Dec 2025 16:00:07 +0100 (CET)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 15:59:59 +0100
Message-ID: <20251226150000.919800-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1766761209; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=z8IGFiRpUfCIV218wDRdOrUF9XXoKutNIimHM/1JckE=;
 b=sFBBduAO0yLhwQj2OOrxtoGLYNHrJAuVtk/fuxv3bfTVR60H1x1kyiEvfTFGHM9o38w6Hn
 Dl79MMTA9EQL/lpSQRTHCeT8knfi4j0e86JFh77ZlDNeN+fC6U11ab6MAnNKquBkdxAaqs
 SKFAHKLk6K0LVEqboDIjo2lnD8JfM6FQNM4O8Vc0QM6VpuvFdK2QOGxDTmXE/uqy+gsKEn
 XYv+s1tWQcXBQL5ilPVQ4gH9QvA3GyUCq2sjveLBZeP4p/vKq7Uqh6Nr6+5ViIfCUe2DZQ
 YaGVeZw2rbF8LjBJyPA0fiCncPeQ2k5+Y5UVi2URu9iedDqRzlZjxB4r/lpZ+A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=sFBBduAO
Subject: [Buildroot] [PATCH] support/docker/Dockerfile: make $HOME folder
 read-only
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The $HOME folder of the br-user inside the container is currently
read-write for the br-user. However, practically speaking, it is only
read-write when the UID of the user running the container from the
host machine is 1000, equal to the UID of the br-user inside the
container. For any other UID on the host machine, the $HOME folder is
in fact already read-only.

Because we do not expect Buildroot to write into $HOME, and in order
to have a consistent behavior regardless of the UID of the user on the
host machine, we change our Docker image to make the $HOME folder of
the br-user entirely non-writable.

Suggested-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Of course, once this is accepted, follow-up patches will be submitted
to update our reference Docker image.
---
 support/docker/Dockerfile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index e7677ac6a9..cb3fdba151 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -92,6 +92,10 @@ RUN sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen && \
 RUN useradd -ms /bin/bash br-user && \
     chown -R br-user:br-user /home/br-user
 
+# Make the br-user home directory not writable, even for br-user
+# itself, to catch builds writing into $HOME
+RUN chmod 555 /home/br-user
+
 USER br-user
 WORKDIR /home/br-user
 ENV HOME=/home/br-user
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
