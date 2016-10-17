From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 17 Oct 2016 08:39:46 +0200
Subject: [Buildroot] [PATCH] support/misc/Vagrantfile: bump to ubuntu 16.04
Message-ID: <1476686386-31512-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Updating to ubuntu 16.04
* Fixing dependencies
* Fixing locale complaints
* Removing unused packages

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 support/misc/Vagrantfile | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index cf269fe..01262b7 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -12,7 +12,7 @@ VM_MEMORY=2048
 VM_CORES=1
 
 Vagrant.configure('2') do |config|
-	config.vm.box = 'ubuntu/trusty64'
+	config.vm.box = 'bento/ubuntu-16.04'
 
 	config.vm.provider :vmware_fusion do |v, override|
 		v.vmx['memsize'] = VM_MEMORY
@@ -44,10 +44,13 @@ Vagrant.configure('2') do |config|
 	config.vm.provision 'shell', inline:
 		"sudo dpkg --add-architecture i386
 		sudo apt-get -q update
+		sudo apt-get purge -q -y snapd lxcfs lxd ubuntu-core-launcher snap-confine
+		sudo apt-get -q -y upgrade
 		sudo apt-get -q -y install build-essential libncurses5-dev \
-			git bzr cvs mercurial subversion libc6:i386 unzip
+			git bzr cvs mercurial subversion libc6:i386 unzip bc
 		sudo apt-get -q -y autoremove
-		sudo apt-get -q -y clean"
+		sudo apt-get -q -y clean
+		sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8"
 
 	config.vm.provision 'shell', privileged: false, inline:
 		"echo 'Downloading and extracting buildroot #{RELEASE}'
-- 
2.7.4
