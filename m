From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu, 10 Sep 2015 00:01:47 +0200
Subject: [Buildroot] [PATCH] RFC: Adding Vagrant file for provisioning
Message-ID: <1441836107-17689-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a Vagrant file to buildroot. With this file
you can provision a complete buildroot developing environment
in minutes on all major platforms.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---

This patch is a tentative approach to add a standard and official
Vagrant file to buildroot. With this file you can setup an isolated
build environment based on Vagrant on all major platforms.

The file is fairly basic right now, it sets up correct Ubuntu version
to download and install required packages for buildroot.

I'm open to suggestions and critics!

 docs/manual/getting.txt    |  7 +++++++
 docs/website/download.html |  9 +++++++++
 support/misc/Vagrantfile   | 42 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 58 insertions(+)
 create mode 100644 support/misc/Vagrantfile

diff --git a/docs/manual/getting.txt b/docs/manual/getting.txt
index 3437f93..5b96928 100644
--- a/docs/manual/getting.txt
+++ b/docs/manual/getting.txt
@@ -10,6 +10,13 @@ November. Release numbers are in the format YYYY.MM, so for example
 
 Release tarballs are available at http://buildroot.org/downloads/[].
 
+If you want an isolated developing environment with Vagrant, paste this
+line in your terminal:
+
+--------------------
+wget http://git.buildroot.net/buildroot/tree/support/misc/Vagrantfile; vagrant up
+--------------------
+
 If you want to follow development, you can use the daily snapshots or
 make a clone of the Git repository. Refer to the
 http://buildroot.org/download[Download page] of the Buildroot website
diff --git a/docs/website/download.html b/docs/website/download.html
index ef87b1c..ece0f19 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -32,6 +32,15 @@ This and earlier releases (and their PGP signatures) can always be downloaded fr
 
 <p>
 
+<p>
+If you want an isolated developing environment with Vagrant, paste this
+line in your terminal:
+
+--------------------
+wget http://git.buildroot.net/buildroot/tree/support/misc/Vagrantfile; vagrant up
+--------------------
+</p>
+
 You can also obtain daily snapshots of the latest Buildroot source tree if you
 want to follow development, but cannot or do not wish to use Git.
 
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
new file mode 100644
index 0000000..e8162f9
--- /dev/null
+++ b/support/misc/Vagrantfile
@@ -0,0 +1,42 @@
+################################################################################
+#
+# Vagrant file
+#
+################################################################################
+
+### Change here for more memory/cores or different version ###
+VM_MEMORY=1024
+VM_CORES=1
+BUILDROOT_VERSION="2015.08.1"
+
+$sudo_script = <<SCRIPT
+sudo apt-get update
+sudo apt-get -y autoremove
+sudo apt-get -y install build-essential libncurses5-dev \
+	git bzr cvs mercurial subversion
+SCRIPT
+
+$script = <<SCRIPT
+echo "Downloading http://buildroot.org/downloads/buildroot-#{BUILDROOT_VERSION}.tar.gz"
+curl -s http://buildroot.org/downloads/buildroot-#{BUILDROOT_VERSION}.tar.gz | tar zx
+SCRIPT
+
+Vagrant.configure("2") do |config|
+  config.vm.box = "ubuntu/trusty64"
+
+  config.vm.provider :vmware_fusion do |v, override|
+    v.vmx["numvcpus"] = VM_CORES
+    v.vmx["memsize"] = VM_MEMORY
+    v.vmx['displayname'] = 'Buildroot'
+  end
+
+  config.vm.provider :virtualbox do |v, override|
+	v.name = "Buildroot"
+	v.customize ["modifyvm", :id, "--name", "Buildroot"]
+    v.customize ["modifyvm", :id, "--memory", VM_MEMORY]
+    v.customize ["modifyvm", :id, "--cpus", VM_CORES]
+  end
+
+  config.vm.provision "shell", inline: $sudo_script
+  config.vm.provision "shell", privileged: false, inline: $script
+end
-- 
1.9.1
