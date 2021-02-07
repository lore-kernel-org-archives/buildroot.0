From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Feb 2021 10:32:40 +0100
Subject: [Buildroot] [git commit] package/pkg-utils: escape \ in generated
 legal-info
Message-ID: <20210207091616.40FA3807E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e4c284e6b931fb4eabda57322fbcede798f63bef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In the output of legal-info, which is JSON-formatted, we include the
CPI_ID (when it is valid).

For xerces, the CPE_ID contains two sequences of \+ (which is exactly
what is present in the NIST DB, [0]).

However, in JSON, like in C, \ escapes the following character; only a
very limited set of characters are valid to escape: " \ / b f n r t u.
Escaping any other character is invalid. Conformant JSON parser will
choke on invalid sequences, and so does not the json python module:

      File "/usr/lib/python2.7/json/decoder.py", line 380, in raw_decode
        obj, end = self.scan_once(s, idx)
    ValueError: Invalid \escape: line 1 column 608554 (char 608553)

We fix that be globally escaping \ in our json output, in the generic
sanitising macro.

[0] https://nvd.nist.gov/products/cpe/detail/645?namingFormat=2.3&orderBy=CPEURI&keyword=xerces&status=FINAL

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-utils.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index d94041de24..d0fcdd4e1d 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -167,8 +167,9 @@ endef
 clean-json = $(strip \
 	$(subst $(comma)},}, $(subst $(comma)$(space)},$(space)}, \
 	$(subst $(comma)],], $(subst $(comma)$(space)],$(space)], \
+	$(subst \,\\, \
 		$(strip $(1)) \
-	)))) \
+	))))) \
 )
 
 ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
