From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 17 Feb 2017 13:38:29 +0000
Subject: [Buildroot] [PATCH] linux-tools/perf: fix build for MIPS by
 using the right emulation on LD
In-Reply-To: <20170217142618.61aa568d@free-electrons.com>
References: <20170217105905.32151-1-Vincent.Riera@imgtec.com>
 <20170217142618.61aa568d@free-electrons.com>
Message-ID: <f8facf7c-9bc0-8578-86fd-191370f8c403@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 17/02/17 13:26, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 17 Feb 2017 10:59:05 +0000, Vicente Olivert Riera wrote:
> 
>> +# We need to pass an argument to ld for setting the emulation when
>> +# building for MIPS architecture, otherwise the default one will always
>> +# be used and the compilation for most variants will fail.
>> +ifeq ($(BR2_mips),y)
>> +PERF_MAKE_FLAGS += LD="$(TARGET_LD) -m elf32btsmip"
>> +else ifeq ($(BR2_mipsel),y)
>> +PERF_MAKE_FLAGS += LD="$(TARGET_LD) -m elf32ltsmip"
>> +else ifeq ($(BR2_mips64),y)
>> +ifeq ($(BR2_MIPS_NABI32),y)
>> +PERF_MAKE_FLAGS += LD="$(TARGET_LD) -m elf32btsmipn32"
>> +else
>> +PERF_MAKE_FLAGS += LD="$(TARGET_LD) -m elf64btsmip"
>> +endif
>> +else ifeq ($(BR2_mips64el),y)
>> +ifeq ($(BR2_MIPS_NABI32),y)
>> +PERF_MAKE_FLAGS += LD="$(TARGET_LD) -m elf32ltsmipn32"
>> +else
>> +PERF_MAKE_FLAGS += LD="$(TARGET_LD) -m elf64ltsmip"
>> +endif
>>  endif
> 
> This is really getting nasty, especially since gcc already knows about
> this. Why not use gcc instead of ld?

Ideally, perf's build system would use gcc for linking instead of ld,
but that's not the case.

This is something we discussed in the past when we were talking about
creating a wrapper for ld, as we already have for gcc. We decided to not
do it and instead let those packages that were using ld for linking to
fail, so we could identify them and fix their build system in order to
link with gcc instead.

But, what happen when you really need to fix the problem and you don't
have the time/skills/whatever to modify the package's build system to
make it link with gcc?

Regards,

Vincent

> 
> Thomas
> 
