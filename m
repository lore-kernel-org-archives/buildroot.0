From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 9 Sep 2015 15:41:00 +0100
Subject: [Buildroot] [PATCHv3] gdb: prevent building the documentation
In-Reply-To: <20150909154913.72954fbc@free-electrons.com>
References: <1441800739-14854-1-git-send-email-Vincent.Riera@imgtec.com>
 <20150909154913.72954fbc@free-electrons.com>
Message-ID: <55F044FC.6040608@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 09/09/2015 02:49 PM, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
> 
> On Wed, 9 Sep 2015 13:12:19 +0100, Vicente Olivert Riera wrote:
>> Force gdb to not build the documentation. This way we avoid depending on
>> host-texinfo. This is a temporary fix until upstream accepts a proposed
>> --disable-docs configure option.
>>
>> Since the documentation will not be build at all, we can remove the
>> parts related to host-texinfo and MAKEINFO in the gdb.mk file.
>>
>> Fixes:
>>
>>   http://autobuild.buildroot.net/results/dd5/dd50ed99abb2c8495def826866b184030953f90e/
>>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> 
> Maybe we could do a similar thing for the binutils package (which is
> the only other user of the host-texinfo package), and then remove the
> host-texinfo package altogether. That's obviously a completely separate
> set of changes.

according to the binutils.mk file, only the one for ARC architecture
needs host-texinfo:

ifeq ($(BR2_arc),y)
BINUTILS_SITE = $(call
github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(BINUTILS_VERSION))
BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.gz
BINUTILS_FROM_GIT = y
endif

[snip]

ifeq ($(BINUTILS_FROM_GIT),y)
BINUTILS_DEPENDENCIES += host-texinfo host-flex host-bison
HOST_BINUTILS_DEPENDENCIES += host-texinfo host-flex host-bison
endif

However, I have removed the texinfo package and also removed the
host-texinfo dependencies from binutils.mk, and it worked fine:

$ grep "BR2_arc=y" .config
BR2_arc=y

$ ls package/texinfo
ls: cannot access package/texinfo: No such file or directory

$ ls output/build/host-binutils-arc-2015.06/.stamp_host_installed
output/build/host-binutils-arc-2015.06/.stamp_host_installed

$ ls output/build/binutils-arc-2015.06/.stamp_target_installed
output/build/binutils-arc-2015.06/.stamp_target_installed

So this dependency is unnecessary.

Regards,

Vincent.

> Thanks,
> 
> Thomas
> 
