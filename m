From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat,  4 Feb 2017 23:33:54 +0100
Subject: [Buildroot] [PATCH 1/1] support/misc/Vagrantfile: Enable website
Message-ID: <1486247634-5995-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch enables buildroot website inside Vagrant
and makes it accessible on localhost:8888 outside. It could be
usefull for website development or simply navigating it
without internet access.

* Removed apt-get update to speedup first boot
* Moved archive download at first to accomodate Apache
* Added Apache configuration via here document
* Added 80 to 8888 port redirection

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 support/misc/Vagrantfile | 52 +++++++++++++++++++++++++++++++++++-------------
 1 file changed, 38 insertions(+), 14 deletions(-)

diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index dc4c15d..fefce5b 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -14,6 +14,8 @@ VM_CORES=1
 Vagrant.configure('2') do |config|
 	config.vm.box = 'bento/ubuntu-16.04'
 
+	config.vm.network "forwarded_port", guest: 80, host: 8888
+
 	config.vm.provider :vmware_fusion do |v, override|
 		v.vmx['memsize'] = VM_MEMORY
 		v.vmx['numvcpus'] = VM_CORES
@@ -41,19 +43,41 @@ Vagrant.configure('2') do |config|
 		end
 	end
 
-	config.vm.provision 'shell', inline:
-		"sudo dpkg --add-architecture i386
-		sudo apt-get -q update
-		sudo apt-get purge -q -y snapd lxcfs lxd ubuntu-core-launcher snap-confine
-		sudo apt-get -q -y upgrade
-		sudo apt-get -q -y install build-essential libncurses5-dev \
-			git bzr cvs mercurial subversion libc6:i386 unzip bc
-		sudo apt-get -q -y autoremove
-		sudo apt-get -q -y clean
-		sudo update-locale LC_ALL=C"
-
 	config.vm.provision 'shell', privileged: false, inline:
-		"echo 'Downloading and extracting buildroot #{RELEASE}'
-		wget -q -c http://buildroot.org/downloads/buildroot-#{RELEASE}.tar.gz
-		tar axf buildroot-#{RELEASE}.tar.gz"
+"echo 'Downloading and extracting buildroot #{RELEASE}'
+wget -q -c http://buildroot.org/downloads/buildroot-#{RELEASE}.tar.gz
+tar axf buildroot-#{RELEASE}.tar.gz"
+
+	config.vm.provision 'shell', privileged: true, inline:
+"sed -i 's|deb http://us.archive.ubuntu.com/ubuntu/|deb mirror://mirrors.ubuntu.com/mirrors.txt|g' /etc/apt/sources.list
+dpkg --add-architecture i386
+apt-get -q update
+apt-get purge -q -y snapd lxcfs lxd ubuntu-core-launcher snap-confine
+apt-get -q -y install build-essential libncurses5-dev \
+	git bzr cvs mercurial subversion libc6:i386 unzip bc \
+	apache2
+apt-get -q -y autoremove
+apt-get -q -y clean
+update-locale LC_ALL=C
+
+# Configure Apache for buildroot website
+a2enmod include
+cat << EOF > /etc/apache2/sites-enabled/000-default.conf
+<VirtualHost *:80>
+ServerAdmin webmaster at localhost
+DocumentRoot /home/vagrant/buildroot-#{RELEASE}/docs/website/
+ErrorLog ${APACHE_LOG_DIR}/error.log
+CustomLog ${APACHE_LOG_DIR}/access.log combined
+<Directory />
+Options Indexes FollowSymLinks Includes ExecCGI Includes
+AllowOverride All
+Require all granted
+Allow from all
+AddType text/html .html
+AddOutputFilter INCLUDES .html
+</Directory>
+</VirtualHost>
+EOF
+service apache2 restart"
+
 end
-- 
2.7.4
