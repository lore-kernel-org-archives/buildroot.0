From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 24 Sep 2019 14:14:49 +0200
Subject: [Buildroot] [PATCH v2] exfat,
 exfat-utils: fix the installation path of the helper, utilities
In-Reply-To: <9dbde6f8-aa14-0b64-3fba-5126f23ad56a@grandegger.com>
References: <0649c089-e5ad-e1b1-4616-2fe66c638dd4@grandegger.com>
 <CAJ4jsaeZs+YUfaWwph1c9ztHzF-g2M3rDFhjRSnipQAxaUCw+A@mail.gmail.com>
 <9dbde6f8-aa14-0b64-3fba-5126f23ad56a@grandegger.com>
Message-ID: <5dd8e5a1-9ce6-2eeb-6f88-e5f698efa22a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24/09/2019 14:13, Wolfgang Grandegger wrote:
> Hallo Carlos,
> 
> Am 24.09.19 um 14:00 schrieb Carlos Santos:
>> On Tue, Sep 24, 2019 at 4:56 AM Wolfgang Grandegger <wg@grandegger.com> wrote:
>>>
>>> "mount" from the "util-linux" package does expect the helper utilities
>>> in "/sbin" and not "/usr/sbin".
>>>
>>> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
>>> ---
>>>
>>> Changes since v1:
>>>   Use "--prefix=/" to get programs properly installed
>>>
>>>  package/exfat-utils/exfat-utils.mk | 2 ++
>>>  package/exfat/exfat.mk             | 2 ++
>>>  2 files changed, 4 insertions(+)
>>>
>>> diff --git a/package/exfat-utils/exfat-utils.mk b/package/exfat-utils/exfat-utils.mk
>>> index 62cd471..dd5036e 100644
>>> --- a/package/exfat-utils/exfat-utils.mk
>>> +++ b/package/exfat-utils/exfat-utils.mk
>>> @@ -9,4 +9,6 @@ EXFAT_UTILS_SITE = https://github.com/relan/exfat/releases/download/v$(EXFAT_UTI
>>>  EXFAT_UTILS_LICENSE = GPL-3.0+
>>>  EXFAT_UTILS_LICENSE_FILES = COPYING
>>>
>>> +EXFAT_UTILS_CONF_OPTS += --prefix=/
>>> +
>>>  $(eval $(autotools-package))
>>> diff --git a/package/exfat/exfat.mk b/package/exfat/exfat.mk
>>> index b52b197..ce6859f 100644
>>> --- a/package/exfat/exfat.mk
>>> +++ b/package/exfat/exfat.mk
>>> @@ -12,4 +12,6 @@ EXFAT_LICENSE = GPL-3.0+
>>>  EXFAT_LICENSE_FILES = COPYING
>>>  EXFAT_CFLAGS = $(TARGET_CFLAGS) -std=c99
>>>
>>> +EXFAT_CONF_OPTS += --prefix=/
>>> +
>>>  $(eval $(autotools-package))
>>> --
>>> 2.7.4
>>
>> Did you test on a clean build?
>>
>> With v1:
>>
>> $ rm -rf target/ build/exfat* && make exfat exfat-utils && find target
>> target/
>> target/sbin
>> target/sbin/mount.exfat-fuse
>> target/sbin/mount.exfat
>> target/sbin/dumpexfat
>> target/sbin/exfatfsck
>> target/sbin/fsck.exfat
>> target/sbin/exfatlabel
>> target/sbin/mkexfatfs
>> target/sbin/mkfs.exfat
>> target/usr
>> target/usr/share
>> target/usr/share/man
>> target/usr/share/man/man8
>> target/usr/share/man/man8/mount.exfat-fuse.8
>> target/usr/share/man/man8/dumpexfat.8
>> target/usr/share/man/man8/exfatfsck.8
>> target/usr/share/man/man8/exfatlabel.8
>>
>> With v2:
>>
>>  rm -rf target/ build/exfat* && make exfat exfat-utils && find target
>> target
>> target/usr
>> target/usr/sbin
>> target/usr/sbin/mount.exfat-fuse
>> target/usr/sbin/mount.exfat
>> target/usr/sbin/dumpexfat
>> target/usr/sbin/exfatfsck
>> target/usr/sbin/fsck.exfat
>> target/usr/sbin/exfatlabel
>> target/usr/sbin/mkexfatfs
>> target/usr/sbin/mkfs.exfat
>> target/share
>> target/share/man
>> target/share/man/man8
>> target/share/man/man8/mount.exfat-fuse.8
>> target/share/man/man8/dumpexfat.8
>> target/share/man/man8/exfatfsck.8
>> target/share/man/man8/exfatlabel.8
>> target/share/man/man8/mkexfatfs.8
> 
> You are completely right! I obviously did something wrong, grrr. Sorry
> for confusion.

 My bad, I should have mentioned that we explicitly set --exec-prefix=/usr as
well, so you need to override that as well.

 Actually, you probably *only* want to override exec-prefix, since the man pages
should still go to usr/share/man.

 Regards,
 Arnout
