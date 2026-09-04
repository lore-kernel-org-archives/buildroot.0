Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0302BC624D3
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 11:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C960560BEC;
	Fri,  4 Sep 2026 11:54:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y4c4POtYBNoI; Fri,  4 Sep 2026 11:54:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 005DB60BE9
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788522888;
	b=ggL10npRri3qfCLC1ll5snh1GrtiqVpENiv/AtYkqP91YGhQ+RRHRpgf+Ce/2BbkURLT
	 KeezaV4VQjgWmfFpnKHmk3lAF3eYJjvoJeKRGIVt/eXLBvrOka1FkvkA2BUUdKaJKnLlZ
	 ogRkBvPXa9o+tnIiXX5VIikDYFFc9+Wcfu5bD2rIbJ4EjApu2U1ay9fwKcAaAfhaniJyc
	 FITk11EboSWMQxLdTI0Znww1Bf8HWrzTZLzK6BnG0ZnDZKrQI6uPenAno6wIJ2YMuEAlR
	 HeNYZEOL6NKDVrdqI+HRuXqTgnrjQ67S1PS2k9GH6VCt8bFIsalhEraxuGK1XJmWefA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788522888;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:From:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=VInkRr6l4AES848zpXFMT1To9QNX8OJGgesnaRNzpL8=;
	b=Z5aOAvjNGf5tnT274GnR/N7fbxmdcz2d8kMg4dLwTz2JBkrsaoj7SHdZ/4M+6+bO9S9c
	 3UkLRBvlO6vqqKJs4kMA3JZBFR3agvEfbvMHCMTS62RMf1JPrgeqdDurofjZWY+jgPwju
	 WP27KGTdk76XgJU/FZ5rhO6OTLIVuhZw3pWqhmLwZ8qRnhpcAioWgIO6139xPEa9cJLgX
	 g7fGqnzLQ9YDL8bzd9IJh/nd/v2oa+ee+LpJ7Z2V6Q2AKSTHzjhlLf9ts6vdY7p0no4s+
	 xIhI0LSZTqajBds9E210bG7ZVvczgeXeGzGRI0IsMuGnp5MEGlY8FfDvGQNmautS0DQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788522888;
	bh=VInkRr6l4AES848zpXFMT1To9QNX8OJGgesnaRNzpL8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Su9DGUF2VpiCAZEWpGnGvVSY9pfpbSpRpFq0JcNDthkixtVkq3PaTyIxCnlQwalzI
	 /Ci6iCjEbhx8VGVLHRe0g1cq5f9o4judcE/tzUfSrdmNQr7uvXU5d4e6c8Ia0WpQij
	 3Oji96YyTw/wsfs8AnuM8YgCHH/Pf6r6V74RzNTUgdjKNuYij6t497TFy0gr9EX1ey
	 gBALm8DBc4v3UaHmkyPkido8ZLTQSBfzXpvJjruSiJZ63JulAvU7D6puA54hBonfM2
	 VHAQ2tJZC6Ibz7g2ZJQbVAfm0CBc4CYNN8IF8DtSPBfCKmoB+V4bdnNC4S/nCDTX5C
	 KBJlxRYrQ5jSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 005DB60BE9;
	Fri,  4 Sep 2026 11:54:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id BA96F10E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 11:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC4C681172
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 11:54:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T_WYdu5fNVxE for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 11:54:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 21CD48116C
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788522879;
 b=O+xg3nKsJdWRt7HgJMltuEfE4XjYK/Zr8ll01WQKpGQm81mUDWnfIq9OpOLMiVeL+aRN
 6GfWJqXGX+TtteAt1dW7luaTmYQHhRyqwn3f629x+h1d2stf5K6dnjgZhnA2PlfljL1/M
 J7/rlon0nMZ6JCR/4tF1eASP93kA+PbLM8ioclrgqbJo7R3YtErXCRjMDNaYDitzgVXb2
 S11mbPz1KHsvvO6TE/jmtvFSwDjAQarZ2Sea3+tjc4J8aJCFpu58yR4BDDR5/Sdj+BqBr
 djqeS8vUKw3uzQd13axLbZUfGVP+NjC0RlgAmAZB3tV8ZBbz60Yo7OOZNpP1dF5IR+g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788522879;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=npn2N0F0Af6C4Ax1KPzk4ByF6krrJgcQpBslPPqjYD8=;
 b=P+JvFilFUUsOlpy3BSVYg4gqleF3YGOYQ2WUpZYMVcfpiNWJOMVtg6Isv5dY0qh4H4U9
 8xsJV+MUzVO79PpnZs68sewM9x8lY3Z1mxIay6dFwW/IK0OHoa9FEGF7OBk5f2Xfwc1pT
 sL2ErZnLS1dTPOJd/wyx3p74L4CnP9ZVorFdzk9lYZD8XSZdBHWvBl+ESV2nChfDiCBqc
 ZStqa2JVNVQbrzUIILDu46FpougGcjuXLTcO4Qdn98iOmcQhYE6wzce2tqTHzff73NYqC
 B0oQ/43grDnrQhwc3F1TzPB2EmM/jzITcoNWlrsTCA9D/qWAl0Eg6GilK2gArxUVIBg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21CD48116C
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 11:54:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C0CD949DB; Fri,  4 Sep 2026 11:53:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 4 Sep 2026 13:53:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ad9557dba535b2b2ad39733c9c3d31851d34a9aa
X-Git-Newrev: dfc909b1cddf7e69fe3d1ad96fdac08f595dccf2
X-Patchwork-Hint: ignore
Message-Id: <20260904115338.9C0CD949DB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/erlang: security bump to v26.2.5.21
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dfc909b1cddf7e69fe3d1ad96fdac08f595dccf2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See the changelogs:

- https://www.erlang.org/patches/OTP-26.2.5.16
- https://www.erlang.org/patches/OTP-26.2.5.17
- https://www.erlang.org/patches/OTP-26.2.5.18
- https://www.erlang.org/patches/OTP-26.2.5.19
- https://www.erlang.org/patches/OTP-26.2.5.20
- https://www.erlang.org/patches/OTP-26.2.5.21

This fixes the following vulnerabilities:

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
