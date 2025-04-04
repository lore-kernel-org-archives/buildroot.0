Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B28C36010
	for <buildroot@archiver.kernel.org>; Fri,  4 Apr 2025 21:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F21DD40BBD;
	Fri,  4 Apr 2025 21:33:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8nfkk1dxMbbm; Fri,  4 Apr 2025 21:33:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08ED140C42
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08ED140C42;
	Fri,  4 Apr 2025 21:33:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 08D951C7
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 21:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EDF7940C42
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 21:33:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h3c2-exmretJ for <buildroot@buildroot.org>;
 Fri,  4 Apr 2025 21:33:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com;
 envelope-from=charlie@rivosinc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9E6C940BBD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E6C940BBD
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E6C940BBD
 for <buildroot@buildroot.org>; Fri,  4 Apr 2025 21:33:53 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-7370a2d1981so2140441b3a.2
 for <buildroot@buildroot.org>; Fri, 04 Apr 2025 14:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743802433; x=1744407233;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mkM+aokQkBTSR+puUf4drzGoTJFa8zrs225wCbgvsQc=;
 b=t0yeUNXz5nOWP+ngIxmtLtgTUsF0ui2j+tL73NhWm8ieZpJk2VcMPUvU5knGsgT5gK
 V8PA3eZjg2T4sbmgKc1WEN7ZKRrlPFcIo7/vFKr/1VPGPd8oyb1MmQECu9EJyYEGBjYg
 WXNOtCqe438V44kX+ntZCckFqP/IQGFJ+LvaUZVRmrRZal843mpreeJ8m6sFQnEI0ZsD
 BCoCpgMY3aVq1viuKNtu73Xw18dEV3AKsO3WAinvUqv5yB10hItSfYBnZGQqtckvQ9EY
 vDaS9329r4OONbQrLs1CPLNNm/VXAeGJ+9y3yJeGVzHZax4OljXO21e6UhQBMfvvEywd
 +Xtg==
X-Gm-Message-State: AOJu0YzCkSZImgavvCW6T9KSPU1waVAjCy16UJvQ9VU5ygoKkpUT1XIG
 aoVAdPU/WiQqAdgKoUF65VZz+EKTlNuGCEnY2wlE7APZ2gYYrnVLk7WAl3cy+Do=
X-Gm-Gg: ASbGnctK451qtS2kb446hazdX97Y++kgUiEzT5ESKqsUxs2Sl3UsL49SKP3umRLusRA
 UBFUTC4qi1qVfoWuDmVb02aTDmWFnZGnN4DayPku25MOGjFJNyAIAfIBQFBLHJ0VgwpxpqczGq6
 SF5BSbXa0qcQPNqsq6CtR/umRh9LGrpeNsEaBsfUE40aWUuqrdPLnDwn4Jvenci0hUQzqw06MUv
 Da34ySZovk8Y1FEh9+/Y5GKo30W1Yzt8TdM8K2WLYogc/dl2wvRALelvs+7g1mOwpuMzFss9dZW
 lqD7jZQ7U9EXH+lwVE//25qgbZsWP0TMKZH5fZGyXEFKnU2sxaNENUZC6qgD2p3V/FKlosE=
X-Google-Smtp-Source: AGHT+IFUR/FROo58m4WAoldfKu6RqRs1NLAaP0jUN5jO7bQmMJcnGfiEEqdLZkkW/YjwcOcgv28o5Q==
X-Received: by 2002:a05:6a00:1813:b0:736:3ea8:4805 with SMTP id
 d2e1a72fcca58-739e48165a4mr7580715b3a.7.1743802432689; 
 Fri, 04 Apr 2025 14:33:52 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-739da0b41f1sm4009699b3a.147.2025.04.04.14.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Apr 2025 14:33:51 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 04 Apr 2025 14:33:39 -0700
MIME-Version: 1.0
Message-Id: <20250404-dhrystone_gcc15-v1-1-23d36daa079f@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIADJQ8GcC/x3MTQqAIBBA4avIrBP8LegqERE26Ww0NKKQ7p60/
 BbvVSiYCQuMrELGiwql2CA7Bi6s0SOnrRmUUFYYYfgW8lPOFHHxzknLcUDZayO0URpadWTc6f6
 P0/y+H8rt5nFhAAAA
X-Change-ID: 20250404-dhrystone_gcc15-e7e163403423
To: buildroot@buildroot.org
Cc: Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7815; i=charlie@rivosinc.com; 
 h=from:subject:message-id;
 bh=WB9uu2rUIVjvyEk+O0fRh4pTx0eLJKZZTH9ldpw9rJ8=; 
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ/qHACsdllcyvYlLe3INtjWFvv7i8vHVa+HU0oCLqQlez
 bv/uBzvKGVhEONikBVTZOG51sDceke/7Kho2QSYOaxMIEMYuDgFYCIfHjEyrOB5e//mZbMnIqav
 lMM+ai1cvep+MOeK0LTc45uXG3k9MWf4X5T5b4P1gt2G5puTEq+s0m6zWXlOz6bs9dTkGOnXWdJ
 LuAA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743802433; x=1744407233;
 darn=buildroot.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mkM+aokQkBTSR+puUf4drzGoTJFa8zrs225wCbgvsQc=;
 b=t187ygzppvZpLwiU2CAFXuumBuEXaHW5PKQWhsOcRbOGN8h+JkUkSzAXqcMERos+DI
 QqubUgwMZV428a5zijVSe/NMpYa5LNeVSjCnKm/fwrtKswlhqRkiQbTLzYy9I+7kk3R4
 Al57omE02LF0Co4r639wi9yA/NKDeZ/Sb0vRX6qRDqQWt93fN5WmPwTfzq2wRPvnUWFq
 MuILGo2b/KSUqIKPh0PXm7rUYDj0QJOREPMmynZW9kJ0GiqqDGqmIGPipWU5CuquQ5rX
 N5ckPcyqMgZKBpYm7ged4V60fZBiVyaw2ZmqD2S5N+zZ3kSvx/jyn9K8ew28t/JRS9gP
 rCjQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=rivosinc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rivosinc-com.20230601.gappssmtp.com
 header.i=@rivosinc-com.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=t187ygzp
Subject: [Buildroot] [PATCH] package/dhrystone: Fix function definitions
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

GCC-15 requires function definitions to have proper arguments. Add them
to dhrystone.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
GCC-15 hasn't been released yet but I was starting to look at what needs
to be done to run Buildroot. Here's a patch to fix dhrystone.
---
 .../0007-Fix-function-definitions-for-gcc15.patch  | 210 +++++++++++++++++++++
 1 file changed, 210 insertions(+)

diff --git a/package/dhrystone/0007-Fix-function-definitions-for-gcc15.patch b/package/dhrystone/0007-Fix-function-definitions-for-gcc15.patch
new file mode 100644
index 0000000000000000000000000000000000000000..6aa569b7b2e99464eda4008a058a65550a9dd4ca
--- /dev/null
+++ b/package/dhrystone/0007-Fix-function-definitions-for-gcc15.patch
@@ -0,0 +1,210 @@
+From b929daf9a5d61d8581e04b0a0c27252d3fe7b7a9 Mon Sep 17 00:00:00 2001
+From: Charlie Jenkins <charlie@rivosinc.com>
+Date: Fri, 4 Apr 2025 14:22:35 -0700
+Subject: [PATCH] Fix function definitions for gcc15
+
+Correct function declarations to contain args.
+
+Fixes:
+
+dhry_1.c:176:19: error: too many arguments to function 'Func_2'; expected 0, have 2
+  176 |     Bool_Glob = ! Func_2 (Str_1_Loc, Str_2_Loc);
+      |                   ^~~~~~  ~~~~~~~~~
+dhry_1.c:35:17: note: declared here
+   35 | Boolean         Func_2 ();
+      |                 ^~~~~~
+dhry_1.c:182:7: error: too many arguments to function 'Proc_7'; expected 0, have 3
+  182 |       Proc_7 (Int_1_Loc, Int_2_Loc, &Int_3_Loc);
+      |       ^~~~~~  ~~~~~~~~~
+
+Upstream: dead
+Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
+---
+ dhry_1.c | 26 +++++++++++---------------
+ dhry_2.c | 30 +++++++-----------------------
+ 2 files changed, 18 insertions(+), 38 deletions(-)
+
+diff --git a/dhry_1.c b/dhry_1.c
+index cad5840..b02ff08 100644
+--- a/dhry_1.c
++++ b/dhry_1.c
+@@ -31,8 +31,8 @@ int             Arr_2_Glob [50] [50];
+ #ifndef NO_PROTOTYPES
+ extern char     *malloc ();
+ #endif
+-Enumeration     Func_1 ();
+-Boolean         Func_2 ();
++Enumeration Func_1 (Capital_Letter Ch_1_Par_Val, Capital_Letter Ch_2_Par_Val);
++Boolean Func_2 (Str_30 Str_1_Par_Ref, Str_30 Str_2_Par_Ref);
+   /* forward declaration necessary since Enumeration may not simply be int */
+ 
+ #ifndef REG
+@@ -73,14 +73,14 @@ float           Microseconds,
+ /* end of variables for time measurement */
+ 
+ /* forward declarations */
+-void Proc_1 ();
+-void Proc_2 ();
+-void Proc_3 ();
++void Proc_1 (REG Rec_Pointer Ptr_Val_Par);
++void Proc_2 (One_Fifty *Int_Par_Ref);
++void Proc_3 (Rec_Pointer *Ptr_Ref_Par);
+ void Proc_4 ();
+ void Proc_5 ();
+-void Proc_6 ();
+-void Proc_7 ();
+-void Proc_8 ();
++void Proc_6 (Enumeration  Enum_Val_Par, Enumeration *Enum_Ref_Par);
++void Proc_7 (One_Fifty Int_1_Par_Val, One_Fifty Int_2_Par_Val, One_Fifty *Int_Par_Ref);
++void Proc_8 (Arr_1_Dim Arr_1_Par_Ref, Arr_2_Dim Arr_2_Par_Ref, int Int_1_Par_Val, int Int_2_Par_Val);
+ 
+ int main(int argc, char *argv[])
+ /*****/
+@@ -305,10 +305,9 @@ int main(int argc, char *argv[])
+ }
+ 
+ 
+-void Proc_1 (Ptr_Val_Par)
++void Proc_1 (REG Rec_Pointer Ptr_Val_Par)
+ /******************/
+ 
+-REG Rec_Pointer Ptr_Val_Par;
+     /* executed once */
+ {
+   REG Rec_Pointer Next_Record = Ptr_Val_Par->Ptr_Comp;  
+@@ -339,12 +338,11 @@ REG Rec_Pointer Ptr_Val_Par;
+ } /* Proc_1 */
+ 
+ 
+-void Proc_2 (Int_Par_Ref)
++void Proc_2 (One_Fifty   *Int_Par_Ref)
+ /******************/
+     /* executed once */
+     /* *Int_Par_Ref == 1, becomes 4 */
+ 
+-One_Fifty   *Int_Par_Ref;
+ {
+   One_Fifty  Int_Loc;  
+   Enumeration   Enum_Loc;
+@@ -362,13 +360,11 @@ One_Fifty   *Int_Par_Ref;
+ } /* Proc_2 */
+ 
+ 
+-void Proc_3 (Ptr_Ref_Par)
++void Proc_3 (Rec_Pointer *Ptr_Ref_Par)
+ /******************/
+     /* executed once */
+     /* Ptr_Ref_Par becomes Ptr_Glob */
+ 
+-Rec_Pointer *Ptr_Ref_Par;
+-
+ {
+   if (Ptr_Glob != Null)
+     /* then, executed */
+diff --git a/dhry_2.c b/dhry_2.c
+index 25051e7..b1c9d8f 100644
+--- a/dhry_2.c
++++ b/dhry_2.c
+@@ -26,15 +26,13 @@
+ extern  int     Int_Glob;
+ extern  char    Ch_1_Glob;
+ 
+-Boolean Func_3 ();
++Boolean Func_3 (Enumeration Enum_Par_Val);
+ 
+-void Proc_6 (Enum_Val_Par, Enum_Ref_Par)
++void Proc_6 (Enumeration  Enum_Val_Par, Enumeration *Enum_Ref_Par)
+ /*********************************/
+     /* executed once */
+     /* Enum_Val_Par == Ident_3, Enum_Ref_Par becomes Ident_2 */
+ 
+-Enumeration  Enum_Val_Par;
+-Enumeration *Enum_Ref_Par;
+ {
+   *Enum_Ref_Par = Enum_Val_Par;
+   if (! Func_3 (Enum_Val_Par))
+@@ -62,7 +60,7 @@ Enumeration *Enum_Ref_Par;
+ } /* Proc_6 */
+ 
+ 
+-void Proc_7 (Int_1_Par_Val, Int_2_Par_Val, Int_Par_Ref)
++void Proc_7 (One_Fifty Int_1_Par_Val, One_Fifty Int_2_Par_Val, One_Fifty *Int_Par_Ref)
+ /**********************************************/
+     /* executed three times                                      */ 
+     /* first call:      Int_1_Par_Val == 2, Int_2_Par_Val == 3,  */
+@@ -71,9 +69,6 @@ void Proc_7 (Int_1_Par_Val, Int_2_Par_Val, Int_Par_Ref)
+     /*                  Int_Par_Ref becomes 17                   */
+     /* third call:      Int_1_Par_Val == 6, Int_2_Par_Val == 10, */
+     /*                  Int_Par_Ref becomes 18                   */
+-One_Fifty       Int_1_Par_Val;
+-One_Fifty       Int_2_Par_Val;
+-One_Fifty      *Int_Par_Ref;
+ {
+   One_Fifty Int_Loc;
+ 
+@@ -82,15 +77,11 @@ One_Fifty      *Int_Par_Ref;
+ } /* Proc_7 */
+ 
+ 
+-void Proc_8 (Arr_1_Par_Ref, Arr_2_Par_Ref, Int_1_Par_Val, Int_2_Par_Val)
++void Proc_8 (Arr_1_Dim Arr_1_Par_Ref, Arr_2_Dim Arr_2_Par_Ref, int Int_1_Par_Val, int Int_2_Par_Val)
+ /*********************************************************************/
+     /* executed once      */
+     /* Int_Par_Val_1 == 3 */
+     /* Int_Par_Val_2 == 7 */
+-Arr_1_Dim       Arr_1_Par_Ref;
+-Arr_2_Dim       Arr_2_Par_Ref;
+-int             Int_1_Par_Val;
+-int             Int_2_Par_Val;
+ {
+   REG One_Fifty Int_Index;
+   REG One_Fifty Int_Loc;
+@@ -107,15 +98,12 @@ int             Int_2_Par_Val;
+ } /* Proc_8 */
+ 
+ 
+-Enumeration Func_1 (Ch_1_Par_Val, Ch_2_Par_Val)
++Enumeration Func_1 (Capital_Letter Ch_1_Par_Val, Capital_Letter Ch_2_Par_Val)
+ /*************************************************/
+     /* executed three times                                         */
+     /* first call:      Ch_1_Par_Val == 'H', Ch_2_Par_Val == 'R'    */
+     /* second call:     Ch_1_Par_Val == 'A', Ch_2_Par_Val == 'C'    */
+     /* third call:      Ch_1_Par_Val == 'B', Ch_2_Par_Val == 'C'    */
+-
+-Capital_Letter   Ch_1_Par_Val;
+-Capital_Letter   Ch_2_Par_Val;
+ {
+   Capital_Letter        Ch_1_Loc;
+   Capital_Letter        Ch_2_Loc;
+@@ -133,14 +121,11 @@ Capital_Letter   Ch_2_Par_Val;
+ } /* Func_1 */
+ 
+ 
+-Boolean Func_2 (Str_1_Par_Ref, Str_2_Par_Ref)
++Boolean Func_2 (Str_30 Str_1_Par_Ref, Str_30 Str_2_Par_Ref)
+ /*************************************************/
+     /* executed once */
+     /* Str_1_Par_Ref == "DHRYSTONE PROGRAM, 1'ST STRING" */
+     /* Str_2_Par_Ref == "DHRYSTONE PROGRAM, 2'ND STRING" */
+-
+-Str_30  Str_1_Par_Ref;
+-Str_30  Str_2_Par_Ref;
+ {
+   REG One_Thirty        Int_Loc;
+       Capital_Letter    Ch_Loc;
+@@ -175,11 +160,10 @@ Str_30  Str_2_Par_Ref;
+ } /* Func_2 */
+ 
+ 
+-Boolean Func_3 (Enum_Par_Val)
++Boolean Func_3 (Enumeration Enum_Par_Val)
+ /***************************/
+     /* executed once        */
+     /* Enum_Par_Val == Ident_3 */
+-Enumeration Enum_Par_Val;
+ {
+   Enumeration Enum_Loc;
+ 
+-- 
+2.43.0
+

---
base-commit: a3b4ae2eaca9791c7c184e49a04a348dd35185c3
change-id: 20250404-dhrystone_gcc15-e7e163403423
-- 
- Charlie

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
