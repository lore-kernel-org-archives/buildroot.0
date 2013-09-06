From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Fri, 6 Sep 2013 13:45:14 -0500
Subject: [Buildroot] [RFC] New feature to handle a custom board folder
Message-ID: <OF9A959FD8.FE78AE85-ON86257BDE.00666A59-86257BDE.00670505@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

I would like to introduce a new concept I've got for how the board
folder is brought into buildroot. I propose adding a feature to
buildroot to treat the board folder as a package. In treating the board
folder as a package, it would allow a board folder to be downloaded
using currently supported methods of packages (HG/Git/SVN/archives from
websites). It would be placed as an archive in the DL_DIR and extracted
to BUILD_DIR/board. I will go into more detail further down about the
structure.

The motivation for this feature is that most of the customization done
to buildroot in order to support  a project (board) is usually
contained to a board folder. However, in many work environments in
which buildroot is used, GIT isn't a preferred version control method
(mine included) so being able to track mainline of buildroot is very
difficult.

NOTE: I haven't attempted to implement this yet as this an idea that 
is still in its infancies. 

Theory
---------
In theory the custom board folder structure would work as follows:

1. User specifies the custom board folder in menuconfig
    a. Initial though would to place it as follows in menuconfig

Target Options 
 > Target Board Folder Type 
     > No Custom Board Folder (default)
     > External Custom Board Folder
 > Target Board Folder Site Method
     > Git
     > HG
     > SVN
     > List goes on...
 > Board folder contains custom applications
     COMMENTARY: This feature allows the use for downloading and building
     a company's custom applications that need to place in the release.
 > (Future Option) Check folder out using method above
     COMMENTARY: This feature would be useful during development of 
     board folder to allow the actual checkout board folder to the 
BUILD_DIR
     to allow for modifications tha easily pushed back.

Target Packages
 > Text editor and viewers
 > Custom board applications
    > App A
    > App B
 
    COMMENTARY: the custom board applications would only appear when 
    "Board folder contains custom applications" is enabled. The 
application 
    list from custom board applications would be sourced an applications 
folder
    within the custom board folder. These apps wouldn't display until the 
board
    folder is actually extract. 
 
    One issue I see with this is how the makefile structure would handle 
    building without the board folder checked out and the make rules for 
these 
    packages being defined.

2. Board folder structure would be as follows:

> BUILD_DIR
   > board (new)
      > kernel-patches
      > local-skeleton
      > packages (this would be the board specific packages)
      > uboot-patches
      > config files
   > build
   > host
   > target

3. User says "make board-folder" and the custom board folder is extracted

4. The user can say "make menuconfig" and their board customization will 
   appear and would be available for selection.

5. User say "make" and buildroot builds them their system

Summary
--------
With adding this feature to buildroot, it will help companies/users easily 

bring in their customization into buildroot with just using a defconfig.

Please provide me with feedback in if this idea is feasible/be useful. I'm 

also very open suggestions to help make this a reality.




Ryan J Barnett / Software Engineer / Platform SW 
MS 137-157, 855 35th St NE, Cedar Rapids, IA, 52498-3161, US
Phone: 319-263-3880 / VPN: 263-3880 
rjbarnet at rockwellcollins.com
www.rockwellcollins.com 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130906/73d37c78/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: image/gif
Size: 2004 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130906/73d37c78/attachment.gif>
