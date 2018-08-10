From: Michal Sojka <sojkam1@fel.cvut.cz>
Date: Fri, 10 Aug 2018 12:37:02 +0200
Subject: [Buildroot] [PATCH] core/legal-info: Add package dependencies
 with licenses to the manifest
In-Reply-To: <9f696e5a41234480bdec320f9677ee0d@ex16mbx1.ms.cvut.cz>
References: <20180809170055.13334-1-sojkam1@fel.cvut.cz>
 <9f696e5a41234480bdec320f9677ee0d@ex16mbx1.ms.cvut.cz>
Message-ID: <874lg2tsmp.fsf@steelpick.2x.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matthew,

On Thu, Aug 09 2018, Matthew Weber wrote:
> Michal,
>
> On Thu, Aug 9, 2018 at 12:08 PM <sojkam1@fel.cvut.cz> wrote:
>>
>> From: Michal Sojka <michal.sojka@cvut.cz>
>>
>> This adds one column to the legal-info manifest table. It contains the
>> dependencies of the given package and their licenses. This information
>> is useful when assessing license compatibility of the packages and
>> their libraries.
>>
>> An example of the content of the new column for the MPD package is
>> shown below:
>>
>>     "alsa-lib (LGPL-2.1+ (library), GPL-2.0+ (aserver)),
>>     boost (BSL-1.0), libid3tag (GPL-2.0+), libmad (GPL-2.0+),
>>     libzlib (Zlib), skeleton-init-common (unknown),
>>     skeleton-init-sysv (unknown),
>>     toolchain-external-linaro-arm (unknown), "
>
> This output is definitely good verbose data to look at for possible
> licensing violations/inheritance.  Maybe it would be better show as a
> part of the dependency graph?

I was also thinking about that, but my feeling is that lawyers and
managers prefer tables over graphs and I need this information for those
people.

>> ---
>>  Makefile               |  6 +++---
>>  package/pkg-generic.mk |  2 +-
>>  package/pkg-utils.mk   | 15 +++++++++++++--
>>  3 files changed, 17 insertions(+), 6 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index f79d39fd26..ba60a5a08f 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -781,9 +781,9 @@ legal-info-clean:
>>  legal-info-prepare: $(LEGAL_INFO_DIR)
>>         @$(call MESSAGE,"Buildroot $(BR2_VERSION_FULL) Collecting legal info")
>>         @$(call legal-license-file,buildroot,buildroot,support/legal-info,COPYING,COPYING,HOST)
>> -       @$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE,TARGET)
>> -       @$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE,HOST)
>> -       @$(call legal-manifest,buildroot,$(BR2_VERSION_FULL),GPL-2.0+,COPYING,not saved,not saved,HOST)
>> +       @$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE,DEPENDENCIES WITH LICENSE,TARGET)
>> +       @$(call legal-manifest,PACKAGE,VERSION,LICENSE,LICENSE FILES,SOURCE ARCHIVE,SOURCE SITE,DEPENDENCIES WITH LICENSE,HOST)
>
> I'd suggest not changing the existing format and append the new data
> as a new field on the end.  Some people might have scripts using this
> data which would be impacted by keeping the host/target field last and
> inserting dependencies before it.

Actually, the format of the generated file is not changed. The new
column is the last one. Here, the last argument specifies, which of the
two manifest files is the target. But I agree that if somebody uses this
macro in their makefiles, it will break.

I'll send v2 with the last two arguments switched.

Thanks
-Michal
