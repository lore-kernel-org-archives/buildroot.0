From: Michael Drake <michael.drake@codethink.co.uk>
Date: Thu, 21 Nov 2019 11:59:01 +0000
Subject: [Buildroot] [RFC PATCH v2 14/30] package/libcef: New package
In-Reply-To: <5b9ab816-4082-7a14-71d6-9408bdcfe441@mind.be>
References: <20191017152929.49153-1-michael.drake@codethink.co.uk>
 <20191017152929.49153-15-michael.drake@codethink.co.uk>
 <5b9ab816-4082-7a14-71d6-9408bdcfe441@mind.be>
Message-ID: <ad3989db-7085-d4e6-90ce-9e2d60ec14eb@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Thank you for all the feedback!

We've addressed most of your comments in v3 of the RFC.

For the rest, I'll respond inline below.


On 20/10/2019 00:55, Arnout Vandecappelle wrote:
> On 17/10/2019 17:29, Michael Drake wrote:

>> +
>> +LIBCEF_LICENSE = GPL-2.0 or LGPL-3.0 or GPL-3.0 or GPL-3.0 with exception
> 
>  I haven't checked, but I'd be surprised if a packages with such a *load of
> bundled dependencies only has those four licenses...

True, we took our inspiration from the qt5webengine package, which is
also based on the Chromium source tree, and already in Buildroot:

https://github.com/buildroot/buildroot/blob/master/package/qt5/qt5webengine/qt5webengine.mk#L20

Perhaps we need to generate a full list from the files listed in the
package/libcef/libcef.license-files.inc file?

>> +ifeq ($(BR2_TOOLCHAIN_EXTERNAL),y)
>> +# Tell clang where the external toolchain is and to use it
>> +LIBCEF_TARGET_CFLAGS += --gcc-toolchain=$(TOOLCHAIN_EXTERNAL_INSTALL_DIR) \
> 
>  Can you explain why this --gcc-toolchain is needed? It can find it in $PATH, no?

Without it, when building using an external toolchain, we see
linking errors:

[2852/24834] LINK ./chrome_sandbox
FAILED: chrome_sandbox
clang++ -Wl,--fatal-warnings -Wl,--build-id=sha1 -fPIC
-Wl,-z,noexecstack -Wl,-z,relro -Wl,-z,now -Wl,-z,defs -Wl,--as-needed
-fuse-ld=lld -Wl,--icf=all -Wl,--color-diagnostics -flto=thin
-Wl,--thinlto-jobs=8 -Wl,--thinlto-cache-dir=thinlto-cache
-Wl,--thinlto-cache-policy,cache_size=10\%:cache_size_bytes=10g:cache_size_files=100000
-Wl,--lto-O0 -fwhole-program-vtables -m64 -Wl,-O2 -Wl,--gc-sections
-Wl,--gdb-index -rdynamic -nostdlib++
--sysroot=../../../../host/x86_64-buildroot-linux-gnu/sysroot
-fsanitize=cfi-vcall -fsanitize=cfi-icall -pie -Wl,--disable-new-dtags
-Wno-unknown-warning-option --target=x86_64-tesla-linux-gnu -o
"./chrome_sandbox" -Wl,--start-group @"./chrome_sandbox.rsp"
-Wl,--end-group  -ldl -lpthread -lrt
ld.lld: error: cannot open crtbeginS.o: No such file or directory
ld.lld: error: unable to find library -lgcc
ld.lld: error: unable to find library -lgcc
ld.lld: error: cannot open crtendS.o: No such file or directory
clang-9: error: linker command failed with exit code 1 (use -v to see
invocation)

>> +define LIBCEF_EXTRACT_CMDS
>> +	# Extract Chromium source code
>> +	tar -C $(@D) \
>> +		--strip-components=1 \
>> +		-xf $(LIBCEF_DL_DIR)/chromium-$(LIBCEF_CHROMIUM_VERSION).tar.xz
>> +
>> +	# Extract CEF to cef dir inside Chromium source code
>> +	mkdir $(@D)/cef
>> +	tar -C $(@D)/cef \
>> +		--strip-components=1 \
>> +		-xf $(LIBCEF_DL_DIR)/libcef-$(LIBCEF_VERSION).tar.gz
> 
>  So Buildroot first extracts (with --strip-components=0) in the top directory,
> then chromium gets extracted next to it, and then we extract libcef again in a
> subdirectory... That sounds a bit like a roundabout approach, no?

Actually, I think defining LIBCEF_EXTRACT_CMDS replaces the default
Buildroot extraction commands.  We simply extract the Chromium source
into the top level libcef output directory, and then extract the
CEF source into a cef/ directory within that.  This is the source
tree layout that the CEF project requires.

Cheers,

Michael
