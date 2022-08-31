Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADAA8ECAAD4
	for <buildroot@archiver.kernel.org>; Wed, 31 Aug 2022 15:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BAE482FCE;
	Wed, 31 Aug 2022 15:16:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BAE482FCE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V1TK1fM3PRRW; Wed, 31 Aug 2022 15:16:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10B5B82FA5;
	Wed, 31 Aug 2022 15:16:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10B5B82FA5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A77241BF41A
 for <buildroot@lists.busybox.net>; Wed, 31 Aug 2022 15:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82390610EC
 for <buildroot@lists.busybox.net>; Wed, 31 Aug 2022 15:16:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82390610EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SYFy02k38r6m for <buildroot@lists.busybox.net>;
 Wed, 31 Aug 2022 15:16:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59055610E6
 for <buildroot@uclibc.org>; Wed, 31 Aug 2022 15:16:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59055610E6
Received: by busybox.osuosl.org (Postfix, from userid 81)
 id 65A8C87A83; Wed, 31 Aug 2022 15:01:14 +0000 (UTC)
From: bugzilla@busybox.net
To: buildroot@uclibc.org
Date: Wed, 31 Aug 2022 15:16:20 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: buildroot
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2022.02.4
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dmrauh@posteo.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P5
X-Bugzilla-Assigned-To: unassigned@buildroot.uclibc.org
X-Bugzilla-Target-Milestone: ---
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-14981-163-WOhq6snShc@https.bugs.busybox.net/>
In-Reply-To: <bug-14981-163@https.bugs.busybox.net/>
References: <bug-14981-163@https.bugs.busybox.net/>
X-Bugzilla-URL: https://bugs.busybox.net/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Subject: [Buildroot] [Bug 14981] package/qt5/qt5webengine: build fails with
 undefined reference to `icu_70::Unicode ...
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://bugs.busybox.net/show_bug.cgi?id=14981

--- Comment #1 from Dominik Michael Rauh <dmrauh@posteo.de> ---
When building qt5webengine on Buildroot 2022.02.04, the builds fails with the
linker errors at the end of the bug report.

This is probably because on my system "icu" version 71 is installed and
"-L/usr/lib" comes before "-L/home/rauhdomi/Code/output/host/lib" that contains
Buildroot's "host-icu" with version 70.

I have confirmed my hypothesis by running the failing command manually with
"-L/home/rauhdomi/Code/output/host/lib" coming first, the error was gone.

This bug is related to Bug 14931
(https://bugs.busybox.net/show_bug.cgi?id=14931), where those
"GN_HOST_EXTRA_LDFLAGS" have been introduced.

Looking forward too your comments!

Dominik

[82/15365] LINK v8_snapshot/gen-regexp-special-case
FAILED: v8_snapshot/gen-regexp-special-case
/home/rauhdomi/Code/output/build/qt5webengine-5.15.8/host-bin/python
"../../3rdparty/chromium/build/toolchain/gcc_link_wrapper.py"
--output="v8_snapshot/gen-regexp-special-case" -- /usr/bin/g++ -pie
-Wl,--fatal-warnings -Wl,--build-id=sha1 -fPIC -Wl,-z,noexecstack -Wl,-z,relro
-Wl,-z,now -Wl,-z,defs -Wl,--as-needed -m64 -pie -Wl,--disable-new-dtags
-Wl,-O2 -Wl,--gc-sections -L/usr/lib -L/home/rauhdomi/Code/output/host/lib
-Wl,-rpath,/home/rauhdomi/Code/output/host/lib -o
"v8_snapshot/gen-regexp-special-case" -Wl,--start-group
@"v8_snapshot/gen-regexp-special-case.rsp"  -Wl,--end-group  -ldl -lpthread
-lrt -licui18n -licuuc -licudata
/usr/bin/ld:
v8_snapshot/obj/v8/gen-regexp-special-case/gen-regexp-special-case.o: in
function `v8::internal::PrintSet(std::basic_ofstream<char,
std::char_traits<char> >&, char const*, icu_70::UnicodeSet const&)':
gen-regexp-special-case.cc:(.text._ZN2v88internal8PrintSetERSt14basic_ofstreamIcSt11char_traitsIcEEPKcRKN6icu_7010UnicodeSetE+0x8b):
undefined reference to `icu_70::UnicodeSet::getRangeStart(int) const'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal8PrintSetERSt14basic_ofstreamIcSt11char_traitsIcEEPKcRKN6icu_7010UnicodeSetE+0xb6):
undefined reference to `icu_70::UnicodeSet::getRangeEnd(int) const'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal8PrintSetERSt14basic_ofstreamIcSt11char_traitsIcEEPKcRKN6icu_7010UnicodeSetE+0xdf):
undefined reference to `icu_70::UnicodeSet::getRangeCount() const'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal8PrintSetERSt14basic_ofstreamIcSt11char_traitsIcEEPKcRKN6icu_7010UnicodeSetE+0xed):
undefined reference to `icu_70::UnicodeSet::getRangeStart(int) const'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal8PrintSetERSt14basic_ofstreamIcSt11char_traitsIcEEPKcRKN6icu_7010UnicodeSetE+0xfa):
undefined reference to `icu_70::UnicodeSet::getRangeEnd(int) const'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal8PrintSetERSt14basic_ofstreamIcSt11char_traitsIcEEPKcRKN6icu_7010UnicodeSetE+0x121):
undefined reference to `icu_70::UnicodeSet::getRangeStart(int) const'
/usr/bin/ld:
v8_snapshot/obj/v8/gen-regexp-special-case/gen-regexp-special-case.o: in
function `v8::internal::PrintSpecial(std::basic_ofstream<char,
std::char_traits<char> >&)':
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x30):
undefined reference to `icu_70::UnicodeSet::UnicodeSet()'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x46):
undefined reference to `icu_70::UnicodeSet::UnicodeSet()'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x5c):
undefined reference to `icu_70::UnicodeSet::UnicodeSet()'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x75):
undefined reference to `icu_70::UnicodeString::UnicodeString(char const*)'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x87):
undefined reference to `icu_70::UnicodeSet::UnicodeSet(icu_70::UnicodeString
const&, UErrorCode&)'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x8f):
undefined reference to `icu_70::UnicodeString::~UnicodeString()'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0xd5):
undefined reference to `icu_70::UnicodeSet::set(int, int)'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0xe2):
undefined reference to `icu_70::UnicodeSet::closeOver(int)'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0xed):
undefined reference to `icu_70::UnicodeString::UnicodeString(int)'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0xf5):
undefined reference to `icu_70::UnicodeString::toUpper()'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x123):
undefined reference to `icu_70::UnicodeString::~UnicodeString()'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x140):
undefined reference to `icu_70::UnicodeSet::getRangeCount() const'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x152):
undefined reference to `icu_70::UnicodeSet::getRangeStart(int) const'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x17b):
undefined reference to `icu_70::UnicodeString::~UnicodeString()'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x1ba):
undefined reference to `icu_70::UnicodeSet::getRangeEnd(int) const'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x1dc):
undefined reference to `icu_70::UnicodeString::UnicodeString(int)'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x1e4):
undefined reference to `icu_70::UnicodeString::toUpper()'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x207):
undefined reference to `icu_70::UnicodeString::char32At(int) const'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x237):
undefined reference to `icu_70::UnicodeSet::getRangeCount() const'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x26b):
undefined reference to `icu_70::UnicodeSet::add(int)'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x2a7):
undefined reference to `icu_70::UnicodeSet::getRangeCount() const'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x2c3):
undefined reference to `icu_70::UnicodeSet::getRangeStart(int) const'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x2db):
undefined reference to `icu_70::UnicodeSet::getRangeEnd(int) const'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x2ff):
undefined reference to `icu_70::UnicodeString::UnicodeString(int)'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x307):
undefined reference to `icu_70::UnicodeString::toUpper()'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x33c):
undefined reference to `icu_70::UnicodeString::~UnicodeString()'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x34c):
undefined reference to `icu_70::UnicodeSet::set(int, int)'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x359):
undefined reference to `icu_70::UnicodeSet::closeOver(int)'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x368):
undefined reference to `icu_70::UnicodeSet::removeAll(icu_70::UnicodeSet
const&)'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x370):
undefined reference to `icu_70::UnicodeSet::getRangeCount() const'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x384):
undefined reference to `icu_70::UnicodeSet::getRangeStart(int) const'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x391):
undefined reference to `icu_70::UnicodeSet::getRangeEnd(int) const'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x3a7):
undefined reference to `icu_70::UnicodeString::UnicodeString(int)'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x3af):
undefined reference to `icu_70::UnicodeString::toUpper()'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x3d7):
undefined reference to `icu_70::UnicodeString::~UnicodeString()'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x3ee):
undefined reference to `icu_70::UnicodeSet::getRangeEnd(int) const'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x422):
undefined reference to `icu_70::UnicodeString::char32At(int) const'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x44c):
undefined reference to `icu_70::UnicodeSet::add(int)'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x463):
undefined reference to `icu_70::UnicodeString::char32At(int) const'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x48c):
undefined reference to `icu_70::UnicodeString::char32At(int) const'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x50d):
undefined reference to `icu_70::UnicodeSet::~UnicodeSet()'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x515):
undefined reference to `icu_70::UnicodeSet::~UnicodeSet()'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x51d):
undefined reference to `icu_70::UnicodeSet::~UnicodeSet()'
/usr/bin/ld:
gen-regexp-special-case.cc:(.text._ZN2v88internal12PrintSpecialERSt14basic_ofstreamIcSt11char_traitsIcEE+0x525):
undefined reference to `icu_70::UnicodeSet::~UnicodeSet()'
collect2: error: ld returned 1 exit status

-- 
You are receiving this mail because:
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
