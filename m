From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Wed, 18 Nov 2015 23:51:35 +0100
Subject: [Buildroot] [PATCH v3] support/misc: Adding Vagrant file for
	provisioning
Message-ID: <1447887095-16773-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a Vagrant file to buildroot. With this file
you can provision a complete buildroot developing environment
in minutes on all major platforms (Linux/Mac/Windows).

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changelog

v2 -> v3:

* Better handling of virtualbox provider options

v1 -> v2:

* Scraping latest version number from website (suggested by Arnout Vandecappelle)
* Added libc i386 dependency for precompiled toolchains (suggested by Arnout Vandecappelle)

 docs/manual/getting.txt    | 14 +++++++++++
 docs/website/download.html | 17 +++++++++++++
 support/misc/Vagrantfile   | 59 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 90 insertions(+)
 create mode 100644 support/misc/Vagrantfile

diff --git a/docs/manual/getting.txt b/docs/manual/getting.txt
index 3437f93..84e1f54 100644
--- a/docs/manual/getting.txt
+++ b/docs/manual/getting.txt
@@ -10,6 +10,20 @@ November. Release numbers are in the format YYYY.MM, so for example
 
 Release tarballs are available at http://buildroot.org/downloads/[].
 
+An official https://www.vagrantup.com/[Vagrantfile] is distributed within buildroot for your needs.
+If you want to setup an isolated buildroot environment on Linux or
+Mac Os X, paste this line onto your terminal:
+
+--------------------
+curl -O http://git.buildroot.net/buildroot/plain/support/misc/Vagrantfile; vagrant up
+--------------------
+
+If you are on Windows, paste this into your powershell:
+
+--------------------
+(new-object System.Net.WebClient).DownloadFile("http://git.buildroot.net/buildroot/plain/support/misc/Vagrantfile","Vagrantfile"); vagrant up
+--------------------
+
 If you want to follow development, you can use the daily snapshots or
 make a clone of the Git repository. Refer to the
 http://buildroot.org/download[Download page] of the Buildroot website
diff --git a/docs/website/download.html b/docs/website/download.html
index a6c2ac0..00e24bc 100644
--- a/docs/website/download.html
+++ b/docs/website/download.html
@@ -32,6 +32,23 @@ This and earlier releases (and their PGP signatures) can always be downloaded fr
 
 <p>
 
+<p>
+An official <a href="https://www.vagrantup.com/">Vagrantfile</a>
+is distributed within buildroot for your needs.
+If you want to setup an isolated buildroot environment on Linux or
+Mac Os X, paste this line onto your terminal:
+
+<pre>
+curl -O http://git.buildroot.net/buildroot/plain/support/misc/Vagrantfile; vagrant up
+</pre>
+
+If you are on Windows, paste this into your powershell:
+
+<pre>
+(new-object System.Net.WebClient).DownloadFile("http://git.buildroot.net/buildroot/plain/support/misc/Vagrantfile","Vagrantfile"); vagrant up
+</pre>
+</p>
+
 You can also obtain daily snapshots of the latest Buildroot source tree if you
 want to follow development, but cannot or do not wish to use Git.
 
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
new file mode 100644
index 0000000..93a7cf8
--- /dev/null
+++ b/support/misc/Vagrantfile
@@ -0,0 +1,59 @@
+################################################################################
+#
+# Vagrantfile
+#
+################################################################################
+
+### Change here for more memory/cores ###
+VM_MEMORY=1024
+VM_CORES=1
+
+Vagrant.configure('2') do |config|
+	config.vm.box = 'ubuntu/trusty64'
+
+	config.vm.provider :vmware_fusion do |v, override|
+		v.vmx['memsize'] = VM_MEMORY
+		v.vmx['numvcpus'] = VM_CORES
+	end
+
+	config.vm.provider :virtualbox do |v, override|
+		v.memory = VM_MEMORY
+		v.cpus = VM_CORES
+		
+		required_plugins = %w( vagrant-vbguest )
+		required_plugins.each do |plugin|
+		  system "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
+		end
+	end
+
+	config.vm.provision 'shell' do |s|
+		s.inline = 'echo Setting up machine name'
+
+		require 'open-uri'
+		open('http://buildroot.org/download.html') do |f|
+			$buildroot_version = f.read.lines.grep(/The latest stable release/)[0]
+				.split('<b>')[1].split('</b>')[0]
+		end
+
+		config.vm.provider :vmware_fusion do |v, override|
+			v.vmx['displayname'] = "Buildroot #{$buildroot_version}"
+		end
+
+		config.vm.provider :virtualbox do |v, override|
+			v.name = "Buildroot #{$buildroot_version}"
+		end
+	end
+
+	config.vm.provision 'shell', inline:
+		"sudo dpkg --add-architecture i386
+		sudo apt-get -q update
+		sudo apt-get -q -y install build-essential libncurses5-dev \
+			git bzr cvs mercurial subversion libc6:i386
+		sudo apt-get -q -y autoremove
+		sudo apt-get -q -y clean"
+
+	config.vm.provision 'shell', privileged: false, inline:
+		"echo 'Downloading and extracting buildroot #{$buildroot_version}'
+		wget -q -c http://buildroot.org/downloads/buildroot-#{$buildroot_version}.tar.gz
+		tar axf buildroot-#{$buildroot_version}.tar.gz"
+end
-- 
1.9.1
