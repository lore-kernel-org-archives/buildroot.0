Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32A6C46467
	for <buildroot@archiver.kernel.org>; Sun, 15 Jan 2023 12:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31FE741682;
	Sun, 15 Jan 2023 12:54:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31FE741682
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BGuzFUhaVq_E; Sun, 15 Jan 2023 12:54:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25AF2408FA;
	Sun, 15 Jan 2023 12:54:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25AF2408FA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C1BE21BF29D
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 12:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9D9241680
 for <buildroot@lists.busybox.net>; Sun, 15 Jan 2023 12:53:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9D9241680
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 62wjfsxoKv7z for <buildroot@lists.busybox.net>;
 Sun, 15 Jan 2023 12:53:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB6BF415DF
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AB6BF415DF
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 12:53:14 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id kt14so3376415ejc.3
 for <buildroot@buildroot.org>; Sun, 15 Jan 2023 04:53:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kfTwvODlOpkPd6tXy38lcnd9njjgJQrst4KoDNR9LQE=;
 b=lno45bWKAa/thijhLq8XHPqOz2TEFYDQPAwJzwFIyz/9pK9I02KUY0h/leg5n0e1YB
 G5k8Srbx78Us8retpbOvBvjNXIZp3FeirPfZby1VlFHsgZfM4Cql16TxjsxQTNMg9stt
 SaMxBsr/oNxChWWEcnU/7l161kh+FM1t0WYKiJALkuHvmq87qlCrwrKbWvp76EJzHPi+
 daZxnP6/p3EtwirQ1ZO3fN0HTpDE85GbjBjrJfEX4BPB08D6ilvfZMFmmqhvzF4klMVF
 OP+lSNfk60bKJNOBOPDsRufwOjqIakuM6nm3P+QJu2awr03aKohwvOTlXEkkM5Kvjrro
 CRKg==
X-Gm-Message-State: AFqh2koBSdLflTpi72MFksiNcLMQ0V5+11R1YBmc+YSRqzbgZ+/cvXc7
 qd+KTNp/0O7MdlaQi7UA9JDItzD5MY4=
X-Google-Smtp-Source: AMrXdXv+n2GAiwaIBEkh4N6/RnH6Zo3Dnr5NTsHNmWCFWnrv2nhf63A6rAho3pcolCNrZXjkIYvOkg==
X-Received: by 2002:a17:907:2127:b0:86f:724b:726c with SMTP id
 qo7-20020a170907212700b0086f724b726cmr2222249ejb.59.1673787192822; 
 Sun, 15 Jan 2023 04:53:12 -0800 (PST)
Received: from debian-noppl.. (84-113-221-34.cable.dynamic.surfer.at.
 [84.113.221.34]) by smtp.gmail.com with ESMTPSA id
 r18-20020a1709061bb200b0084cd08e5cb5sm10581673ejg.159.2023.01.15.04.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 04:53:12 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Jan 2023 13:52:51 +0100
Message-Id: <20230115125253.280257-7-nolange79@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230115125253.280257-1-nolange79@gmail.com>
References: <20230115125253.280257-1-nolange79@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kfTwvODlOpkPd6tXy38lcnd9njjgJQrst4KoDNR9LQE=;
 b=F80BbPpQyB9FZWvxAtJ60XtgLfad6hQF4DEeQHTenhygIA5VZhj/Foi14wbXLuav9X
 Jw0fWVKhXM/+Ypd5vAlpo073X5sG0eqOfUN5W9DOLPVtbP5m0GlmFg7lcBXmApWur3ta
 ynLG4Jd6SsSn+aAnOH+a410WTfS6ov1imtZMv+rDPdpFZWuRcDtd1Bx4UdSXvsbY3NQB
 63/6eQIFMs3p+/cYwPhh1cLPVcZNVGfc/wuRsvuBrfEl43Bwfr0zTUodTqX3pL2O9i4b
 xHXodiZ3QJXdVg5MTrU5Kylw4IjSMj7nlXpTk7UPfQpgASECAtyepvm8DnUPxWGTOARE
 Qbgg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=F80BbPpQ
Subject: [Buildroot] [PATCH 6/7] package/systemd: handle creation of
 /var/log/journal
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Sen Hastings <sen@phobosdpl.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

journald will always have a runtime log in /run/systemd/journal,
and a persistent one in /var/log/journal under certain conditions.
By default it will check for the existence of that directory.

When /var is not backed by mass-storage you typically dont want your
log duplicated and journald should be tuned to account for
having only RAM available.

Buildroot will now create this directory conditionally together with
it's handling of /var under a read-only filesystem.

It is rather easy for users to opt-in by either creating that directory
or editing /etc/systemd/journald.conf.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/systemd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index b96873b73f..420197005c 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -61,6 +61,7 @@ SYSTEMD_SELINUX_MODULES = systemd udev xdg
 SYSTEMD_PROVIDES = udev
 
 SYSTEMD_CONF_OPTS += \
+	-Dcreate-log-dirs=false \
 	-Ddefault-hierarchy=unified \
 	-Didn=true \
 	-Dima=false \
@@ -100,6 +101,10 @@ ifeq ($(BR2_nios2),y)
 SYSTEMD_LDFLAGS = $(TARGET_LDFLAGS) -Wl,--no-fatal-warnings
 endif
 
+ifeq ($(BR2_TARGET_GENERIC_REMOUNT_ROOTFS_RW),y)
+SYSTEMD_JOURNALD_PERMISSIONS = /var/log/journal d 2755 root systemd-journal - - - - -
+endif
+
 ifeq ($(BR2_PACKAGE_ACL),y)
 SYSTEMD_DEPENDENCIES += acl
 SYSTEMD_CONF_OPTS += -Dacl=true
@@ -603,6 +608,7 @@ define SYSTEMD_PERMISSIONS
 	/var/lib/private d 700 0 0 - - - - -
 	/var/log/private d 700 0 0 - - - - -
 	/var/cache/private d 700 0 0 - - - - -
+	$(SYSTEMD_JOURNALD_PERMISSIONS)
 	$(SYSTEMD_LOGIND_PERMISSIONS)
 	$(SYSTEMD_MACHINED_PERMISSIONS)
 	$(SYSTEMD_HOMED_PERMISSIONS)
@@ -782,6 +788,7 @@ HOST_SYSTEMD_CONF_OPTS = \
 	--libdir=lib \
 	--sysconfdir=/etc \
 	--localstatedir=/var \
+	-Dcreate-log-dirs=false \
 	-Dmode=release \
 	-Dutmp=false \
 	-Dhibernate=false \
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
