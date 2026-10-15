Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1EDCCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30C42613FD;
	Fri, 16 Oct 2026 13:14:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lfpf33q4-y4y; Fri, 16 Oct 2026 13:14:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D1C886143B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156446;
	b=n2rE4Hl2m3CgbSpik17DL/5aVwLtU6rLdr6RO9/tacyDUjl9ttFS4dkS9YjWZfK6M8So
	 9NZfS0ySF994aGeTtXNYGvjfC7OMjoEvF5sWe0E8dwfQo8hoYla9k4RXx/60PSk9Piq9p
	 YFONm7pvlodkBPrDS91eUsUrcJ4tq5JfhYjkmiata9x7wUS448PlXnGo/fQ//i0h+1yMg
	 qN7v+zmXtcdaZ7W6tIeE2Yg6coNij4Z1WVpFkC1UWEvvDOO3/g6eKRU/PdADFO2z8v2rt
	 1Msf0BflQ+9MVOt2cBZbd0ZjzAbPGa79OgQCxSg3cPL1q3UqqqFR3a9N0Udc6Q7MKkA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156446;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=wYNKVdfnJsN5PTO+FV/rdOE4x3ABXGX6qh+BHpZBXL4=;
	b=skb4rEmzA2l0URQJ0Zc+CafdFgzzBs6vj62048teCXrfhR2QrYfcNHfOc1chhyh7mdsZ
	 nuSsb4G9bCEY2002mG2GXdm3JcHbWVJcNJR7bYDIX2BlTfG79h8BE6/AXD9rSTkmUR0TV
	 CjrutaSt3p0NARmXAQXJAiQ8tgHFxLcAY36bgKLmYtB8N1y8a2XfT5O8oqxK+BFqe748W
	 9OvBlnKp8N+c5pNGqtHUs5T5b1lxXr2XIeMlHADAXggsFDQ282fIqsUUxbmFSqw16iVOZ
	 4SqkBCJ/SFN8sf3k2ervpi0TMgJXlRt9g7bULhmsNo5p+YsJIMFPUZtEYaKrNeag5Tg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156446;
	bh=wYNKVdfnJsN5PTO+FV/rdOE4x3ABXGX6qh+BHpZBXL4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dJJz0G0jIEdM8eoTWaJgRKe3lIEy9UjnVFdXqB1rvhFt3I/n1SRpuhLPW4nPWT4zk
	 Tv/E27OG2yhYyHGw3AXQBLfwIdOYbQ33LHBu8+54MqVFwAFL1fbn3ntXdozXSQC+bv
	 WiqT3mb3achLub3rSw1+XrD+pVyKAwKv3QwV5Kv5QajUpCVtqVwcmKSeJIaq38KL37
	 xjFjCFFDyGoMojZx2b4NqN+Sqx5zGFWTKhMSyj7xV9QhDl8Ygo0qf/6TemTTEMHbsx
	 OBjCbpxpUdfdaK7tM4VSkzCBIoLiJEKt+Bo/NCEmg9gCRba07Ih0TI0XSwKea9dpi9
	 Y+Gn1Db+zd3zw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1C886143B;
	Fri, 16 Oct 2026 13:14:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E44F4920
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C869860F1D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xTlltIfeH1i5 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:10:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B8B7B60F63
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156194;
 b=dIuz1hIruFy6JPf4u/L/kfny2q57yjN9ZZrSKdjsfIQCaqSOMg8B6GaVifzapnN2H456
 RlMKLT+zav/3aPH3fwdQFUfvPjSfxkMdzj9cZpcFTUK47Lx95y6x1ARf3CJlTBHnHcHN6
 /PQg6dQp+drwko4WEZX7pL4cnw1FjF3VgNRsY/VQEtOmDrXuJn7SL92P9SF6/fJOEbK3z
 NdTA7Nnp29YN5VQTiQ5MQA/WlUc3uwy3P2yu6RRte+r5BieNS3qTl6kYi2K8qSyzHgG9M
 h1rnBAT5IdPqUe/PTlWkM9f5Arc2BNxuw8PWDsGLK1fMuK+IkA+8C8ImQ0IqfOKC7nQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156194;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=BUFBWuySKc8g8ke9/MJdPskDnUttpcttKM4S2jPTcDU=;
 b=DrdcZSbTVJUgCqbkKqbRWIcTtqz5mIXdRjvE8xUBNruzfFPWMc9uMeKBHTC/FTPq54ey
 YMxGZOUW74kQS7wmiH53M5n7nH2zMD7PBMANAeHxo27ni6uo4bBe8ONYRNL1w8VTlfvAs
 EIzcsYbEA3ACxI9bCDnHEmkC76pc8YdKUFGmFgJC1cn5PXIvFdgvAQjxBAr/30xvjEwgu
 ZSs17xgJEgCd14sXTYc4l871zsNVzk7B5pvLwJaVVVQ5nJNW7sBHzqNiJEPNK0+RgF6BV
 q3FlJd4StgOj61nTYBW3erWa26dNzfgBzXW6hgKztGZ3XcZaFWxjSJ8aIB/u7sqpO4w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B8B7B60F63
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A86E7960D3; Fri, 16 Oct 2026 13:08:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:54:35 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: a9295cc3e4028ac46840fc209eb6f2be9d9f7cab
X-Git-Newrev: 59bb1c43a4c6d3a628edb4a2ebf4672549af9b78
X-Patchwork-Hint: ignore
Message-Id: <20261016130833.A86E7960D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] utils/docker-run: mount
 and pass BR2_EXTERNAL dirs
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4893347121810124110=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4893347121810124110==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/59bb1c43a4c6d3a628edb4a2ebf4672549af9b78
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The BR2_EXTERNAL environment variable is passed into the container,
and each path listed in it mounted. This allows using external trees
when running a build using utils/docker-run. Testing the existence of
the variable instead of a non-empty value allows passing an empty
BR2_EXTERNAL variable to disable currently set external trees.

The --mount option needs an absolute path for the destination. Make the
paths absolute the same way br2-external itself does it. Do not use
realpath since that resolves symlinks and would make it different from
what is in the BR2_EXTERNAL variable.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit ddd4788c1f1f047398aa028954381372b5ce47be)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 utils/docker-run | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/utils/docker-run b/utils/docker-run
index 8cb15c9c48..675e945193 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -97,6 +97,17 @@ if [ "${BR2_DL_DIR}" ]; then
     docker_opts+=( --env BR2_DL_DIR )
 fi
 
+# Testing the existence of the variable instead of a non-empty value
+# allows passing an empty BR2_EXTERNAL variable to disable currently
+# set external trees.
+if [ "${BR2_EXTERNAL+set}" ]; then
+    docker_opts+=( --env BR2_EXTERNAL )
+    for br2_ext in ${BR2_EXTERNAL//:/ }; do
+        # bind volume source paths must be absolute
+        mountpoints+=( "$(cd "${br2_ext}" && pwd)" )
+    done
+fi
+
 # shellcheck disable=SC2013 # can't use while-read because of the assignment
 for dir in $(printf '%s\n' "${mountpoints[@]}" |LC_ALL=C sort -u); do
     docker_opts+=( --mount "type=bind,src=${dir},dst=${dir}" )

--===============4893347121810124110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4893347121810124110==--
