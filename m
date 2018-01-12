From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Jan 2018 22:53:29 +0100
Subject: [Buildroot] [git commit] support/dockerfile: add directives to run
 as non-root
Message-ID: <20180112215335.2B1D482850@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff0ebec8a99205765ad188f5df301d7be6f42c47
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, our jobs on the gitlab-ci infra are running as root, which is
problematic for two reasons:

  - this is not the usual way Buildroot is built;
  - it may miss issues where running as non-root is problematic.

So, complement our Dockerfile with directives to add a new user and run
everything as that user, as demonstrated by this build job:
    https://gitlab.com/ymorin/buildroot-ci/-/jobs/46929562

Additional, enforce an UTF-8 locale while running.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/docker/Dockerfile | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index d45b23d..ebb471f 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -28,3 +28,10 @@ RUN apt-get -q -y clean
 RUN sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen
 RUN /usr/sbin/locale-gen
 
+RUN useradd -ms /bin/bash br-user
+RUN chown -R br-user:br-user /home/br-user
+
+USER br-user
+WORKDIR /home/br-user
+ENV HOME /home/br-user
+ENV LC_ALL en_US.UTF-8
