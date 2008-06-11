From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 11 Jun 2008 07:37:08 +0200
Subject: [Buildroot] Q: Modifying package builds?
References: <C681C76E0D5F1E4BB01DE79E0A80EEC77C514F@usrdes03.ebgroup.elektrobit.com>
Message-ID: <00c301c8cb8e$aaa42da0$090514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> **My primary question(s) for this group is**: How can I change the
> configuration of packages before they are built? 

The build of a package <package> is goverened by
<buildroot>/packages/<package>/<package>.mk

Ensure that this file contains the target:

<package>-unpacked:    <package>-source

The target should be completed when the package has been decompressed
in "build_arm/<package>" and any patched present in 
"<buildroot>/packages/<package>/" has been applied.

Unpack and apply the existing patches with:

$ make <package>-unpacked
$ cd build_arm
$ mv <package> <package>-0rig
$ cd ..
$ make <package>-unpacked

Now you have both 
"build_arm/<package>" and "build_arm/<package>-0rig"

Make any modifications to "build_arm/<package>" and create a patch

$ cd build_arm
$ diff -urN <package>-0rig <package>    >    <package>-###.patch
$ mv <package>-###.patch ../packages/<package>

"###" should ensure that the new patch is applied after all existing patches.

This will handle one package at a time.

It might be a good idea to have a generic target which unpacks and patches
all packages but I am not aware that this exist and can't check right now.
Most of the packages support "make source", but very few support
"make unpacked".



Best Regards
Ulf Samuelsson 
