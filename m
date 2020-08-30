From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 30 Aug 2020 17:59:53 +0200
Subject: [Buildroot] [PATCH] support/misc/gitlab-ci.yml.in: include Branches
 workflow
Message-ID: <20200830155953.1650346-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Recently, gitlab-ci has gained a lot more flexibility in when pipelines
are created. As a side-effect of this, double pipelines may be created
when a `when` clause is used in some job. Avoid this by adding a
workflow that launches it only on branches. See [1] and [2].

Note that in reality, the duplicate pipelines only occur for merge
requests. Since we don't have merge requests, we don't have this
problem. Howver, gitlab also displays an annoying error message on the
pipeline page [3], and it sends an error mail to the triggerer (i.e.,
Arnout), so it's still useful to do this.

[1] https://docs.gitlab.com/ee/ci/yaml/README.html#prevent-duplicate-pipelines
[2] https://docs.gitlab.com/ee/ci/yaml/README.html#workflowrules-templates
[3] https://gitlab.com/buildroot.org/buildroot/-/pipelines/183589361/builds

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
I'd like to get this one in master, because the e-mails are annoying me
:-)
---
 support/misc/gitlab-ci.yml.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
index dddebf09e9..8a031898ef 100644
--- a/support/misc/gitlab-ci.yml.in
+++ b/support/misc/gitlab-ci.yml.in
@@ -1,6 +1,9 @@
 # Configuration for Gitlab-CI.
 # Builds appear on https://gitlab.com/buildroot.org/buildroot/pipelines
 
+include:
+  - template: 'Workflows/Branch-Pipelines.gitlab-ci.yml'
+
 image: buildroot/base:20200814.2228
 
 .check_base:
-- 
2.26.2
