From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 17 Mar 2017 23:20:54 +0100
Subject: [Buildroot] [PATCH v2 1/3] acl: make sure build picks up
 TARGET_CFLAGS
In-Reply-To: <08d783f9-0117-8a3c-0e8d-c034f0238d78@andin.de>
References: <20170317160616.20570-1-arnout@mind.be>
 <08d783f9-0117-8a3c-0e8d-c034f0238d78@andin.de>
Message-ID: <82f3ccde-64a0-ab90-a450-15a46e34f7f6@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 17-03-17 23:17, Andreas Naumann wrote:
> Hi Arnout,
> tested and works :-)

 You can formalize this by replying with

 Tested-by: Andreas Naumann <dev@andin.de>

(but then without a space in front). It gets picked up by Patchwork and it will
be added to the git log.

 By the way, did you actually test *this patch*, or just that fakeroot works
after the entire series is applied? In the latter case, you should only add your
Tested-by to the last patch (and perhaps 2/3). This particular patch has no
impact on fakeroot.

 Regards,
 Arnout

> 
> thanks,
> Andreas
> 
> Am 17.03.2017 um 17:06 schrieb Arnout Vandecappelle (Essensium/Mind):
>> The acl build system doesn't use automake, therefore it is broken. It
>> doesn't use the CFLAGS passed by configure. Work around this by passing
>> CFLAGS in the environment. The makefiles append to CFLAGS, so this
>> works.
>>
>> This issue hasn't led to build failures, but it is visible e.g. when
>> stack protector is enabled: the stack protector options are not applied
>> to acl. Also debug and optimisation options aren't applied.
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> Cc: Yegor Yefremov <yegorslists@googlemail.com>
>> ---
>> v2: new patch
>> ---
>>  package/acl/acl.mk | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/acl/acl.mk b/package/acl/acl.mk
>> index cbe5e93961..9fd5de18a4 100644
>> --- a/package/acl/acl.mk
>> +++ b/package/acl/acl.mk
>> @@ -15,7 +15,13 @@ ACL_LICENSE_FILES = doc/COPYING doc/COPYING.LGPL
>>
>>  # While the configuration system uses autoconf, the Makefiles are
>>  # hand-written and do not use automake. Therefore, we have to hack
>> -# around their deficiencies by passing installation paths.
>> +# around their deficiencies by:
>> +# - explicitly passing CFLAGS (LDFLAGS are passed on from configure,
>> +#   CFLAGS are not).
>> +# - explicitly passing the installation prefix, not using DESTDIR.
>> +
>> +ACL_MAKE_ENV = CFLAGS="$(TARGET_CFLAGS)"
>> +
>>  ACL_INSTALL_STAGING_OPTS = \
>>      prefix=$(STAGING_DIR)/usr \
>>      exec_prefix=$(STAGING_DIR)/usr \
>>

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
