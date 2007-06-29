From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 29 Jun 2007 04:20:29 -0700
Subject: [Buildroot] [buildroot 0001410]: uclibc.mk produces .config that
	confuses uclibc's configuration system
Message-ID: <6834cb00285c7f842cf86fc7cfb042e7@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1410 
====================================================================== 
Reported By:                bjdooks
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1410
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-29-2007 04:18 PDT
Last Modified:              06-29-2007 04:20 PDT
====================================================================== 
Summary:                    uclibc.mk produces .config that confuses uclibc's
configuration system
Description: 
If building for ARM, and providing an configuration from a file in a target
sub-directory, the uclibc.mk file incorrectly re-writes the .config for
building uclibc, causing warnings and an incorrect .config

The problem stems from unsetting CONFIG_<x> options, then re-specifying
them as CONFIG_<x>=y later in the file. The current configuration system
(make oldconfig) seems to take the first occurence as the proper setting.
This means that options that should be set end up being unset as 'make
oldconfig' removes any further refrences to CONFIG_<x> from the file.

For example, if you specify the buildroot config as CONFIG_ARM920T=y, then
the uclibc.mk removes that turning it into # CONFIG_ARM920T is unset and
then adds CONFIG_ARM920T=y to the end of the file. Then 'make oldconfig'
is run, and CONFIG_ARM920T=y is deleted, thus causing CONFIG_GENERIC_ARM=y
to be placed in the config file.

The warnings produced by 'make oldconfig' are:
config:209:warning: trying to reassign symbol CONFIG_ARM920T
.config:210:warning: trying to reassign symbol CONFIG_ARM_OABI
.config:211:warning: trying to reassign symbol CONFIG_ARM_EABI

Also note, that the EABI/OABI are also being warned about, so are
also fixed.

The simple fix is to change the sed expressions unsetting these options to
simply deleting them from the file.
====================================================================== 

---------------------------------------------------------------------- 
 bjdooks - 06-29-07 04:20  
---------------------------------------------------------------------- 
Uploaded the original configuration for uclibc, and the one produced by
oldconfig.  as well as the overall buildroot config. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-29-07 04:18  bjdooks        New Issue                                    
06-29-07 04:18  bjdooks        Status                   new => assigned     
06-29-07 04:18  bjdooks        Assigned To               => buildroot       
06-29-07 04:18  bjdooks        File Added: uclibc-arm-config.patch              
     
06-29-07 04:19  bjdooks        File Added: uClibc-original.config               
    
06-29-07 04:19  bjdooks        File Added: uClibc-oldconfiged.config            
       
06-29-07 04:19  bjdooks        File Added: buildropt.config                    
06-29-07 04:20  bjdooks        Note Added: 0002532                          
======================================================================
