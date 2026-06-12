Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA299CD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C432611AD;
	Fri, 12 Jun 2026 11:37:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id njMw7qkj80rf; Fri, 12 Jun 2026 11:37:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5948610BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264241;
	bh=QW88mvGd/DjWM3VhPKmWeuixw2rwJvNHnDKVHSgn314=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GOtq0JD8fyiA7JGS7gzKyPtAr//NMcYVb9XQk2HCg3K77SdyhoUH8nLWq5mieqxXi
	 MZDxXfTSFAHr881B1UFbZym+RbCKHj4+q0zuoHCbAmVyJWUvtmknxNeZ8fDg65k671
	 QXQIbLULvlcZ8cdYvlQArd4k+zJV66dQbwaxRdGQoZ1aC35/hJxShIkoikzCiSOE9Z
	 WRr6mE3bb9+Le8TFdZf6Ub2rbsRISnDNfTkOrTbZmZSuU6QUT3Yq2Gffbf59al0Ydo
	 FxZfm0OYqU0PKBcvvdbRmdXskRY3sAALOYG0rxuKPj3lI9HLTXcccVB0RefKY1RZsg
	 2xaNYn5ZnVttw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5948610BF;
	Fri, 12 Jun 2026 11:37:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4ED1812F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40CED8330B
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M5UivskwcEfy for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:37:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0E63F832FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E63F832FF
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E63F832FF
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:37:14 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-45e9f4a3510so510899f8f.1
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:37:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264233; x=1781869033;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dVCDweWged/TG5c2Ex9QsdScsHdU1r5koq3qSZHj+cU=;
 b=QDOVBfA27jRqmSriGpQZ5jjSbevPIbZvH7BIftpwh6EhRp34cb65PJdCyU3SIFBstJ
 Eitw+KsLIEoIAOcko9ERXITgTLZnpwEo1MTzHtS1AKxCHGfCD4531y3UdpIgwyvpMvAp
 r6z07eSTD6y09cw5Eo+v2+XouGREpWe9wdd55uHGXIr3ovJNnfI5DP9EXRDTM7Z0Vshw
 gU0YC8m/+yw5m5eliliWSIg+W2CCJ6CKiNW0rKqb4uR32C/eZ0NZ6f+PKFllcZO+LV9B
 H9t/t2u1loBlI2BMr4PTswzfMcPiBdyGKhncl3vooiVZhS3IXeYGFeALg5VylLelqnnv
 2tvQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ87/YjWfQT1/M83aQaO5FabQFJny5/tYbYRe/YphE3mgK/CXgpGnUXvB2e+pbS04y31FYK1LmOxd2o=@buildroot.org
X-Gm-Message-State: AOJu0YxUgdMs5gwvWlxdP6aRQs/FxwAx7UghnHwXl2i6/NmuC0CV6Tql
 8DqQ+VJkpCU/0PBzQJes+NU0irrrLas834tzz97xEfPZFgHJy/xHuL5toqzXesu6tyw=
X-Gm-Gg: Acq92OGBx6nF29FRNGnK4aRIRotJQlFGdXzCWylIW8mEhbUVWglInSmKZ4+h66zp4xj
 LFs9loOSgdeKanCL73Ky6lxgK21KGulC7Z/SnvM42HUk9jQenD499IneMXB0WiEB7OZLSz+KtGk
 +I4FlvNXP5Ch9I6l/WBKWlW0ZZ29veixTCWaUpSkXpImuuhN4XHuAV65CauaXWaz6/wj9fjtNi4
 40awtYZMiasE1Fp1JMkWCdRjMooR9twSwWVnIfgsRxFdAla4t+/UUcZZB0TUPVeJmp86Oil1KU0
 dHsJPnC+w0uU4k/kz8tJzflU4vGqDdryJfAx5yfZPRU2ocUmyEZuLNHt7MNCsHnP+BaPRLhwBcZ
 uJBWfc+zkZDlxR55ZK+v/ctG57ASSYh9IoTaQ4z/Au7JEcC/L5d2SuAiebaY1hIq6ypdiARi0W4
 UunIrElDqKQLE0+GI=
X-Received: by 2002:a05:6000:250e:b0:45d:3aa3:7f76 with SMTP id
 ffacd0b85a97d-4606dba772fmr3921134f8f.33.1781264232961; 
 Fri, 12 Jun 2026 04:37:12 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f2b0c35sm5178418f8f.22.2026.06.12.04.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:37:12 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:37:12 +0200
Message-ID: <20260612113712.251616-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260604173707.2135315-2-bernd@kuhls.net>
References: <20260604173707.2135315-2-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264233; x=1781869033; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dVCDweWged/TG5c2Ex9QsdScsHdU1r5koq3qSZHj+cU=;
 b=cc7/76dxXZ5r3o16xa2BjtUkBDtvz6IY+ZmHu/rBpDPaTJQsxTE3oJ+4Mxbk/N9Bb6
 eiqeSVhTNnfuIY2VFZYybKN/bI0aldS7+EahjM0X9XfXQ50YGYn+QYcxRSqzOhriJJcG
 mJ8kc6nE9u1Gx9G8POyExXuMF44NBMYSpajsp+GRx7pxrMYAANQMgt3F50YY3/iYF1tq
 2hvWKJn4OYe4LUqT+hWeyV30KeSzBhWSeq6QBpkTW0DXYZTKAToAyrmkJ4wmBqBbr0b3
 5/6RB5mevWdtCQ4nfZg3ytzNSjaCY34NUtE8GltRlqg5fcSXOyWmeJbF1WoMeFa+Fsv/
 I3Ow==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cc7/76dx
Subject: Re: [Buildroot] [PATCH 2/2] package/python3: add upstream security
 patch for CVE-2026-8328
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> https://mail.python.org/archives/list/security-announce@python.org/thread/ITF2BAPBQEPYK3LDMPRSY435JGNHYNDP/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
> Series passed Gitlab pipeline:
> https://gitlab.com/bkuhls/buildroot/-/commits/5b4549fd52313aa0caa2dbb919a8b98c11ab5768
> 
>  ...ply-CVE-2021-4189-PASV-fix-to-ftplib.patch | 123 ++++++++++++++++++
>  package/python3/python3.mk                    |   3 +
>  2 files changed, 126 insertions(+)
>  create mode 100644 package/python3/0013-3.14-gh-87451-Apply-CVE-2021-4189-PASV-fix-to-ftplib.patch
> 
> diff --git a/package/python3/0013-3.14-gh-87451-Apply-CVE-2021-4189-PASV-fix-to-ftplib.patch b/package/python3/0013-3.14-gh-87451-Apply-CVE-2021-4189-PASV-fix-to-ftplib.patch
> new file mode 100644
> index 0000000000..7605e40722
> --- /dev/null
> +++ b/package/python3/0013-3.14-gh-87451-Apply-CVE-2021-4189-PASV-fix-to-ftplib.patch
> @@ -0,0 +1,123 @@
> +From 7d95a1dc7382b55cba7fdd6a110336077584a4f0 Mon Sep 17 00:00:00 2001
> +From: "Miss Islington (bot)"
> + <31488909+miss-islington@users.noreply.github.com>
> +Date: Wed, 13 May 2026 19:59:11 +0200
> +Subject: [PATCH] [3.14] gh-87451: Apply CVE-2021-4189 PASV fix to
> + ftplib.ftpcp() (GH-149648) (#149793)
> +
> +gh-87451: Apply CVE-2021-4189 PASV fix to ftplib.ftpcp() (GH-149648)
> +
> +ftpcp() called parse227() directly and passed the source server's
> +self-reported PASV IPv4 address to the target server's PORT command,
> +bypassing the CVE-2021-4189 fix that was applied only to FTP.makepasv().
> +A malicious source FTP server could use this to redirect the target
> +server's data connection to an arbitrary host:port (SSRF).
> +
> +ftpcp() now uses the source server's actual peer address, honoring the
> +existing trust_server_pasv_ipv4_address opt-out, the same as makepasv().
> +
> +Thanks to Qi Ding at Aurascape AI for the report. (GHSA-w8c5-q2xf-gf7c)
> +(cherry picked from commit eac4fe3b2c77693790a5ef7dfab127c1fee81bf9)
> +
> +Co-authored-by: Gregory P. Smith <68491+gpshead@users.noreply.github.com>
> +Upstream: https://github.com/python/cpython/commit/7d95a1dc7382b55cba7fdd6a110336077584a4f0
> +CVE: CVE-2026-8328
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + Lib/ftplib.py                                 | 11 +++++-
> + Lib/test/test_ftplib.py                       | 36 ++++++++++++++++++-
> + ...6-05-10-18-05-32.gh-issue-87451.XkKB6M.rst |  6 ++++
> + 3 files changed, 51 insertions(+), 2 deletions(-)
> + create mode 100644 Misc/NEWS.d/next/Security/2026-05-10-18-05-32.gh-issue-87451.XkKB6M.rst
> +
> +diff --git a/Lib/ftplib.py b/Lib/ftplib.py
> +index 50771e8c17c..73882a38dce 100644
> +--- a/Lib/ftplib.py
> ++++ b/Lib/ftplib.py
> +@@ -883,7 +883,16 @@ def ftpcp(source, sourcename, target, targetname = '', type = 'I'):
> +     type = 'TYPE ' + type
> +     source.voidcmd(type)
> +     target.voidcmd(type)
> +-    sourcehost, sourceport = parse227(source.sendcmd('PASV'))
> ++    # Don't trust the IPv4 address the source server advertises in its PASV
> ++    # reply: a malicious source could otherwise point the target's data
> ++    # connection at an arbitrary host (SSRF).  A caller that needs the old
> ++    # behavior can set trust_server_pasv_ipv4_address on the source FTP
> ++    # object.  See FTP.makepasv(), which applies the same rule.
> ++    untrusted_host, sourceport = parse227(source.sendcmd('PASV'))
> ++    if source.trust_server_pasv_ipv4_address:
> ++        sourcehost = untrusted_host
> ++    else:
> ++        sourcehost = source.sock.getpeername()[0]
> +     target.sendport(sourcehost, sourceport)
> +     # RFC 959: the user must "listen" [...] BEFORE sending the
> +     # transfer request.
> +diff --git a/Lib/test/test_ftplib.py b/Lib/test/test_ftplib.py
> +index c864d401f9e..f1eff9430f7 100644
> +--- a/Lib/test/test_ftplib.py
> ++++ b/Lib/test/test_ftplib.py
> +@@ -16,7 +16,7 @@
> + except ImportError:
> +     ssl = None
> + 
> +-from unittest import TestCase, skipUnless
> ++from unittest import mock, TestCase, skipUnless
> + from test import support
> + from test.support import requires_subprocess
> + from test.support import threading_helper
> +@@ -1145,6 +1145,40 @@ def testTimeoutDirectAccess(self):
> +         ftp.close()
> + 
> + 
> ++class TestFtpcpSecurity(TestCase):
> ++    """ftpcp() must not trust the host a source server advertises in PASV.
> ++
> ++    A malicious source server can otherwise redirect the target server's
> ++    data connection to an arbitrary host:port (SSRF), so ftpcp() uses the
> ++    source server's actual peer address instead, the same as FTP.makepasv().
> ++    """
> ++
> ++    def _make_pair(self, *, advertised_host, real_host, trust=False):
> ++        source = mock.Mock(spec=ftplib.FTP)
> ++        source.trust_server_pasv_ipv4_address = trust
> ++        source.sock.getpeername.return_value = (real_host, 21)
> ++        # PASV replies give the host as comma-separated octets, not dotted.
> ++        advertised = advertised_host.replace('.', ',')
> ++        source.sendcmd.side_effect = lambda cmd: (
> ++            f'227 Entering Passive Mode ({advertised},1,2).'
> ++            if cmd == 'PASV' else '150 ok')
> ++        target = mock.Mock(spec=ftplib.FTP)
> ++        target.sendcmd.return_value = '150 ok'
> ++        return source, target
> ++
> ++    def test_ftpcp_ignores_untrusted_pasv_host(self):
> ++        source, target = self._make_pair(advertised_host='10.0.0.5',
> ++                                         real_host='198.51.100.7')
> ++        ftplib.ftpcp(source, 'a', target, 'b')
> ++        target.sendport.assert_called_once_with('198.51.100.7', 258)
> ++
> ++    def test_ftpcp_trust_server_pasv_ipv4_address(self):
> ++        source, target = self._make_pair(advertised_host='10.0.0.5',
> ++                                         real_host='198.51.100.7', trust=True)
> ++        ftplib.ftpcp(source, 'a', target, 'b')
> ++        target.sendport.assert_called_once_with('10.0.0.5', 258)
> ++
> ++
> + class MiscTestCase(TestCase):
> +     def test__all__(self):
> +         not_exported = {
> +diff --git a/Misc/NEWS.d/next/Security/2026-05-10-18-05-32.gh-issue-87451.XkKB6M.rst b/Misc/NEWS.d/next/Security/2026-05-10-18-05-32.gh-issue-87451.XkKB6M.rst
> +new file mode 100644
> +index 00000000000..21a79c3e0e7
> +--- /dev/null
> ++++ b/Misc/NEWS.d/next/Security/2026-05-10-18-05-32.gh-issue-87451.XkKB6M.rst
> +@@ -0,0 +1,6 @@
> ++The :mod:`ftplib` module's undocumented ``ftpcp`` function no longer trusts
> ++the IPv4 address value returned from the source server in response to the
> ++``PASV`` command by default, completing the fix for CVE-2021-4189.  As with
> ++:class:`ftplib.FTP`, the former behavior can be re-enabled by setting the
> ++``trust_server_pasv_ipv4_address`` attribute on the source :class:`ftplib.FTP`
> ++instance to ``True``.  Thanks to Qi Deng at Aurascape AI for the report.
> +-- 
> +2.47.3
> +
> diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> index e14ddf4f20..931ad3bae6 100644
> --- a/package/python3/python3.mk
> +++ b/package/python3/python3.mk
> @@ -19,6 +19,9 @@ PYTHON3_IGNORE_CVES += CVE-2026-3276
>  # 0012-3.14-gh-149486-tarfile.data_filter-validate-written-.patch
>  PYTHON3_IGNORE_CVES += CVE-2026-7774
>  
> +# 0013-3.14-gh-87451-Apply-CVE-2021-4189-PASV-fix-to-ftplib.patch
> +PYTHON3_IGNORE_CVES += CVE-2026-8328
> +
>  # This host Python is installed in $(HOST_DIR), as it is needed when
>  # cross-compiling third-party Python modules.
>  
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
