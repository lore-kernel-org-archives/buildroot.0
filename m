Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D468C79F80
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 07:00:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C05B060BBE;
	Fri,  4 Sep 2026 07:00:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nr0IEsgREAqQ; Fri,  4 Sep 2026 07:00:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 3D2FE60BC2
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788505255;
	b=TDSv93q7cy09OdcICA9Wtex95Lk/qn4TG+F0uFi+jS3f8HNvGGFBywRJrZ4upz0fF2Hh
	 CLD4cdd0MDfSdfK7wcyKikGmbceefEjZoysdiv8u0QSrbBHzuHv4w7fOruwhlxDb9N1Pi
	 yGwGkBKdqIi6BhLoPWe7K6/ttzKIGXAMN5iX52+PQ6fkqUITtlIeTrpyaQpFlcA/VYCq6
	 cov3E3qW5QUDj60wCfOWUklh1hg+eDPpftd8DDE7menoxgrjcjmp1QMlPYGdx2yKwAeIW
	 RLyYAcxDcpW4IpLp+lgqVwzKHvYwpaFarhzioDEtUX9h9XsWPNHTj1tjuEEBXi/10Ng==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788505255;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ARKWQHdvx5Y2XgD/jXcgldePkvN6Q0CtLYZR43ElQE0=;
	b=c/ZVypXB+FdGHd9ilfABFuHrrRy2IBnKwcu1wpTpL/8/42b3VGHyPDqX7+TW+luHwCWI
	 sQH2VLYM3/DJMdryXlhN9euQPwi2L0CuzRh/SOXnUcH3piKAIxJHbfUM01yq3pzh4mxBP
	 j7e+gzj5exoiEw76Crxx4MXHa1WHNss379SZAUFjf8Cm3wIJSnp4aHhsO8MQO60F20OXD
	 tJbdHolPksPCCpY5cT1AOIsiJVOCyaOrVOisRU1fMzuXwyFC3Eay4FBZkyZuJglU3goKI
	 yGc79Fwu+DALA/inVBzIxcj+cK+dSo3QOf5ccq45QsakMvUdWLAPcHSqrHLsPkuLUvw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788505255;
	bh=ARKWQHdvx5Y2XgD/jXcgldePkvN6Q0CtLYZR43ElQE0=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=UOdkD53uE9LC6+9FGLk/cFFYrznUlbI7y5mZoSAZKax8hzst0qTJdJ7ur5CWg+wgh
	 mur9JHy6nfh3Eg0BF5kEspvLetMpte1N4qCXdDSraTGKcFoRkd0zIhdhhcIbfqwdog
	 ge081J4CMbzkPloZdQs4zZB4iXl4dJT+rjcoOwfhTc3ZEzpDNrWgaN+Qd60CtAqc/Y
	 Xq1jyC7dDbcDhdkLfcCgtX5IAc57dlM2/hHcVKp91kPKqJ6W1ToiyXUBIu8DdXWFAg
	 kHuZh24aAkT/JO3gJ6Vb4eZjmGuyqltOzVbCWMB/XIgNrbL2rtOplRGzBLGX9tDvvU
	 KazGnVUy7Mrow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D2FE60BC2;
	Fri,  4 Sep 2026 07:00:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D8714B2C
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 07:00:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC7BC40B32
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 07:00:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LlTv8UeWwAYz for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 07:00:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0AB5240B5E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788505250;
 b=rGUKbLMXFR3bFTJdq7SL62H+MHXnD6LMtOdU7PuICSBo3M83KwsH2dvPbUxcXZaDPoAb
 KX1ETI8UpDrc4XFrO1VZjuo1O3vGgAYdnUkNzT0N4kUeY4CwFMJ4Gut7ubIGtWJvrcTsX
 K+2be4uILuh39z95AekJGVZBPByZARPpqeAVu0jitbKTwGOGPJ8K+mE8MNYHTj1eOWpmk
 KpEvW5x7cdk5draT0Zrt5BPDEDbIVyH7rMSnFt4JcELwExWlZrAJ1wTwX4tmcacO5pvJG
 l6nYGDOnqJq7Yqx/vuob5QnPsDgNC9RpHnL7oDrNoUHe8GYyTbCI+4Gw/IHAKHU3HyA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788505250;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=QRg2TVKUKh1bctQj5lx3Ld8vtFyl6yKJsd6q+3vNDWo=;
 b=TOjT1+T2cBrsGM7Ebx8wRBg25r3fCN4xsU/mZPhWKp1SAsAVCuFRkkmbA0v5t3Imbglx
 1q1K/x+a2KEHW0pn+MgHZLOcOVLY3uCUJDoinzh1zcAZIJtxyXFT/Vcy6GNXX+FIaqo6u
 WA67gEerIrTeXOoKHKFpgtwwEGJiJm44thu1QpU/lv5Y5wI7nAfp3Lxn0ckY56pRdW0Nq
 HTdMGkPYiqA5AFYbiNsoiWRe+7qexh5yBGhwbW3CB3ZVmSD+5CTA0ifEuX806nGL8h9Yx
 7DFls0hg+BvDB/ebC6w7dbxi1hkwnc7vx98eUnkuWBOTi3V090RANZbBBF1CZ6pgk9g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=d6Eb2VC2; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0AB5240B5E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 07:00:49 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-49b8e527d63so7792625e9.2
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 00:00:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788505247; x=1789110047;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=QRg2TVKUKh1bctQj5lx3Ld8vtFyl6yKJsd6q+3vNDWo=;
 b=aNPLEOo5ookSsByDpg22AuW6EUrUh3gep253KawodbzvT2J2mVOmHKOMrB1QaZXyCO
 jZK1pNjArlNVZNPwL5HpyVlrxG+IT65YsdHSOj9ninwhbfLoiOahbjA3nesbHxpwY3qh
 LJ9R0LDlCCoQJ6odBR9O4pa4RK4f4ndkiBC1L4+6kNyvkp1XX0e3hnGgVCOcmjXD/F9a
 WIBMU1xwT6WpB5H/RBI6SW1oQWwkK0YEZE4xjJguJSD7kqzC3OOJM1tAdf85VsXOKHE0
 sFI6cbelE2rB0w5VgAXUXKyPVOUndn96cy++drkZz3pnZGIAItHtr4eU31xpOnhDi3uv
 AR1Q==
X-Gm-Message-State: AFuF++mo4dcPovPmfD1PzRb6weccKuCovkZn9Q9f3bcGNlTz5+fKq/1j
 jhv89SfTvD62vRz1iHsEe5XoRV5DBfh0+ImpBGLdWxpzKByL+btivzU8WPfcUSPpywqLc7JRlQD
 f4XRC
X-Gm-Gg: AYBFou1ip2hUmIurGWCIWCxEpPgNb8ADI0HmD9iI1dtDZ6N0IWeiqh6MA6hCnZP3zi4
 X9BFyYjz9heWE0Cd90qCrOU9kwLDt00vrCD6Ms1s1jszsI+nIwrCtMoXu0mnxL4Zw7fymApth9b
 jqRPJ2PmnfPCwBDswYs2NbWA21EGRLe8Kc2/dCxR0xf+9dk/5DGvkVILhRy+k/hI7vBWDTDlzHO
 gMLsw4RLuf7+e1diB419vQHJaLpJdwPzXiS29kktpZoMqObSMuVZd2VXLipUlPEajOsuJSmh2pO
 Qtelzkp8USx1tMZeiMZnaIbOM1yuH9/zsnZ33RZitsMMRCtoZl3Bpjn8maFkSm2clseJxWA4acn
 cPWAcOi9fnoO/9pTdhlY1ygNqMajPjxcUI8fPl1mfaXtd/B540x3J55yBHad7qPecMMtBlvjVO8
 vUbAM4VMLM1m1dQJougd8+hqWBD55UtBKmLPhkd1AXQdQWnzprGglCeQ==
X-Received: by 2002:a05:600c:3f0a:b0:49c:e27c:6b10 with SMTP id
 5b1f17b1804b1-49cf81e4a10mr43177905e9.3.1788505246840; 
 Fri, 04 Sep 2026 00:00:46 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ce831af89sm109480385e9.1.2026.09.04.00.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 00:00:46 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Will Newton <will.newton@gmail.com>
Date: Fri,  4 Sep 2026 09:00:45 +0200
Message-ID: <20260904070045.110534-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/erlang: security bump to v26.2.5.21
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

See the changelogs:

- https://www.erlang.org/patches/OTP-26.2.5.16
- https://www.erlang.org/patches/OTP-26.2.5.17
- https://www.erlang.org/patches/OTP-26.2.5.18
- https://www.erlang.org/patches/OTP-26.2.5.19
- https://www.erlang.org/patches/OTP-26.2.5.20
- https://www.erlang.org/patches/OTP-26.2.5.21

This fixes the following vulnerabilies:

- CVE-2026-21620:
    Relative Path Traversal, Improper Isolation or Compartmentalization
    vulnerability in erlang otp erlang/otp (tftp_file modules), erlang otp
    inets (tftp_file modules), erlang otp tftp (tftp_file modules) allows
    Relative Path Traversal. This vulnerability is associated with program
    files lib/tftp/src/tftp_file.erl, src/tftp_file.erl.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-21620

- CVE-2026-23941:
    Inconsistent Interpretation of HTTP Requests ('HTTP Request
    Smuggling') vulnerability in Erlang OTP (inets httpd module) allows
    HTTP Request Smuggling.  This vulnerability is associated with program
    files lib/inets/src/http_server/httpd_request.erl and program routines
    httpd_request:parse_headers/7.  The server does not reject or
    normalize duplicate Content-Length headers. The earliest Content-
    Length in the request is used for body parsing while common reverse
    proxies (nginx, Apache httpd, Envoy) honor the last Content-Length
    value. This violates RFC 9112 Section 6.3 and allows front-end/back-
    end desynchronization, leaving attacker-controlled bytes queued as the
    start of the next request.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-23941

- CVE-2026-23942:
    Improper Limitation of a Pathname to a Restricted Directory ('Path
    Traversal') vulnerability in Erlang OTP (ssh_sftpd module) allows Path
    Traversal.  This vulnerability is associated with program files
    lib/ssh/src/ssh_sftpd.erl and program routines
    ssh_sftpd:is_within_root/2.  The SFTP server uses string prefix
    matching via lists:prefix/2 rather than proper path component
    validation when checking if a path is within the configured root
    directory. This allows authenticated users to access sibling
    directories that share a common name prefix with the configured root
    directory. For example, if root is set to /home/user1, paths like
    /home/user10 or /home/user1_backup would incorrectly be considered
    within the root.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-23942

- CVE-2026-23943:
    Improper Handling of Highly Compressed Data (Compression Bomb)
    vulnerability in Erlang OTP ssh (ssh_transport modules) allows Denial
    of Service via Resource Depletion.  The SSH transport layer advertises
    legacy zlib compression by default and inflates attacker-controlled
    payloads pre-authentication without any size limit, enabling reliable
    memory exhaustion DoS.  Two compression algorithms are affected:  *
    zlib: Activates immediately after key exchange, enabling
    unauthenticated attacks * zlib@openssh.com: Activates post-
    authentication, enabling authenticated attacks  Each SSH packet can
    decompress ~255 MB from 256 KB of wire data (1029:1 amplification
    ratio). Multiple packets can rapidly exhaust available memory, causing
    OOM kills in memory-constrained environments.  This vulnerability is
    associated with program files lib/ssh/src/ssh_transport.erl and
    program routines ssh_transport:decompress/2,
    ssh_transport:handle_packet_part/4.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-23943

- CVE-2026-28810:
    Generation of Predictable Numbers or Identifiers vulnerability in
    Erlang/OTP kernel (inet_res, inet_db modules) allows DNS Cache
    Poisoning.  The built-in DNS resolver (inet_res) uses a sequential,
    process-global 16-bit transaction ID for UDP queries and does not
    implement source port randomization. Response validation relies almost
    entirely on this ID, making DNS cache poisoning practical for an
    attacker who can observe one query or predict the next ID. This
    conflicts with RFC 5452 recommendations for mitigating forged DNS
    answers.  inet_res is intended for use in trusted network environments
    and with trusted recursive resolvers. Earlier documentation did not
    clearly state this deployment assumption, which could lead users to
    deploy the resolver in environments where spoofed DNS responses are
    possible.  This vulnerability is associated with program files
    lib/kernel/src/inet_db.erl and lib/kernel/src/inet_res.erl.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-28810

- CVE-2026-32147:
    Improper Limitation of a Pathname to a Restricted Directory ('Path
    Traversal') vulnerability in Erlang OTP ssh (ssh_sftpd module) allows
    an authenticated SFTP user to modify file attributes outside the
    configured chroot directory.  The SFTP daemon (ssh_sftpd) stores the
    raw, user-supplied path in file handles instead of the chroot-resolved
    path. When SSH_FXP_FSETSTAT is issued on such a handle, file
    attributes (permissions, ownership, timestamps) are modified on the
    real filesystem path, bypassing the root directory boundary entirely.
    Any authenticated SFTP user on a server configured with the root
    option can modify file attributes of files outside the intended chroot
    boundary. The prerequisite is that a target file must exist on the
    real filesystem at the same relative path. Note that this
    vulnerability only allows modification of file attributes; file
    contents cannot be read or altered through this attack vector.  If the
    SSH daemon runs as root, this enables direct privilege escalation: an
    attacker can set the setuid bit on any binary, change ownership of
    sensitive files, or make system configuration world-writable.  This
    vulnerability is associated with program files
    lib/ssh/src/ssh_sftpd.erl and program routines ssh_sftpd:do_open/4 and
    ssh_sftpd:handle_op/4.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-32147

- CVE-2026-42789:
    Improper Following of a Certificate's Chain of Trust vulnerability in
    Erlang OTP public_key (pubkey_cert module) allows a non-CA certificate
    to be accepted as an intermediate issuer, enabling certificate chain
    forgery.  In lib/public_key/src/pubkey_cert.erl,
    pubkey_cert:validate_extensions/7 contains two flaws that together
    allow a certificate with basicConstraints cA:false and no keyUsage
    extension to be used as an intermediate issuer in a chain passed to
    public_key:pkix_path_validation/3: the cA:false clause recurses into
    the remaining extensions without rejecting the certificate when it is
    in issuer position, and the keyUsage check only fires when the
    extension is present, so a certificate lacking keyUsage entirely
    bypasses the keyCertSign enforcement.  Any party holding an end-entity
    certificate with basicConstraints cA:false and no keyUsage extension,
    issued by any CA in the victim's trust store, can use that
    certificate's private key to sign forged leaf certificates for
    arbitrary identities. public_key:pkix_path_validation/3 accepts the
    resulting chain, and by extension every TLS or mTLS endpoint built on
    the OTP ssl application that relies on the default verifier is
    affected, including server identity verification on the client side
    and client certificate verification on mTLS servers.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-42789

- CVE-2026-42790:
    Improper Certificate Validation vulnerability in Erlang OTP public_key
    (pubkey_cert and public_key modules) allows a DNS nameConstraints
    bypass via subject CommonName fallback in TLS hostname verification.
    Two flaws combine to allow a subordinate CA whose DNS nameConstraints
    are restricted (e.g. permitted;DNS:allowed.example.com) to issue a
    leaf certificate that an OTP TLS client accepts as a valid identity
    for an out-of-scope hostname (e.g. victim.example.com):  First,
    pubkey_cert:validate_names/6 in lib/public_key/src/pubkey_cert.erl
    only checks SAN DNS entries against nameConstraints. Per RFC 5280, a
    permitted DNS subtree only restricts certificates that contain a DNS-
    typed name. A leaf with no subjectAltName therefore trivially
    satisfies any permitted;DNS:... constraint regardless of its subject
    commonName.  Second, public_key:pkix_verify_hostname/3 in
    lib/public_key/src/public_key.erl falls back to the subject commonName
    when no subjectAltName is present, extracting id-at-commonName
    attributes as presented IDs and matching them against the reference
    hostname. The strict pkix_verify_hostname_match_fun(https) matcher
    does not suppress this fallback.  The result is that path validation
    accepts a CN-only leaf under a DNS-constrained intermediate (no SAN
    means the nameConstraints are not triggered), and hostname
    verification then accepts it via the CN fallback. The bypass is
    reachable from stock ssl:connect with verify_peer, a trusted CA, SNI,
    and the canonical strict https hostname matcher.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-42790

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/erlang/erlang.hash | 4 ++--
 package/erlang/erlang.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/erlang/erlang.hash b/package/erlang/erlang.hash
index 7ff587e35c..667b27753e 100644
--- a/package/erlang/erlang.hash
+++ b/package/erlang/erlang.hash
@@ -1,5 +1,5 @@
-# From https://github.com/erlang/otp/releases/download/OTP-26.2.5.15/SHA256.txt
-sha256  28e6d63d82927f132d56289dd3c428ef8bce6bf2283c8549aa0a7afca1a8fe3b  otp_src_26.2.5.15.tar.gz
+# From https://github.com/erlang/otp/releases/download/OTP-26.2.5.21/SHA256.txt
+sha256  e1fde86f4e2874d4c136221a34753b5b785d762b910fb3fb35a23a6a7faf0a64  otp_src_26.2.5.21.tar.gz
 
 # Hash for license file
 sha256  809fa1ed21450f59827d1e9aec720bbc4b687434fa22283c6cb5dd82a47ab9c0  LICENSE.txt
diff --git a/package/erlang/erlang.mk b/package/erlang/erlang.mk
index 59353742f0..e038c66e0a 100644
--- a/package/erlang/erlang.mk
+++ b/package/erlang/erlang.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_VERSION = 26.2.5.15
+ERLANG_VERSION = 26.2.5.21
 ERLANG_RELEASE = $(firstword $(subst ., ,$(ERLANG_VERSION)))
 ERLANG_SITE = \
 	https://github.com/erlang/otp/releases/download/OTP-$(ERLANG_VERSION)
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
