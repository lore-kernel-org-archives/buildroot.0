Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E297CCF2D6
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 08:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1365880E2C;
	Mon, 19 Oct 2026 08:37:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JfCHkfU0EB8A; Mon, 19 Oct 2026 08:37:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 27FD280F5F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792399055;
	b=kZAxj1kOp8nussqHZxXlD3mR82OawZi1i8NBGWEYJRkXBUDXdvmpHHZg/SsTXCTKr7iV
	 NNrksC0lJ/3pd3ngPHr702M/X+9cGdnNpZegbZtRrGtg40+KHuBode/yQ/EovROnxew2L
	 T6gfg03qYM4zbOPA7WQTNYFlZiqlOXKWch3sMhb4C5PG2DRJTq/2UwJ9PpW7U7HrRjkqN
	 0P6ohylDWYnutrhpqB/xZXSAyAh+fvx5biAsAKk+Oxw6r7A3Jj5YajsB8BRz9VWwCV+d7
	 zRbJjhcq9sytaOuXEqIYBdyn8+HvckjUkLBsIxrsZk/CM2zhkDd7gjD1zNnnYxQcSPA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792399055;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=R3CDeDZaPbQPfov0+tAz4efl3CYuKh+RihTXUmZDsO8=;
	b=iSwfzvoThuxkBcGPEFvAKtkr29uDXajaoiNZb5Pk/v+Uo7MkF6Cbk2lR0WQTbfUNv1EJ
	 koSvAlooD8qHmnjq2494jNNaue6/TRZPG+AiBsGvZ7Ulmn70veR1RD2fwB6m29vQBDwWp
	 Jd/bBVSNTEIKH/t+wdClCer5CnjIPXx/8JhGg/scpRbt02bNX0iK2VRimB6/ChJQSy754
	 mjO2zkB5jU39XqUEHkIF8fR0gXmlFmIK8/7hhVHYKiwDlmC0XgO3m0Lr7bez0eCFEwVjm
	 FY6Geng/glpIs+vizNUcETgDcFqhtG3LFr3vm3fBFCfRaReTMQnKWzqfu49MfSKyG3w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792399055;
	bh=R3CDeDZaPbQPfov0+tAz4efl3CYuKh+RihTXUmZDsO8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EDDm46XQQD49MY5YOsdBr/bdgeyM1ZJNVkFH/Dddy0HzXE/roAE97Fme+bphwsE+R
	 X8k2O1qKlg+LTHsJwz/QkGAcEZiJ0xK6pQ1W7k/uB9wbJbu00RHqppU7IbtsqeOMFp
	 Ob3SZJ2gGwE9UYNhjucmA6wlcU0TTOMjLw1vwJfyIsf2C0o8NuxHOWq0pMjV2CT8Cl
	 rz1blibUrMshniVS3ULk9FKjGgrRLxZCQlqmGMnzhJZpV9KnUP6obDGODqldiz+J4b
	 +Sb97exY9zv3OTR7/wdURt/UCKKInN1VyNrkSANxfnKyTgOklpIz6iLR6x7o9U4CX2
	 ICNCiqv7LZ+0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27FD280F5F;
	Mon, 19 Oct 2026 08:37:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A0D85263
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:37:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 90DC580F5F
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TciABsoivpZB for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 08:37:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CE02780E2C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792399051;
 b=gTDI41xc8v1kaZ+K8mxsCUwQEo4jZznvr0UJQUQ4cS12nm8ZFHbx6WkxOyfU4+VUnu0D
 k0Q1s3ajFLmbzOrGYjTMdkvlW9ZffXdaWjlAnbC79QeNe3qb4ZqOCQxD0fxpiV21fRByS
 cAsP/XZvSwR1sANkX6SDsSsFA7xqQz4h/A+w3/WJQ0yQPfjry67IGUiHmH7+pEG9GdnWb
 TLva7vp0ry4uWK7BgL+So8A0eCp/moRQszlBoQtWr0jdTJlte/R0+dIxOEnNa3O13cjdk
 pVU6EmLfTe0lE6TtzBKQWAJcToL3tQE3kCofbmHqv5vi6n0njcgHh4uuQvPbSQ5V7ow==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792399051;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=gxGNDqEKtc4MQec+yL/gL+Nla7knUsQrAaHaNsV0OQk=;
 b=AJtUHq2h19bQtX5SNPij3o50XkP8OdRYse2H2IzOhfaEVMFXmQ1VYsBoEShcBwrE/yOm
 bBBi8GtVV/tiS31A3kXCKFrgfUC8fPHotwP7DMEKTuQu5I2bJZD5nxKtB4ZOwqk124eDT
 oR/pXKARu7cEJta7nBo1XDVFvk86aaYSoGGRIyOX3xQh5khWhCULlafvD7ifuN115r/dN
 lJC/4Wo3YlHD+3BZrgE8QOJzhJu3M9TEARpJIZ77GyKhsRUJIhhYI6LyHx3W7FxC6o+iL
 wbpBO1BGtuHm7IFGWj62xCWda/VgJZgCgIYfR5+ealxG40fCdsi17nyw8fypStqB4hw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE02780E2C
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:37:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 55936984AB; Mon, 19 Oct 2026 08:36:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 10:29:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4557cd6597076c7fc1d76c430b252b09f1cb895e
X-Git-Newrev: 2b8779b40573a5df82249a781649d1a0e32ef899
X-Patchwork-Hint: ignore
Message-Id: <20261019083609.55936984AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-fastapi: bump to version
 0.146.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2b8779b40573a5df82249a781649d1a0e32ef899
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index 97346560ab..8c4142b76b 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  de01fa672d0af011a4d534e5dfbe3240  fastapi-0.143.2.tar.gz
-sha256  e9e6d97018dcfd748da7d9e7c61cedefbe9eb91b1a3288e45b13fbae76df2d54  fastapi-0.143.2.tar.gz
+md5  1acee1cb23e9a402c5d8afc54cf5078a  fastapi-0.146.0.tar.gz
+sha256  e96047fc353ff43f7fda069c3578a7d94902a762d9aca2e065f7f801abd91a49  fastapi-0.146.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 1b373acdfb..6301b61742 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.143.2
+PYTHON_FASTAPI_VERSION = 0.146.0
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/19/f5/4bbb2df9bb6f365151f2c02795ca3f17f78d08e670a394df963f3d8881ce
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/cd/5b/f3b4277844c3ce66c16f62670cd2a26236489aa97115d04182171ce714a9
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
