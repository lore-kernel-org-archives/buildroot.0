From: Christian Stewart <christian@paral.in>
Date: Sun, 30 Aug 2020 18:07:54 -0700
Subject: [Buildroot] [PATCH 1/1] package/docker-cli: fix version ldflags
Message-ID: <20200831010754.92051-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The variables for the "docker version" output are located at
$(DOCKER_CLI_GOMOD)/cli/version - correct the path to these in the ldflags to
fix the following "unknown" lines in "docker version" output:

Client:
 Version:           unknown-version
 Git commit:        unknown-commit
 Built:             unknown-buildtime

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-cli/docker-cli.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 07700809d5..147807cfc9 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -15,8 +15,8 @@ DOCKER_CLI_DEPENDENCIES = host-pkgconf
 
 DOCKER_CLI_GOMOD = github.com/docker/cli
 DOCKER_CLI_LDFLAGS = \
-	-X $(DOCKER_CLI_GOMOD).GitCommit=$(DOCKER_CLI_VERSION) \
-	-X $(DOCKER_CLI_GOMOD).Version=$(DOCKER_CLI_VERSION)
+	-X $(DOCKER_CLI_GOMOD)/cli/version.GitCommit=$(DOCKER_CLI_VERSION) \
+	-X $(DOCKER_CLI_GOMOD)/cli/version.Version=$(DOCKER_CLI_VERSION)
 
 DOCKER_CLI_BUILD_TARGETS = $(DOCKER_CLI_GOMOD)/cmd/docker
 DOCKER_CLI_TAGS = autogen
-- 
2.28.0
