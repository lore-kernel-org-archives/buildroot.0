Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B4ECA5FEF
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 15:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BBEE605CB;
	Sun,  4 Oct 2026 15:53:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RUgP-RTAVpIf; Sun,  4 Oct 2026 15:53:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B58A5605E1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791129236;
	b=fV8TZ48mPNMxwqqIwCFjbCZ/x3yFl4wOQ+FM706rj435ICYnf6hO/zwiMg81G6uaz/U2
	 k31TqapNZtsDXcO7yVrpSGCUq6/0FTKcrp2yHgJPtmBLvumOYRLS/BDH/MRnSCyKlz79p
	 8j0DnYYOw+L27OkJCAVKesVaxx4nUtgqwrCoKwo8IeZVo7iwRhcAUk7nb4KfTcgf8cz8q
	 bihv7nAr/QhdwcWtBF10g8LVd1PHko2QdK2v7TMIuHw+6CMeSKSE/6VCxsNwWETDUnw2E
	 JnlSJqfvrIR2A0bnNhCpRv1/grahm/ayzbiHGpjje83VVtoVs2QMvtAf9PYOTAQy8/w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791129236;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=d1x9sjbw0yN6yuxLb52BvEteDULF8K0Qy9GPLtUKM6U=;
	b=QBhRzVt878U3jKcMNGR9vmvKD86ZBFX8iwmuVgIFyDg37ysx0iEs0V+vU1rsLKwTo/FB
	 eFWROe9OS1hqywiDrLx12IhpsppNmY6tMHpjLIfGGnw+ztW6ThnFkwIsEv1hzkkAyb1aa
	 Jvpqe+1qjuwryW5Sd9xG7Pg3Mvpv1uXTawyVj5Oygmlwt0p34tZDeKBKAQfRjZUmMynRU
	 jaxkB6Qpbls8ctCad/jc6Pe65TEC7FSjzzOrBgQxVAY9moXZuK8+nHVzKl/4PJd5hCSID
	 aODRISiYOage9lHI1sm9a1wjag+ZYM0BRF7nI/pB5KZU/0DTqRyCYGiqvNrTM0HCxzw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791129236;
	bh=d1x9sjbw0yN6yuxLb52BvEteDULF8K0Qy9GPLtUKM6U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=e6MU4AMaEfTYMWPn6yrqSFX7FtDSpVBXyJlxUBzzAKqH8rlfW/7WkuBW7N+fF5Khb
	 L8f0zmwp3csnAnkHq//yDjhhHhhmTD16l2w7TRcaGFb+wEZUn+GW8rTWMRjcOrxNw3
	 Gy+PIPPtKOrsVEXg2wwig1guoduo8wkUOaaWAlkQ2AMblE0axTXJaoylhw6XucTb0t
	 HAlKzdGIPz2/wlzXKPHbSnyzKc2R/Mj/I8E62HU1XSF03Ejlt1n9coykHK9SWT0XPZ
	 EYu41GT6h1So6LmlsG+dm6MMTCgeLm/LNdpmEvND9NmKKqYVJ/Kuwni0SZxPxtBiqX
	 FxQYUFIRZxDNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B58A5605E1;
	Sun,  4 Oct 2026 15:53:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 806DA32F
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71A9340462
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:53:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6HenjS7RS7YQ for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 15:53:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3CC2C401C1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791129234;
 b=lqUCgRK0L0WcFYgg82USTOmD2GPv60AsNjw2geRoH1eH8DXPG6nQ6tmFDH9Nk3z5+KFC
 AUh1ecC3pZ2vH9jDkW1shncMsiRrszcFBEh4C8vtqz2YgHLUOWBXcRVruMZbSU8TBRDDT
 ivrMslBTQA4G7fJbqDlyPVJKZDSWGCJaRhBJRMnDImgzqYIiXYmASOEGWtb+8WUCNnFik
 XjhzHHjoEaBYIeOLZFsEx8TJxoct6QcZnU+YWAHyIajTPAwk1/v2Mp/2M51jhWDIzvMWO
 xIAvybXyDh8amrORt9yq/G3TnMpZ1G1CT8IaG9RW5ehKjCuOJ5TPyhaothHF3X1ZKug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791129234;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=IE76obkcnkrasceqg0oCCz8gHhd4GAJ7LNLsaaZzKDU=;
 b=Fx+IPYSAw5PmlJZtnP1Fqo5UkIrlU1HsICGUAHJWzH/vL86uwO5e9OFW3Q5mIU6gqvLi
 mPJE7mG2DEoBDw1zsl31D7OIgXk7ICXTYMdWeI5RHoKpJXVEkpGNNl1diUZEmLLr0Y5fK
 jbGpo5LVC/fWX6XmCPqL2z5V8/zGMydEVstYtUxtk2GE0jYddEUmJO3C2/+dGW6XXohaP
 /KLkLrK0J4ii1Q7EHe/wAYVDV8ilsYnS0pape6u4hQIAuORR03UHj4rfHV664GQsCKa38
 YJElQ3Tc9HZ/xRMBxUQsgFzXDbZKyg66KJEXMBXsdGGTDIeDleI/i+bF/YAmmoz0ltw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CC2C401C1
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:53:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E61AE8B6B8; Sun,  4 Oct 2026 15:52:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Oct 2026 17:51:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 73761afe0fceddb66228add1ea7d205428e2340b
X-Git-Newrev: ab2c02907005727b935cd40cb3c6a4c4f83d3adf
X-Patchwork-Hint: ignore
Message-Id: <20261004155238.E61AE8B6B8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/thrift: security bump version to
 0.25.0
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
Content-Type: multipart/mixed; boundary="===============3454661666926270189=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3454661666926270189==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ab2c02907005727b935cd40cb3c6a4c4f83d3adf
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/apache/thrift/blob/v0.25.0/CHANGES.md
https://lists.apache.org/thread/33otcgbqd27wf6qq810q56znzbomnhg1

Removed patch 0001 which is included in this release.

Updated license hash due to upstream commit
https://github.com/apache/thrift/commit/df376589a8a9d83a5a6082c1a358d4ad0f020434

Quoting https://seclists.org/oss-sec/2026/q4/38:

"It fixes the 61 vulnerabilities listed below.
[...]
Each entry gives the CVSS 4.0 score, the ASF rating, the title, the
affected language bindings and a link to the full announcement (severity
vector, weakness, description and credit). The CVE records are at
https://www.cve.org/CVERecord?id=<CVE id>.

CVE-2026-61373  8.7  important Java TSaslNonblockingServer pre-auth
                               unbounded SASL frame allocation
                               Bindings: Java
 https://lists.apache.org/thread/shy1rrm2g383wlbdb2p7w19c868ntdjp

CVE-2026-61374  7.1  important Java TSaslTransport post-auth data-frame
                               missing size limit
                               Bindings: Java
 https://lists.apache.org/thread/35831rngzrqky1gvc32t06psgq1b8441

CVE-2026-63772  8.7  important Unauthenticated single-packet crash of Go
                               Thrift servers via the THeader transform
                               count
                               Bindings: Go
 https://lists.apache.org/thread/6kpzdw29gsfxptv4b65y9s6f42tdyo8k

CVE-2026-66054  6.9  moderate  C++ THeaderTransport does not enforce
                               configured maxFrameSize
                               Bindings: C++
 https://lists.apache.org/thread/7c23sgowkb3ssmolqofqsn8wzsddvf33

CVE-2026-66055  8.2  important TJSONProtocol accepts a single JSON
                               string/number exceeding the configured size
                               limit (multi-language)
                               Bindings: C++, Java, Go, netstd, Python,
                                 Delphi
 https://lists.apache.org/thread/nxlmlhgsh7fwr4mo1fkhtkw3v266qhcx

CVE-2026-66081  8.7  important c_glib read_message_begin leaves output
                               parameters unset for non-versioned messages
                               Bindings: c_glib
 https://lists.apache.org/thread/9d51ygo6hrsdo5ndwckbwt3mnp290m57

CVE-2026-66331  6.9  moderate  Buffered transport reads are not accounted
                               against MaxMessageSize
                               Bindings: Delphi
 https://lists.apache.org/thread/971572orz86jdwlg58wqv8o50oqqb143

CVE-2026-66837  8.7  important PHP accelerator sizes a stack buffer from a
                               wire-controlled string length
                               Bindings: PHP
 https://lists.apache.org/thread/7o985t84551tpo55v6fsd3g42gs3zps1

CVE-2026-66858  8.7  important skip() does not apply the recursion limit
                               (Python accelerator, PHP, Perl, Lua,
                               Smalltalk, OCaml)
                               Bindings: Python, PHP, Perl, Lua, Smalltalk,
                                 OCaml
 https://lists.apache.org/thread/6kl6g40tpl8zt3opd8fwn6bsgyddzhd5

CVE-2026-66859  8.7  important c_glib multiplexed processor crashes on a
                               message it cannot route
                               Bindings: c_glib
 https://lists.apache.org/thread/n9rogg2166hl9y4ycq5njpvnxndr8y5o

CVE-2026-82458  8.7  important Container element count not bounded by the
                               bytes available
                               Bindings: Go, Rust, netstd, OCaml, Erlang,
                                 JavaME, C++, Java, Kotlin, D
 https://lists.apache.org/thread/7xqf651pvjykw0xr9vw0ooz0bwx7wzy7

CVE-2026-82459  8.2  important Integer underflow in C++ THeaderTransport
                               allows an unauthenticated remote peer to
                               terminate a 32-bit process
                               Bindings: C++
 https://lists.apache.org/thread/zf8ppfpl6nqhp53sxnz6osnjw93g9fw2

CVE-2026-83632  9.2  critical  C++ THttpTransport grows its line buffer
                               without bound
                               Bindings: C++
 https://lists.apache.org/thread/zjv6hjmhl4tb4l4l1dk4bmc2whxh0lb4

CVE-2026-83663  8.7  important TFramedTransport and THeaderTransport
                               re-enter Read once per frame that carries no
                               payload (Go)
                               Bindings: Go
 https://lists.apache.org/thread/yjz317wq7h86q9k8ws6ton0ojgl8hjct

CVE-2026-83745  8.7  important WebSocket frame decoders allocate the payload
                               buffer from the declared length, not the
                               bytes received (Node.js, D)
                               Bindings: Node.js, D
 https://lists.apache.org/thread/64y7f0b89mnq4xoqcn4h26to8kskolgc

CVE-2026-85086  6.9  moderate  Perl TLS client disables certificate
                               verification by default
                               Bindings: Perl
 https://lists.apache.org/thread/c7f9g4027ok0gocyso2y84r2mhgc2xmy

CVE-2026-85087  6.9  moderate  Python ≥3.12 host-name check silently becomes
                               a no-op
                               Bindings: Python
 https://lists.apache.org/thread/l2rgp3dqhpy2w347forzdt9g7o2d6k0d

CVE-2026-85088  6.9  moderate  The C++ and D clients fall back to the
                               certificate Common Name when subjectAltName
                               entries are present but do not match
                               Bindings: C++, D
 https://lists.apache.org/thread/zcgm7lx6037lvgvn87rc1tj3p0zhv371

CVE-2026-85476  8.2  important c_glib `read_all` spins when the underlying
                               read returns 0
                               Bindings: c_glib
 https://lists.apache.org/thread/1zdvscq7p3hf3z30s26h4tm9dvljm1jj

CVE-2026-85483  6.3  moderate  c_glib TZlibTransport reports a full read
                               after a premature stream end
                               Bindings: c_glib
 https://lists.apache.org/thread/ro1y0ckzfzcc45yk9qkt1p6t4g2jvrfy

CVE-2026-85493  8.7  important TProtocolUtil.skip follows peer-chosen
                               nesting to any depth the stack allows (Dart,
                               Java ME)
                               Bindings: Dart, JavaME
 https://lists.apache.org/thread/oqr0h2k1cg9hho3oh8trmovmxc04fl5m

CVE-2026-85494  8.7  important Framed transport and binary protocol size a
                               read buffer from a peer-declared length with
                               no effective maximum (multi-language)
                               Bindings: Python, Ruby, Erlang, Lua, Dart,
                                 JavaME, D, Perl, PHP
 https://lists.apache.org/thread/rm0m34gt6fh1flvt16wty559hfg191qr

CVE-2026-86535  8.7  important A JSON member name can stall the Node
                               server's event loop indefinitely
                               Bindings: Node.js
 https://lists.apache.org/thread/94cvvzzl0rh707bn2j4zt844v547508g

CVE-2026-86536  6.3  moderate  A map key from the wire can replace a decoded
                               object's prototype in generated JavaScript
                               Bindings: Node.js, JavaScript, TypeScript
 https://lists.apache.org/thread/xckvfky30kdnk8vqnhy0wndthvc9nymp

CVE-2026-86537  8.7  important A truncated HTTP request stops the D

                               library's server, allowing an unauthenticated

                               remote attacker to deny service
                               Bindings: D
 https://lists.apache.org/thread/k14jfr1xwc0vtmm2s7xro6lt7q4y6s7m

CVE-2026-87117  8.7  important PHP `thrift_protocol` accelerator

                               dereferences a missing container-element spec

                               Bindings: PHP
 https://lists.apache.org/thread/y05tvpv19ow44j16gtbcy9ht7lb0qjpy

CVE-2026-90440  8.2  important An exception escaping a libevent callback
                               stops the D library's non-blocking server,
                               allowing an unauthenticated remote attacker
                               to deny service
                               Bindings: D
 https://lists.apache.org/thread/s8fjltl6c1pkm7vg9v4qkr89b5b74jbg

CVE-2026-91135  9.2  critical  C++ `THeaderTransport::transform()` heap
                               buffer overflow (write direction)
                               Bindings: C++
 https://lists.apache.org/thread/rbpwlhlxnv2qgyk8cfscp2d2fd3p0ojb

CVE-2026-91137  8.7  important PHP `thrift_protocol` accelerator: zero-byte
                               container elements
                               Bindings: PHP
 https://lists.apache.org/thread/bf12g1b11r4x9x3wsy4mgwfgd0t779h7

CVE-2026-92834  6.3  moderate  C++ WebSocket server transport does not read
                               a full request length
                               Bindings: C++
 https://lists.apache.org/thread/bjor9ttx7hk23gzcx60ohz0f20xzvgv0

CVE-2026-93925  8.7  important C++ `THeaderTransport::writeVarint32()` stack
                               buffer overflow on a negative protocol id
                               Bindings: C++
 https://lists.apache.org/thread/b4rrkrwoyqb9g7hk58d3fx09cbvp1tg9

CVE-2026-93926  8.7  important C++ `THeaderTransport::untransform()` leaks
                               the zlib stream on the error path
                               Bindings: C++
 https://lists.apache.org/thread/9353rb8mpoq4ltff88h1j2y3hfy6blgb

CVE-2026-94633  8.7  important Dart `TBinaryProtocol.readMessageBegin`
                               allocates from the pre-versioned name length
                               Bindings: Dart
 https://lists.apache.org/thread/cxkbblyht7988p2o6yvnmd6536qmt88k

CVE-2026-94634  8.2  important Python `TJSONProtocol` has a string length
                               limit that is off by default
                               Bindings: Python
 https://lists.apache.org/thread/dgy8ox9t4bh1xhf74ovf29ht87x7dno4

CVE-2026-94635  8.7  important Lua `TBinaryProtocol:readMessageBegin`
                               bypasses `checkStringSize` on the
                               pre-versioned name
                               Bindings: Lua
 https://lists.apache.org/thread/ow8994gb5g8ssmmbkbl48xqb0tpvqyr3

CVE-2026-94636  8.2  important Python `TZlibTransport` stops enforcing its
                               decompressed-size limit once the limit is
                               exactly used up
                               Bindings: Python
 https://lists.apache.org/thread/1rpq0d0g6yzjjzl1z27lwmvhzkn6rbrs

CVE-2026-94637  8.2  important Go `THeaderTransport` does not bound the
                               inflated size of a ZLIB frame
                               Bindings: Go
 https://lists.apache.org/thread/6hxll1jcnod9gfr225tz7my08lpj3jmt

CVE-2026-94638  6.3  moderate  PHP `thrift_protocol` C extension ignores the
                               configured `maxStringSize`
                               Bindings: PHP
 https://lists.apache.org/thread/v60w786pqr7njzz9425grby8yjrgmbsj

CVE-2026-94639  8.2  important Java `TSaslNonblockingServer`: residual of
                               CVE-2026-61373 (thread-death black hole + no
                               cross-connection budget)
                               Bindings: Java
 https://lists.apache.org/thread/5okpz47dv8hy0s3r6tmrplg3y7jzhhyw

CVE-2026-94642  8.7  important PHP `TSimpleServer` exits the whole process
                               on any non-transport exception
                               Bindings: PHP
 https://lists.apache.org/thread/5tjwbbyympbj16lblocv9b12s32sg113

CVE-2026-94644  8.2  important PHP `TJSONProtocol` string/number readers
                               have no size bound
                               Bindings: PHP
 https://lists.apache.org/thread/8y04vvxw7ozxxh3c44vhoy7jsd6bonzq

CVE-2026-94645  8.2  important Node.js `TJSONProtocol` uses a peer-declared
                               container size as an unbounded loop bound
                               Bindings: Node.js
 https://lists.apache.org/thread/p96mokqfy16mnqfyon46mf6g8nr9ghb6

CVE-2026-94646  8.7  important Node.js `server.js` ends the process on any
                               per-connection error (+ two triggers)
                               Bindings: Node.js
 https://lists.apache.org/thread/5hjh0gz8wf6bo7ydxjpqj92m42hwmfo8

CVE-2026-94648  8.2  important dart `TJsonProtocol`/`TJSONProtocol` has no
                               string size bound
                               Bindings: Dart
 https://lists.apache.org/thread/f9w4q6ttlc3k9404x4do25gdhqodtjnn

CVE-2026-94650  8.2  important c_glib generated struct readers have no
                               recursion-depth guard (native stack
                               exhaustion)
                               Bindings: c_glib
 https://lists.apache.org/thread/poskkt3p754b2f293g63934hw160o86j

CVE-2026-94651  8.2  important Java `TSaslNonblockingServer`
                               `Computation.run` orphans a connection on a
                               pre-auth parse error
                               Bindings: Java
 https://lists.apache.org/thread/rflzpdvtk8yhpzg99wkf5yf277nn7267

CVE-2026-94652  6.3  moderate  C++ `TEvhttpServer` leaks its
                               `RequestContext` when the processor throws
                               before calling back
                               Bindings: C++
 https://lists.apache.org/thread/nodwz7gjvogkkh3w1jwbsslk1c7t0727

CVE-2026-94653  8.2  important PHP framed/memory/HTTP transports re-slice
                               the buffer on every read (quadratic)
                               Bindings: PHP
 https://lists.apache.org/thread/8zbv1y4wzr3nn5mzmdph7b0n6tm0lc4m

CVE-2026-94654  8.2  important Python `TNonblockingServer` busy-loops and
                               stops selecting all fds after an
                               8192-byte-boundary frame
                               Bindings: Python
 https://lists.apache.org/thread/kx3xdttoypl8j4dcxmqbq9dwy1w0kr7j

CVE-2026-94655  8.2  important Lua `TJsonProtocol` string/number readers
                               have no size bound and are quadratic
                               Bindings: Lua
 https://lists.apache.org/thread/wdjyf4y115ybgdzz5m3gspo97lcmz1dt

CVE-2026-94656  8.2  important rb `TJsonProtocol`/`TJSONProtocol` has no
                               string size bound
                               Bindings: Ruby
 https://lists.apache.org/thread/lg97w2yvg3c6z06l8m5xs3j3v2m6mvj8

CVE-2026-94657  8.2  important javame `TJsonProtocol`/`TJSONProtocol` has no
                               string size bound
                               Bindings: JavaME
 https://lists.apache.org/thread/lpcmo2xjfyfww474xdyyfypkqthk9s14

CVE-2026-94658  8.7  important Lua `TFramedTransport`/`THttpTransport`

                               re-slice the buffer on every read (quadratic)

                               Bindings: Lua
 https://lists.apache.org/thread/hv6b1nyk2p15gy5pmtprwo7z9m46mfcx

CVE-2026-96277  8.7  important Ruby `SimpleServer` ends `serve()` on any
                               non-Transport/Protocol exception
                               Bindings: Ruby
 https://lists.apache.org/thread/k1t5r9sz7k5tn57cnf5khw2ywlxv6098

CVE-2026-96286  8.2  important Perl servers end `serve()` when serving one
                               connection fails
                               Bindings: Perl
 https://lists.apache.org/thread/o5386v7ytbbjv9sx7dbszw46ypod5yd9

CVE-2026-96287  8.2  important Perl `FramedTransport` reads and TLS socket

                               writes re-slice the remaining buffer on every

                               call (quadratic)
                               Bindings: Perl
 https://lists.apache.org/thread/tcg16jr59z5nry066dw7ym60vl25dxt9

CVE-2026-96288  8.2  important Erlang generated struct reads have no
                               recursion-depth guard (unbounded memory)
                               Bindings: Erlang
 https://lists.apache.org/thread/vxnk7cmdtoqjn97b8szlqym1mxx0xtzb

CVE-2026-96289  8.2  important php `--gen php:inlined` struct readers (and
                               `TProtocol::skipBinary`) have no
                               recursion-depth guard
                               Bindings: PHP
 https://lists.apache.org/thread/kv1zkwlt82lkkv20g29txr5pjnvo0pf8

CVE-2026-96292  8.2  important Lua `THttpTransport:_parseHeaders` matches
                               each header line with a backtracking pattern
                               (quadratic)
                               Bindings: Lua
 https://lists.apache.org/thread/3wmvtvv56rky5wtszn4zr8w12kg928qn

CVE-2026-96294  8.7  important nodejs web server: no `error` listener on an
                               upgraded WebSocket connection
                               Bindings: Node.js
 https://lists.apache.org/thread/52gwhsy947hj9qhgn0dql726z1q927g4

CVE-2026-96990  8.2  important Erlang thrift_json_protocol reads a whole
                               message with no size bound
                               Bindings: Erlang
 https://lists.apache.org/thread/hrgcqlms4ksrz4qkqdjwoxxggdty7dgh

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...def-include-to-fix-build-error-with-6.3.0.patch | 33 ----------------------
 package/thrift/thrift.hash                         |  6 ++--
 package/thrift/thrift.mk                           |  2 +-
 3 files changed, 4 insertions(+), 37 deletions(-)

diff --git a/package/thrift/0001-Add-cstddef-include-to-fix-build-error-with-6.3.0.patch b/package/thrift/0001-Add-cstddef-include-to-fix-build-error-with-6.3.0.patch
deleted file mode 100644
index f59454c3d1..0000000000
--- a/package/thrift/0001-Add-cstddef-include-to-fix-build-error-with-6.3.0.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From ca2c2467c78d9140a7e260727cd3305bf3decd09 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Fri, 4 Sep 2026 19:49:59 +0200
-Subject: [PATCH] Add cstddef include to fix build error with 6.3.0
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-thrift-0.24.0/lib/cpp/src/thrift/transport/TBufferTransports.h:110:32:
- error: ‘ptrdiff_t’ does not name a type
-
-Upstream: https://github.com/apache/thrift/pull/3801
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- lib/cpp/src/thrift/transport/TBufferTransports.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/lib/cpp/src/thrift/transport/TBufferTransports.h b/lib/cpp/src/thrift/transport/TBufferTransports.h
-index b78e457b3..b0447b0bc 100644
---- a/lib/cpp/src/thrift/transport/TBufferTransports.h
-+++ b/lib/cpp/src/thrift/transport/TBufferTransports.h
-@@ -20,6 +20,7 @@
- #ifndef _THRIFT_TRANSPORT_TBUFFERTRANSPORTS_H_
- #define _THRIFT_TRANSPORT_TBUFFERTRANSPORTS_H_ 1
- 
-+#include <cstddef>
- #include <cstdlib>
- #include <cstring>
- #include <limits>
--- 
-2.47.3
-
diff --git a/package/thrift/thrift.hash b/package/thrift/thrift.hash
index 187fd15c50..411e2a8d82 100644
--- a/package/thrift/thrift.hash
+++ b/package/thrift/thrift.hash
@@ -1,4 +1,4 @@
-# From https://downloads.apache.org/thrift/0.24.0/thrift-0.24.0.tar.gz.sha256
-sha256  e0fa5839a4c5c1d631b0931cf2c554ebbfa4e2fee3a9fb3ffd4f82ce4396c6e4  thrift-0.24.0.tar.gz
+# From https://downloads.apache.org/thrift/0.25.0/thrift-0.25.0.tar.gz.sha256
+sha256  66da4707214c54c94bac082103dc67adaf9e08925662700f269170a7b534b214  thrift-0.25.0.tar.gz
 # License files, locally calculated
-sha256  89aa7b27868669299bd8a6c53b72ec4beadce42dad6c8336797cc26e1e8df98d  LICENSE
+sha256  c866aafb79e8d5885eabb9d44a0105c8fcca35d26c5088025b131a908458a8af  LICENSE
diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
index a517dd5035..32ae140228 100644
--- a/package/thrift/thrift.mk
+++ b/package/thrift/thrift.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-THRIFT_VERSION = 0.24.0
+THRIFT_VERSION = 0.25.0
 THRIFT_SITE = https://downloads.apache.org/thrift/$(THRIFT_VERSION)
 THRIFT_LICENSE = Apache-2.0, Public Domain (sha256.h)
 THRIFT_LICENSE_FILES = LICENSE

--===============3454661666926270189==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3454661666926270189==--
