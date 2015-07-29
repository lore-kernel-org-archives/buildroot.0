From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Wed, 29 Jul 2015 08:38:11 -0700
Subject: [Buildroot] building host-e2fsprogs on RHEL5.8
In-Reply-To: <20150729090628.70c71933@free-electrons.com>
References: <55B81D1E.90203@mentor.com>
 <20150729090628.70c71933@free-electrons.com>
Message-ID: <55B8F363.2010606@mentor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Wonderful. I'm not even sure how I would the patches for those two 
problems anyways... :-)

Hollis Blanchard
Mentor Graphics Emulation Division

On 07/29/2015 12:06 AM, Thomas Petazzoni wrote:
> Hollis,
>
> On Tue, 28 Jul 2015 17:23:58 -0700, Hollis Blanchard wrote:
>> I get two errors when building buildroot's host-e2fsprogs (1.42.13) on
>> RHEL5.8, both from e4defrag.c:
>> e4defrag.c:197:2: error: #error sync_file_range not available!
>> e4defrag.c:201:2: error: #error fallocate64 not available!
>>
>> The latter can be patched by calling posix_fallocate64 instead. The
>> former seems to be due to a known bug
>> <https://bugzilla.redhat.com/show_bug.cgi?id=518581>, requiring manually
>> calling syscall().
>>
>> (For the record, this is glibc 2.5 and kernel 2.6.18.)
>>
>> I can work around the problem with this:
>> diff --git a/package/e2fsprogs/e2fsprogs.mk b/package/e2fsprogs/e2fsprogs.mk
>> index 0537521..4aeda83 100644
>> --- a/package/e2fsprogs/e2fsprogs.mk
>> +++ b/package/e2fsprogs/e2fsprogs.mk
>> @@ -12,6 +12,9 @@ E2FSPROGS_LICENSE_FILES = COPYING lib/uuid/COPYING
>> lib/ss/mit-sipb-copyright.h l
>>    E2FSPROGS_INSTALL_STAGING = YES
>>    E2FSPROGS_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-libs
>>
>> +HOST_E2FSPROGS_CONF_OPTS = \
>> +       --disable-defrag
>> +
>>    E2FSPROGS_CONF_OPTS = \
>>           $(if $(BR2_STATIC_LIBS),,--enable-elf-shlibs) \
>>           $(if $(BR2_PACKAGE_E2FSPROGS_DEBUGFS),,--disable-debugfs) \
>>
>>
>> Alternately, if I come up with patches to work around these two
>> problems, would buildroot carry them until upstream e2fsprogs (hopefully
>> one day) picks them up?
> Thanks for the report.
>
> To be honest, I don't think we really care about having the ext4
> defragmentation tool being built as part of our host-e2fsprogs build.
> So you could just as well submit a patch that does:
>
> # the ext4 defragmentation utility doesn't build on old systems, and we
> # don't need it, so disable it
> HOST_E2FSPROGS_CONF_OPTS += --disable-defrag
>
> Of course, do not hesitate to report the issue upstream. But I don't
> think it's worth adding patches to fix this in Buildroot in the mean
> time, just disable the tool.
>
> Best regards,
>
> Thomas
