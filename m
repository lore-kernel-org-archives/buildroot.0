From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue,  1 Jun 2021 16:34:16 +0200
Subject: [Buildroot] [PATCHv4 11/16] package/sofia-sip: correct passing of
 '--enable-ndebug'
In-Reply-To: <20210601143422.25064-1-patrickdepinguin@gmail.com>
References: <20210601143422.25064-1-patrickdepinguin@gmail.com>
Message-ID: <20210601143422.25064-12-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

The preprocessor option NDEBUG, triggered by the configure option
'--enable-ndebug', should be read as 'no-debug'. When NDEBUG is set, asserts
are _disabled_.

The sofia-sip package had inverted logic, and set '--enable-ndebug' when
BR2_ENABLE_DEBUG was enabled, while it should be the other way around.

Reported-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
v4: new patch;
Even though the next patch will remove this block altogether, I keep this
correction as a separate patch to make it clear that the original code was
incorrect, and allow potential backporting to other branches.

 package/sofia-sip/sofia-sip.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
index 5c383400ff..274c72fce8 100644
--- a/package/sofia-sip/sofia-sip.mk
+++ b/package/sofia-sip/sofia-sip.mk
@@ -30,7 +30,7 @@ SOFIA_SIP_CONF_OPTS += \
 	--without-openssl
 endif
 
-ifeq ($(BR2_ENABLE_DEBUG),y)
+ifeq ($(BR2_ENABLE_DEBUG),)
 SOFIA_SIP_CONF_OPTS += --enable-ndebug
 endif
 
-- 
2.26.3
