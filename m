From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 3 Jul 2017 17:28:57 +0200
Subject: [Buildroot] [PATCH] core: postpone evaluation on decompressor
	dependencies
In-Reply-To: <f75e93d0-ef5d-9d71-fca8-1a96329886d3@mind.be>
References: <20170702103030.2210-1-yann.morin.1998@free.fr>
 <20170702123621.67df4ae7@windsurf>
 <f75e93d0-ef5d-9d71-fca8-1a96329886d3@mind.be>
Message-ID: <CAAXf6LUDuRMfrcb=MuZ6O8fofzKKDHEf-zAjArw0mdch-zxiZA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2017-07-02 13:18 GMT+02:00 Arnout Vandecappelle <arnout@mind.be>:
>
>
> On 02-07-17 12:36, Thomas Petazzoni wrote:
>>>  DL_TOOLS_DEPENDENCIES += $$(call extractor-dependency,$$($(2)_SOURCE))
>>> +UNCOMP_TOOLS_DEPENDENCIES += $$(UNCOMP_TOOL_DEPENDENCY$$(suffix $$($(2)_SOURCE)))
>> I know we looked at it yesterday, but I again don't remember what
>> extractor-dependency is for. When looking at this code, it seems a bit
>> weird that extractor dependencies are added to DL_TOOLS_DEPENDENCIES
>> and "uncompressor dependencies" are added to UNCOMP_TOOLS_DEPENDENCIES.
>>
>> Can we clarify this ? Should the output of extractor-dependency be added
>> to UNCOMP_TOOLS_DEPENDENCIES ? Do we need both extractor-dependency and
>> UNCOMP_TOOL_DEPENDENCY ?
>
>  It also took me a bit of browsing to find out what this was about. IIUC,
> DL_TOOLS_DEPENDENCIES is not actually a list of dependencies, but rather a list
> of tools that should be checked by dependencies.mk. In addition, this list mixes
> download tools (e.g. git) with extractor/uncompressor tools - and it could in
> fact contain anything else. So it would be better to call it something like
> DEPENDENCIES_TO_CHECK.
>
>  Also, this patch only looks at the uncompressor tools, but the same approach
> could be applied to the download tools. In fact, I'd like those two to be
> refactored a little.
>
>  Ideally, we'd even have a distinct name for dependencies.mk "things" (i.e.
> tools that may or may not be available on the host and, for some of them, that
> we build on demand) and FOO_DEPENDENCIES "things" (i.e. packages that we need to
> build before package foo).
>
>  So perhaps:
> DL_TOOLS_DEPENDENCIES -> TOOLS_TO_CHECK
> UNCOMP_TOOLS_DEPENDENCIES -> TOOLS_DEPENDENCIES
>
>

I have been looking at this in the past too. Here is some input from my side:

- host-lzip requires tar to extract. If the tar on the host is not
good enough (RHEL4/5), then host-tar is built, but host-lzip does not
express a dependency on it. As a quick fix we have currently following
patch:

diff --git a/support/dependencies/check-host-lzip.mk
b/support/dependencies/check-host-lzip.mk
--- a/support/dependencies/check-host-lzip.mk
+++ b/support/dependencies/check-host-lzip.mk
@@ -1,4 +1,7 @@
 ifeq (,$(call suitable-host-package,lzip,$(LZCAT)))
+ifeq (,$(call suitable-host-package,tar,tar))
+HOST_LZIP_DEPENDENCIES = host-tar
+endif
 DEPENDENCIES_HOST_PREREQ += host-lzip
 EXTRACTOR_DEPENDENCY_PRECHECKED_EXTENSIONS += .lz
 LZCAT = $(HOST_DIR)/usr/bin/lzip -d -c

- when ccache is enabled, we need to make sure that ccache is not used
for any of the dependencies, also for those in
DEPENDENCIES_HOST_PREREQ, as ccache is not yet necessarily built.
Today, this is happening based on the 'dependencies' target, but if
any of them are built via another path, this is not working. One such
case had to do with the above lzip/tar problem, but I don't recall all
details. Another case is that 'make clean host-ccache' does not work.
Following patch fixes that: (we didn't get around to sending that properly yet)

diff --git a/support/dependencies/dependencies.mk
b/support/dependencies/dependencies.mk
--- a/support/dependencies/dependencies.mk
+++ b/support/dependencies/dependencies.mk
@@ -25,8 +25,8 @@ core-dependencies:
         DL_TOOLS="$(sort $(DL_TOOLS_DEPENDENCIES))" \
         $(TOPDIR)/support/dependencies/dependencies.sh

-dependencies: HOSTCC=$(HOSTCC_NOCCACHE)
-dependencies: HOSTCXX=$(HOSTCXX_NOCCACHE)
+core-dependencies $(DEPENDENCIES_HOST_PREREQ): HOSTCC=$(HOSTCC_NOCCACHE)
+core-dependencies $(DEPENDENCIES_HOST_PREREQ): HOSTCXX=$(HOSTCXX_NOCCACHE)
 dependencies: core-dependencies $(DEPENDENCIES_HOST_PREREQ)

 ################################################################################

- regarding the naming: I agree with Thomas that EXTRACT_TOOLS is
better than UNCOMP_TOOLS;

- but further, like Arnout, I also think that a better split may be
needed. In my rough ideas I had written down:
  TOOLS_DEPENDENCIES_EXPECTED_ON_HOST versus
TOOLS_DEPENDENCIES_BUILT_IF_NEEDED, because that is actually the split
we need, regardless of whether it is a tool used for downloading,
extracting or something else.

Best regards,
Thomas
