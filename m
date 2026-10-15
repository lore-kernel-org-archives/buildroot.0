Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F315FCCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:11:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AC0C611C1;
	Fri, 16 Oct 2026 13:11:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IlXo5lAbodUe; Fri, 16 Oct 2026 13:11:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D26E3611A0
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156311;
	b=pb1Dx6H8Ey9swxyGGBAndn7bv3x8Y0jd4dDuZsJnD8ME/4GTYv0ow3vDX75m2IjsnSY2
	 EoDhfu23tCLXgdGWNNyhI7OHLFdarGigwYubPoOreYm8qu2JniSR4PN5J3d2lqW373ipS
	 uR8Fu6gpxHYPjVR8K5SaSsEGhl0NNE3LQsW/o6oT8DDdnNDNeBSfF9XSizAMGuF46VDx5
	 3xYp6+wStr/a0CxVgk6cmOtLNuwVXNZNeLqCc/yHNkGuVbIQIvNKlZ09cS5XxxdqpOsss
	 ruOcTxoEkRnPBSJdxxm/4VZyEiHNyp4neQI10W5VXLlDyfTNW8JirkhJcz6NwaOyHkQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156311;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=wFdH7xYDH+2INCunEVU1SPZHo4S3L0buc+NUDfIi2gc=;
	b=IVp3Mm8HNfVn2allCEtm3uHzb+u/wvciMVGzm6x1fi3/M+mqPLNZPLCllEJxHg2RE1cO
	 qxzihdDiTRZwxQycxOaNNx5U4hCy4DpTQuXD93U7glpRzRTc5zrunHMFlH1fX2qxyN8BM
	 aspNAgbi5Rt4dLYgvU0U6dJTtu/ZoExD5mW9OMG1dounElEBvmRX/aKdjE4Zcocw60E+X
	 IoECc9TB6R/3T62X9sakYSWAbLj36f6+QzpWqKaaHuvi7U8txr/h8mWTNOXxJTiTjA21v
	 /I8QatwDPZaB9bZ1RAzgeecsKBFaKy7OBHc/PFvkTZJ+xtZlv2D9ACqf9ox1/2CXSUQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156311;
	bh=wFdH7xYDH+2INCunEVU1SPZHo4S3L0buc+NUDfIi2gc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YDZvOnlZMM2eMNUyjiWlRdK666f0PvB8KyI/FhP/MMcSDowX2TL9DfjgxL2y3kHOp
	 Ds7zMMcCcmIFkHXNaCFw06BGdCDKOmkVYlqjf1b2kouK8f6G8IErN+4Z4FRCHS31Sv
	 zsk9fmRYglOi65J3EBMAKPeskSwa++jVSWG82F4/V0v8Y2lMRXraw18D4e7I+YWSga
	 KqwO5zmnDI65TPK8WNiFxrT2m14LyEJalaSi0xgytkyftBJc5V/82jJWEgz82DUCHU
	 /j4xZXjj34alUhH7g3vMF4sfsWDBUdkE2QaBTQh7zYS7II9ZTgoTvw1tUfmP+UILuy
	 v8VX3DcNviygQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D26E3611A0;
	Fri, 16 Oct 2026 13:11:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CD45F105
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB0884016B
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S12fO21S86RC for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:09:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0DEE84016D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156194;
 b=Q1PFbGZGaJkGQOGHoWcyR0JUfgNzBRGry0avjHbzWftHkYtm9xEgQyt808QUiCnMhHnb
 lz/8VOffhoF4KvGUdhX4LJuw4kQqds5vhm4M0m4iHErL3GVfbx46KUUidW3GU4IrkrfQl
 TsXSMP/C3/TB9SEootPKDjdTDhm7HY4w8XZK6CmLsKGe1OXHJwrlJjVJIap8hWvk+UT8u
 n9jQ/OipHuZi3Cr2l+MlUpJqg/fZVLK+Ia3nvMcO0Bz0LE1cYhArFWfLbTpJwFUMA40AS
 ck4WqNogriI/Ve0N6n/751TDyklmfF0rPbyY29NxwOClQaluzBANA0bO1ZuhA+JEoIw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156194;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=FuNCs+ymSPA9iZZ9PRsAp0UGNMAwq5ssswpJLPmgKkg=;
 b=QZ8glJM2Q+55BUbjus5+iErqkTmfflMlNXlPaQzhAs+Vx/9EvuZL9Dq4ZQv01LW9HmrQ
 q6hZFCJhmtqZHkt+MnWm/AC0UiPLsFXkf5snUpqsaZButGoertn5/RnHt/n10/m2p4Lw+
 77EeG/LSgN/jKt2dEHfBjcAhwO2FIXbs0Qk5Wpuai4UE9mi/ejtxNz6w0bnpqG+hGqzo9
 /j7nxdkVuzNubLQvqRAFhoCmWaE5zCXxeUNDN+6kQCue4EYNeehdXLJiuOmm7RjfCKAhG
 YdTMzcKB1HLDMOE7PV2LKUMexLiUjvOlM6fWquESdC0hk0G6pHjbN4jKVpYeH0Zi0lQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DEE84016D
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F2093960D3; Fri, 16 Oct 2026 13:08:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:45:59 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 682dac6c387f9f2846a72425cef88af59dfc86bb
X-Git-Newrev: a682d7e1aaa650c42a8505538118c6ae250e2b08
X-Patchwork-Hint: ignore
Message-Id: <20261016130832.F2093960D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/flutter-engine:
 don't write into $HOME
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
Content-Type: multipart/mixed; boundary="===============6811464201570621960=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6811464201570621960==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a682d7e1aaa650c42a8505538118c6ae250e2b08
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

gclient.py tries to not only read from $HOME/.config, but actually
create some directories/files in there. As $HOME can be inaccessible,
let's override XDG_CONFIG_HOME to tell the depot-tools code to write
its stuff into $(@D)/dl-tmp instead (which we already use as a scratch
directory in this package).

Fixes:

>>> flutter-engine 3.29.2 Downloading
/home/thomas/buildroot/br/output-all/host/share/depot_tools/gclient.py:3367: SyntaxWarning: invalid escape sequence '\s'
  dot_git_pattern = re.compile('^(\s*)url(\s*)=.*\.git$')
/home/thomas/buildroot/br/output-all/host/share/depot_tools/gclient_scm.py:436: SyntaxWarning: invalid escape sequence '\.'
  tokens = re.search('//(.+).googlesource.com/(.+?)(?:\.git)?$',
Traceback (most recent call last):
  File "/home/thomas/buildroot/br/output-all/host/lib/python3.13/pathlib/_local.py", line 722, in mkdir
    os.mkdir(self, mode)
    ~~~~~~~~^^^^^^^^^^^^
FileNotFoundError: [Errno 2] No such file or directory: '/home/br-user/.config/depot_tools'

During handling of the above exception, another exception occurred:

Traceback (most recent call last):
  File "/home/thomas/buildroot/br/output-all/host/share/depot_tools/gclient.py", line 108, in <module>
    import gclient_scm
  File "/home/thomas/buildroot/br/output-all/host/share/depot_tools/gclient_scm.py", line 23, in <module>
    import gerrit_util
  File "/home/thomas/buildroot/br/output-all/host/share/depot_tools/gerrit_util.py", line 42, in <module>
    import metrics
  File "/home/thomas/buildroot/br/output-all/host/share/depot_tools/metrics.py", line 23, in <module>
    CONFIG_FILE = utils.depot_tools_config_path('metrics.cfg')
  File "/home/thomas/buildroot/br/output-all/host/share/depot_tools/utils.py", line 48, in depot_tools_config_path
    pathlib.Path(config_dir).mkdir(parents=True, exist_ok=True)
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/thomas/buildroot/br/output-all/host/lib/python3.13/pathlib/_local.py", line 726, in mkdir
    self.parent.mkdir(parents=True, exist_ok=True)
    ~~~~~~~~~~~~~~~~~^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/thomas/buildroot/br/output-all/host/lib/python3.13/pathlib/_local.py", line 722, in mkdir
    os.mkdir(self, mode)
    ~~~~~~~~^^^^^^^^^^^^
PermissionError: [Errno 13] Permission denied: '/home/br-user/.config'
make[1]: *** [package/pkg-generic.mk:181: /home/thomas/buildroot/br/output-all/build/flutter-engine-3.29.2/.stamp_downloaded] Error 1

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2a69b8c7eda80157d7e794ba64ebfbc86b20c48b)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/flutter-engine/flutter-engine.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
index 1fa59a3863..e1c56ee62b 100644
--- a/package/flutter-engine/flutter-engine.mk
+++ b/package/flutter-engine/flutter-engine.mk
@@ -181,6 +181,7 @@ define FLUTTER_ENGINE_GENERATE_TARBALL
 	PATH=$(HOST_DIR)/share/depot_tools:$(BR_PATH) \
 	PYTHONPATH=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR) \
 	PUB_CACHE=$(FLUTTER_SDK_BIN_PUB_CACHE) \
+	XDG_CONFIG_HOME=$(@D)/dl-tmp \
 	$(FLUTTER_ENGINE_PKGDIR)/gen-tarball \
 		--dot-gclient $(TOPDIR)/$(FLUTTER_ENGINE_PKGDIR)/dot-gclient \
 		--jobs $(PARALLEL_JOBS) \

--===============6811464201570621960==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6811464201570621960==--
