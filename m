From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 05 Feb 2014 09:27:42 +0100
Subject: [Buildroot] RFC: Revert uClibc 0.9.33.2 pread/pwrite patches?
In-Reply-To: <87eh46od0y.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Fri, 17 Jan 2014 16:15:25 +0100")
References: <87eh46od0y.fsf@dell.be.48ers.dk>
Message-ID: <878utq2cch.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:

Hi,

I never got any feedback on this, so I decided to revert the affected
patches for 2014.02.


 > As you probably are all aware of, there hasn't been any uClibc release
 > in quite a while. Back in September an issue was reported (on IRC I
 > believe) and the fact that a fix for this and other issues were already
 > lined up in uClibc git for a 0.9.33.3 release, so I ended up adding
 > those fixes to BR:

 > commit 055f1c02d35068d0b089f3b29ffdd4fb2717bb5c
 > Author: Peter Korsgaard <jacmet@sunsite.dk>
 > Date:   Fri Sep 6 15:28:51 2013 +0200

 >     uclibc: add upstream 0.9.33 fixes
    
 >     Upstream has a large number of patches lined up for the next 0.9.33.x bugfix
 >     release;
    
 >     http://git.uclibc.org/uClibc/log/?h=0.9.33
    
 >     Add them here, as atleast some of them are quite critical (E.G. the eventfd
 >     issue gets triggered by recent glib versions).
    
 >     I've skipped the microblaze and xtensa fixes as we don't currently support
 >     those with 0.9.33.2.
    
 >     Drop uclibc-0002-Add-definition-of-MSG_WAITFORONE-and-MSG_CMSG_CMSG_CLOEXE.patch
 >     as that is a subset of uclibc-0035-socket.h-pull-socket_type.h-from-eglibc.patch
    
 >     Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>


 > One of the issues fixed was that uClibc was still using a pread/pwrite
 > emulation (using lseek+read/write), even though pread/pwrite has been
 > natively supported by the kernel since the 2.1.x days - And this
 > implementation is racy in multithreaded applications.

 > The system call uses 64bit for the offset parameter, and the
 > implementation on the 0.9.33 branch unfortunately doesn't take into
 > consideration architectures with an ABI requiring natural alignment for
 > 64bit arguments (afaik ARM EABI, MIPS O32, PPC, SH and Xtensa), causing
 > havoc when pread/pwrite is used.

 > I brought the issue up on the uClibc list back in October, but so far it
 > hasn't been fixed:

 > http://lists.uclibc.org/pipermail/uclibc/2013-October/047968.html

 > It IS fixed on the main branch, but it looks nontrivial to backport it.


 > So what do we do?

 > - Remove the uClibc patches (14, 21, 32 and 54), and tell people running
 >   into the race condition to use uClibc master / Glibc?

 > - Backport fix from uClibc master?

 > - Deprecate 0.9.33.2 and instead use a git snapshot of master?

 > What do you think?

-- 
Bye, Peter Korsgaard
