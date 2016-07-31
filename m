From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  1 Aug 2016 00:35:56 +0200
Subject: [Buildroot] [PATCH 2/2 v2] support/download: be more conservative
	about git special refs
In-Reply-To: <cover.1470004037.git.yann.morin.1998@free.fr>
References: <cover.1470004037.git.yann.morin.1998@free.fr>
Message-ID: <de318be75bdcad45f90ddb81d86911b72951e607.1470004037.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The git special refs (e.g. Github PRs, Gerrit changes...) are not
retrieved on non-bare clones; we need to fetch them manually.

However, we need not fetch any cset that is not such a special ref; it
only generates warning messages that are *really* confusing.

Instead, we now check if we have the cset we need, and only when it is
missing do we explicitly request it.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 support/download/git | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/support/download/git b/support/download/git
index e3be2e1..1c08c17 100755
--- a/support/download/git
+++ b/support/download/git
@@ -66,8 +66,12 @@ pushd "${basename}" >/dev/null
 # below, if there is an issue anyway. Since most of the cset we're gonna
 # have to clone are not such special refs, consign the output to oblivion
 # so as not to alarm unsuspecting users, but still trace it as a warning.
-if ! _git fetch origin "'${cset}:${cset}'" >/dev/null 2>&1; then
-    printf "Could not fetch special ref '%s'; assuming it is not special.\n" "${cset}"
+#
+# Only try to fetch such a special ref if we do not already have the
+# cset we need locally.
+#
+if ! _git rev-parse -q --verify "'${cset}^{commit}'" >/dev/null; then
+    _git fetch origin "'${cset}:${cset}'"
 fi
 
 # Checkout the required changeset, so that we can update the required
-- 
2.7.4
