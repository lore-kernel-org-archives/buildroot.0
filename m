From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 6 Nov 2017 18:08:34 -0600
Subject: [Buildroot] [PATCH v2 2/2] security hardening: add RELFO,
 FORTIFY options
In-Reply-To: <e29b21b0-6c5f-ef3b-4123-9e8782639f43@mind.be>
References: <1508936397-33651-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1508936397-33651-2-git-send-email-matthew.weber@rockwellcollins.com>
 <e29b21b0-6c5f-ef3b-4123-9e8782639f43@mind.be>
Message-ID: <CANQCQpZ4kVabQPuCNjazZdMB_O-jUxoOFzALR=CKZh5x36pwKQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Mon, Nov 6, 2017 at 3:14 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> Hi Matt,
>
> In the subject: s/RELFO/RELRO/
>
> On 25-10-17 14:59, Matt Weber wrote:
>> This enables a user to build a complete system using these
>> options. It is important to note that not all packages will
>> build correctly to start with.
>
> So perhaps you could make another patch that extends the autobuilders to
test
> this option. Just modify utils/genrandconfig and in the gen_config
function
> randomly enable these options.

Sure :) I've got an initial patchset of half dozen packages we've fixed but
I'm working upstreaming on some of them first before submitting here.


Another thing to note.... As things still build with various hardening
flags possibly taking affect our not, we validated the configurations took
affect by using the checksec.sh tool against all target binaries post-
build then went through fixing packages.   I've been thinking about how to
do this checking..... I think at a minimum, I should add the test tool to
this series and at least one buildroot test case to cover a static set of
packages we've fixed so far.  The other option would be a more active check
post build that validates all target elfs are compliant.


>> +
>> +config BR2_RELRO_FULL
>> + bool "Full"
>> + help
>> + This option includes the partial configuration, but also
>> + marks the GOT as read-only at the cost of initialization time
>> + during program loading, i.e every time an executable is started.
>
> Do these options make sense at all in static linking? Isn't it implicit
then
> (text is always readonly I think)? -pie is certainly invalid in static
linking
> (at least with uClibc).
>
> Also, does it make sense on NOMMU, even shared? I mean, "readonly"
doesn't mean
> much when there is no MMU I think...
>

For both of those, I agree it doesn't make sense for static or NOMMU but I
have asked my developer just to be sure.

>> +
>> +endchoice
>> +
>> +choice
>> + bool "Buffer-overflow Detection (FORTIFY_SOURCE)"
>> + help
>> + Enable the _FORTIFY_SOURCE macro which introduces additional
>> + checks to detect buffer-overflows in the following standard library
>> + functions: memcpy, mempcpy, memmove, memset, strcpy, stpcpy,
>> + strncpy, strcat, strncat, sprintf, vsprintf, snprintf, vsnprintf,
>> + gets.
>> +
>> +config BR2_FORTIFY_SOURCE_NONE
>> + bool "None"
>> + help
>> + Enables additional checks to detect buffer-overflows.
>> +
>> +config BR2_FORTIFY_SOURCE_1
>> + bool "Conservative"
>> + help
>> + This option sets _FORTIFY_SOURCE set to 1 and only introduces
>> + checks that shouldn't change the behavior of conforming programs.
>> + Adds checks at compile-time only.
>> +
>> +config BR2_FORTIFY_SOURCE_2
>> + bool "Aggressive"
>> + help
>> + This option sets _FORTIFY_SOURCES set to 2 and some more checking
>> + is added, but some conforming programs might fail.
>> + Also adds checks at run-time (detected buffer overflow terminates
>> + the program)
>
> Do you know how these behave in uClibc and musl? Waldemar, any idea?
Obviously
> the gcc part will still be activated, which covers about half of the
functionality.
>

Checking on the answer, but we ran through the complete test-pkg build
list. I'll see which were skipped. We didn't see specific failures.

>> +
>> +endchoice
>> +
>> endmenu
>>
>> source "toolchain/Config.in"
>> diff --git a/package/Makefile.in b/package/Makefile.in
>> index a1a5316..c99361f 100644
>> --- a/package/Makefile.in
>> +++ b/package/Makefile.in
>> @@ -144,6 +144,9 @@ TARGET_CXXFLAGS = $(TARGET_CFLAGS)
>> TARGET_FCFLAGS = $(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
>> TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
>>
>> +TARGET_CFLAGS_RELRO = -Wl,-z,relro
>> +TARGET_CFLAGS_RELRO_FULL = -Wl,-z,now $(TARGET_CFLAGS_RELRO)
>> +
>> ifeq ($(BR2_BINFMT_FLAT),y)
>> TARGET_CFLAGS += $(if
$($(PKG)_FLAT_STACKSIZE),-Wl$(comma)-elf2flt=-s$($(PKG)_FLAT_STACKSIZE),\
>> -Wl$(comma)-elf2flt)
>> @@ -181,6 +184,28 @@ TARGET_CXXFLAGS += -fstack-protector-all
>> TARGET_FCFLAGS += -fstack-protector-all
>> endif
>>
>> +ifeq ($(BR2_RELRO_PARTIAL),y)
>> +TARGET_CFLAGS += $(TARGET_CFLAGS_RELRO)
>> +TARGET_CXXFLAGS += $(TARGET_CFLAGS_RELRO)
>> +TARGET_FCFLAGS += $(TARGET_CFLAGS_RELRO)
>
> Since these are linker flags, it _should_ be sufficient to add them to
LDFLAGS.
> There may be some packages that don't listen to LDFLAGS so in that sense
it
> could be a good idea to add it to CFLAGS as well, but I tend to prefer to
fix
> the packages. Only, there is no easy way to detect that LDFLAGS are
ignored.

What we ended up with here worked for a large test build ( lots of packages
in a glibc embedded router configuration) and passed a minimal test-pkg
cfg.   That being said, we could go back and try flag combos but I know a
few of them can't be in the linker vs just cflags (and vice versa).

>
>> +TARGET_LDFLAGS += $(TARGET_CFLAGS_RELRO)
>> +else ifeq ($(BR2_RELRO_FULL),y)
>> +TARGET_CFLAGS += -fPIE $(TARGET_CFLAGS_RELRO_FULL)
>> +TARGET_CXXFLAGS += -fPIE $(TARGET_CFLAGS_RELRO_FULL)
>> +TARGET_FCFLAGS += -fPIE $(TARGET_CFLAGS_RELRO_FULL)
>> +TARGET_LDFLAGS += -pie
>> +endif
>> +
>> +ifeq ($(BR2_FORTIFY_SOURCE_1),y)
>> +TARGET_CFLAGS += -D_FORTIFY_SOURCE=1
>> +TARGET_CXXFLAGS += -D_FORTIFY_SOURCE=1
>
> It should go into CPPFLAGS (which automatically goes into CFLAGS and
CXXFLAGS).

Nice that cleans it up

>
>> +TARGET_FCFLAGS += -D_FORTIFY_SOURCE=1
>
> FCFLAGS indeed needs to be handled separately. Except: is FORTIFY
valid/useful
> for Fortran?
>

It is not, shoot we got that feedback on the RFC.  I'll remove it this time.

Matt
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171106/424998ec/attachment.html>
