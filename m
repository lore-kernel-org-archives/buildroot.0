From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 9 Sep 2015 15:49:07 +0100
Subject: [Buildroot] [PATCHv3] gdb: prevent building the documentation
In-Reply-To: <20150909164526.4467be61@free-electrons.com>
References: <1441800739-14854-1-git-send-email-Vincent.Riera@imgtec.com>	<20150909154913.72954fbc@free-electrons.com>	<55F044FC.6040608@imgtec.com>
 <20150909164526.4467be61@free-electrons.com>
Message-ID: <55F046E3.9040401@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 09/09/2015 03:45 PM, Thomas Petazzoni wrote:
> Vicente,
> 
> On Wed, 9 Sep 2015 15:41:00 +0100, Vicente Olivert Riera wrote:
> 
>> according to the binutils.mk file, only the one for ARC architecture
>> needs host-texinfo:
>>
>> ifeq ($(BR2_arc),y)
>> BINUTILS_SITE = $(call
>> github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(BINUTILS_VERSION))
>> BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.gz
>> BINUTILS_FROM_GIT = y
>> endif
>>
>> [snip]
>>
>> ifeq ($(BINUTILS_FROM_GIT),y)
>> BINUTILS_DEPENDENCIES += host-texinfo host-flex host-bison
>> HOST_BINUTILS_DEPENDENCIES += host-texinfo host-flex host-bison
>> endif
>>
>> However, I have removed the texinfo package and also removed the
>> host-texinfo dependencies from binutils.mk, and it worked fine:
>>
>> $ grep "BR2_arc=y" .config
>> BR2_arc=y
>>
>> $ ls package/texinfo
>> ls: cannot access package/texinfo: No such file or directory
>>
>> $ ls output/build/host-binutils-arc-2015.06/.stamp_host_installed
>> output/build/host-binutils-arc-2015.06/.stamp_host_installed
>>
>> $ ls output/build/binutils-arc-2015.06/.stamp_target_installed
>> output/build/binutils-arc-2015.06/.stamp_target_installed
>>
>> So this dependency is unnecessary.
> 
> Actually, it is not clear to me when binutils/gdb want to rebuild their
> documentation. Some versions of gdb did not try to rebuild their
> documentation, some did. I wonder if gdb/binutils don't come with a
> pre-generated version of the documentation, which might get
> re-generated if the timestamps of the generated doc is older than the
> documentation source. This is pure guess.
> 
> But in any case, if host-texinfo is no longer needed to build the ARC
> binutils, then indeed we can drop the host-texinfo dependency, and drop
> the host-texinfo package as well.

Maybe this is the reason why host-texinfo is no longer needed:

https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=bba33ab1e0f7d2ebd8f8435f92ed12e2a3c558a4

Regards,

Vincent.


> Best regards,
> 
> Thomas
> 
