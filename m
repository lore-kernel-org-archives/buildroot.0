From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Jun 2018 11:08:18 +0200
Subject: [Buildroot] [PATCH 1/5] support/docker: run apt-get update and
 apt-get install in two RUNs
In-Reply-To: <cover.1528016895.git.yann.morin.1998@free.fr>
References: <cover.1528016895.git.yann.morin.1998@free.fr>
Message-ID: <474022096f189332bf42c3da6e299b85f252efed.1528016895.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In commit 7517aef4d (support/docker: limit the number of layers),
we reduced the number of layers by coalescing multiple RUN commands
into less commands.

In doing so, we especially coalesced "apt-get update" with "apt-get
install".

However, the distribution we used is a pinned version of stretch, so
we know that running apt-get update will always yield the same apt
database.

If we split the two apt-get commands, then we can re-use any local
intermediate image when we need to update the list of packages to
install; this helps quite a bit when testing the docker files over
and over again, with just slight variants in the packages list.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 support/docker/Dockerfile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index f01ac25f93..8c525f7cf1 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -20,8 +20,8 @@ COPY apt-sources.list /etc/apt/sources.list
 
 # The container has no package lists, so need to update first
 RUN dpkg --add-architecture i386 && \
-    apt-get update -y && \
-    apt-get install -y --no-install-recommends \
+    apt-get update -y
+RUN apt-get install -y --no-install-recommends \
         build-essential cmake libc6:i386 g++-multilib \
         bc ca-certificates file locales rsync \
         cvs bzr git mercurial subversion wget \
-- 
2.14.1
