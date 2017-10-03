From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 3 Oct 2017 13:00:20 -0500
Subject: [Buildroot] [PATCH] host-lzo: default liblzo2.a install to
	host/lib
In-Reply-To: <CANQCQpYFxcNzRVvQpjSCbCxr+TvfKy9MbfZtvxS1raHgyAkkjw@mail.gmail.com>
References: <1507038558-27163-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20171003164222.GG4753@scaer>
 <CANQCQpYFxcNzRVvQpjSCbCxr+TvfKy9MbfZtvxS1raHgyAkkjw@mail.gmail.com>
Message-ID: <CANQCQpaZQ4TAN+F0yO30XTTrOvaHk4j-mQW0SKS55nH-kEuVVg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Tue, Oct 3, 2017 at 12:17 PM, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
> Yann,
>
> On Tue, Oct 3, 2017 at 11:42 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> Matthew, All,
>>
>> On 2017-10-03 08:49 -0500, Matt Weber spake thusly:
>>> Discovered the issue on a RHEL7.4 machine where
>>> the cmake build dynamically selected HOST_DIR/lib64
>>> as the installation path for the library.
>>>
>>> Fixes failures like the following:
>>> host-mtd
>>> http://autobuild.buildroot.net/results/d31/d31581d2e60f35cf70312683df99c768e2ea8516/
>>> host-squashfs
>>> http://autobuild.buildroot.net/results/d9c/d9c95231ac774ed71580754a15ebb3b121764310/
>>>
>>> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>>> ---
>>>  package/lzo/lzo.mk | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/package/lzo/lzo.mk b/package/lzo/lzo.mk
>>> index 27ca459..0cafba2 100644
>>> --- a/package/lzo/lzo.mk
>>> +++ b/package/lzo/lzo.mk
>>> @@ -11,6 +11,9 @@ LZO_LICENSE_FILES = COPYING
>>>  LZO_INSTALL_STAGING = YES
>>>  LZO_SUPPORTS_IN_SOURCE_BUILD = NO
>>>
>>> +# Prevent dynamically using lib64 as install libdir
>>> +HOST_LZO_CONF_OPTS += -DCMAKE_INSTALL_LIBDIR=lib
>>
>> So, probably other packages would have the same issue, then? And indeed,
>> we've just had Jan on IRC reporting the same issue with a new package
>> he's adding.
>>
>> So I suggest that we simply symlink lib64 -> lib like we do for the
>> target, and be done with it.
>>
>> Thoughts?
>
> Sounds reasonable, so something we'd add in the Makefile by the following?
> # Compatibility symlink in case a post-build script still uses $(HOST_DIR)/usr
> $(HOST_DIR)/usr: $(HOST_DIR)
>         @ln -snf . $@
>

Something like this (testing it now)

# Make a symlink lib32->lib or lib64->lib as appropriate.
# MIPS64/n32 requires lib32 even though it's a 64-bit arch.
ifeq ($(BR2_ARCH_IS_64)$(BR2_MIPS_NABI32),y)
$(HOST_DIR)/lib64: $(HOST_DIR)
        @ln -snf lib $@
else
$(HOST_DIR)/lib32: $(HOST_DIR)
        @ln -snf lib $@
endif
