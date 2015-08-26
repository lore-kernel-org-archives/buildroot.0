From: John O'Sullivan <john.osullivan@cloudiumsystems.com>
Date: Wed, 26 Aug 2015 11:36:14 +0100
Subject: [Buildroot] Support for linux kernel custom svn repository
Message-ID: <55DD969E.20409@cloudiumsystems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I have recently upgraded to buildroot-2015-05 from buildroot-2013-05. My custom kernel is held in an SVN repository and I had to alter buildroot-2013-05
  to support this. I was just wondering why this option is not available?

I made the following alterations but I am still hitting an error
In linux/Config.in I added an option for SVN

--- buildroot-2015.05/linux/Config.in	(revision 2165)
+++ buildroot-2015.05/linux/Config.in	(working copy)
@@ -62,6 +62,12 @@
  	  This option allows Buildroot to get the Linux kernel source
  	  code from a Git repository.
  
+config BR2_LINUX_KERNEL_CUSTOM_SVN
+	bool "Custom SVN repository"
+	help
+	  This option allows Buildroot to get the Linux kernel source
+	  code from a SVN repository.
+
  config BR2_LINUX_KERNEL_CUSTOM_HG
  	bool "Custom Mercurial repository"
  	help
@@ -84,22 +90,24 @@
  	string "URL of custom kernel tarball"
  	depends on BR2_LINUX_KERNEL_CUSTOM_TARBALL
  
-if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG
+if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG || BR2_LINUX_KERNEL_CUSTOM_SVN
  
  config BR2_LINUX_KERNEL_CUSTOM_REPO_URL
  	string "URL of custom repository"
-	default BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL \
-		if BR2_LINUX_KERNEL_CUSTOM_GIT_REPO_URL != ""  # legacy
+	default BR2_LINUX_KERNEL_CUSTOM_SVN_REPO_URL \
+		if BR2_LINUX_KERNEL_CUSTOM_SVN_REPO_URL != ""  # legacy
  
  config BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION
  	string "Custom repository version"
-	default BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION \
-		if BR2_LINUX_KERNEL_CUSTOM_GIT_VERSION != ""  # legacy
+	default BR2_LINUX_KERNEL_CUSTOM_SVN_VERSION \
+		if BR2_LINUX_KERNEL_CUSTOM_SVN_VERSION != ""  # legacy
  	help
  	  Revision to use in the typical format used by Git/Mercurial
  	  E.G. a sha id, a tag, branch, ..
  
  endif
+
+
  
  config BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH
  	string "Path to the local directory"
@@ -115,7 +123,7 @@
  		if BR2_LINUX_KERNEL_CUSTOM_VERSION
  	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
  	default BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION \
-		if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG
+		if BR2_LINUX_KERNEL_CUSTOM_GIT || BR2_LINUX_KERNEL_CUSTOM_HG || BR2_LINUX_KERNEL_CUSTOM_SVN
  	default "custom" if BR2_LINUX_KERNEL_CUSTOM_LOCAL
  
  #
This results in a config file with the following settings:

# BR2_LINUX_KERNEL_CUSTOM_VERSION is not set
# BR2_LINUX_KERNEL_CUSTOM_TARBALL is not set
# BR2_LINUX_KERNEL_CUSTOM_GIT is not set
BR2_LINUX_KERNEL_CUSTOM_SVN=y
# BR2_LINUX_KERNEL_CUSTOM_HG is not set
# BR2_LINUX_KERNEL_CUSTOM_LOCAL is not set
BR2_LINUX_KERNEL_CUSTOM_REPO_URL="$(SVN_ROOT)/linux-xlnx-2014.2_3.14 "
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="HEAD"



But When I run this I get an error:
svn: '.' is not a working copy
--2015-08-26 10:21:44--  http://sources.buildroot.net/linux-.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)... 176.9.16.109
Connecting to sources.buildroot.net (sources.buildroot.net)|176.9.16.109|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2015-08-26 10:21:45 ERROR 404: Not Found.


Any suggestion!
