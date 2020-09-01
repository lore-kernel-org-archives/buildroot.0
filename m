From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Sep 2020 21:38:38 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/docker-cli: fix
 version info since move to 19.03.x
Message-ID: <20200901193237.8674B81344@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0ebd8c25d361933f2ea742aa835b92ee7e1b91e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Upstream changed the variables used when outputting version / git commit
info in docker version since:

 commit 04b5f44230162de40741acaa0f94c7af6f2fa1d5
 Author: Ian Campbell <ijc@docker.com>
 Date:   Tue Jan 8 15:03:51 2019 +0000

    Move versioning variables to a separate package.

    This helps to avoid circular includes, by separating the pure data out from the
    actual functionality in the cli subpackage, allowing other code which is
    imported to access the data.

    Signed-off-by: Ian Campbell <ijc@docker.com>
    Upstream-commit: 20c19830a95455e8562551aad52c715ad0807cc6
    Component: cli

Which is included in docker-cli 19.3.x - So adjust the _CLI_LDFLAGS to match
to get proper docker version output:

Client:
 Version:           19.03.11
 API version:       1.40
 Go version:        go1.13.14
 Git commit:        19.03.11

vs:

Client:
 Version:           unknown-version
 API version:       1.40
 Go version:        go1.13.14
 Git commit:        unknown-commit

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit bf27781bb1e87ff2d0beae3ce8dbb5564c5f398e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-cli/docker-cli.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 1466b0afbd..766c984f0b 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -17,8 +17,8 @@ DOCKER_CLI_TAGS = autogen
 DOCKER_CLI_BUILD_TARGETS = cmd/docker
 
 DOCKER_CLI_LDFLAGS = \
-	-X github.com/docker/cli/cli.GitCommit=$(DOCKER_CLI_VERSION) \
-	-X github.com/docker/cli/cli.Version=$(DOCKER_CLI_VERSION)
+	-X github.com/docker/cli/cli/version.GitCommit=$(DOCKER_CLI_VERSION) \
+	-X github.com/docker/cli/cli/version.Version=$(DOCKER_CLI_VERSION)
 
 ifeq ($(BR2_PACKAGE_DOCKER_CLI_STATIC),y)
 DOCKER_CLI_LDFLAGS += -extldflags '-static'
