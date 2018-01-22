From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 21 Jan 2018 22:44:41 -0200
Subject: [Buildroot] [PATCH 13/14] support/dockerfile: allow to install
 packages
In-Reply-To: <1516581882-30582-1-git-send-email-ricardo.martincoski@gmail.com>
References: <1516581882-30582-1-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <1516581882-30582-14-git-send-email-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Some tools in the Docker image can be useful to a single test only.
Allow tests to install packages on the fly instead of adding everything
to the base Docker image.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
For a demo, see the beginning of the log at this job:
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/48876752
---
 support/docker/Dockerfile | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index ebb471f..9d115d8 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -20,7 +20,8 @@ RUN apt-get install -y -qq --no-install-recommends \
     cvs bzr git mercurial subversion wget \
     cpio unzip \
     libncurses5-dev \
-    python-nose2 python-pexpect qemu-system-arm qemu-system-x86
+    python-nose2 python-pexpect qemu-system-arm qemu-system-x86 \
+    sudo
 RUN apt-get -q -y autoremove
 RUN apt-get -q -y clean
 
@@ -31,6 +32,11 @@ RUN /usr/sbin/locale-gen
 RUN useradd -ms /bin/bash br-user
 RUN chown -R br-user:br-user /home/br-user
 
+# Allow user to install packages
+RUN adduser br-user sudo
+RUN echo "br-user ALL = NOPASSWD : /usr/bin/apt-get" > /etc/sudoers.d/apt-get
+RUN chmod 440 /etc/sudoers.d/apt-get
+
 USER br-user
 WORKDIR /home/br-user
 ENV HOME /home/br-user
-- 
2.7.4
