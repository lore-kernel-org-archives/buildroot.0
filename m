From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Feb 2016 17:25:54 +0100
Subject: [Buildroot] [git commit] support/misc: Adding Vagrant file for
	provisioning
Message-ID: <20160204162631.1423980065@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=778026b94db1d050102d73eea5dc1fb9baedb7d7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds a Vagrant file to buildroot. With this file
you can provision a complete buildroot developing environment
in minutes on all major platforms (Linux/Mac/Windows).

[Peter: bump to 2GB RAM, hardcode Buildroot release, add unzip,
	drop website update and tweak manual text as suggested by Yann]
Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/getting.txt  | 18 ++++++++++++++++
 support/misc/Vagrantfile | 56 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+)

diff --git a/docs/manual/getting.txt b/docs/manual/getting.txt
index 3437f93..bb63cab 100644
--- a/docs/manual/getting.txt
+++ b/docs/manual/getting.txt
@@ -10,6 +10,24 @@ November. Release numbers are in the format YYYY.MM, so for example
 
 Release tarballs are available at http://buildroot.org/downloads/[].
 
+For your convenience, a https://www.vagrantup.com/[Vagrantfile] is
+available in `support/misc/Vagrantfile` in the Buildroot source tree
+to quickly set up a virtual machine with the needed dependencies to
+get started.
+
+If you want to setup an isolated buildroot environment on Linux or Mac
+Os X, paste this line onto your terminal:
+
+--------------------
+wget https://buildroot.org/downloads/Vagrantfile; vagrant up
+--------------------
+
+If you are on Windows, paste this into your powershell:
+
+--------------------
+(new-object System.Net.WebClient).DownloadFile("https://buildroot.org/downloads/Vagrantfile","Vagrantfile"); vagrant up
+--------------------
+
 If you want to follow development, you can use the daily snapshots or
 make a clone of the Git repository. Refer to the
 http://buildroot.org/download[Download page] of the Buildroot website
diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
new file mode 100644
index 0000000..c376837
--- /dev/null
+++ b/support/misc/Vagrantfile
@@ -0,0 +1,56 @@
+################################################################################
+#
+# Vagrantfile
+#
+################################################################################
+
+# Buildroot version to use
+RELEASE='2015.11.1'
+
+### Change here for more memory/cores ###
+VM_MEMORY=2048
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
+		config.vm.provider :vmware_fusion do |v, override|
+			v.vmx['displayname'] = "Buildroot #{RELEASE}"
+		end
+
+		config.vm.provider :virtualbox do |v, override|
+			v.name = "Buildroot #{RELEASE}"
+		end
+	end
+
+	config.vm.provision 'shell', inline:
+		"sudo dpkg --add-architecture i386
+		sudo apt-get -q update
+		sudo apt-get -q -y install build-essential libncurses5-dev \
+			git bzr cvs mercurial subversion libc6:i386 unzip
+		sudo apt-get -q -y autoremove
+		sudo apt-get -q -y clean"
+
+	config.vm.provision 'shell', privileged: false, inline:
+		"echo 'Downloading and extracting buildroot #{RELEASE}'
+		wget -q -c http://buildroot.org/downloads/buildroot-#{RELEASE}.tar.gz
+		tar axf buildroot-#{RELEASE}.tar.gz"
+end
