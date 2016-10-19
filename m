From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Oct 2016 23:00:38 +0200
Subject: [Buildroot] [git commit] support/misc/Vagrantfile: bump to ubuntu
	16.04
Message-ID: <20161019210046.607DC81E4E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6294204686b93ffecdc2a0e486aea86b96a691c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Updating to ubuntu 16.04
* Fixing dependencies
* Fixing locale complaints
* Removing unused packages

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/misc/Vagrantfile | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index cf269fe..5e56d5d 100644
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
+		sudo update-locale LC_ALL=C"
 
 	config.vm.provision 'shell', privileged: false, inline:
 		"echo 'Downloading and extracting buildroot #{RELEASE}'
