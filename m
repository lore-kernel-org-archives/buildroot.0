From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Tue, 16 Apr 2019 22:02:43 +0200
Subject: [Buildroot] [PATCH] package/madplay: fix build failure due to
 old autotools macro
In-Reply-To: <c905ca2b-dab2-525d-c1bf-27de0bc8c02d@mind.be>
References: <20190416102125.124084-1-giulio.benetti@micronovasrl.com>
 <c905ca2b-dab2-525d-c1bf-27de0bc8c02d@mind.be>
Message-ID: <236d5006-5412-7c58-b915-63bec6df476c@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

Il 16/04/2019 21:45, Arnout Vandecappelle ha scritto:
> 
> 
> On 16/04/2019 12:21, Giulio Benetti wrote:
>> MKINSTALLDIRS is not automatically called by autotools when
>> autoreconfigured.
>> This leads to have install stage error:
>> `/bin/sh @MKINSTALLDIRS@
>> /home/dawncrow/buildroot-test/scripts/instance-0/output/target/usr/share
>> /bin/sh: 0: Can't open @MKINSTALLDIRS@`
>> because @MKINSTALLDIRS@ doesn't get substituted during autoreconf.
>>
>> Add patch that explicitly calls AM_MKINSTALLDIRS macro to substitute
>> every @MKINSTALLDIRS@ occurence in *.in Makefile.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/744/7447c03426556f787f20f7ab2d36f0cacc4af1bd/
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>> ---
>>   ...4-configure-ac-call-AM_MKINSTALLDIRS.patch | 23 +++++++++++++++++++
>>   1 file changed, 23 insertions(+)
>>   create mode 100644 package/madplay/0004-configure-ac-call-AM_MKINSTALLDIRS.patch
>>
>> diff --git a/package/madplay/0004-configure-ac-call-AM_MKINSTALLDIRS.patch b/package/madplay/0004-configure-ac-call-AM_MKINSTALLDIRS.patch
>> new file mode 100644
>> index 0000000000..bc6c97efae
>> --- /dev/null
>> +++ b/package/madplay/0004-configure-ac-call-AM_MKINSTALLDIRS.patch
>> @@ -0,0 +1,23 @@
>> +configure.ac: call AM_MKINSTALLDIRS to substitute @MKINSTALLDIRS@
>> +
>> +MKINSTALLDIRS is obsolete and doesn't get automatically called.
>> +
>> +Force call AM_MKINSTALLDIRS() macro to substitute every @MKINSTALLDIRS@
>> +occurence in *.in files.
>> +
>> +Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> 
>   What is the upstream status of this patch?

It seems almost dead the development, latest release is old, 2004:
https://sourceforge.net/projects/mad/files/
there are several patches pending but nothing seems to move on:
https://sourceforge.net/p/mad/patches/

I haven't found any other possible upstream different from sourceforge.
Do you know if there's another one?

Or do I send patch anyway on Sourceforge and leave it there?

>> +
>> +diff -urpN madplay-0.15.2b.orig/configure.ac madplay-0.15.2b/configure.ac
>> +--- madplay-0.15.2b.orig/configure.ac	2019-04-16 12:06:03.781018755 +0200
>> ++++ madplay-0.15.2b/configure.ac	2019-04-16 12:07:48.399162610 +0200
>> +@@ -146,6 +146,10 @@ ALL_LINGUAS="en es fr hr no"
>> + AM_GNU_GETTEXT([use-libtool])
>> + AM_GNU_GETTEXT_VERSION(0.14.1)
>> +
>> ++dnl Make sure AM_MKINSTALLDIRS gets called
> 
>   That comment just repeats the function call. Better:
> 
> dnl Substitute MKINSTALLDIRS

Yes, right.

Thank you
Kind regards
-- 
Giulio Benetti
CTO

MICRONOVA SRL
Sede: Via A. Niedda 3 - 35010 Vigonza (PD)
Tel. 049/8931563 - Fax 049/8931346
Cod.Fiscale - P.IVA 02663420285
Capitale Sociale ? 26.000 i.v.
Iscritta al Reg. Imprese di Padova N. 02663420285
Numero R.E.A. 258642
