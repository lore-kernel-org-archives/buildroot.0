From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 26 Mar 2014 00:27:46 +0100
Subject: [Buildroot] PowerPC: scsi/sg.h missing in glibc-2.18 /
 linux-headers-3.10.20 toolchain
In-Reply-To: <778977534.278661.1395686596735.JavaMail.root@mail>
References: <778977534.278661.1395686596735.JavaMail.root@mail>
Message-ID: <533210F2.5040908@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/03/14 19:43, ?meric Vigier wrote:
> Hi makers,
> 
> I struggled to cross-compile (powerpc) strace-4.8 with linux-headers-3.10.20
> and glibc-2.18.It does not find <scsi/sg.h> in my toolchain. Indeed there is
> none in my sysroot:
> 
> $ find output/ -path "*/scsi/sg.h"
> output/build/glibc-2.18/sysdeps/unix/sysv/linux/scsi/sg.h
> output/build/linux-headers-3.10.20/include/scsi/sg.h

 This is a known issue: linux-headers removes sg.h from the staging
directory. Normally this isn't an issue because glibc installs it again,
but if for whatever reason linux-headers gets reinstalled, it gets
removed again. You shouldn't get this issue with a clean build.

 See the thread at
http://thread.gmane.org/gmane.comp.lib.uclibc.buildroot/77571


 Regards,
 Arnout

> 
> I have a duplicate buildroot with linux-headers-3.2.52 and the same glibc.
> It succeeds to compile strace. Indeed headers are present in sysroot:
> 
> $ find output/ -path "*/scsi/sg.h"
> output/build/linux-headers-3.2.52/include/scsi/sg.h
> output/build/glibc-2.18/sysdeps/unix/sysv/linux/scsi/sg.h
> output/build/linux-3.2.x/include/scsi/sg.h
> output/host/usr/powerpc-buildroot-linux-gnu/sysroot/usr/include/scsi/sg.h
> 
> I checked linux API changes but nothing about SCSI:
> http://man7.org/tlpi/api_changes/index.html
> 
> I worked around this problem with a simple copy:
> $ cp output/build/glibc-2.18/sysdeps/unix/sysv/linux/scsi/sg.h \
>      output/host/usr/powerpc-buildroot-linux-gnu/sysroot/usr/incl
> 
> I'd like to know how to truly fix this issue. Is this a bug in the toolchain 
> cross-compilation?
> 
> thanks,
> Emeric
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
