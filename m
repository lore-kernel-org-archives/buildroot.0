From: Ming-Ching Tiew <mingching.tiew@redtone.com>
Date: Sat, 26 Jan 2008 16:44:50 -0500
Subject: [Buildroot] Segmentation fault in rootfs
Message-ID: <479BA9D2.6070901@redtone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


OK I have finally tracked down the intermittent but highly repeatable 
'segmentation fault'
which I encounter with the rootfs, which I previously suspect it was due 
to compiler
error and versioning, and gave me the impression that the rootfs is of 
low quality! ;-)

Suspect the least unsuspected, the problem is with the program 'bash' ( 
version 3.2 is
what is being used in my buildroot  ). The buildroot supplied about 25 
patches to bash
as compared to 30 something on the gnu sites.  And I also tracked down 
which is the
offending part of the program, ie it is contributed by patch 'bash32-011'.

Basically when bash-3.2 is crossed compiled, GETCWD is defined as 
broken, as such
it will call getcwd( 0,  PATH_MAX ) due to patch bash32-011. This is 
what will corrupt
memory and causing intermittent segmentation fault.

Some of the symptoms of the bug :-

1. After getting the rootfs.xxx.ext2, I copied it to a bigger piece of 
space and chroot
   into it. The bash will intermittently hang/block forever instead of 
giving back a
   command prompt.

2. Sometimes chroot will succeed, but when executing certain make 
scripts inside
    the chroot environment can get intermittent 'segmentation fault' at 
somewhat
    random location, but it is highly dependent on the type of make 
scripts. The
    ones with loops or recurse calls will be highly crashable.

I workaround the problem by undefining GETCWD_BROKEN so that it will call
getcwd( 0, 0 ) instead.



--------------------------------------------
Important Warning! 

*************************** 

This electronic communication (including any attached files) may contain confidential and/or legally privileged information and is only intended for the use of the person to whom it is addressed. If you are not the intended recipient, you do not have permission to read, use, disseminate, distribute, copy or retain any part of this communication or its attachments in any form. If this e-mail was sent to you by mistake, please take the time to notify the sender so that they can identify the problem and avoid any more mistakes in sending e-mail to you. The unauthorised use of information contained in this communication or its attachments may result in legal action against any person who uses it.
