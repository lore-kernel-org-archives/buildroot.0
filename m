Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F6AC3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 12:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 724C8408B6;
	Sun, 18 May 2025 12:49:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FkJ8uHovApoD; Sun, 18 May 2025 12:49:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D6EB408AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D6EB408AF;
	Sun, 18 May 2025 12:49:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9560BDF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7811981EBF
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:49:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BFsI9xjECa9D for <buildroot@buildroot.org>;
 Sun, 18 May 2025 12:49:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6552181EB8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6552181EB8
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6552181EB8
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:49:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2DBCE43A01;
 Sun, 18 May 2025 12:49:52 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1uGdSh-00HS6D-1q;
 Sun, 18 May 2025 14:49:51 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 14:49:48 +0200
Message-Id: <20250518124949.4159568-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250518124949.4159568-1-peter@korsgaard.com>
References: <20250518124949.4159568-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefudekheehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnheptdelfeekveegudfhudehtedtjeekkeeggeehgfeghfevkedvtdfhfeetudfgiedtnecukfhppedvrgdtvdemkeegvdgrmeeghegrtgemleegtddumeejiegukeemfegvfhhfmehfvggsfeemgegssgehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvrgemgeehrggtmeelgedtudemjeeiugekmeefvghffhemfhgvsgefmeegsggshedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghkoheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdprhgtphhtthhopehgihhulhhiohdrsggvnhgvthhtihessggvnhgvthhtihgvnhhgihhnvggvrhhinhhgrdgtohhmp
 dhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhm
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 2/2] toolchain/toolchain-wrapper.c: get rid of
 EXCLUSIVE_ARGS
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rather than having a hard coded amount of exclusive args (with the risk of
overflow when new logic is added), simplify the argument buffer allocation
logic to always allocate room for DEFAULT_MAX_ARGS (1024) arguments and just
realloc to grow for the rare situation where that is not enough.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/toolchain-wrapper.c | 37 ++++++++++++++---------------------
 1 file changed, 15 insertions(+), 22 deletions(-)

diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index d6ce74fc94..fdfedf20ef 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -36,25 +36,9 @@ static char sysroot[PATH_MAX];
 static char _time_[sizeof("-D__TIME__=\"HH:MM:SS\"")];
 static char _date_[sizeof("-D__DATE__=\"MMM DD YYYY\"")];
 
-/**
- * GCC errors out with certain combinations of arguments (examples are
- * -mfloat-abi={hard|soft} and -m{little|big}-endian), so we have to ensure
- * that we only pass the predefined one to the real compiler if the inverse
- * option isn't in the argument list.
- * This specifies the worst case number of extra arguments we might pass
- * Currently, we may have:
- * 	-mfloat-abi=
- * 	-march=
- * 	-mcpu=
- * 	-D__TIME__=
- * 	-D__DATE__=
- * 	-Wno-builtin-macro-redefined
- * 	-Wl,-z,now
- * 	-Wl,-z,relro
- * 	-fPIE
- * 	-pie
- */
-#define EXCLUSIVE_ARGS	10
+/* Maximum amount of arguments to reserve space for by default.
+   Must be > predef_args */
+#define DEFAULT_MAX_ARGS	1024
 
 static char *predef_args[] = {
 #ifdef BR_CCACHE
@@ -246,6 +230,7 @@ int main(int argc, char **argv)
 	char *basename;
 	char *env_debug;
 	int ret, i, count = 0, debug = 0, found_shared = 0, found_nonoption = 0;
+	size_t n_args;
 
 	/* Debug the wrapper to see arguments it was called with.
 	 * If environment variable BR2_DEBUG_WRAPPER is:
@@ -354,8 +339,7 @@ int main(int argc, char **argv)
 		return 3;
 	}
 
-	cur = args = malloc(sizeof(predef_args) +
-			    (sizeof(char *) * (argc + EXCLUSIVE_ARGS)));
+	cur = args = malloc(DEFAULT_MAX_ARGS * sizeof(char *));
 	if (args == NULL) {
 		perror(__FILE__ ": malloc");
 		return 2;
@@ -497,8 +481,17 @@ int main(int argc, char **argv)
 #endif
 	}
 
+        n_args = (cur - args);
+        if ((n_args + argc) > DEFAULT_MAX_ARGS) {
+		args = realloc(args, (n_args + argc) * sizeof(char *));
+		if (args == NULL) {
+			perror(__FILE__ ": realloc");
+			return 2;
+		}
+        }
+
 	/* append forward args and terminating NULL */
-	memcpy(cur, &argv[1], sizeof(char *) * argc);
+	memcpy(&args[n_args], &argv[1], sizeof(char *) * argc);
 
 	exec_args = args;
 #ifdef BR_CCACHE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
