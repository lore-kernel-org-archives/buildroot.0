From: John Schimandle <john_schimandle@hotmail.com>
Date: Fri, 7 Nov 2008 08:23:55 -0800
Subject: [Buildroot] how to get the rootfs rebuilded ?
In-Reply-To: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAANxvIbP3pP1EiLoe96b5TKYBAAAAAA==@cimeq.qc.ca>
References: <!&!AAAAAAAAAAAYAAAAAAAAAHWPmCJoh6pNraKNfwnUAkLCgAAAEAAAANxvIbP3pP1EiLoe96b5TKYBAAAAAA==@cimeq.qc.ca>
Message-ID: <COL0-DAV2058919F278F2BD4A318F98D190@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jonathon,

I don't think there is any command in the top level make file that rebuilds
your root file system but the following commands seem to work.

rm project_build_ARM/project/autotools-stamps/*  #removes the autotools
target install flag files
rm project_build_ARM/project/.root # removes the flag file to copy a the
root fs skeleton into the root directory
rm -rf project_build_ARM/project/root # removes the existing root file
system

I would suggest that you make a backup of the existing root file system
directory prior to this process so that you can determine if any files are
missing after the rebuild.

Also, remember to put any changes to system level files into the skeleton.
Files like /etc/inittab or any other configuration files. Failure to do this
will result in loosing these changes from your root file system. You can
find your current skeleton by moving the current root directory to another
directory and then removing the .root file. This will re-copy the skeleton
and you can see the skeleton directory used in the make output.

Properly configured packages should sense the changes and re-install their
already compiled and linked components. Packages using the autotools include
file should work fine and most other packages should work but some may not.
If you find packages that did not install correctly then the only thing you
can do is remove the build_ARCH directory for that package and rebuild the
package. You may want to submit a bug if a package does not re-install so
that it can get fixed in the future.

Use the following command to remove a package build directory.

rm build_ARCH/package-version

Regards,

John

-----Original Message-----
From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org] On
Behalf Of Jonathan Dumaresq
Sent: Friday, November 07, 2008 6:55 AM
To: buildroot at uclibc.org
Subject: [Buildroot] how to get the rootfs rebuilded ?

Hi all,

I have compiled all my buildroot, and I would like to modify the root file
system directory customized. I would like to know what is the precess to
have the root file system rebuilded. 

Do I need to remove some .file to force makefile to reinstall the root
directory (under /project_build_ARCH_project/root) ?

Regards

Jonathan

_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot
