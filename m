From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 2 May 2018 23:54:11 +0200
Subject: [Buildroot] [PATCH 3/4] package/Makefile.in: Remove RELRO
 linker flags from CFLAGS
In-Reply-To: <CANQCQpbyDWsyEQ4ERFfpQ=h_5fU_QnXNcKN-ULOKhMf1e7FLDg@mail.gmail.com>
References: <20180425064518.31797-1-stefan.sorensen@spectralink.com>
 <20180425064518.31797-3-stefan.sorensen@spectralink.com>
 <CANQCQpbyDWsyEQ4ERFfpQ=h_5fU_QnXNcKN-ULOKhMf1e7FLDg@mail.gmail.com>
Message-ID: <4fcd5eb1-7cd2-319a-a23f-4cbb3ab06c21@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30-04-18 19:57, Matthew Weber wrote:
> Stefan,
> 
> On Wed, Apr 25, 2018 at 1:45 AM, Stefan S?rensen
> <stefan.sorensen@spectralink.com> wrote:
>> The RELRO related flags are for the linker, not the compiler, so they belong
>> in LDFLAGS.
>>
>> Signed-off-by: Stefan S?rensen <stefan.sorensen@spectralink.com>
>> ---
>>  package/Makefile.in | 10 +++-------
>>  1 file changed, 3 insertions(+), 7 deletions(-)
>>
>> diff --git a/package/Makefile.in b/package/Makefile.in
>> index 1cbf34e0df..4525b8e79f 100644
>> --- a/package/Makefile.in
>> +++ b/package/Makefile.in
>> @@ -141,9 +141,6 @@ ifeq ($(BR2_DEBUG_3),y)
>>  TARGET_DEBUGGING = -g3
>>  endif
>>
>> -TARGET_CFLAGS_RELRO = -Wl,-z,relro
>> -TARGET_CFLAGS_RELRO_FULL = -Wl,-z,now $(TARGET_CFLAGS_RELRO)
>> -
> 
> If you remove these flags from CFLAGS then packages that link with gcc
> vs explicitly ld won't get the flag.

 The intention is that LDFLAGS is used when linking with $CC/$CXX. Linking with
ld should ideally never be done, except for some special snowflakes like the kernel.

 The intention is that TARGET_LDFLAGS is used in all linking invocation.
However, we're pretty sure that for a large number of packages, this isn't
really the case. That's why we want to move more things into the wrapper.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
