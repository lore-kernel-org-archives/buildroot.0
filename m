Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71084F8924C
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 10:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDC6F83E65;
	Tue, 21 Apr 2026 10:28:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gdIG7bp3OLSQ; Tue, 21 Apr 2026 10:28:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A57083E6B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776767331;
	bh=1mdW6Kh7n/IVEHHT0x8sYEZPoM5wJYMnp3712cvwsNQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=dDvO5eQRdBJCpeUXE5zMzxWW9PCM2426bDQUygEh5gd5b9Pbk3GG/SOAj0ZdsdMWT
	 DaEkhKUGP9MJXc1biqfhoytDaHoKJM88RlqsDohbCanK5TxIgzYya1+jTsxFRhzIuu
	 EbKY8aENZXJCnsKdWDu3njdxVHiailVIzsPhWSp0sWmzbj5k4NddrTXTVwe7ClWhh2
	 Q5MmWNO2ms0KMRCcJ0/yXdzxbhW640bhGV7Hrj9eLj3N3FcQxbJs1Wz4/xpARNAzf9
	 q0rFS+vDhHBs3F9E8796q70KjnB1LnhHhdkbCJ13vCLeIj5vYZLlj/LSlp849sruM1
	 pICPP5+P5Rp0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A57083E6B;
	Tue, 21 Apr 2026 10:28:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CC952257
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 10:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD963606FA
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 10:28:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sm4AjulcYBmI for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 10:28:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.49;
 helo=mail-wr1-f49.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D843A606F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D843A606F7
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D843A606F7
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 10:28:48 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-43eb05b1875so2380481f8f.3
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 03:28:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776767326; x=1777372126;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OdqVKIJ7A1g6WNSnR7CEjCT6R5QePAEYh+p9BKMm9Tk=;
 b=NREEBarTnYzZeuQ1Hg7a/4QF80eD2r6H4EIYfGk0GY6k3drhiPiJwtqHNeqN5Js37b
 zJKxv2qQo/ecWsunqoplVUrklppImde5mnuQCla/v07iE2CNG5sW6PLPZYN58bVKElBJ
 /Ue8pvpOnpNpFjrJIi7CyOXpKJ1pkA/fo/HysG6uSNNsUoqBnjO66Z4RcSQXvdPJWdY8
 zTCvKw1QocaQf3AdJ8wnh6TZ627zKMNWFUiZLnHimG4Uo649kD6z1SOQBGiH5mOHOp/I
 tzWsfoJSAocXCtuscHpOooFllvUMpVAgLS9w9HpKAkqTUGjh1NktzyiXV9jzSkmda/xW
 NVUQ==
X-Gm-Message-State: AOJu0YxvJUONhQYqB3hoBikMicwtuYRffymWdpRnu35gBWAzgo62aunI
 26Di2PZZ81aDe0eSXKiqzWMsZBPTvogMBeoP9USjuNs+NWZZHNbGLgd7zTJUWePi
X-Gm-Gg: AeBDievauwdLZTpUcaq/x4gK3UDgeUlVOgNGfufgAFMKesDgBuQlObjXdkPnajmzdnf
 XkRsyW0xSA6a5zzLHYvJ3aIIsvhblp7YylR0vUxCf05RcHNol37ftFjuq8iwgYjJgz9JvWxBiiw
 SN/3xjh4wQ9mrrMyxMy+CWR6glb6bvvem+VrTSivPPdYaRrftz/I85IVtsyVPBULCQhBaNPoQQF
 rDG2Wm1Ga3wB4gbRTHBErvdsGOHSLcMVBCZhrfXxgLXcnMfBHdXbw/elcbeS+TZJTzrdpSAQHmi
 MVtW/H9G4YZJ5mnWP65tRqAzva5BSDxdydRy2buxvHtwKOzIzaK08jXcwAbTr2Tsx7zBSd6I/zs
 on2DHPJjBRolu8S+Fxb1Tm2fA5bx5yXhWzD1hjNHpSsaQZ0fEMtfn1fqV4f+xOdVf60OT8rL+Bs
 yo13tVHKBxApXrCJURlRsYzDoEi3u/F3UhRRUhtzBSuEnLl3kQ+JNjEDof4G22mwYajv/Aie+C3
 kFxJG9ADLYyG0x+L+FG/0YkvKOpxHPnEdRJa7AS/NfSPqYghmCnQcg8CyeQ/sMeZisWURcGSBh9
 sHIRecmCIU51PQJqgZU=
X-Received: by 2002:a5d:64e3:0:b0:43e:aa88:f1a1 with SMTP id
 ffacd0b85a97d-43fe3dfd649mr27176218f8f.30.1776767326027; 
 Tue, 21 Apr 2026 03:28:46 -0700 (PDT)
Received: from KORLIN44614.barco.com (d528f5fdd.static.telenet.be.
 [82.143.95.221]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-43fe4dc26a3sm41250948f8f.15.2026.04.21.03.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2026 03:28:45 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Date: Tue, 21 Apr 2026 12:28:43 +0200
Message-ID: <20260421102843.160108-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] package/webkitgtk: bump to 2.52.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Devoogdt <thomas.devoogdt@barco.com>

This is a major release to 2.52.x, see highlights:

https://webkitgtk.org/2026/03/18/webkitgtk-2.52-highlights.html

Other news:

https://webkitgtk.org/news.html

Changes:

- Use USE_GSTREAMER rather than ENABLE_{VIDEO,WEB_{AUDIO,CODECS}}.
  Move USE_GSTREAMER_GL while at it.
  See https://github.com/WebKit/WebKit/commit/92179a19a0f189ff7ddcf0e1d2792804b65653d3.

- Add 0001-JSC-Fix-ENABLE-JIT-build.patch to fix some undefined symbols.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 .../0001-JSC-Fix-ENABLE-JIT-build.patch       | 331 ++++++++++++++++++
 package/webkitgtk/webkitgtk.hash              |   6 +-
 package/webkitgtk/webkitgtk.mk                |  24 +-
 3 files changed, 343 insertions(+), 18 deletions(-)
 create mode 100644 package/webkitgtk/0001-JSC-Fix-ENABLE-JIT-build.patch

diff --git a/package/webkitgtk/0001-JSC-Fix-ENABLE-JIT-build.patch b/package/webkitgtk/0001-JSC-Fix-ENABLE-JIT-build.patch
new file mode 100644
index 00000000000..c8779688e4d
--- /dev/null
+++ b/package/webkitgtk/0001-JSC-Fix-ENABLE-JIT-build.patch
@@ -0,0 +1,331 @@
+From ad28ad528d433cff1fec831d922e569bf446773e Mon Sep 17 00:00:00 2001
+From: Shu-yu Guo <syg@apple.com>
+Date: Fri, 17 Apr 2026 15:57:23 -0700
+Subject: [PATCH] [JSC] Fix !ENABLE(JIT) build
+ https://bugs.webkit.org/show_bug.cgi?id=306638 rdar://169822205
+
+Reviewed by Yusuke Suzuki.
+
+* Source/JavaScriptCore/jit/ExecutableAllocator.h:
+(JSC::performJITMemcpy):
+* Source/JavaScriptCore/llint/InPlaceInterpreter.asm:
+* Source/JavaScriptCore/llint/LLIntData.cpp:
+(JSC::LLInt::initialize):
+* Source/JavaScriptCore/wasm/WasmCallee.cpp:
+* Source/WTF/wtf/PlatformEnable.h:
+
+Canonical link: https://commits.webkit.org/311492@main
+
+(cherry picked from commit e7ae451260d742f70f63bd07ed1484331d534b3f)
+Upstream: https://github.com/WebKit/WebKit/pull/58096
+Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
+---
+ .../JavaScriptCore/jit/ExecutableAllocator.h  |  8 ++
+ .../llint/InPlaceInterpreter.asm              |  8 +-
+ Source/JavaScriptCore/llint/LLIntData.cpp     | 81 +++++++++++++++----
+ Source/JavaScriptCore/wasm/WasmCallee.cpp     | 18 ++++-
+ Source/WTF/wtf/PlatformEnable.h               |  2 +-
+ 5 files changed, 93 insertions(+), 24 deletions(-)
+
+diff --git a/Source/JavaScriptCore/jit/ExecutableAllocator.h b/Source/JavaScriptCore/jit/ExecutableAllocator.h
+index 3e8efce28cfe..cb81579c8703 100644
+--- a/Source/JavaScriptCore/jit/ExecutableAllocator.h
++++ b/Source/JavaScriptCore/jit/ExecutableAllocator.h
+@@ -390,6 +390,14 @@ WTF_ALLOW_UNSAFE_BUFFER_USAGE_BEGIN
+ WTF_ALLOW_UNSAFE_BUFFER_USAGE_END
+ }
+ 
++template<RepatchingInfo>
++inline void* performJITMemcpy(void *dst, const void *src, size_t n)
++{
++WTF_ALLOW_UNSAFE_BUFFER_USAGE_BEGIN
++    return memcpy(dst, src, n);
++WTF_ALLOW_UNSAFE_BUFFER_USAGE_END
++}
++
+ inline bool isJITPC(void*) { return false; }
+ #endif // ENABLE(JIT)
+ 
+diff --git a/Source/JavaScriptCore/llint/InPlaceInterpreter.asm b/Source/JavaScriptCore/llint/InPlaceInterpreter.asm
+index 64db9cdb21df..dac1faa5260a 100644
+--- a/Source/JavaScriptCore/llint/InPlaceInterpreter.asm
++++ b/Source/JavaScriptCore/llint/InPlaceInterpreter.asm
+@@ -420,7 +420,7 @@ end
+ 
+ # OSR
+ macro ipintPrologueOSR(increment)
+-if JIT
++if WEBASSEMBLY_BBQJIT
+     loadp UnboxedWasmCalleeStackSlot[cfr], ws0
+     baddis increment, Wasm::IPIntCallee::m_tierUpCounter + Wasm::IPIntTierUpCounter::m_counter[ws0], .continue
+ 
+@@ -457,11 +457,11 @@ end
+     if ARMv7
+         break # FIXME: ipint support.
+     end # ARMv7
+-end # JIT
++end # WEBASSEMBLY_BBQJIT
+ end
+ 
+ macro ipintLoopOSR(increment)
+-if JIT and not ARMv7
++if WEBASSEMBLY_BBQJIT and not ARMv7
+     validateOpcodeConfig(ws0)
+     loadp UnboxedWasmCalleeStackSlot[cfr], ws0
+     baddis increment, Wasm::IPIntCallee::m_tierUpCounter + Wasm::IPIntTierUpCounter::m_counter[ws0], .continue
+@@ -492,7 +492,7 @@ end
+ end
+ 
+ macro ipintEpilogueOSR(increment)
+-if JIT and not ARMv7
++if WEBASSEMBLY_BBQJIT and not ARMv7
+     loadp UnboxedWasmCalleeStackSlot[cfr], ws0
+     baddis increment, Wasm::IPIntCallee::m_tierUpCounter + Wasm::IPIntTierUpCounter::m_counter[ws0], .continue
+ 
+diff --git a/Source/JavaScriptCore/llint/LLIntData.cpp b/Source/JavaScriptCore/llint/LLIntData.cpp
+index 5d7c88f72571..2509dc4132f3 100644
+--- a/Source/JavaScriptCore/llint/LLIntData.cpp
++++ b/Source/JavaScriptCore/llint/LLIntData.cpp
+@@ -199,8 +199,28 @@ void initialize()
+ #if CPU(ARM64E)
+ 
+ #if ENABLE(JIT_CAGE)
+-    if (Options::useJITCage())
++    if (Options::useJITCage()) {
+         g_jscConfig.llint.gateMap[static_cast<unsigned>(Gate::jitCagePtr)] = jitCagePtrThunk().code().taggedPtr();
++#if ENABLE(WEBASSEMBLY)
++        // JSPI JITCage gates
++        g_jscConfig.llint.gateMap[static_cast<unsigned>(Gate::jspiResignReturnPCs)] = jspiResignReturnPCsThunk().code().taggedPtr();
++        g_jscConfig.llint.gateMap[static_cast<unsigned>(Gate::jspiExecuteSliceEntry)] = jspiExecuteSliceEntryThunk().code().taggedPtr();
++        // jspiExitImplantedSlice is stored untagged because it's used as a return address
++        // (not as a jump target) and will be signed by JITCage with the stack pointer diversifier.
++        g_jscConfig.llint.gateMap[static_cast<unsigned>(Gate::jspiExitImplantedSlice)] = jspiExitImplantedSliceThunk().code().untaggedPtr();
++#endif // ENABLE(WEBASSEMBLY)
++    }
++#endif
++
++#if ENABLE(JIT)
++#define INITIALIZE_JS_GATE_JIT_PATH(name, tag) \
++    if (Options::useJIT()) { \
++        codeRef8.construct(createJSGateThunk(retagCodePtr<void*, CFunctionPtrTag, OperationPtrTag>(LLInt::getCodeFunctionPtr<CFunctionPtrTag>(name##_return_location)), tag, #name)); \
++        codeRef16.construct(createJSGateThunk(retagCodePtr<void*, CFunctionPtrTag, OperationPtrTag>(LLInt::getWide16CodeFunctionPtr<CFunctionPtrTag>(name##_return_location)), tag, #name "_wide16")); \
++        codeRef32.construct(createJSGateThunk(retagCodePtr<void*, CFunctionPtrTag, OperationPtrTag>(LLInt::getWide32CodeFunctionPtr<CFunctionPtrTag>(name##_return_location)), tag, #name "_wide32")); \
++    } else
++#else
++#define INITIALIZE_JS_GATE_JIT_PATH(name, tag)
+ #endif
+ 
+ #define INITIALIZE_JS_GATE(name, tag) \
+@@ -208,11 +228,7 @@ void initialize()
+         static LazyNeverDestroyed<MacroAssemblerCodeRef<NativeToJITGatePtrTag>> codeRef8; \
+         static LazyNeverDestroyed<MacroAssemblerCodeRef<NativeToJITGatePtrTag>> codeRef16; \
+         static LazyNeverDestroyed<MacroAssemblerCodeRef<NativeToJITGatePtrTag>> codeRef32; \
+-        if (Options::useJIT()) { \
+-            codeRef8.construct(createJSGateThunk(retagCodePtr<void*, CFunctionPtrTag, OperationPtrTag>(LLInt::getCodeFunctionPtr<CFunctionPtrTag>(name##_return_location)), tag, #name)); \
+-            codeRef16.construct(createJSGateThunk(retagCodePtr<void*, CFunctionPtrTag, OperationPtrTag>(LLInt::getWide16CodeFunctionPtr<CFunctionPtrTag>(name##_return_location)), tag, #name "_wide16")); \
+-            codeRef32.construct(createJSGateThunk(retagCodePtr<void*, CFunctionPtrTag, OperationPtrTag>(LLInt::getWide32CodeFunctionPtr<CFunctionPtrTag>(name##_return_location)), tag, #name "_wide32")); \
+-        } else { \
++        INITIALIZE_JS_GATE_JIT_PATH(name, tag) { \
+             codeRef8.construct(LLInt::getCodeRef<NativeToJITGatePtrTag>(js_trampoline_##name)); \
+             codeRef16.construct(LLInt::getWide16CodeRef<NativeToJITGatePtrTag>(js_trampoline_##name)); \
+             codeRef32.construct(LLInt::getWide32CodeRef<NativeToJITGatePtrTag>(js_trampoline_##name)); \
+@@ -226,16 +242,23 @@ void initialize()
+ 
+ #if ENABLE(WEBASSEMBLY)
+ 
++#if ENABLE(JIT)
++#define INITIALIZE_WASM_GATE_JIT_PATH(name, tag) \
++    if (Options::useJIT()) { \
++        codeRef8.construct(createWasmGateThunk(retagCodePtr<void*, CFunctionPtrTag, OperationPtrTag>(LLInt::getCodeFunctionPtr<CFunctionPtrTag>(name##_return_location)), tag, #name)); \
++        codeRef16.construct(createWasmGateThunk(retagCodePtr<void*, CFunctionPtrTag, OperationPtrTag>(LLInt::getWide16CodeFunctionPtr<CFunctionPtrTag>(name##_return_location)), tag, #name "_wide16")); \
++        codeRef32.construct(createWasmGateThunk(retagCodePtr<void*, CFunctionPtrTag, OperationPtrTag>(LLInt::getWide32CodeFunctionPtr<CFunctionPtrTag>(name##_return_location)), tag, #name "_wide32")); \
++    } else
++#else
++#define INITIALIZE_WASM_GATE_JIT_PATH(name, tag)
++#endif
++
+ #define INITIALIZE_WASM_GATE(name, tag) \
+     do { \
+         static LazyNeverDestroyed<MacroAssemblerCodeRef<NativeToJITGatePtrTag>> codeRef8; \
+         static LazyNeverDestroyed<MacroAssemblerCodeRef<NativeToJITGatePtrTag>> codeRef16; \
+         static LazyNeverDestroyed<MacroAssemblerCodeRef<NativeToJITGatePtrTag>> codeRef32; \
+-        if (Options::useJIT()) { \
+-            codeRef8.construct(createWasmGateThunk(retagCodePtr<void*, CFunctionPtrTag, OperationPtrTag>(LLInt::getCodeFunctionPtr<CFunctionPtrTag>(name##_return_location)), tag, #name)); \
+-            codeRef16.construct(createWasmGateThunk(retagCodePtr<void*, CFunctionPtrTag, OperationPtrTag>(LLInt::getWide16CodeFunctionPtr<CFunctionPtrTag>(name##_return_location)), tag, #name "_wide16")); \
+-            codeRef32.construct(createWasmGateThunk(retagCodePtr<void*, CFunctionPtrTag, OperationPtrTag>(LLInt::getWide32CodeFunctionPtr<CFunctionPtrTag>(name##_return_location)), tag, #name "_wide32")); \
+-        } else { \
++        INITIALIZE_WASM_GATE_JIT_PATH(name, tag) { \
+             codeRef8.construct(LLInt::getCodeRef<NativeToJITGatePtrTag>(wasm_trampoline_##name)); \
+             codeRef16.construct(LLInt::getWide16CodeRef<NativeToJITGatePtrTag>(wasm_trampoline_##name)); \
+             codeRef32.construct(LLInt::getWide32CodeRef<NativeToJITGatePtrTag>(wasm_trampoline_##name)); \
+@@ -253,10 +276,12 @@ void initialize()
+     // This is key to entering the interpreter.
+     {
+         static LazyNeverDestroyed<MacroAssemblerCodeRef<VMEntryToJITGatePtrTag>> codeRef;
++#if ENABLE(JIT)
+         if (Options::useJIT()) {
+             auto gateCodeRef = createJSGateThunk(retagCodePtr<void*, CFunctionPtrTag, OperationPtrTag>(&vmEntryToJavaScriptGateAfter), JSEntryPtrTag, "vmEntryToJavaScript");
+             codeRef.construct(gateCodeRef.retagged<VMEntryToJITGatePtrTag>());
+         } else
++#endif
+             codeRef.construct(MacroAssemblerCodeRef<VMEntryToJITGatePtrTag>::createSelfManagedCodeRef(CodePtr<VMEntryToJITGatePtrTag>::fromTaggedPtr(retagCodePtr<void*, CFunctionPtrTag, VMEntryToJITGatePtrTag>(&vmEntryToJavaScriptTrampoline))));
+         g_jscConfig.llint.gateMap[static_cast<unsigned>(Gate::vmEntryToJavaScript)] = codeRef.get().code().taggedPtr();
+     }
+@@ -268,79 +293,103 @@ void initialize()
+ 
+     {
+         static LazyNeverDestroyed<MacroAssemblerCodeRef<NativeToJITGatePtrTag>> codeRef;
++#if ENABLE(JIT)
+         if (Options::useJIT())
+             codeRef.construct(createTailCallGate(JSEntryPtrTag, true));
+         else
++#endif
+             codeRef.construct(MacroAssemblerCodeRef<NativeToJITGatePtrTag>::createSelfManagedCodeRef(CodePtr<NativeToJITGatePtrTag>::fromTaggedPtr(retagCodePtr<void*, CFunctionPtrTag, NativeToJITGatePtrTag>(&tailCallJSEntryTrampoline))));
+         g_jscConfig.llint.gateMap[static_cast<unsigned>(Gate::tailCallJSEntryPtrTag)]= codeRef.get().code().taggedPtr();
+     }
+     {
+         static LazyNeverDestroyed<MacroAssemblerCodeRef<NativeToJITGatePtrTag>> codeRef;
++#if ENABLE(JIT)
+         if (Options::useJIT())
+             codeRef.construct(createTailCallGate(JSEntryPtrTag, true));
+         else
++#endif
+             codeRef.construct(MacroAssemblerCodeRef<NativeToJITGatePtrTag>::createSelfManagedCodeRef(CodePtr<NativeToJITGatePtrTag>::fromTaggedPtr(retagCodePtr<void*, CFunctionPtrTag, NativeToJITGatePtrTag>(&tailCallJSEntrySlowPathTrampoline))));
+         g_jscConfig.llint.gateMap[static_cast<unsigned>(Gate::tailCallJSEntrySlowPathPtrTag)] = codeRef.get().code().taggedPtr();
+     }
+     {
+         static LazyNeverDestroyed<MacroAssemblerCodeRef<NativeToJITGatePtrTag>> codeRef;
++#if ENABLE(JIT)
+         if (Options::useJIT())
+             codeRef.construct(createTailCallGate(JSEntryPtrTag, false));
+         else
++#endif
+             codeRef.construct(MacroAssemblerCodeRef<NativeToJITGatePtrTag>::createSelfManagedCodeRef(CodePtr<NativeToJITGatePtrTag>::fromTaggedPtr(retagCodePtr<void*, CFunctionPtrTag, NativeToJITGatePtrTag>(&tailCallWithoutUntagJSEntryTrampoline))));
+         g_jscConfig.llint.gateMap[static_cast<unsigned>(Gate::tailCallWithoutUntagJSEntryPtrTag)]= codeRef.get().code().taggedPtr();
+     }
+     {
+         static LazyNeverDestroyed<MacroAssemblerCodeRef<NativeToJITGatePtrTag>> codeRef;
++#if ENABLE(JIT)
+         if (Options::useJIT())
+             codeRef.construct(createWasmTailCallGate(WasmEntryPtrTag));
+         else
++#endif
+             codeRef.construct(MacroAssemblerCodeRef<NativeToJITGatePtrTag>::createSelfManagedCodeRef(CodePtr<NativeToJITGatePtrTag>::fromTaggedPtr(retagCodePtr<void*, CFunctionPtrTag, NativeToJITGatePtrTag>(&wasmTailCallTrampoline))));
+         g_jscConfig.llint.gateMap[static_cast<unsigned>(Gate::wasmTailCallWasmEntryPtrTag)]= codeRef.get().code().taggedPtr();
+     }
+     {
+         static LazyNeverDestroyed<MacroAssemblerCodeRef<NativeToJITGatePtrTag>> codeRef;
++#if ENABLE(JIT)
+         if (Options::useJIT())
+             codeRef.construct(createWasmTailCallGate(WasmEntryPtrTag));
+         else
++#endif
+             codeRef.construct(MacroAssemblerCodeRef<NativeToJITGatePtrTag>::createSelfManagedCodeRef(CodePtr<NativeToJITGatePtrTag>::fromTaggedPtr(retagCodePtr<void*, CFunctionPtrTag, NativeToJITGatePtrTag>(&wasmTailCallTrampoline))));
+         g_jscConfig.llint.gateMap[static_cast<unsigned>(Gate::wasmIPIntTailCallWasmEntryPtrTag)]= codeRef.get().code().taggedPtr();
+     }
+     {
+         static LazyNeverDestroyed<MacroAssemblerCodeRef<NativeToJITGatePtrTag>> codeRef;
++#if ENABLE(JIT)
+         if (Options::useJIT())
+             codeRef.construct(exceptionHandlerGateThunk());
+         else
++#endif
+             codeRef.construct(MacroAssemblerCodeRef<NativeToJITGatePtrTag>::createSelfManagedCodeRef(CodePtr<NativeToJITGatePtrTag>::fromTaggedPtr(retagCodePtr<void*, CFunctionPtrTag, NativeToJITGatePtrTag>(&exceptionHandlerTrampoline))));
+         g_jscConfig.llint.gateMap[static_cast<unsigned>(Gate::exceptionHandler)] = codeRef.get().code().taggedPtr();
+     }
+     {
+         static LazyNeverDestroyed<MacroAssemblerCodeRef<NativeToJITGatePtrTag>> codeRef;
++#if ENABLE(JIT)
+         if (Options::useJIT())
+             codeRef.construct(returnFromLLIntGateThunk());
+         else
++#endif
+             codeRef.construct(MacroAssemblerCodeRef<NativeToJITGatePtrTag>::createSelfManagedCodeRef(CodePtr<NativeToJITGatePtrTag>::fromTaggedPtr(retagCodePtr<void*, CFunctionPtrTag, NativeToJITGatePtrTag>(&returnFromLLIntTrampoline))));
+         g_jscConfig.llint.gateMap[static_cast<unsigned>(Gate::returnFromLLInt)] = codeRef.get().code().taggedPtr();
+     }
+ 
++#if ENABLE(JIT)
+     if (Options::useJIT()) {
+         g_jscConfig.llint.gateMap[static_cast<unsigned>(Gate::loopOSREntry)] = loopOSREntryGateThunk().code().taggedPtr();
+         g_jscConfig.llint.gateMap[static_cast<unsigned>(Gate::entryOSREntry)] = entryOSREntryGateThunk().code().taggedPtr();
+         g_jscConfig.llint.gateMap[static_cast<unsigned>(Gate::wasmOSREntry)] = wasmOSREntryGateThunk().code().taggedPtr();
+-    } else {
++    } else
++#endif
++    {
+         g_jscConfig.llint.gateMap[static_cast<unsigned>(Gate::loopOSREntry)] = LLInt::getCodeRef<NativeToJITGatePtrTag>(loop_osr_entry_gate).code().taggedPtr();
+         g_jscConfig.llint.gateMap[static_cast<unsigned>(Gate::entryOSREntry)] = nullptr;
+         g_jscConfig.llint.gateMap[static_cast<unsigned>(Gate::wasmOSREntry)] = nullptr;
+     }
+ 
++#if ENABLE(JIT)
++#define INITIALIZE_TAG_AND_UNTAG_THUNKS_JIT_PATH(name) \
++    if (Options::useJIT()) { \
++        tagCodeRef.construct(tagGateThunk(retagCodePtr<void*, CFunctionPtrTag, OperationPtrTag>(name##TagGateAfter))); \
++        untagCodeRef.construct(untagGateThunk(retagCodePtr<void*, CFunctionPtrTag, OperationPtrTag>(name##UntagGateAfter))); \
++    } else
++#else
++#define INITIALIZE_TAG_AND_UNTAG_THUNKS_JIT_PATH(name)
++#endif
++
+ #define INITIALIZE_TAG_AND_UNTAG_THUNKS(name) \
+     do { \
+         static LazyNeverDestroyed<MacroAssemblerCodeRef<NativeToJITGatePtrTag>> tagCodeRef; \
+         static LazyNeverDestroyed<MacroAssemblerCodeRef<NativeToJITGatePtrTag>> untagCodeRef; \
+-        if (Options::useJIT()) { \
+-            tagCodeRef.construct(tagGateThunk(retagCodePtr<void*, CFunctionPtrTag, OperationPtrTag>(name##TagGateAfter))); \
+-            untagCodeRef.construct(untagGateThunk(retagCodePtr<void*, CFunctionPtrTag, OperationPtrTag>(name##UntagGateAfter))); \
+-        } else { \
++        INITIALIZE_TAG_AND_UNTAG_THUNKS_JIT_PATH(name) { \
+             tagCodeRef.construct(LLInt::getCodeRef<NativeToJITGatePtrTag>(js_trampoline_##name##_tag)); \
+             untagCodeRef.construct(LLInt::getCodeRef<NativeToJITGatePtrTag>(js_trampoline_##name##_untag)); \
+         } \
+diff --git a/Source/JavaScriptCore/wasm/WasmCallee.cpp b/Source/JavaScriptCore/wasm/WasmCallee.cpp
+index 94a845ab47e4..b689f00143ab 100644
+--- a/Source/JavaScriptCore/wasm/WasmCallee.cpp
++++ b/Source/JavaScriptCore/wasm/WasmCallee.cpp
+@@ -55,13 +55,25 @@ WTF_MAKE_COMPACT_TZONE_ALLOCATED_IMPL(Callee);
+ WTF_MAKE_COMPACT_TZONE_ALLOCATED_IMPL(JITCallee);
+ WTF_MAKE_COMPACT_TZONE_ALLOCATED_IMPL(JSToWasmCallee);
+ WTF_MAKE_COMPACT_TZONE_ALLOCATED_IMPL(WasmToJSCallee);
++WTF_MAKE_COMPACT_TZONE_ALLOCATED_IMPL(IPIntCallee);
++WTF_MAKE_COMPACT_TZONE_ALLOCATED_IMPL(WasmBuiltinCallee);
++
++#if ENABLE(JIT)
+ WTF_MAKE_COMPACT_TZONE_ALLOCATED_IMPL(JSToWasmICCallee);
++#endif
++
++#if ENABLE(WEBASSEMBLY_BBQJIT) || ENABLE(WEBASSEMBLY_OMGJIT)
+ WTF_MAKE_COMPACT_TZONE_ALLOCATED_IMPL(OptimizingJITCallee);
++#endif
++
++#if ENABLE(WEBASSEMBLY_BBQJIT)
++WTF_MAKE_COMPACT_TZONE_ALLOCATED_IMPL(BBQCallee);
++#endif
++
++#if ENABLE(WEBASSEMBLY_OMGJIT)
+ WTF_MAKE_COMPACT_TZONE_ALLOCATED_IMPL(OMGCallee);
+ WTF_MAKE_COMPACT_TZONE_ALLOCATED_IMPL(OMGOSREntryCallee);
+-WTF_MAKE_COMPACT_TZONE_ALLOCATED_IMPL(BBQCallee);
+-WTF_MAKE_COMPACT_TZONE_ALLOCATED_IMPL(IPIntCallee);
+-WTF_MAKE_COMPACT_TZONE_ALLOCATED_IMPL(WasmBuiltinCallee);
++#endif
+ 
+ Callee::Callee(Wasm::CompilationMode compilationMode)
+     : NativeCallee(NativeCallee::Category::Wasm, ImplementationVisibility::Private)
+diff --git a/Source/WTF/wtf/PlatformEnable.h b/Source/WTF/wtf/PlatformEnable.h
+index 9c20eb45de48..1561e5ecc85a 100644
+--- a/Source/WTF/wtf/PlatformEnable.h
++++ b/Source/WTF/wtf/PlatformEnable.h
+@@ -1006,7 +1006,7 @@
+ #define ENABLE_JIT_OPERATION_DISASSEMBLY 1
+ #endif
+ 
+-#if CPU(ARM64E)
++#if CPU(ARM64E) && ENABLE(JIT)
+ #define ENABLE_JIT_SIGN_ASSEMBLER_BUFFER 1
+ #endif
+ 
+-- 
+2.43.0
+
diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
index 77bdc5485bc..03b8d0a9bec 100644
--- a/package/webkitgtk/webkitgtk.hash
+++ b/package/webkitgtk/webkitgtk.hash
@@ -1,6 +1,6 @@
-# From https://webkitgtk.org/releases/webkitgtk-2.50.5.tar.xz.sums
-sha1  e93f7efa9fbc7304cc159c35d8e76d7febab2515  webkitgtk-2.50.5.tar.xz
-sha256  8737631bac3e9c7ad3e5208f9370e076c09d9c45b39980021ce54edadcc6f94f  webkitgtk-2.50.5.tar.xz
+# From https://webkitgtk.org/releases/webkitgtk-2.52.3.tar.xz.sums
+sha1  17f9b127618040a5f3fcbb70e37ea16ab6d69b0b  webkitgtk-2.52.3.tar.xz
+sha256  5b3e0d174e63dcc28848b1194e0e7448d5948c3c2427ecd931c2c5be5261aebb  webkitgtk-2.52.3.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 26c70ae6c8c..d5b7639ee61 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBKITGTK_VERSION = 2.50.5
+WEBKITGTK_VERSION = 2.52.3
 WEBKITGTK_SITE = https://www.webkitgtk.org/releases
 WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
 WEBKITGTK_INSTALL_STAGING = YES
@@ -56,16 +56,16 @@ WEBKITGTK_CONF_OPTS += -DENABLE_BUBBLEWRAP_SANDBOX=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_WEBKITGTK_MULTIMEDIA),y)
-WEBKITGTK_CONF_OPTS += \
-	-DENABLE_VIDEO=ON \
-	-DENABLE_WEB_AUDIO=ON \
-	-DENABLE_WEB_CODECS=ON
+WEBKITGTK_CONF_OPTS += -DUSE_GSTREAMER=ON
 WEBKITGTK_DEPENDENCIES += gstreamer1 gst1-libav gst1-plugins-bad gst1-plugins-base
 else
-WEBKITGTK_CONF_OPTS += \
-	-DENABLE_VIDEO=OFF \
-	-DENABLE_WEB_AUDIO=OFF \
-	-DENABLE_WEB_CODECS=OFF
+WEBKITGTK_CONF_OPTS += -DUSE_GSTREAMER=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_WEBKITGTK_USE_GSTREAMER_GL),y)
+WEBKITGTK_CONF_OPTS += -DUSE_GSTREAMER_GL=ON
+else
+WEBKITGTK_CONF_OPTS += -DUSE_GSTREAMER_GL=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_WEBKITGTK_WEBDRIVER),y)
@@ -160,12 +160,6 @@ else
 WEBKITGTK_CONF_OPTS += -DENABLE_WAYLAND_TARGET=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_WEBKITGTK_USE_GSTREAMER_GL),y)
-WEBKITGTK_CONF_OPTS += -DUSE_GSTREAMER_GL=ON
-else
-WEBKITGTK_CONF_OPTS += -DUSE_GSTREAMER_GL=OFF
-endif
-
 ifeq ($(BR2_INIT_SYSTEMD),y)
 WEBKITGTK_CONF_OPTS += -DENABLE_JOURNALD_LOG=ON
 WEBKITGTK_DEPENDENCIES += systemd
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
