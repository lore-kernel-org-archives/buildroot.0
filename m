Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B501E9A053
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 17:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D3C3610C6;
	Thu, 19 Feb 2026 17:24:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6SxzGnXDGV6p; Thu, 19 Feb 2026 17:24:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2ECBA60EF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771521885;
	bh=oRSWhOt9G6l8npt3kR3Aa7G8p1tQFAZeyAfuLsUSXYs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kNNGyFoM/1U+ojxfwHJlqliusU0n3R6cyfjPeZ+YeBQqO6HVd4QobsnLK2UVkIjGV
	 /iN6Jklf6vWjLtwDK27m4jnuONxO8Wd1Rvt9rswXDG5oMIIOvKvDegQj3iI0iz63/2
	 scFxZYPdVblP/SuehjYyJ0Xtu15hhHvZb1246W254VZfrJKA6kIKeF+Nf5Syvd7ENT
	 QRPDxVS1r+7M5GDyleVTa04YlKORPorGw6m0R/fUHUx17AOouZPucSlN2g/SYDGMy8
	 WbhvJT6KRue+sZ+bUgOwxvo9QXkU8cbx3rKQBT9bEpXjAl0CP2IBUR+o2lqNS6qMo/
	 919WQgxx7S5Uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2ECBA60EF3;
	Thu, 19 Feb 2026 17:24:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F013206
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44CD840C78
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vT8LNqoY_8hM for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 17:24:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECF3040CE9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECF3040CE9
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 17:24:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA1D884046; Thu, 19 Feb 2026 17:24:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 18 Feb 2026 19:23:25 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: b79b19a3e32a19ed240d509415d1f511ab9efaf8
X-Git-Newrev: b7aa218d7692947283bcf8c644b264b474486ce3
X-Patchwork-Hint: ignore
Message-Id: <20260219172413.EA1D884046@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/avahi: patch
 various security vulnerabilities
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0375415038199677554=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0375415038199677554==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b7aa218d7692947283bcf8c644b264b474486ce3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Please note that the fix for CVE-2024-52615 introduces CVE-2025-59529
which is not fixed yet (https://github.com/avahi/avahi/pull/808). You
can mitigate this vulnerability by setting the `enable-wide-area=no`
option.

Patch `0011-properly-randomize-query-id-of-DNS-packets.patch` modify
`configure.ac` and then `AVAHI_AUTORECONF` is set.

This commit fixes the following vulnerabilities:

- CVE-2021-3468:
    A flaw was found in avahi in versions 0.6 up to 0.8. The event used to
    signal the termination of the client connection on the avahi Unix
    socket is not correctly handled in the client_work function, allowing
    a local attacker to trigger an infinite loop. The highest threat from
    this vulnerability is to the availability of the avahi service, which
    becomes unresponsive after this flaw is triggered.

For more information, see:
    - https://www.cve.org/CVERecord?id=CVE-2021-3468
    - https://github.com/avahi/avahi/commit/447affe29991ee99c6b9732fc5f2c1048a611d3b

- CVE-2023-38469:
    A vulnerability was found in Avahi, where a reachable assertion exists
    in avahi_dns_packet_append_record.
    https://www.cve.org/CVERecord?id=CVE-2023-38469

- CVE-2023-38470:
    A vulnerability was found in Avahi. A reachable assertion exists in
    the avahi_escape_label() function.

For more information, see:
    - https://www.cve.org/CVERecord?id=CVE-2023-38470
    - https://github.com/avahi/avahi/commit/a337a1ba7d15853fb56deef1f464529af6e3a1cf

- CVE-2023-38471:
    A vulnerability was found in Avahi. A reachable assertion exists in
    the dbus_set_host_name function.

For more information, see:
    - https://www.cve.org/CVERecord?id=CVE-2023-38471
    - github.com/avahi/avahi/commit/894f085f402e023a98cbb6f5a3d117bd88d93b09

- CVE-2023-38472:
    A vulnerability was found in Avahi. A reachable assertion exists in
    the avahi_rdata_parse() function.

For more information, see:
    - https://www.cve.org/CVERecord?id=CVE-2023-38472
    - https://github.com/avahi/avahi/commit/b024ae5749f4aeba03478e6391687c3c9c8dee40

- CVE-2023-38473:
    A vulnerability was found in Avahi. A reachable assertion exists in
    the avahi_alternative_host_name() function.

For more information, see:
    - https://www.cve.org/CVERecord?id=CVE-2023-38473
    - https://github.com/avahi/avahi/commit/b448c9f771bada14ae8de175695a9729f8646797

- CVE-2024-52615:
    A flaw was found in Avahi-daemon, which relies on fixed source ports
    for wide-area DNS queries. This issue simplifies attacks where
    malicious DNS responses are injected.

For more information, see:
    - https://www.cve.org/CVERecord?id=CVE-2024-52615
    - https://github.com/avahi/avahi/commit/4e2e1ea0908d7e6ad7f38ae04fdcdf2411f8b942
    - https://github.com/avahi/avahi/issues/810 (introduce regression CVE-2025-59529)

- CVE-2024-52616:
    A flaw was found in the Avahi-daemon, where it initializes DNS
    transaction IDs randomly only once at startup, incrementing them
    sequentially after that. This predictable behavior facilitates DNS
    spoofing attacks, allowing attackers to guess transaction IDs.

For more information, see:
    - https://www.cve.org/CVERecord?id=CVE-2024-52616
    - https://github.com/avahi/avahi/commit/f8710bdc8b29ee1176fe3bfaeabebbda1b7a79f7

- CVE-2025-68276:
    Avahi is a system which facilitates service discovery on a local
    network via the mDNS/DNS-SD protocol suite. In 0.9-rc2 and earlier, an
    unprivileged local users can crash avahi-daemon (with wide-area
    disabled) by creating record browsers with the
    AVAHI_LOOKUP_USE_WIDE_AREA flag set via D-Bus. This can be done by
    either calling the RecordBrowserNew method directly or creating
    hostname/address/service resolvers/browsers that create those browsers
    internally themselves.

For more information, see:
    - https://www.cve.org/CVERecord?id=CVE-2025-68276
    - https://github.com/avahi/avahi/commit/2d48e42d44a183f26a4d12d1f5d41abb9b7c6355

- CVE-2025-68468:
    Avahi is a system which facilitates service discovery on a local
    network via the mDNS/DNS-SD protocol suite. In 0.9-rc2 and earlier,
    avahi-daemon can be crashed by sending unsolicited announcements
    containing CNAME resource records pointing it to resource records with
    short TTLs. As soon as they expire avahi-daemon crashes.

For more information, see:
    - https://www.cve.org/CVERecord?id=CVE-2025-68468
    - https://github.com/avahi/avahi/commit/f66be13d7f31a3ef806d226bf8b67240179d309a

- CVE-2025-68471:
    Avahi is a system which facilitates service discovery on a local
    network via the mDNS/DNS-SD protocol suite. In 0.9-rc2 and earlier,
    avahi-daemon can be crashed by sending 2 unsolicited announcements
    with CNAME resource records 2 seconds apart.

For more information, see:
    - https://www.cve.org/CVERecord?id=CVE-2025-68471
    - https://github.com/avahi/avahi/commit/9c6eb53bf2e290aed84b1f207e3ce35c54cc0aa1

- CVE-2026-24401:
    Avahi is a system which facilitates service discovery on a local
    network via the mDNS/DNS-SD protocol suite. In versions 0.9rc2 and
    below, avahi-daemon can be crashed via a segmentation fault by sending
    an unsolicited mDNS response containing a recursive CNAME record,
    where the alias and canonical name point to the same domain (e.g.,
    "h.local" as a CNAME for "h.local"). This causes unbounded recursion
    in the lookup_handle_cname function, leading to stack exhaustion. The
    vulnerability affects record browsers where AVAHI_LOOKUP_USE_MULTICAST
    is set explicitly, which includes record browsers created by resolvers
    used by nss-mdns. This issue is patched in commit
    78eab31128479f06e30beb8c1cbf99dd921e2524.

For more information, see:
    - https://www.cve.org/CVERecord?id=CVE-2026-24401
    - https://github.com/avahi/avahi/commit/78eab31128479f06e30beb8c1cbf99dd921e2524

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit e728d3506b0bb0c3169b5beccdf6eb523bdda3f7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...emon-by-handling-hup-event-in-client-work.patch |  41 ++++
 ...e-reject-overly-long-txt-resource-records.patch |  45 ++++
 ...sure-each-label-is-at-least-one-byte-long.patch |  56 +++++
 ...ut-when-escaped-labels-can-t-fit-into-ret.patch |  52 +++++
 ...ract-host-name-using-avahi-unescape-label.patch |  70 +++++++
 ...-from-avahi-server-set-host-name-properly.patch |  51 +++++
 ...ere-is-rdata-to-process-before-parsing-it.patch |  42 ++++
 ...tive-host-name-from-its-unescaped-version.patch | 106 ++++++++++
 ...roperly-randomize-query-id-of-DNS-packets.patch | 102 +++++++++
 ...012-core-wide-area-fix-for-CVE-2024-52615.patch | 227 +++++++++++++++++++++
 ...rea-record-browsers-when-wide-area-is-off.patch |  64 ++++++
 ...x-DoS-bug-by-removing-incorrect-assertion.patch |  26 +++
 ...-fix-DoS-bug-by-changing-assert-to-return.patch |  30 +++
 ...g-using-a-simple-loop-detection-algorithm.patch |  73 +++++++
 package/avahi/avahi.mk                             |  41 ++++
 15 files changed, 1026 insertions(+)

diff --git a/package/avahi/0003-avoid-infinite-loop-in-avahi-daemon-by-handling-hup-event-in-client-work.patch b/package/avahi/0003-avoid-infinite-loop-in-avahi-daemon-by-handling-hup-event-in-client-work.patch
new file mode 100644
index 0000000000..562a400375
--- /dev/null
+++ b/package/avahi/0003-avoid-infinite-loop-in-avahi-daemon-by-handling-hup-event-in-client-work.patch
@@ -0,0 +1,41 @@
+From 447affe29991ee99c6b9732fc5f2c1048a611d3b Mon Sep 17 00:00:00 2001
+From: Riccardo Schirone <sirmy15@gmail.com>
+Date: Fri, 26 Mar 2021 11:50:24 +0100
+Subject: [PATCH] Avoid infinite-loop in avahi-daemon by handling HUP event in
+ client_work
+
+If a client fills the input buffer, client_work() disables the
+AVAHI_WATCH_IN event, thus preventing the function from executing the
+`read` syscall the next times it is called. However, if the client then
+terminates the connection, the socket file descriptor receives a HUP
+event, which is not handled, thus the kernel keeps marking the HUP event
+as occurring. While iterating over the file descriptors that triggered
+an event, the client file descriptor will keep having the HUP event and
+the client_work() function is always called with AVAHI_WATCH_HUP but
+without nothing being done, thus entering an infinite loop.
+
+See https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=984938
+
+CVE: CVE-2021-3468
+Upstream: https://github.com/avahi/avahi/commit/447affe29991ee99c6b9732fc5f2c1048a611d3b
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ avahi-daemon/simple-protocol.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/avahi-daemon/simple-protocol.c b/avahi-daemon/simple-protocol.c
+index 3e0ebb114..6c0274d65 100644
+--- a/avahi-daemon/simple-protocol.c
++++ b/avahi-daemon/simple-protocol.c
+@@ -424,6 +424,11 @@ static void client_work(AvahiWatch *watch, AVAHI_GCC_UNUSED int fd, AvahiWatchEv
+         }
+     }
+ 
++    if (events & AVAHI_WATCH_HUP) {
++        client_free(c);
++        return;
++    }
++
+     c->server->poll_api->watch_update(
+         watch,
+         (c->outbuf_length > 0 ? AVAHI_WATCH_OUT : 0) |
diff --git a/package/avahi/0004-core-reject-overly-long-txt-resource-records.patch b/package/avahi/0004-core-reject-overly-long-txt-resource-records.patch
new file mode 100644
index 0000000000..eca99b8365
--- /dev/null
+++ b/package/avahi/0004-core-reject-overly-long-txt-resource-records.patch
@@ -0,0 +1,45 @@
+From a337a1ba7d15853fb56deef1f464529af6e3a1cf Mon Sep 17 00:00:00 2001
+From: Evgeny Vereshchagin <evvers@ya.ru>
+Date: Mon, 23 Oct 2023 20:29:31 +0000
+Subject: [PATCH] core: reject overly long TXT resource records
+
+Closes https://github.com/avahi/avahi/issues/455
+
+CVE: CVE-2023-38469
+Upstream: https://github.com/avahi/avahi/commit/a337a1ba7d15853fb56deef1f464529af6e3a1cf
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ avahi-core/rr.c | 9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/avahi-core/rr.c b/avahi-core/rr.c
+index 2bb892445..9c04ebbdb 100644
+--- a/avahi-core/rr.c
++++ b/avahi-core/rr.c
+@@ -32,6 +32,7 @@
+ #include <avahi-common/malloc.h>
+ #include <avahi-common/defs.h>
+ 
++#include "dns.h"
+ #include "rr.h"
+ #include "log.h"
+ #include "util.h"
+@@ -689,11 +690,17 @@ int avahi_record_is_valid(AvahiRecord *r) {
+         case AVAHI_DNS_TYPE_TXT: {
+ 
+             AvahiStringList *strlst;
++            size_t used = 0;
+ 
+-            for (strlst = r->data.txt.string_list; strlst; strlst = strlst->next)
++            for (strlst = r->data.txt.string_list; strlst; strlst = strlst->next) {
+                 if (strlst->size > 255 || strlst->size <= 0)
+                     return 0;
+ 
++                used += 1+strlst->size;
++                if (used > AVAHI_DNS_RDATA_MAX)
++                    return 0;
++            }
++
+             return 1;
+         }
+     }
diff --git a/package/avahi/0005-ensure-each-label-is-at-least-one-byte-long.patch b/package/avahi/0005-ensure-each-label-is-at-least-one-byte-long.patch
new file mode 100644
index 0000000000..183ad44446
--- /dev/null
+++ b/package/avahi/0005-ensure-each-label-is-at-least-one-byte-long.patch
@@ -0,0 +1,56 @@
+From 94cb6489114636940ac683515417990b55b5d66c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Petr=20Men=C5=A1=C3=ADk?= <pemensik@redhat.com>
+Date: Tue, 11 Apr 2023 15:29:59 +0200
+Subject: [PATCH] Ensure each label is at least one byte long
+
+The only allowed exception is single dot, where it should return empty
+string.
+
+Fixes #454.
+
+Upstream: 
+CVE: CVE-2023-38470
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ avahi-common/domain-test.c | 14 ++++++++++++++
+ avahi-common/domain.c      |  2 +-
+ 2 files changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/avahi-common/domain-test.c b/avahi-common/domain-test.c
+index cf763eca6..3acc1c1e4 100644
+--- a/avahi-common/domain-test.c
++++ b/avahi-common/domain-test.c
+@@ -45,6 +45,20 @@ int main(AVAHI_GCC_UNUSED int argc, AVAHI_GCC_UNUSED char *argv[]) {
+     printf("%s\n", s = avahi_normalize_name_strdup("fo\\\\o\\..f oo."));
+     avahi_free(s);
+ 
++    printf("%s\n", s = avahi_normalize_name_strdup("."));
++    avahi_free(s);
++
++    s = avahi_normalize_name_strdup(",.=.}.=.?-.}.=.?.?.}.}.?.?.?.z.?.?.}.}."
++		    "}.?.?.?.r.=.=.}.=.?.}}.}.?.?.?.zM.=.=.?.?.}.}.?.?.}.}.}"
++		    ".?.?.?.r.=.=.}.=.?.}}.}.?.?.?.zM.=.=.?.?.}.}.?.?.?.zM.?`"
++		    "?.}.}.}.?.?.?.r.=.?.}.=.?.?.}.?.?.?.}.=.?.?.}??.}.}.?.?."
++		    "?.z.?.?.}.}.}.?.?.?.r.=.=.}.=.?.}}.}.?.?.?.zM.?`?.}.}.}."
++		    "??.?.zM.?`?.}.}.}.?.?.?.r.=.?.}.=.?.?.}.?.?.?.}.=.?.?.}?"
++		    "?.}.}.?.?.?.z.?.?.}.}.}.?.?.?.r.=.=.}.=.?.}}.}.?.?.?.zM."
++		    "?`?.}.}.}.?.?.?.r.=.=.?.?`.?.?}.}.}.?.?.?.r.=.?.}.=.?.?."
++		    "}.?.?.?.}.=.?.?.}");
++    assert(s == NULL);
++
+     printf("%i\n", avahi_domain_equal("\\065aa bbb\\.\\046cc.cc\\\\.dee.fff.", "Aaa BBB\\.\\.cc.cc\\\\.dee.fff"));
+     printf("%i\n", avahi_domain_equal("A", "a"));
+ 
+diff --git a/avahi-common/domain.c b/avahi-common/domain.c
+index 3b1ab6834..e66d2416c 100644
+--- a/avahi-common/domain.c
++++ b/avahi-common/domain.c
+@@ -201,7 +201,7 @@ char *avahi_normalize_name(const char *s, char *ret_s, size_t size) {
+         }
+ 
+         if (!empty) {
+-            if (size < 1)
++            if (size < 2)
+                 return NULL;
+ 
+             *(r++) = '.';
diff --git a/package/avahi/0006-common-bail-out-when-escaped-labels-can-t-fit-into-ret.patch b/package/avahi/0006-common-bail-out-when-escaped-labels-can-t-fit-into-ret.patch
new file mode 100644
index 0000000000..be55bb0e6e
--- /dev/null
+++ b/package/avahi/0006-common-bail-out-when-escaped-labels-can-t-fit-into-ret.patch
@@ -0,0 +1,52 @@
+From 20dec84b2480821704258bc908e7b2bd2e883b24 Mon Sep 17 00:00:00 2001
+From: Evgeny Vereshchagin <evvers@ya.ru>
+Date: Tue, 19 Sep 2023 03:21:25 +0000
+Subject: [PATCH] [common] bail out when escaped labels can't fit into ret
+
+Fixes:
+```
+==93410==ERROR: AddressSanitizer: stack-buffer-overflow on address 0x7f9e76f14c16 at pc 0x00000047208d bp 0x7ffee90a6a00 sp 0x7ffee90a61c8
+READ of size 1110 at 0x7f9e76f14c16 thread T0
+    #0 0x47208c in __interceptor_strlen (out/fuzz-domain+0x47208c) (BuildId: 731b20c1eef22c2104e75a6496a399b10cfc7cba)
+    #1 0x534eb0 in avahi_strdup avahi/avahi-common/malloc.c:167:12
+    #2 0x53862c in avahi_normalize_name_strdup avahi/avahi-common/domain.c:226:12
+```
+and
+```
+fuzz-domain: fuzz/fuzz-domain.c:38: int LLVMFuzzerTestOneInput(const uint8_t *, size_t): Assertion `avahi_domain_equal(s, t)' failed.
+==101571== ERROR: libFuzzer: deadly signal
+    #0 0x501175 in __sanitizer_print_stack_trace (/home/vagrant/avahi/out/fuzz-domain+0x501175) (BuildId: 682bf6400aff9d41b64b6e2cc3ef5ad600216ea8)
+    #1 0x45ad2c in fuzzer::PrintStackTrace() (/home/vagrant/avahi/out/fuzz-domain+0x45ad2c) (BuildId: 682bf6400aff9d41b64b6e2cc3ef5ad600216ea8)
+    #2 0x43fc07 in fuzzer::Fuzzer::CrashCallback() (/home/vagrant/avahi/out/fuzz-domain+0x43fc07) (BuildId: 682bf6400aff9d41b64b6e2cc3ef5ad600216ea8)
+    #3 0x7f1581d7ebaf  (/lib64/libc.so.6+0x3dbaf) (BuildId: c9f62793b9e886eb1b95077d4f26fe2b4aa1ac25)
+    #4 0x7f1581dcf883 in __pthread_kill_implementation (/lib64/libc.so.6+0x8e883) (BuildId: c9f62793b9e886eb1b95077d4f26fe2b4aa1ac25)
+    #5 0x7f1581d7eafd in gsignal (/lib64/libc.so.6+0x3dafd) (BuildId: c9f62793b9e886eb1b95077d4f26fe2b4aa1ac25)
+    #6 0x7f1581d6787e in abort (/lib64/libc.so.6+0x2687e) (BuildId: c9f62793b9e886eb1b95077d4f26fe2b4aa1ac25)
+    #7 0x7f1581d6779a in __assert_fail_base.cold (/lib64/libc.so.6+0x2679a) (BuildId: c9f62793b9e886eb1b95077d4f26fe2b4aa1ac25)
+    #8 0x7f1581d77186 in __assert_fail (/lib64/libc.so.6+0x36186) (BuildId: c9f62793b9e886eb1b95077d4f26fe2b4aa1ac25)
+    #9 0x5344a4 in LLVMFuzzerTestOneInput /home/vagrant/avahi/fuzz/fuzz-domain.c:38:9
+```
+
+It's a follow-up to 94cb6489114636940ac683515417990b55b5d66c
+
+CVE: CVE-2023-38470
+Upstream: https://github.com/avahi/avahi/commit/20dec84b2480821704258bc908e7b2bd2e883b24
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ avahi-common/domain.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/avahi-common/domain.c b/avahi-common/domain.c
+index e66d2416c..88c6f0114 100644
+--- a/avahi-common/domain.c
++++ b/avahi-common/domain.c
+@@ -210,7 +210,8 @@ char *avahi_normalize_name(const char *s, char *ret_s, size_t size) {
+         } else
+             empty = 0;
+ 
+-        avahi_escape_label(label, strlen(label), &r, &size);
++        if (!(avahi_escape_label(label, strlen(label), &r, &size)))
++            return NULL;
+     }
+ 
+     return ret_s;
diff --git a/package/avahi/0007-core-extract-host-name-using-avahi-unescape-label.patch b/package/avahi/0007-core-extract-host-name-using-avahi-unescape-label.patch
new file mode 100644
index 0000000000..67f1b914a0
--- /dev/null
+++ b/package/avahi/0007-core-extract-host-name-using-avahi-unescape-label.patch
@@ -0,0 +1,70 @@
+From 894f085f402e023a98cbb6f5a3d117bd88d93b09 Mon Sep 17 00:00:00 2001
+From: Michal Sekletar <msekleta@redhat.com>
+Date: Mon, 23 Oct 2023 13:38:35 +0200
+Subject: [PATCH] core: extract host name using avahi_unescape_label()
+
+Previously we could create invalid escape sequence when we split the
+string on dot. For example, from valid host name "foo\\.bar" we have
+created invalid name "foo\\" and tried to set that as the host name
+which crashed the daemon.
+
+Fixes #453
+
+CVE: CVE-2023-38471
+Upstream: https://github.com/avahi/avahi/commit/894f085f402e023a98cbb6f5a3d117bd88d93b09
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ avahi-core/server.c | 27 +++++++++++++++++++++------
+ 1 file changed, 21 insertions(+), 6 deletions(-)
+
+diff --git a/avahi-core/server.c b/avahi-core/server.c
+index c32637af8..f6a21bb77 100644
+--- a/avahi-core/server.c
++++ b/avahi-core/server.c
+@@ -1295,7 +1295,11 @@ static void update_fqdn(AvahiServer *s) {
+ }
+ 
+ int avahi_server_set_host_name(AvahiServer *s, const char *host_name) {
+-    char *hn = NULL;
++    char label_escaped[AVAHI_LABEL_MAX*4+1];
++    char label[AVAHI_LABEL_MAX];
++    char *hn = NULL, *h;
++    size_t len;
++
+     assert(s);
+ 
+     AVAHI_CHECK_VALIDITY(s, !host_name || avahi_is_valid_host_name(host_name), AVAHI_ERR_INVALID_HOST_NAME);
+@@ -1305,17 +1309,28 @@ int avahi_server_set_host_name(AvahiServer *s, const char *host_name) {
+     else
+         hn = avahi_normalize_name_strdup(host_name);
+ 
+-    hn[strcspn(hn, ".")] = 0;
++    h = hn;
++    if (!avahi_unescape_label((const char **)&hn, label, sizeof(label))) {
++        avahi_free(h);
++        return AVAHI_ERR_INVALID_HOST_NAME;
++    }
++
++    avahi_free(h);
++
++    h = label_escaped;
++    len = sizeof(label_escaped);
++    if (!avahi_escape_label(label, strlen(label), &h, &len))
++        return AVAHI_ERR_INVALID_HOST_NAME;
+ 
+-    if (avahi_domain_equal(s->host_name, hn) && s->state != AVAHI_SERVER_COLLISION) {
+-        avahi_free(hn);
++    if (avahi_domain_equal(s->host_name, label_escaped) && s->state != AVAHI_SERVER_COLLISION)
+         return avahi_server_set_errno(s, AVAHI_ERR_NO_CHANGE);
+-    }
+ 
+     withdraw_host_rrs(s);
+ 
+     avahi_free(s->host_name);
+-    s->host_name = hn;
++    s->host_name = avahi_strdup(label_escaped);
++    if (!s->host_name)
++        return AVAHI_ERR_NO_MEMORY;
+ 
+     update_fqdn(s);
+ 
diff --git a/package/avahi/0008-core-return-errors-from-avahi-server-set-host-name-properly.patch b/package/avahi/0008-core-return-errors-from-avahi-server-set-host-name-properly.patch
new file mode 100644
index 0000000000..633500f492
--- /dev/null
+++ b/package/avahi/0008-core-return-errors-from-avahi-server-set-host-name-properly.patch
@@ -0,0 +1,51 @@
+From b675f70739f404342f7f78635d6e2dcd85a13460 Mon Sep 17 00:00:00 2001
+From: Evgeny Vereshchagin <evvers@ya.ru>
+Date: Tue, 24 Oct 2023 22:04:51 +0000
+Subject: [PATCH] core: return errors from avahi_server_set_host_name properly
+
+It's a follow-up to 894f085f402e023a98cbb6f5a3d117bd88d93b09
+
+CVE: CVE-2023-38471
+Upstream: https://github.com/avahi/avahi/commit/b675f70739f404342f7f78635d6e2dcd85a13460
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ avahi-core/server.c | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/avahi-core/server.c b/avahi-core/server.c
+index f6a21bb77..84df6b5de 100644
+--- a/avahi-core/server.c
++++ b/avahi-core/server.c
+@@ -1309,10 +1309,13 @@ int avahi_server_set_host_name(AvahiServer *s, const char *host_name) {
+     else
+         hn = avahi_normalize_name_strdup(host_name);
+ 
++    if (!hn)
++        return avahi_server_set_errno(s, AVAHI_ERR_NO_MEMORY);
++
+     h = hn;
+     if (!avahi_unescape_label((const char **)&hn, label, sizeof(label))) {
+         avahi_free(h);
+-        return AVAHI_ERR_INVALID_HOST_NAME;
++        return avahi_server_set_errno(s, AVAHI_ERR_INVALID_HOST_NAME);
+     }
+ 
+     avahi_free(h);
+@@ -1320,7 +1323,7 @@ int avahi_server_set_host_name(AvahiServer *s, const char *host_name) {
+     h = label_escaped;
+     len = sizeof(label_escaped);
+     if (!avahi_escape_label(label, strlen(label), &h, &len))
+-        return AVAHI_ERR_INVALID_HOST_NAME;
++        return avahi_server_set_errno(s, AVAHI_ERR_INVALID_HOST_NAME);
+ 
+     if (avahi_domain_equal(s->host_name, label_escaped) && s->state != AVAHI_SERVER_COLLISION)
+         return avahi_server_set_errno(s, AVAHI_ERR_NO_CHANGE);
+@@ -1330,7 +1333,7 @@ int avahi_server_set_host_name(AvahiServer *s, const char *host_name) {
+     avahi_free(s->host_name);
+     s->host_name = avahi_strdup(label_escaped);
+     if (!s->host_name)
+-        return AVAHI_ERR_NO_MEMORY;
++        return avahi_server_set_errno(s, AVAHI_ERR_NO_MEMORY);
+ 
+     update_fqdn(s);
+ 
diff --git a/package/avahi/0009-core-make-sure-there-is-rdata-to-process-before-parsing-it.patch b/package/avahi/0009-core-make-sure-there-is-rdata-to-process-before-parsing-it.patch
new file mode 100644
index 0000000000..8f7febe547
--- /dev/null
+++ b/package/avahi/0009-core-make-sure-there-is-rdata-to-process-before-parsing-it.patch
@@ -0,0 +1,42 @@
+From b024ae5749f4aeba03478e6391687c3c9c8dee40 Mon Sep 17 00:00:00 2001
+From: Michal Sekletar <msekleta@redhat.com>
+Date: Thu, 19 Oct 2023 17:36:44 +0200
+Subject: [PATCH] core: make sure there is rdata to process before parsing it
+
+Fixes #452
+
+CVE: CVE-2023-38472
+Upstream: https://github.com/avahi/avahi/commit/b024ae5749f4aeba03478e6391687c3c9c8dee40
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ avahi-client/client-test.c      | 3 +++
+ avahi-daemon/dbus-entry-group.c | 2 +-
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/avahi-client/client-test.c b/avahi-client/client-test.c
+index b3366d848..ba9799881 100644
+--- a/avahi-client/client-test.c
++++ b/avahi-client/client-test.c
+@@ -258,6 +258,9 @@ int main (AVAHI_GCC_UNUSED int argc, AVAHI_GCC_UNUSED char *argv[]) {
+     printf("%s\n", avahi_strerror(avahi_entry_group_add_service (group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, "Lathiat's Site", "_http._tcp", NULL, NULL, 80, "foo=bar", NULL)));
+     printf("add_record: %d\n", avahi_entry_group_add_record (group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, "TestX", 0x01, 0x10, 120, "\5booya", 6));
+ 
++    error = avahi_entry_group_add_record (group, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, 0, "TestX", 0x01, 0x10, 120, "", 0);
++    assert(error != AVAHI_OK);
++
+     avahi_entry_group_commit (group);
+ 
+     domain = avahi_domain_browser_new (avahi, AVAHI_IF_UNSPEC, AVAHI_PROTO_UNSPEC, NULL, AVAHI_DOMAIN_BROWSER_BROWSE, 0, avahi_domain_browser_callback, (char*) "omghai3u");
+diff --git a/avahi-daemon/dbus-entry-group.c b/avahi-daemon/dbus-entry-group.c
+index 4e879a5ba..aa23d4b6b 100644
+--- a/avahi-daemon/dbus-entry-group.c
++++ b/avahi-daemon/dbus-entry-group.c
+@@ -340,7 +340,7 @@ DBusHandlerResult avahi_dbus_msg_entry_group_impl(DBusConnection *c, DBusMessage
+         if (!(r = avahi_record_new_full (name, clazz, type, ttl)))
+             return avahi_dbus_respond_error(c, m, AVAHI_ERR_NO_MEMORY, NULL);
+ 
+-        if (avahi_rdata_parse (r, rdata, size) < 0) {
++        if (!rdata || avahi_rdata_parse (r, rdata, size) < 0) {
+             avahi_record_unref (r);
+             return avahi_dbus_respond_error(c, m, AVAHI_ERR_INVALID_RDATA, NULL);
+         }
diff --git a/package/avahi/0010-common-derive-alternative-host-name-from-its-unescaped-version.patch b/package/avahi/0010-common-derive-alternative-host-name-from-its-unescaped-version.patch
new file mode 100644
index 0000000000..adb6d95bf8
--- /dev/null
+++ b/package/avahi/0010-common-derive-alternative-host-name-from-its-unescaped-version.patch
@@ -0,0 +1,106 @@
+From b448c9f771bada14ae8de175695a9729f8646797 Mon Sep 17 00:00:00 2001
+From: Michal Sekletar <msekleta@redhat.com>
+Date: Wed, 11 Oct 2023 17:45:44 +0200
+Subject: [PATCH] common: derive alternative host name from its unescaped
+ version
+
+Normalization of input makes sure we don't have to deal with special
+cases like unescaped dot at the end of label.
+
+Fixes #451 #487
+CVE: CVE-2023-38473
+Upstream: https://github.com/avahi/avahi/commit/b448c9f771bada14ae8de175695a9729f8646797
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ avahi-common/alternative-test.c |  3 +++
+ avahi-common/alternative.c      | 27 +++++++++++++++++++--------
+ 2 files changed, 22 insertions(+), 8 deletions(-)
+
+diff --git a/avahi-common/alternative-test.c b/avahi-common/alternative-test.c
+index 9255435ec..681fc15b8 100644
+--- a/avahi-common/alternative-test.c
++++ b/avahi-common/alternative-test.c
+@@ -31,6 +31,9 @@ int main(AVAHI_GCC_UNUSED int argc, AVAHI_GCC_UNUSED char *argv[]) {
+     const char* const test_strings[] = {
+         "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX",
+         "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXüüüüüüü",
++        ").",
++        "\\.",
++        "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\\\\",
+         "gurke",
+         "-",
+         " #",
+diff --git a/avahi-common/alternative.c b/avahi-common/alternative.c
+index b3d39f0ed..a094e6d76 100644
+--- a/avahi-common/alternative.c
++++ b/avahi-common/alternative.c
+@@ -49,15 +49,20 @@ static void drop_incomplete_utf8(char *c) {
+ }
+ 
+ char *avahi_alternative_host_name(const char *s) {
++    char label[AVAHI_LABEL_MAX], alternative[AVAHI_LABEL_MAX*4+1];
++    char *alt, *r, *ret;
+     const char *e;
+-    char *r;
++    size_t len;
+ 
+     assert(s);
+ 
+     if (!avahi_is_valid_host_name(s))
+         return NULL;
+ 
+-    if ((e = strrchr(s, '-'))) {
++    if (!avahi_unescape_label(&s, label, sizeof(label)))
++        return NULL;
++
++    if ((e = strrchr(label, '-'))) {
+         const char *p;
+ 
+         e++;
+@@ -74,19 +79,18 @@ char *avahi_alternative_host_name(const char *s) {
+ 
+     if (e) {
+         char *c, *m;
+-        size_t l;
+         int n;
+ 
+         n = atoi(e)+1;
+         if (!(m = avahi_strdup_printf("%i", n)))
+             return NULL;
+ 
+-        l = e-s-1;
++        len = e-label-1;
+ 
+-        if (l >= AVAHI_LABEL_MAX-1-strlen(m)-1)
+-            l = AVAHI_LABEL_MAX-1-strlen(m)-1;
++        if (len >= AVAHI_LABEL_MAX-1-strlen(m)-1)
++            len = AVAHI_LABEL_MAX-1-strlen(m)-1;
+ 
+-        if (!(c = avahi_strndup(s, l))) {
++        if (!(c = avahi_strndup(label, len))) {
+             avahi_free(m);
+             return NULL;
+         }
+@@ -100,7 +104,7 @@ char *avahi_alternative_host_name(const char *s) {
+     } else {
+         char *c;
+ 
+-        if (!(c = avahi_strndup(s, AVAHI_LABEL_MAX-1-2)))
++        if (!(c = avahi_strndup(label, AVAHI_LABEL_MAX-1-2)))
+             return NULL;
+ 
+         drop_incomplete_utf8(c);
+@@ -109,6 +113,13 @@ char *avahi_alternative_host_name(const char *s) {
+         avahi_free(c);
+     }
+ 
++    alt = alternative;
++    len = sizeof(alternative);
++    ret = avahi_escape_label(r, strlen(r), &alt, &len);
++
++    avahi_free(r);
++    r = avahi_strdup(ret);
++
+     assert(avahi_is_valid_host_name(r));
+ 
+     return r;
diff --git a/package/avahi/0011-properly-randomize-query-id-of-DNS-packets.patch b/package/avahi/0011-properly-randomize-query-id-of-DNS-packets.patch
new file mode 100644
index 0000000000..f85f6df595
--- /dev/null
+++ b/package/avahi/0011-properly-randomize-query-id-of-DNS-packets.patch
@@ -0,0 +1,102 @@
+From f8710bdc8b29ee1176fe3bfaeabebbda1b7a79f7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Petr=20Men=C5=A1=C3=ADk?= <pemensik@redhat.com>
+Date: Mon, 11 Nov 2024 00:56:09 +0100
+Subject: [PATCH] Properly randomize query id of DNS packets
+
+CVE: CVE-2024-52616
+Upstream: https://github.com/avahi/avahi/commit/f8710bdc8b29ee1176fe3bfaeabebbda1b7a79f7
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ avahi-core/wide-area.c | 36 ++++++++++++++++++++++++++++--------
+ configure.ac           |  3 ++-
+ 2 files changed, 30 insertions(+), 9 deletions(-)
+
+diff --git a/avahi-core/wide-area.c b/avahi-core/wide-area.c
+index 971f5e714..00a15056e 100644
+--- a/avahi-core/wide-area.c
++++ b/avahi-core/wide-area.c
+@@ -40,6 +40,13 @@
+ #include "addr-util.h"
+ #include "rr-util.h"
+ 
++#ifdef HAVE_SYS_RANDOM_H
++#include <sys/random.h>
++#endif
++#ifndef HAVE_GETRANDOM
++#  define getrandom(d, len, flags) (-1)
++#endif
++
+ #define CACHE_ENTRIES_MAX 500
+ 
+ typedef struct AvahiWideAreaCacheEntry AvahiWideAreaCacheEntry;
+@@ -84,8 +91,6 @@ struct AvahiWideAreaLookupEngine {
+     int fd_ipv4, fd_ipv6;
+     AvahiWatch *watch_ipv4, *watch_ipv6;
+ 
+-    uint16_t next_id;
+-
+     /* Cache */
+     AVAHI_LLIST_HEAD(AvahiWideAreaCacheEntry, cache);
+     AvahiHashmap *cache_by_key;
+@@ -201,6 +206,26 @@ static void sender_timeout_callback(AvahiTimeEvent *e, void *userdata) {
+     avahi_time_event_update(e, avahi_elapse_time(&tv, 1000, 0));
+ }
+ 
++static uint16_t get_random_uint16(void) {
++    uint16_t next_id;
++
++    if (getrandom(&next_id, sizeof(next_id), 0) == -1)
++        next_id = (uint16_t) rand();
++    return next_id;
++}
++
++static uint16_t avahi_wide_area_next_id(AvahiWideAreaLookupEngine *e) {
++    uint16_t next_id;
++
++    next_id = get_random_uint16();
++    while (find_lookup(e, next_id)) {
++        /* This ID is already used, get new. */
++        next_id = get_random_uint16();
++    }
++    return next_id;
++}
++
++
+ AvahiWideAreaLookup *avahi_wide_area_lookup_new(
+     AvahiWideAreaLookupEngine *e,
+     AvahiKey *key,
+@@ -227,11 +252,7 @@ AvahiWideAreaLookup *avahi_wide_area_lookup_new(
+     /* If more than 65K wide area quries are issued simultaneously,
+      * this will break. This should be limited by some higher level */
+ 
+-    for (;; e->next_id++)
+-        if (!find_lookup(e, e->next_id))
+-            break; /* This ID is not yet used. */
+-
+-    l->id = e->next_id++;
++    l->id = avahi_wide_area_next_id(e);
+ 
+     /* We keep the packet around in case we need to repeat our query */
+     l->packet = avahi_dns_packet_new(0);
+@@ -604,7 +625,6 @@ AvahiWideAreaLookupEngine *avahi_wide_area_engine_new(AvahiServer *s) {
+         e->watch_ipv6 = s->poll_api->watch_new(e->server->poll_api, e->fd_ipv6, AVAHI_WATCH_IN, socket_event, e);
+ 
+     e->n_dns_servers = e->current_dns_server = 0;
+-    e->next_id = (uint16_t) rand();
+ 
+     /* Initialize cache */
+     AVAHI_LLIST_HEAD_INIT(AvahiWideAreaCacheEntry, e->cache);
+diff --git a/configure.ac b/configure.ac
+index a3211b80e..31bce3d76 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -367,7 +367,8 @@ AC_FUNC_SELECT_ARGTYPES
+ # whether libc's malloc does too. (Same for realloc.)
+ #AC_FUNC_MALLOC
+ #AC_FUNC_REALLOC
+-AC_CHECK_FUNCS([gethostname memchr memmove memset mkdir select socket strchr strcspn strdup strerror strrchr strspn strstr uname setresuid setreuid setresgid setregid strcasecmp gettimeofday putenv strncasecmp strlcpy gethostbyname seteuid setegid setproctitle getprogname])
++AC_CHECK_FUNCS([gethostname memchr memmove memset mkdir select socket strchr strcspn strdup strerror strrchr strspn strstr uname setresuid setreuid setresgid setregid strcasecmp gettimeofday putenv strncasecmp strlcpy gethostbyname seteuid setegid setproctitle getprogname getrandom])
++AC_CHECK_HEADERS([sys/random.h])
+ 
+ AC_FUNC_CHOWN
+ AC_FUNC_STAT
diff --git a/package/avahi/0012-core-wide-area-fix-for-CVE-2024-52615.patch b/package/avahi/0012-core-wide-area-fix-for-CVE-2024-52615.patch
new file mode 100644
index 0000000000..bbb3ec32d2
--- /dev/null
+++ b/package/avahi/0012-core-wide-area-fix-for-CVE-2024-52615.patch
@@ -0,0 +1,227 @@
+From 4e2e1ea0908d7e6ad7f38ae04fdcdf2411f8b942 Mon Sep 17 00:00:00 2001
+From: Michal Sekletar <msekleta@redhat.com>
+Date: Wed, 27 Nov 2024 18:07:32 +0100
+Subject: [PATCH] core/wide-area: fix for CVE-2024-52615
+
+CVE: CVE-2024-52615
+Upstream: https://github.com/avahi/avahi/commit/4e2e1ea0908d7e6ad7f38ae04fdcdf2411f8b942
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ avahi-core/wide-area.c | 128 ++++++++++++++++++++++-------------------
+ 1 file changed, 69 insertions(+), 59 deletions(-)
+
+diff --git a/avahi-core/wide-area.c b/avahi-core/wide-area.c
+index 00a15056e..06df7afc6 100644
+--- a/avahi-core/wide-area.c
++++ b/avahi-core/wide-area.c
+@@ -81,6 +81,10 @@ struct AvahiWideAreaLookup {
+ 
+     AvahiAddress dns_server_used;
+ 
++    int fd;
++    AvahiWatch *watch;
++    AvahiProtocol proto;
++
+     AVAHI_LLIST_FIELDS(AvahiWideAreaLookup, lookups);
+     AVAHI_LLIST_FIELDS(AvahiWideAreaLookup, by_key);
+ };
+@@ -88,9 +92,6 @@ struct AvahiWideAreaLookup {
+ struct AvahiWideAreaLookupEngine {
+     AvahiServer *server;
+ 
+-    int fd_ipv4, fd_ipv6;
+-    AvahiWatch *watch_ipv4, *watch_ipv6;
+-
+     /* Cache */
+     AVAHI_LLIST_HEAD(AvahiWideAreaCacheEntry, cache);
+     AvahiHashmap *cache_by_key;
+@@ -125,35 +126,67 @@ static AvahiWideAreaLookup* find_lookup(AvahiWideAreaLookupEngine *e, uint16_t i
+     return l;
+ }
+ 
++static void socket_event(AVAHI_GCC_UNUSED AvahiWatch *w, int fd, AVAHI_GCC_UNUSED AvahiWatchEvent events, void *userdata);
++
+ static int send_to_dns_server(AvahiWideAreaLookup *l, AvahiDnsPacket *p) {
++    AvahiWideAreaLookupEngine *e;
+     AvahiAddress *a;
++    AvahiServer *s;
++    AvahiWatch *w;
++    int r;
+ 
+     assert(l);
+     assert(p);
+ 
+-    if (l->engine->n_dns_servers <= 0)
++    e = l->engine;
++    assert(e);
++
++    s = e->server;
++    assert(s);
++
++    if (e->n_dns_servers <= 0)
+         return -1;
+ 
+-    assert(l->engine->current_dns_server < l->engine->n_dns_servers);
++    assert(e->current_dns_server < e->n_dns_servers);
+ 
+-    a = &l->engine->dns_servers[l->engine->current_dns_server];
++    a = &e->dns_servers[e->current_dns_server];
+     l->dns_server_used = *a;
+ 
+-    if (a->proto == AVAHI_PROTO_INET) {
++    if (l->fd >= 0) {
++        /* We are reusing lookup object and sending packet to another server so let's cleanup before we establish connection to new server. */
++        s->poll_api->watch_free(l->watch);
++        l->watch = NULL;
+ 
+-        if (l->engine->fd_ipv4 < 0)
+-            return -1;
++        close(l->fd);
++        l->fd = -EBADF;
++    }
+ 
+-        return avahi_send_dns_packet_ipv4(l->engine->fd_ipv4, AVAHI_IF_UNSPEC, p, NULL, &a->data.ipv4, AVAHI_DNS_PORT);
++    assert(a->proto == AVAHI_PROTO_INET || a->proto == AVAHI_PROTO_INET6);
+ 
+-    } else {
+-        assert(a->proto == AVAHI_PROTO_INET6);
++    if (a->proto == AVAHI_PROTO_INET)
++        r = s->config.use_ipv4 ? avahi_open_unicast_socket_ipv4() : -1;
++    else
++        r = s->config.use_ipv6 ? avahi_open_unicast_socket_ipv6() : -1;
+ 
+-        if (l->engine->fd_ipv6 < 0)
+-            return -1;
++    if (r < 0) {
++        avahi_log_error(__FILE__ ": Failed to create socket for wide area lookup");
++        return -1;
++    }
+ 
+-        return avahi_send_dns_packet_ipv6(l->engine->fd_ipv6, AVAHI_IF_UNSPEC, p, NULL, &a->data.ipv6, AVAHI_DNS_PORT);
++    w = s->poll_api->watch_new(s->poll_api, r, AVAHI_WATCH_IN, socket_event, l);
++    if (!w) {
++        close(r);
++        avahi_log_error(__FILE__ ": Failed to create socket watch for wide area lookup");
++        return -1;
+     }
++
++    l->fd = r;
++    l->watch = w;
++    l->proto = a->proto;
++
++    return a->proto == AVAHI_PROTO_INET ?
++                avahi_send_dns_packet_ipv4(l->fd, AVAHI_IF_UNSPEC, p, NULL, &a->data.ipv4, AVAHI_DNS_PORT):
++                avahi_send_dns_packet_ipv6(l->fd, AVAHI_IF_UNSPEC, p, NULL, &a->data.ipv6, AVAHI_DNS_PORT);
+ }
+ 
+ static void next_dns_server(AvahiWideAreaLookupEngine *e) {
+@@ -246,6 +279,9 @@ AvahiWideAreaLookup *avahi_wide_area_lookup_new(
+     l->dead = 0;
+     l->key = avahi_key_ref(key);
+     l->cname_key = avahi_key_new_cname(l->key);
++    l->fd = -EBADF;
++    l->watch = NULL;
++    l->proto = AVAHI_PROTO_UNSPEC;
+     l->callback = callback;
+     l->userdata = userdata;
+ 
+@@ -314,6 +350,12 @@ static void lookup_destroy(AvahiWideAreaLookup *l) {
+     if (l->cname_key)
+         avahi_key_unref(l->cname_key);
+ 
++    if (l->watch)
++            l->engine->server->poll_api->watch_free(l->watch);
++
++    if (l->fd >= 0)
++        close(l->fd);
++
+     avahi_free(l);
+ }
+ 
+@@ -572,14 +614,20 @@ static void handle_packet(AvahiWideAreaLookupEngine *e, AvahiDnsPacket *p) {
+ }
+ 
+ static void socket_event(AVAHI_GCC_UNUSED AvahiWatch *w, int fd, AVAHI_GCC_UNUSED AvahiWatchEvent events, void *userdata) {
+-    AvahiWideAreaLookupEngine *e = userdata;
++    AvahiWideAreaLookup *l = userdata;
++    AvahiWideAreaLookupEngine *e = l->engine;
+     AvahiDnsPacket *p = NULL;
+ 
+-    if (fd == e->fd_ipv4)
+-        p = avahi_recv_dns_packet_ipv4(e->fd_ipv4, NULL, NULL, NULL, NULL, NULL);
++    assert(l);
++    assert(e);
++    assert(l->fd == fd);
++
++    if (l->proto == AVAHI_PROTO_INET)
++        p = avahi_recv_dns_packet_ipv4(l->fd, NULL, NULL, NULL, NULL, NULL);
+     else {
+-        assert(fd == e->fd_ipv6);
+-        p = avahi_recv_dns_packet_ipv6(e->fd_ipv6, NULL, NULL, NULL, NULL, NULL);
++        assert(l->proto == AVAHI_PROTO_INET6);
++
++        p = avahi_recv_dns_packet_ipv6(l->fd, NULL, NULL, NULL, NULL, NULL);
+     }
+ 
+     if (p) {
+@@ -598,32 +646,6 @@ AvahiWideAreaLookupEngine *avahi_wide_area_engine_new(AvahiServer *s) {
+     e->server = s;
+     e->cleanup_dead = 0;
+ 
+-    /* Create sockets */
+-    e->fd_ipv4 = s->config.use_ipv4 ? avahi_open_unicast_socket_ipv4() : -1;
+-    e->fd_ipv6 = s->config.use_ipv6 ? avahi_open_unicast_socket_ipv6() : -1;
+-
+-    if (e->fd_ipv4 < 0 && e->fd_ipv6 < 0) {
+-        avahi_log_error(__FILE__": Failed to create wide area sockets: %s", strerror(errno));
+-
+-        if (e->fd_ipv6 >= 0)
+-            close(e->fd_ipv6);
+-
+-        if (e->fd_ipv4 >= 0)
+-            close(e->fd_ipv4);
+-
+-        avahi_free(e);
+-        return NULL;
+-    }
+-
+-    /* Create watches */
+-
+-    e->watch_ipv4 = e->watch_ipv6 = NULL;
+-
+-    if (e->fd_ipv4 >= 0)
+-        e->watch_ipv4 = s->poll_api->watch_new(e->server->poll_api, e->fd_ipv4, AVAHI_WATCH_IN, socket_event, e);
+-    if (e->fd_ipv6 >= 0)
+-        e->watch_ipv6 = s->poll_api->watch_new(e->server->poll_api, e->fd_ipv6, AVAHI_WATCH_IN, socket_event, e);
+-
+     e->n_dns_servers = e->current_dns_server = 0;
+ 
+     /* Initialize cache */
+@@ -651,18 +673,6 @@ void avahi_wide_area_engine_free(AvahiWideAreaLookupEngine *e) {
+     avahi_hashmap_free(e->lookups_by_id);
+     avahi_hashmap_free(e->lookups_by_key);
+ 
+-    if (e->watch_ipv4)
+-        e->server->poll_api->watch_free(e->watch_ipv4);
+-
+-    if (e->watch_ipv6)
+-        e->server->poll_api->watch_free(e->watch_ipv6);
+-
+-    if (e->fd_ipv6 >= 0)
+-        close(e->fd_ipv6);
+-
+-    if (e->fd_ipv4 >= 0)
+-        close(e->fd_ipv4);
+-
+     avahi_free(e);
+ }
+ 
+@@ -680,7 +690,7 @@ void avahi_wide_area_set_servers(AvahiWideAreaLookupEngine *e, const AvahiAddres
+ 
+     if (a) {
+         for (e->n_dns_servers = 0; n > 0 && e->n_dns_servers < AVAHI_WIDE_AREA_SERVERS_MAX; a++, n--)
+-            if ((a->proto == AVAHI_PROTO_INET && e->fd_ipv4 >= 0) || (a->proto == AVAHI_PROTO_INET6 && e->fd_ipv6 >= 0))
++            if (a->proto == AVAHI_PROTO_INET || a->proto == AVAHI_PROTO_INET6)
+                 e->dns_servers[e->n_dns_servers++] = *a;
+     } else {
+         assert(n == 0);
diff --git a/package/avahi/0013-core-refuse-to-create-wide-area-record-browsers-when-wide-area-is-off.patch b/package/avahi/0013-core-refuse-to-create-wide-area-record-browsers-when-wide-area-is-off.patch
new file mode 100644
index 0000000000..c8f9b704cb
--- /dev/null
+++ b/package/avahi/0013-core-refuse-to-create-wide-area-record-browsers-when-wide-area-is-off.patch
@@ -0,0 +1,64 @@
+From 2d48e42d44a183f26a4d12d1f5d41abb9b7c6355 Mon Sep 17 00:00:00 2001
+From: Evgeny Vereshchagin <evvers@ya.ru>
+Date: Wed, 17 Dec 2025 08:11:23 +0000
+Subject: [PATCH] core: refuse to create wide-area record browsers when
+ wide-area is off
+
+It fixes a bug where it was possible for unprivileged local users to
+crash avahi-daemon (with wide-area disabled) by creating record browsers
+with the AVAHI_LOOKUP_USE_WIDE_AREA flag set via D-Bus (either by calling
+the RecordBrowserNew method directly or by creating hostname/address/service
+resolvers/browsers that create those browsers internally themselves).
+
+```
+$ gdbus call --system --dest org.freedesktop.Avahi --object-path / --method org.freedesktop.Avahi.Server.ResolveHostName -- -1 -1 yo.local -1 1
+Error: GDBus.Error:org.freedesktop.DBus.Error.NoReply: Message recipient disconnected from message bus without replying
+```
+```
+dbus-protocol.c: interface=org.freedesktop.Avahi.Server, path=/, member=ResolveHostName
+avahi-daemon: wide-area.c:725: avahi_wide_area_scan_cache: Assertion `e' failed.
+==307948==
+==307948== Process terminating with default action of signal 6 (SIGABRT)
+==307948==    at 0x4B3630C: __pthread_kill_implementation (pthread_kill.c:44)
+==307948==    by 0x4ADF921: raise (raise.c:26)
+==307948==    by 0x4AC74AB: abort (abort.c:77)
+==307948==    by 0x4AC741F: __assert_fail_base.cold (assert.c:118)
+==307948==    by 0x48D8B85: avahi_wide_area_scan_cache (wide-area.c:725)
+==307948==    by 0x48C8953: lookup_scan_cache (browse.c:351)
+==307948==    by 0x48C8B1B: lookup_go (browse.c:386)
+==307948==    by 0x48C9148: defer_callback (browse.c:516)
+==307948==    by 0x48AEA0E: expiration_event (timeeventq.c:94)
+==307948==    by 0x489D3AE: timeout_callback (simple-watch.c:447)
+==307948==    by 0x489D787: avahi_simple_poll_dispatch (simple-watch.c:563)
+==307948==    by 0x489D91E: avahi_simple_poll_iterate (simple-watch.c:605)
+==307948==
+```
+
+wide-area has been disabled by default since
+9c4214146738146e454f098264690e8e884c39bd (v0.9-rc2).
+
+https://github.com/avahi/avahi/security/advisories/GHSA-mhf3-865v-g5rc
+
+CVE: CVE-2025-68276
+Upstream: https://github.com/avahi/avahi/commit/2d48e42d44a183f26a4d12d1f5d41abb9b7c6355
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ avahi-core/browse.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/avahi-core/browse.c b/avahi-core/browse.c
+index 0afeba7d4..d7d541bde 100644
+--- a/avahi-core/browse.c
++++ b/avahi-core/browse.c
+@@ -583,6 +583,11 @@ AvahiSRecordBrowser *avahi_s_record_browser_prepare(
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(server, AVAHI_FLAGS_VALID(flags, AVAHI_LOOKUP_USE_WIDE_AREA|AVAHI_LOOKUP_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
+     AVAHI_CHECK_VALIDITY_RETURN_NULL(server, !(flags & AVAHI_LOOKUP_USE_WIDE_AREA) || !(flags & AVAHI_LOOKUP_USE_MULTICAST), AVAHI_ERR_INVALID_FLAGS);
+ 
++    if ((flags & AVAHI_LOOKUP_USE_WIDE_AREA) && !server->wide_area_lookup_engine) {
++        avahi_server_set_errno(server, AVAHI_ERR_NOT_SUPPORTED);
++        return NULL;
++    }
++
+     if (!(b = avahi_new(AvahiSRecordBrowser, 1))) {
+         avahi_server_set_errno(server, AVAHI_ERR_NO_MEMORY);
+         return NULL;
diff --git a/package/avahi/0014-core-fix-DoS-bug-by-removing-incorrect-assertion.patch b/package/avahi/0014-core-fix-DoS-bug-by-removing-incorrect-assertion.patch
new file mode 100644
index 0000000000..e0fffbc96e
--- /dev/null
+++ b/package/avahi/0014-core-fix-DoS-bug-by-removing-incorrect-assertion.patch
@@ -0,0 +1,26 @@
+From f66be13d7f31a3ef806d226bf8b67240179d309a Mon Sep 17 00:00:00 2001
+From: Hugo Muis <198191869+friendlyhugo@users.noreply.github.com>
+Date: Sun, 2 Mar 2025 18:06:24 +0100
+Subject: [PATCH] core: fix DoS bug by removing incorrect assertion
+
+Closes https://github.com/avahi/avahi/issues/683
+
+CVE: CVE-2025-68468
+Upstream: https://github.com/avahi/avahi/commit/f66be13d7f31a3ef806d226bf8b67240179d309a
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ avahi-core/browse.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/avahi-core/browse.c b/avahi-core/browse.c
+index e00cbed84..0afeba7d4 100644
+--- a/avahi-core/browse.c
++++ b/avahi-core/browse.c
+@@ -295,7 +295,6 @@ static void lookup_multicast_callback(
+                 lookup_drop_cname(l, interface, protocol, 0, r);
+             else {
+                 /* It's a normal record, so let's call the user callback */
+-                assert(avahi_key_equal(b->key, l->key));
+ 
+                 b->callback(b, interface, protocol, event, r, flags, b->userdata);
+             }
diff --git a/package/avahi/0015-core-fix-DoS-bug-by-changing-assert-to-return.patch b/package/avahi/0015-core-fix-DoS-bug-by-changing-assert-to-return.patch
new file mode 100644
index 0000000000..fc80ee1ab7
--- /dev/null
+++ b/package/avahi/0015-core-fix-DoS-bug-by-changing-assert-to-return.patch
@@ -0,0 +1,30 @@
+From 9c6eb53bf2e290aed84b1f207e3ce35c54cc0aa1 Mon Sep 17 00:00:00 2001
+From: Hugo Muis <198191869+friendlyhugo@users.noreply.github.com>
+Date: Sun, 2 Mar 2025 18:06:24 +0100
+Subject: [PATCH] core: fix DoS bug by changing assert to return
+
+Closes https://github.com/avahi/avahi/issues/678
+
+CVE: CVE-2025-68471
+Upstream: https://github.com/avahi/avahi/commit/9c6eb53bf2e290aed84b1f207e3ce35c54cc0aa1
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ avahi-core/browse.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/avahi-core/browse.c b/avahi-core/browse.c
+index e8a915e97..ad08bd65f 100644
+--- a/avahi-core/browse.c
++++ b/avahi-core/browse.c
+@@ -320,7 +320,10 @@ static int lookup_start(AvahiSRBLookup *l) {
+     assert(l);
+ 
+     assert(!(l->flags & AVAHI_LOOKUP_USE_WIDE_AREA) != !(l->flags & AVAHI_LOOKUP_USE_MULTICAST));
+-    assert(!l->wide_area && !l->multicast);
++    if (l->wide_area || l->multicast) {
++        /* Avoid starting a duplicate lookup */
++        return 0;
++    }
+ 
+     if (l->flags & AVAHI_LOOKUP_USE_WIDE_AREA) {
+ 
diff --git a/package/avahi/0016-core-fix-uncontrolled-recursion-bug-using-a-simple-loop-detection-algorithm.patch b/package/avahi/0016-core-fix-uncontrolled-recursion-bug-using-a-simple-loop-detection-algorithm.patch
new file mode 100644
index 0000000000..c2c3a5dd3d
--- /dev/null
+++ b/package/avahi/0016-core-fix-uncontrolled-recursion-bug-using-a-simple-loop-detection-algorithm.patch
@@ -0,0 +1,73 @@
+From 78eab31128479f06e30beb8c1cbf99dd921e2524 Mon Sep 17 00:00:00 2001
+From: Hugo Muis <198191869+friendlyhugo@users.noreply.github.com>
+Date: Sun, 2 Mar 2025 18:06:24 +0100
+Subject: [PATCH] core: fix uncontrolled recursion bug using a simple loop
+ detection algorithm
+
+Closes https://github.com/avahi/avahi/issues/501
+
+CVE: CVE-2026-24401
+Upstream: https://github.com/avahi/avahi/commit/78eab31128479f06e30beb8c1cbf99dd921e2524
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ avahi-core/browse.c | 40 ++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 40 insertions(+)
+
+diff --git a/avahi-core/browse.c b/avahi-core/browse.c
+index ad08bd65f..e00cbed84 100644
+--- a/avahi-core/browse.c
++++ b/avahi-core/browse.c
+@@ -401,6 +401,40 @@ static int lookup_go(AvahiSRBLookup *l) {
+     return n;
+ }
+ 
++static int lookup_exists_in_path(AvahiSRBLookup* lookup, AvahiSRBLookup* from, AvahiSRBLookup* to) {
++    AvahiRList* rl;
++    if (from == to)
++        return 0;
++    for (rl = from->cname_lookups; rl; rl = rl->rlist_next) {
++        int r = lookup_exists_in_path(lookup, rl->data, to);
++        if (r == 1) {
++            /* loop detected, propagate result */
++            return r;
++        } else if (r == 0) {
++            /* is loop detected? */
++            return lookup == from;
++        } else {
++	        /* `to` not found, continue */
++            continue;
++        }
++    }
++    /* no path found */
++    return -1;
++}
++
++static int cname_would_create_loop(AvahiSRBLookup* l, AvahiSRBLookup* n) {
++    int ret;
++    if (l == n)
++        /* Loop to self */
++        return 1;
++
++    ret = lookup_exists_in_path(n, l->record_browser->root_lookup, l);
++
++    /* Path to n always exists */
++    assert(ret != -1);
++    return ret;
++}
++
+ static void lookup_handle_cname(AvahiSRBLookup *l, AvahiIfIndex interface, AvahiProtocol protocol, AvahiLookupFlags flags, AvahiRecord *r) {
+     AvahiKey *k;
+     AvahiSRBLookup *n;
+@@ -420,6 +454,12 @@ static void lookup_handle_cname(AvahiSRBLookup *l, AvahiIfIndex interface, Avahi
+         return;
+     }
+ 
++    if (cname_would_create_loop(l, n)) {
++        /* CNAME loops are not allowed */
++        lookup_unref(n);
++        return;
++    }
++
+     l->cname_lookups = avahi_rlist_prepend(l->cname_lookups, lookup_ref(n));
+ 
+     lookup_go(n);
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index 9074b374f6..bcba0a0a4f 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -12,6 +12,9 @@ AVAHI_CPE_ID_VENDOR = avahi
 AVAHI_SELINUX_MODULES = avahi
 AVAHI_INSTALL_STAGING = YES
 
+# 0011-properly-randomize-query-id-of-DNS-packets.patch
+AVAHI_AUTORECONF = YES
+
 # CVE-2021-26720 is an issue in avahi-daemon-check-dns.sh, which is
 # part of the Debian packaging and not part of upstream avahi
 AVAHI_IGNORE_CVES += CVE-2021-26720
@@ -19,6 +22,44 @@ AVAHI_IGNORE_CVES += CVE-2021-26720
 # 0001-Fix-NULL-pointer-crashes-from-175.patch
 AVAHI_IGNORE_CVES += CVE-2021-36217
 
+# 0003-avoid-infinite-loop-in-avahi-daemon-by-handling-hup-event-in-client-work.patch
+AVAHI_IGNORE_CVES += CVE-2021-3468
+
+# 0004-core-reject-overly-long-txt-resource-records.patch
+AVAHI_IGNORE_CVES += CVE-2023-38469
+
+# 0005-ensure-each-label-is-at-least-one-byte-long.patch
+# 0006-common-bail-out-when-escaped-labels-can-t-fit-into-ret.patch
+AVAHI_IGNORE_CVES += CVE-2023-38470
+
+# 0007-core-extract-host-name-using-avahi-unescape-label.patch
+# 0008-core-return-errors-from-avahi-server-set-host-name-properly.patch
+AVAHI_IGNORE_CVES += CVE-2023-38471
+
+# 0009-core-make-sure-there-is-rdata-to-process-before-parsing-it.patch
+AVAHI_IGNORE_CVES += CVE-2023-38472
+
+# 0010-common-derive-alternative-host-name-from-its-unescaped-version.patch
+AVAHI_IGNORE_CVES += CVE-2023-38473
+
+# 0011-properly-randomize-query-id-of-DNS-packets.patch
+AVAHI_IGNORE_CVES += CVE-2024-52616
+
+# 0012-core-wide-area-fix-for-CVE-2024-52615.patch
+AVAHI_IGNORE_CVES += CVE-2024-52615
+
+# 0013-core-refuse-to-create-wide-area-record-browsers-when-wide-area-is-off.patch
+AVAHI_IGNORE_CVES += CVE-2025-68276
+
+# 0014-core-fix-DoS-bug-by-removing-incorrect-assertion.patch
+AVAHI_IGNORE_CVES += CVE-2025-68468
+
+# 0015-core-fix-DoS-bug-by-changing-assert-to-return.patch
+AVAHI_IGNORE_CVES += CVE-2025-68471
+
+# 0016-core-fix-uncontrolled-recursion-bug-using-a-simple-loop-detection-algorithm.patch
+AVAHI_IGNORE_CVES += CVE-2026-24401
+
 AVAHI_CONF_ENV = \
 	avahi_cv_sys_cxx_works=yes \
 	DATADIRNAME=share

--===============0375415038199677554==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0375415038199677554==--
