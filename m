From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Feb 2017 21:15:13 +0100
Subject: [Buildroot] [git commit] support/misc/Vagrantfile: reorganize
	provisioning
Message-ID: <20170226201826.7BB0E81E16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=410082e1d980668385ffd2993920785e0fffd2c1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

* Remove distribution upgrade cause it slows down the first boot and
  presents a bug when executed non interactively.

* Reorganize provision scripts to be in privileged and non privileged
  sections

* Add Ubuntu mirror automatic handling for apt packages sources

Fixes bug #9581

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/misc/Vagrantfile | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index dc4c15d..89973ce 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -41,19 +41,20 @@ Vagrant.configure('2') do |config|
 		end
 	end
 
-	config.vm.provision 'shell', inline:
-		"sudo dpkg --add-architecture i386
-		sudo apt-get -q update
-		sudo apt-get purge -q -y snapd lxcfs lxd ubuntu-core-launcher snap-confine
-		sudo apt-get -q -y upgrade
-		sudo apt-get -q -y install build-essential libncurses5-dev \
+	config.vm.provision 'shell', privileged: true, inline:
+		"sed -i 's|deb http://us.archive.ubuntu.com/ubuntu/|deb mirror://mirrors.ubuntu.com/mirrors.txt|g' /etc/apt/sources.list
+		dpkg --add-architecture i386
+		apt-get -q update
+		apt-get purge -q -y snapd lxcfs lxd ubuntu-core-launcher snap-confine
+		apt-get -q -y install build-essential libncurses5-dev \
 			git bzr cvs mercurial subversion libc6:i386 unzip bc
-		sudo apt-get -q -y autoremove
-		sudo apt-get -q -y clean
-		sudo update-locale LC_ALL=C"
+		apt-get -q -y autoremove
+		apt-get -q -y clean
+		update-locale LC_ALL=C"
 
 	config.vm.provision 'shell', privileged: false, inline:
 		"echo 'Downloading and extracting buildroot #{RELEASE}'
 		wget -q -c http://buildroot.org/downloads/buildroot-#{RELEASE}.tar.gz
 		tar axf buildroot-#{RELEASE}.tar.gz"
+
 end
