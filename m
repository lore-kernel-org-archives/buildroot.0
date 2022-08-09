Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1613C19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 08:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AE8360C17;
	Tue,  9 Aug 2022 08:00:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AE8360C17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gcbIEqafYcaN; Tue,  9 Aug 2022 08:00:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71BA460644;
	Tue,  9 Aug 2022 08:00:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71BA460644
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6B8681BF27E
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 07:57:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 470F5818A7
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 07:57:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 470F5818A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T4zG_rTTzI9W for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 07:57:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65D08818A2
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 65D08818A2
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 07:57:37 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id dc19so20741120ejb.12
 for <buildroot@buildroot.org>; Tue, 09 Aug 2022 00:57:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=EOBi6gXGKtWtcMwf0DLUc2VTG4Y27HfhAC65oxt9crI=;
 b=R/Rq5tgyCIvSK84v0Z+muQGf5tvDFGqOZLePdqYFYq/lQyCLoRygE3pKcFgMUEEuyc
 T9XdhmtPJZ5BoN+mg7QHGaZXBCQRF05uGFXY15TtLcZ369T8DiJBZRtLzMzWMLU9x67I
 P1HkRSXdkcu6yb6o7Y2CjLsbg69NSEc1h2d2ub1eQIe2mUIBhP51FxnKFAvd8RLm+eAu
 rAwb08MF5GGglDan4dt6N0hTKxhIPXYZzgRsuySgyvLrJm0JNiE13FKD88urjayfSf7f
 dAnS9HPL19t4WXt8RqrXnZCndhf/yN8oBqjogvP/+ZozWor+E7hQQqmWQIWaFpM7rAQg
 bWKw==
X-Gm-Message-State: ACgBeo2RMbPIHT0G4yLclQHua+/QIuabuHmiaYCqEyvJke+g+WQy+MrL
 RKCn5aTMUZmObyNuz7m+rivRcTRJl+o=
X-Google-Smtp-Source: AA6agR7cL52bnXIP97mE6zVnGGa05VeEIq9fd5b5YuN51C0zzZY1NuoFJB8f6gZQp1mItQmr9bqs3A==
X-Received: by 2002:a17:906:cc50:b0:730:b5fd:89cf with SMTP id
 mm16-20020a170906cc5000b00730b5fd89cfmr16361384ejb.221.1660031855345; 
 Tue, 09 Aug 2022 00:57:35 -0700 (PDT)
Received: from mercury.. ([188.27.130.4]) by smtp.gmail.com with ESMTPSA id
 pk9-20020a170906d7a900b0073065767404sm819341ejb.34.2022.08.09.00.57.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 00:57:34 -0700 (PDT)
From: Alexandru Ardelean <ardeleanalex@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Aug 2022 10:57:03 +0300
Message-Id: <20220809075704.86472-13-ardeleanalex@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220809075704.86472-1-ardeleanalex@gmail.com>
References: <20220809075704.86472-1-ardeleanalex@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=EOBi6gXGKtWtcMwf0DLUc2VTG4Y27HfhAC65oxt9crI=;
 b=le8EMem7d/rramxTZl6cM5Su3dKQ+QSx2ErrDQFvP3PvQvyL07Qcvt+TbseLp16cmy
 PkJCZrbJoQbHePXwAVcoZ6ZjR9oy9GZ2E4p+01UsNd2ab2RmyErzHHSqiZgnWwovI6S1
 n3ZX1087MJfuoOt/jQ0jdKgRrHf1WTFjO5mvUsmsd8BFKT+gli7jLl6sZmBfetLS81tn
 HaQy0I/2ckpM0g+P1i6EHV6KoREb4veiPsMT7eMCh7iDWAc1BhR7q7KdC+QQw4URaIsD
 SifcyQIcWvpDl551NBfJ7L/jXPv4l7jonXNEVXgOLim9cB4wrw9QZ3a51+mWepINNXft
 OhWQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=le8EMem7
Subject: [Buildroot] [PATCH 12/13] package/nodejs: add a hack to
 cross-compile 32-bit targets on x64 hosts
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
Cc: Alexandru Ardelean <ardeleanalex@gmail.com>, fontaine.fabrice@gmail.com,
 aduskett@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When gcc is run with -m32, the IA32 assembler doesn't understand 64-bit
assembly.

What happens is, that the bi-arch stuff won't seem to select the ia32
assembly-code when cross-building for a 32 bit target.
It will try to build the host-tools with 'gcc -m32', but it still will try
to compile the x64 assembly push_registers.

This patch adds a 'ARCH_IS_32BIT' #define along side the -m32 flag and will
select the code in the x64 push_registers assembly file. The undesired part
is that we'll need to copy+paste the assembly code into the x64 file.

Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
---
 ...-x64-cross-compile-for-32-bit-target.patch | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 package/nodejs/0003-fix-host-x64-cross-compile-for-32-bit-target.patch

diff --git a/package/nodejs/0003-fix-host-x64-cross-compile-for-32-bit-target.patch b/package/nodejs/0003-fix-host-x64-cross-compile-for-32-bit-target.patch
new file mode 100644
index 0000000000..533105ec22
--- /dev/null
+++ b/package/nodejs/0003-fix-host-x64-cross-compile-for-32-bit-target.patch
@@ -0,0 +1,71 @@
+diff --git a/deps/v8/src/heap/base/asm/x64/push_registers_asm.cc b/deps/v8/src/heap/base/asm/x64/push_registers_asm.cc
+index 9780b877..bffc8516 100644
+--- a/deps/v8/src/heap/base/asm/x64/push_registers_asm.cc
++++ b/deps/v8/src/heap/base/asm/x64/push_registers_asm.cc
+@@ -16,6 +16,45 @@
+ // GN toolchain (e.g. ChromeOS) and not provide them.
+ // _WIN64 Defined as 1 when the compilation target is 64-bit ARM or x64.
+ // Otherwise, undefined.
++#ifdef ARCH_IS_32BIT
++// stuff copied from 'deps/v8/src/heap/base/asm/ia32/push_registers_asm.cc'
++
++asm(
++#ifdef _WIN32
++    ".globl _PushAllRegistersAndIterateStack            \n"
++    "_PushAllRegistersAndIterateStack:                  \n"
++#else   // !_WIN32
++    ".globl PushAllRegistersAndIterateStack             \n"
++    ".type PushAllRegistersAndIterateStack, %function   \n"
++    ".hidden PushAllRegistersAndIterateStack            \n"
++    "PushAllRegistersAndIterateStack:                   \n"
++#endif  // !_WIN32
++    // [ IterateStackCallback ]
++    // [ StackVisitor*        ]
++    // [ Stack*               ]
++    // [ ret                  ]
++    // ebp is callee-saved. Maintain proper frame pointer for debugging.
++    "  push %ebp                                        \n"
++    "  movl %esp, %ebp                                  \n"
++    "  push %ebx                                        \n"
++    "  push %esi                                        \n"
++    "  push %edi                                        \n"
++    // Save 3rd parameter (IterateStackCallback).
++    "  movl 28(%esp), %ecx                              \n"
++    // Pass 3rd parameter as esp (stack pointer).
++    "  push %esp                                        \n"
++    // Pass 2nd parameter (StackVisitor*).
++    "  push 28(%esp)                                    \n"
++    // Pass 1st parameter (Stack*).
++    "  push 28(%esp)                                    \n"
++    "  call *%ecx                                       \n"
++    // Pop the callee-saved registers.
++    "  addl $24, %esp                                   \n"
++    // Restore rbp as it was used as frame pointer.
++    "  pop %ebp                                         \n"
++    "  ret                                              \n");
++#else
++
+ #ifdef _WIN64
+ 
+ // We maintain 16-byte alignment at calls. There is an 8-byte return address
+@@ -104,3 +143,5 @@ asm(
+     "  ret                                              \n");
+ 
+ #endif  // !_WIN64
++
++#endif // ! ARCH_IS_32BIT
+diff --git a/tools/v8_gypfiles/toolchain.gypi b/tools/v8_gypfiles/toolchain.gypi
+index ecbd63b5..0dfda084 100644
+--- a/tools/v8_gypfiles/toolchain.gypi
++++ b/tools/v8_gypfiles/toolchain.gypi
+@@ -1034,8 +1034,8 @@
+                     'cflags': [ '-m31' ],
+                     'ldflags': [ '-m31' ]
+                   },{
+-                   'cflags': [ '-m32' ],
+-                   'ldflags': [ '-m32' ]
++                   'cflags': [ '-m32', '-DARCH_IS_32BIT' ],
++                   'ldflags': [ '-m32', '-DARCH_IS_32BIT' ]
+                   }],
+                 ],
+               }],
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
