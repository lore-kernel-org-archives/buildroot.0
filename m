Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87726CA9EC9
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 15:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45CDB81162;
	Sat, 10 Oct 2026 15:12:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tyz-7B-I_rrV; Sat, 10 Oct 2026 15:12:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6F23F8122B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791645121;
	b=M2MwPW6kwV0ApkEt3VaVxaX1vWRXdNU2OjxwmClycCgsTn58eZH7FW5Dlq+xTmhTZRwq
	 ++P9iGW+S9h0vYHiKU7jMRNNCxhXFHqQxkCX2hkPRUckhJ7gnQodo5s/G8CzohyAeARjG
	 9GNqoHvPm2NcIFEpINQBQrxaUTekl/KlsDKdPariG8u0MvhxaHh6ZJUkjO1hxrQOn6Mhc
	 6RwczQDMeMfu/PwF2jXXrmb4q6NGdOqx6Ga+1Hsuadwh/9Et9Sw+U0FcxgG/ogb4cGOFl
	 J4NptUXh6ZjX70PX5SkUzKXzgWfqswqBTy2IliBZ6NhuAE1cg57+KFC5r9FfDbiJ48w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791645121;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=yA9hyioC2gZ93cCvRrYtM5B0uQeEv/NKOfNYDOVBOVQ=;
	b=e6Vq7KLrfHbiyF+q6PtWESSwu3KMFDyUh9drqn0+jE9quwy3KZ/UdA7EAD8H8tuRXe2D
	 QSA9jkzG2wpyMu6/G0UYSvZfmXzR0Q6i2GvFU7S1bbG4x3BTR2bmbYBdbH2A3aMPSfXgk
	 lBCCZSkE25gZcHjUSORWqn0RFMAnbNAYeQbG18aOL41mR8GxN1UUGFiGQyoHVCK1XFf+H
	 8f8vVMuYFM25yXy8FvDaEjbPhbKhXlK6hhY40MoNtA/sxsawrM7YlHmmeuo7/M0as4IPN
	 hlz0Zld9mSrmg5LvlMcSUTbeo7SfrK0e5oCXn+WvQSqiMPLopZremX9YHqdjHLrZFaA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791645121;
	bh=yA9hyioC2gZ93cCvRrYtM5B0uQeEv/NKOfNYDOVBOVQ=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=nMQpD3csaGA1+91fu3LVlaFONKDGg66oq4aL0ISr/1VFVvkkWfRbRhwZuSCWkkn4K
	 pfe/nJhirVakl5m/ZBgXQK8MxJ91Rl/6+jNO+IzWNG41fG8c8enNmBPNnhaNYYKA6H
	 GIJ7pbn8iLuorT7M3DZo6GfT2M1uE41RkBemQ5OQLk39i04FIIGPbQi9Ebgt/O8fIE
	 qJuMmN7CPUTAFJtOTuxTOeXZ+YHXny1Bf8qSi8Bztfoy3MSoNWefsGZThsXIRj07BR
	 Ndw7SS9JTxdHqtMOruBYUR7EtVjsgzq0/EiZz0nFss2gQ6PvoLH6eF+ZeF8nuJZrM/
	 2bi3UfZzLRivA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F23F8122B;
	Sat, 10 Oct 2026 15:12:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BB86D317
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACAA481173
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:11:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ESKVQodd4xXR for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 15:11:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C2B0881154
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791645116;
 b=Nyl2ioQJI8OxN+4ltUwGDEjIshHw9EAOl11zSxxietcjghF1W+FbhLjKvRrNVNfAW5JA
 dcSA9vLJsvt/5Pa+J6l8kObVizSdjwNHOxxmfUp/WzAbYEXMccFrt5LPTXVyX/H4vpgMs
 BrW2k9HqPNaZjefzJuPf09pzE+tGaZaJzF9YiU78/BgA9Sz29OVHMhdDby+jlSKIsDqle
 8kWrohxJi4TztGTyMs4InDg27lP+mnKUcIpMFNVI9kbUpvPlDh57sjjQPT0H7UpWhGF17
 PajdoUTqjHDhobpWDbYRJ4Iz6lRaT+uDmrQdKlg4g3dDyqW4a/rnE5KRMLFb0JK9XiQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791645116;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=8YjhT9NNEsfPuYTGNE9V7I9VCgNalbir0uu9b2h2WSk=;
 b=NgoUP+Ujb37ze4/PPqWtiVP6mbJDK0Put6uQL7knnZSU9L1NH2yvRdRTXZWTRmGESQB/
 TYGdztlqAAo9pJOlsPShbCXWPra04VZwdRy1r6foffUbd2kzmGtRUTcgVz1m5BXJgwTrD
 RuSDKNDAeC659NBYYaQDpfRsK+0IIbqbshhTlRoFiAVmNoNBXtbOXhGphjKyGXKfwSaCW
 Ksp7j0yasaF5YhjEpePlkEixrebtQuzcpd9lhzCXmSgQBuNqDiBB91wNBzXLVS6s6G61Z
 Yhbb3BdtRRAE/BIWNOz3/bCsLLAAfjh96clb122q8uhxeTAiuOXxdcZz5Eh217HVNYg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Jyx+UF8k; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C2B0881154
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 15:11:55 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-49d0da752ffso6930345e9.3
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:11:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791645113; x=1792249913;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=8YjhT9NNEsfPuYTGNE9V7I9VCgNalbir0uu9b2h2WSk=;
 b=CE1aOH4BmrNYDTO7rhN1nPL1C5x0tTcctSgu9mIVycSRvl52CHxbTbfJ9A5+2OZUzT
 h2wZrYuecYlCQG0eQmM7519CCANRVTwJ8SoO6IWT+qc8R601pzCLrsMYhFJFT7cy1qYE
 F+oWyds/54IMwh9ESFogySwnNq5mGH5sdtTZqdu4mK98tOsPMfV4U7Kja+EWoRWMX4Zl
 sp70x9VjNsiO6D89QF6O1h/i2rvJV6oMh1eirgaqTySZvpVJDfRvoLxmJqP+mqd8mb5f
 ObXVQN64hd/C3QimlynoPzDaczfjKAkwJ19q2v24y12gN/GGw6qyr3C9JVmynTELwj4w
 vx3A==
X-Gm-Message-State: AFq9FYIdX7uM3FY1UoBEDKQLRCJfmTBH+/3YisVqUs6dqwM0QqKzNsRx
 WltynW4GqaJ/HW7x4U9LuN7IyOopBPOLoWCx/5WKVd0hFtj2+UySaOTjnDNAKovX9ehwLukcP7y
 a6p9Le9E=
X-Gm-Gg: AYBFou2PpmRJiGT/Ej53Sa4gq1KaSajXfjMWZVuXUZyKO4LQAoc4dUy2krZVsnlA3Ze
 RQiTZbfycz4jmGQI3x6QdUYiWAn2PM4PySAxlN3qiTbSC1yl2/Q57Fq1Zbv3EhpmisQ6lu50vTu
 C2k/yrSwRA6Bz9UEGuSpNBqg+otFrJnwEAFxOXRIRmQp0f3h1gdip8p3Kga8qAJRtGWurv5IVyW
 AOvokcjPiiNpZBjKXT305tXXjEa53Ptp7raMDw06R1QHga0qyE0jdHrvWHMo6FNcPAmnElJMaEU
 1UI2Sdb+cLkcEfAbRUtdpH+v3j5TBfTBCqHLKlOHC8RuW1HEeXv3fH8/evmiIz8Ik8Bk4xshL+S
 7mVnP2AWMi50rZUByHF+7Ti27eksAB2VZrxPE03kxQ5kgHgmLSiMNhSaJx2JxT16yQXw+XySnUh
 kSpfs96f88DxkYZ0XASiSyqj/4pZX+vlTawh329K8o8lGpALIz+qlnL7WEDLTGU65w75ARAFjgj
 ZfjwY/56OsGObqFN0VkT3EVfLrkF1Elwr1lCBUavC/ckl7fOiSGxX6XcdFH2XTQKfGp7n5OWw==
X-Received: by 2002:a05:600c:3e87:b0:4a0:a34:6e7d with SMTP id
 5b1f17b1804b1-4a18e4bacbfmr89465145e9.18.1791645113406; 
 Sat, 10 Oct 2026 08:11:53 -0700 (PDT)
Received: from dragon.telekom.ip
 (2001-1aeb-401-dd00-a87-9755-c250-f5ef.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:a87:9755:c250:f5ef])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bb6b3cbsm115104125e9.0.2026.10.10.08.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Oct 2026 08:11:53 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 17:11:18 +0200
Message-ID: <20261010151121.876133-7-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010151121.876133-1-titouan.christophe@mind.be>
References: <20261010151121.876133-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 6/7] docs/manual: add migration notes for
 changes in the kconfig syntax
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: petr.vorel@gmail.com, ps.report@gmx.net, yann.morin@orange.com,
 thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Previous patches introduced some changes in the KConfig syntax,
namely on variable expansion and choice entries. Reflect that in
the migration guide.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 docs/manual/migrating.adoc | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/docs/manual/migrating.adoc b/docs/manual/migrating.adoc
index 86b040a19c..b2e0cb24b4 100644
--- a/docs/manual/migrating.adoc
+++ b/docs/manual/migrating.adoc
@@ -270,3 +270,16 @@ changed, therefore the suffix of such tarballs has been changed from
 
 Due to the update of Dovecot to version 2.4.x the runtime configuration
 files need to be updated.
+
+Following the update of the bundled kconfig infrastructure, the syntax
+of +Config.in+ files changed in a few ways, which affects **all
+br2-external trees**:
+
+- variable names in +source+ statements and prompts must now be
+  enclosed in parentheses. For example,
+  +source "$BR2_EXTERNAL_FOO_PATH/bar"+ must now be rewritten as
+  +source "$(BR2_EXTERNAL_FOO_PATH)/bar"+;
+- +option env="VAR"+ is no longer supported. Environment variables
+  are referenced directly as +$(VAR)+ instead;
+- the prompt of a +choice+ must now be given with +prompt "..."+
+  instead of +bool "..."+.
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
