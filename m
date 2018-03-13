From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Mar 2018 22:32:36 +0100
Subject: [Buildroot] [git commit] support/dockerfile: install flake8
Message-ID: <20180313213834.A6CCD81428@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=14aa15a5a583cf1621880f422f27296180a3d73a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the latest version of the tool because it is actively maintained.
But use a fixed version of the tool and its dependencies to get stable
results. It can be manually bumped from time to time.

Before installing any Python packages, ensure pip, setuptools, and wheel
are up to date as recommended in the docs [1].

[1] https://packaging.python.org/tutorials/installing-packages/

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/docker/Dockerfile | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index ce3fdd9cc2..f01ac25f93 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -27,10 +27,19 @@ RUN dpkg --add-architecture i386 && \
         cvs bzr git mercurial subversion wget \
         cpio unzip \
         libncurses5-dev \
-        python-nose2 python-pexpect qemu-system-arm qemu-system-x86 && \
+        python-nose2 python-pexpect qemu-system-arm qemu-system-x86 \
+        python-pip && \
     apt-get -y autoremove && \
     apt-get -y clean
 
+# For check-flake8
+RUN python -m pip install --upgrade pip setuptools wheel && \
+    pip install -q \
+        flake8==3.5.0 \
+        mccabe==0.6.1 \
+        pycodestyle==2.3.1 \
+        pyflakes==1.6.0
+
 # To be able to generate a toolchain with locales, enable one UTF-8 locale
 RUN sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen && \
     /usr/sbin/locale-gen
