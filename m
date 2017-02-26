From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sun, 26 Feb 2017 16:08:49 +0100
Subject: [Buildroot] [PATCH] support/misc/Vagrantfile: reorgainzing
	provisioining
Message-ID: <1488121729-29214-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Removed distribution upgrade cause it slows down the first boot
  and presents a bug when executeted non interactively.
* Reorganized provsion scripts to be in privileged and
  non privileged sections
* Added ubuntu mirror automatic hadling for apt packages
  sources

Fixes: http://bugs.busybox.net/show_bug.cgi?id=9581
Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
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
-- 
2.7.4
