From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 19 Jan 2019 16:33:49 +0100
Subject: [Buildroot] [git commit] package/pango: add upstream security fix
 for CVE-2018-15120
Message-ID: <20190119153718.4A2528CA66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1574dd6d48e4b1deef1dc05764eb51687e699822
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libpango in Pango 1.40.8 through 1.42.3, as used in hexchat and other
products, allows remote attackers to cause a denial of service (application
crash) or possibly have unspecified other impact via crafted text with
invalid Unicode sequences.

https://nvd.nist.gov/vuln/detail/CVE-2018-15120

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-assertion-with-invalid-Unicode-sequences.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/pango/0002-Prevent-an-assertion-with-invalid-Unicode-sequences.patch b/package/pango/0002-Prevent-an-assertion-with-invalid-Unicode-sequences.patch
new file mode 100644
index 0000000000..010981e8b4
--- /dev/null
+++ b/package/pango/0002-Prevent-an-assertion-with-invalid-Unicode-sequences.patch
@@ -0,0 +1,38 @@
+From 71aaeaf020340412b8d012fe23a556c0420eda5f Mon Sep 17 00:00:00 2001
+From: Matthias Clasen <mclasen@redhat.com>
+Date: Fri, 17 Aug 2018 22:29:36 -0400
+Subject: [PATCH] Prevent an assertion with invalid Unicode sequences
+
+Invalid Unicode sequences, such as 0x2665 0xfe0e 0xfe0f,
+can trick the Emoji iter code into returning an empty
+segment, which then triggers an assertion in the itemizer.
+
+Prevent this by ensuring that we make progress.
+
+This issue was reported by Jeffrey M.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ pango/pango-emoji.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/pango/pango-emoji.c b/pango/pango-emoji.c
+index 0e332dff..29472452 100644
+--- a/pango/pango-emoji.c
++++ b/pango/pango-emoji.c
+@@ -253,6 +253,12 @@ _pango_emoji_iter_next (PangoEmojiIter *iter)
+     if (iter->is_emoji == PANGO_EMOJI_TYPE_IS_EMOJI (current_emoji_type))
+     {
+       iter->is_emoji = !PANGO_EMOJI_TYPE_IS_EMOJI (current_emoji_type);
++
++      /* Make sure we make progress.  Weird sequences, like a VC15 followed
++       * by VC16, can trick us into stalling otherwise. */
++      if (iter->start == iter->end)
++        iter->end = g_utf8_next_char (iter->end);
++
+       return TRUE;
+     }
+   }
+-- 
+2.11.0
+
