From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 1 Sep 2020 22:20:34 +0200
Subject: [Buildroot] [git commit] package/docker-cli: fix version ldflags
Message-ID: <20200902161640.400A485EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9a262b4054e2c25d6c6009948bb35a2f6f4e276a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The variables for the "docker version" output are located at
$(DOCKER_CLI_GOMOD)/cli/version - correct the path to these in the ldflags to
fix the following "unknown" lines in "docker version" output:

Client:
 Version:           unknown-version
 Git commit:        unknown-commit
 Built:             unknown-buildtime

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/docker-cli/docker-cli.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index fd96ff9f35..8607425efa 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -17,8 +17,8 @@ DOCKER_CLI_BUILD_TARGETS = cmd/docker
 DOCKER_CLI_GOMOD = github.com/docker/cli
 
 DOCKER_CLI_LDFLAGS = \
-	-X $(DOCKER_CLI_GOMOD)/cli.GitCommit=$(DOCKER_CLI_VERSION) \
-	-X $(DOCKER_CLI_GOMOD)/cli.Version=$(DOCKER_CLI_VERSION)
+	-X $(DOCKER_CLI_GOMOD)/cli/version.GitCommit=$(DOCKER_CLI_VERSION) \
+	-X $(DOCKER_CLI_GOMOD)/cli/version.Version=$(DOCKER_CLI_VERSION)
 
 ifeq ($(BR2_PACKAGE_DOCKER_CLI_STATIC),y)
 DOCKER_CLI_LDFLAGS += -extldflags '-static'
