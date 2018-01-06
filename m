From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  6 Jan 2018 16:28:33 +0100
Subject: [Buildroot] [PATCH] support/dockerfile: add directives to run as
 non-root
Message-ID: <20180106152833.10111-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 support/docker/Dockerfile | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index d45b23dc23..ebb471f7e5 100644
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
-- 
2.11.0
