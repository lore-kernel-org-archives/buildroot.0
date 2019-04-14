From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Apr 2019 22:17:16 +0200
Subject: [Buildroot] [PATCH 05/12 v2] infra/utils: add helper to generate
 comma-separated lists
In-Reply-To: <cover.1555273025.git.yann.morin.1998@free.fr>
References: <cover.1555273025.git.yann.morin.1998@free.fr>
Message-ID: <c1da3d005d552147d497686e45ae5e95423e1f81.1555273025.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a helper macro that, from a space-separated list of items, returns a
comma-separated list of the quoted items.

This will be useful when we need to generate lists in JSON, later...

Code suggested by Thomas P.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>

---
Changes v1 -> v2:
  - don't rely on implicit space in replacement text, instead use
    explicit $(space)  (Thmas DS)
---
 support/misc/utils.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/misc/utils.mk b/support/misc/utils.mk
index c44319338e..b422c67d76 100644
--- a/support/misc/utils.mk
+++ b/support/misc/utils.mk
@@ -70,6 +70,10 @@ finddirclauses = $(call notfirstword,$(patsubst %,-o -path '$(1)/%',$(2)))
 # notfirstword(wordlist): returns all but the first word in wordlist
 notfirstword = $(wordlist 2,$(words $(1)),$(1))
 
+# build a comma-separated list of quoted items, from a space-separated
+# list of unquoted items:   a b c d  -->  "a", "b", "c", "d"
+make-comma-list = $(subst $(space),$(comma)$(space),$(patsubst %,"%",$(strip $(1))))
+
 # Needed for the foreach loops to loop over the list of hooks, so that
 # each hook call is properly separated by a newline.
 define sep
-- 
2.14.1
