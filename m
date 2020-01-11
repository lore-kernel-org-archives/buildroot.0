From: Christian Stewart <christian@paral.in>
Date: Fri, 10 Jan 2020 20:13:54 -0800
Subject: [Buildroot] [PATCH v2 5/6] package/docker-cli: fix go-module
 package identifier
In-Reply-To: <20200111041355.21705-1-christian@paral.in>
References: <20200111041355.21705-1-christian@paral.in>
Message-ID: <20200111041355.21705-5-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/docker-cli/docker-cli.mk | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 4ad30e0278..12fb563885 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -13,12 +13,13 @@ DOCKER_CLI_LICENSE_FILES = LICENSE
 
 DOCKER_CLI_DEPENDENCIES = host-pkgconf
 
-DOCKER_CLI_TAGS = autogen
-DOCKER_CLI_BUILD_TARGETS = cmd/docker
-
+DOCKER_CLI_GOMOD = github.com/docker/cli
 DOCKER_CLI_LDFLAGS = \
-	-X github.com/docker/cli/cli.GitCommit=$(DOCKER_CLI_VERSION) \
-	-X github.com/docker/cli/cli.Version=$(DOCKER_CLI_VERSION)
+	-X $(DOCKER_CLI_GOMOD).GitCommit=$(DOCKER_CLI_VERSION) \
+	-X $(DOCKER_CLI_GOMOD).Version=$(DOCKER_CLI_VERSION)
+
+DOCKER_CLI_BUILD_TARGETS = $(DOCKER_CLI_GOMOD)/cmd/docker
+DOCKER_CLI_TAGS = autogen
 
 ifeq ($(BR2_PACKAGE_DOCKER_CLI_STATIC),y)
 DOCKER_CLI_LDFLAGS += -extldflags '-static'
-- 
2.24.1
