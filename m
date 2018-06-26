From: Sven Neumann <neumann@teufel.de>
Date: Tue, 26 Jun 2018 11:36:17 +0200
Subject: [Buildroot] [PATCH] git-download: Fix downloading of specific
 revisions from github.
Message-ID: <20180626093617.13034-1-neumann@teufel.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Oliver Tappe <zooey@hirschkaefer.de>

Github has recently dropped support for the archive-URLs that we
used to use.

They do provide another URL where archives can be fetched from, but
not as git shallow clone, but direcly as tarball. Adjust the URL to
be used and adjust the git download script to use wget when trying
to download from github.

Signed-off-by: Oliver Tappe <zooey@hirschkaefer.de>
Signed-off-by: Sven Neumann <neumann@teufel.de>
---
 package/pkg-download.mk | 2 +-
 support/download/git    | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 2ca6ccf44d..2e3b734f97 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -56,7 +56,7 @@ notdomain = $(patsubst $(call domain,$(1),$(2))$(call domainseparator,$(2))%,%,$
 domainseparator = $(if $(1),$(1),/)
 
 # github(user,package,version): returns site of GitHub repository
-github = https://github.com/$(1)/$(2)/archive/$(3)
+github = https://api.github.com/repos/$(1)/$(2)/tarball/$(3)
 
 # Expressly do not check hashes for those files
 # Exported variables default to immediately expanded in some versions of
diff --git a/support/download/git b/support/download/git
index 11bb52c1e1..1efde4fcdc 100755
--- a/support/download/git
+++ b/support/download/git
@@ -75,6 +75,12 @@ _git() {
     eval GIT_DIR="${git_cache}/.git" ${GIT} "${@}"
 }
 
+# If the URL contains github, simply fetch the archive via wget:
+if [[ $repo == https://api.github.com/* ]]; then
+    wget -O $output $repo
+    exit 0
+fi
+
 # Create a warning file, that the user should not use the git cache.
 # It's ours. Our precious.
 cat <<-_EOF_ >"${dl_dir}/git.readme"
-- 
2.14.4
