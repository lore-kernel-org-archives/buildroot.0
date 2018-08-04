From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  4 Aug 2018 18:33:05 +0200
Subject: [Buildroot] [PATCH 3/3] support/download: detect and abort when
 using a git branch by name
In-Reply-To: <cover.1533400367.git.yann.morin.1998@free.fr>
References: <cover.1533400367.git.yann.morin.1998@free.fr>
Message-ID: <d1cdffd986d2f2128396aa785d542fdd3d2c90e0.1533400367.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using a git branch by its name does not work as people expect:

 1. due to local caching, Buildroot will not re-fetch the repository,
    so people that expect to be able to follow the remote repository
    will be quite surprised and disapointed;

 2. if the user removes the local cache, then the build is no longer
    reproducible, because the remote repository may change any time
    between two builds, and people will be quite surprised and
    disapointed.

In either case, users are surprised and disapointed, which is a sad
state of matters. :-(

So, detect if the changeset requested is a branch by name, and abort
in that case.

Note that this only applies to using a branch by name. Any other mean
of using the branch (tag, sha1) is still supported, of course.

Note also that the download wrapper still first tries from the local
cache, then from the primary site (if set), and falls back to trying
the mirror eventually (if set). This is not a problem per-se, because
a malicious user that is capable of pre-seeding either locations with
a matching archive already gamed the system, and there is nothing we
can do to prevent that...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/download/git | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/support/download/git b/support/download/git
index 11bb52c1e1..28391b908b 100755
--- a/support/download/git
+++ b/support/download/git
@@ -134,6 +134,13 @@ if ! _git rev-parse --quiet --verify "'${cset}^{commit}'" >/dev/null 2>&1; then
     exit 1
 fi
 
+# Check if the changeset is a branch name.
+if _git show-ref "${cset}" |grep -qv refs/tags; then
+    printf "Commit '%s' is a branch name.\n" "${cset}"
+    printf "Using a branch name is not supported.\n"
+    exit 1
+fi
+
 # The new cset we want to checkout might have different submodules, or
 # have sub-dirs converted to/from a submodule. So we would need to
 # deregister _current_ submodules before we checkout.
-- 
2.14.1
