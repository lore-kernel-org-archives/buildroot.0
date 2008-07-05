From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 5 Jul 2008 07:11:30 -0700
Subject: [Buildroot] [buildroot 0003154]: configure option for local package
	mirror
Message-ID: <4867d3490895c8d9306705964236b07a@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=3154 
====================================================================== 
Reported By:                kendallc
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   3154
Category:                   New Features
Reproducibility:            N/A
Severity:                   feature
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-26-2008 19:21 PDT
Last Modified:              07-05-2008 07:11 PDT
====================================================================== 
Summary:                    configure option for local package mirror
Description: 
It would be nice to have an option for buildroot pull packages from a local
mirror. This feature would allow users to run a fresh buildroot build
without an internet connection. It requires the addition of a
configuration option. It also requires a few lines below the "..._SITE:="
stuff in every package's makefile.

I've attached a patch that adds a BR2_PACKAGE_MIRROR option to
target/device/Config.in.mirrors. The patch adds support for the option to
uClibc, and busybox. This patch is just an example of how this feature
could be added to a couple of packages.

The code to add the feature is fairly simple; however, it requires
touching every package makefile.
====================================================================== 

---------------------------------------------------------------------- 
 hbr_in - 04-26-08 21:38  
---------------------------------------------------------------------- 
Hi,

Instead of adding an option, what i do is that -->

i have a local directory which contain all my sources. 

my local src --> /opt/source
my buildroot directory --> /opt/buildroot

Inside Buildroot, i link the above folder to dl directory i.e., to a
directory where buildroot downloads and stores all package source

/opt/buildroot # ln -s /opt/source dl

So when buildroot starts make it 1st check in dl/ directory (which is my
local source directory) and if it finds the source there then it doesnt
need any internet connection.

Regards
Gururaja 

---------------------------------------------------------------------- 
 UlfSamuelsson - 04-27-08 07:18  
---------------------------------------------------------------------- 
A better implementation would replace $(WGET) with a script
which test the main location first and then goes through a
list of mirrors.
Then no package file need to be touched, and it is easy
to maintain a number of mirrors. 

---------------------------------------------------------------------- 
 kendallc - 04-28-08 19:56  
---------------------------------------------------------------------- 
There are ways to accomplish this outside of buildroot. My suggestion was
to integrate this feature into buildroot.

Whatever the implementation, it will take some effort to do it properly. I
guess the first issue is whether or not this feature useful to enough users
to warrant implementing. 

---------------------------------------------------------------------- 
 UlfSamuelsson - 07-05-08 00:56  
---------------------------------------------------------------------- 
I think it would be better to replace the WGET command
with a new command $(DOWNLOAD)
which a function which has two parameters.

1) SITE
2) TARBALL

The function will try to download from $(SITE)/$(TARBALL)
and if this fails, then it will try downloads from
BR2_PACKAGE_MIRROR which is a list of hosts separated by spaces.

You can also have a file in you home directory ~/.buildroot/mirrors
containing a list of hosts. 

---------------------------------------------------------------------- 
 Correa - 07-05-08 07:11  
---------------------------------------------------------------------- 
openwrt has a neat way of handling this. 

You define PKG_FILE, PKG_SITE and PKG_MD5 and call a function. PKG_SITE
can be a list of URL's or it can include some "custom keywords" for well
known mirrors such as mirror://gnu/somepackage or
mirror://sourceforge/someproject

The processing is done in a perl script, I would rather prefer if it was
bash if possible, so we don't require perl in the host computer, but if we
use their code it would be ok and quite some improvement over just plain
wget. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-26-08 19:21  kendallc       New Issue                                    
04-26-08 19:21  kendallc       Status                   new => assigned     
04-26-08 19:21  kendallc       Assigned To               => buildroot       
04-26-08 19:21  kendallc       File Added: buildroot-local-mirror.patch         
          
04-26-08 21:38  hbr_in         Note Added: 0007254                          
04-27-08 07:18  UlfSamuelsson  Note Added: 0007274                          
04-28-08 19:56  kendallc       Note Added: 0007294                          
07-05-08 00:56  UlfSamuelsson  Note Added: 0008954                          
07-05-08 07:11  Correa         Note Added: 0008994                          
======================================================================
