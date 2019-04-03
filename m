From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 3 Apr 2019 17:44:21 +0200
Subject: [Buildroot] [PATCH] package/bayer2rgb-neon: fix build failure
 with musl libc
In-Reply-To: <cae2e1d4-e0fe-dbe8-c4b1-d7003ddcfad5@micronovasrl.com>
References: <20190403144220.9090-1-giulio.benetti@micronovasrl.com>
 <cae2e1d4-e0fe-dbe8-c4b1-d7003ddcfad5@micronovasrl.com>
Message-ID: <c42e02c1-b11b-a786-1a01-a7ffecae999b@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Il 03/04/2019 16:44, Giulio Benetti ha scritto:
> Il 03/04/2019 16:42, Giulio Benetti ha scritto:
>> Musl libc doesn't provide ssize_t type through <stdlib.h>, need to
>> directly include <unistd.h>.
>>
>> Add patch to include <unistd.h> in main header included in every .c/.cc
>> file.
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/2e9/2e99d0066fadb0802dd0d898215b2f6867603d69/ 
>>
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>> ---
>> ? .../0001-bayer2rgb.h-add-missing-header.patch | 36 +++++++++++++++++++
>> ? 1 file changed, 36 insertions(+)
>> ? create mode 100644 
>> package/bayer2rgb-neon/0001-bayer2rgb.h-add-missing-header.patch
>>
>> diff --git 
>> a/package/bayer2rgb-neon/0001-bayer2rgb.h-add-missing-header.patch 
>> b/package/bayer2rgb-neon/0001-bayer2rgb.h-add-missing-header.patch
>> new file mode 100644
>> index 0000000000..65302f3baf
>> --- /dev/null
>> +++ b/package/bayer2rgb-neon/0001-bayer2rgb.h-add-missing-header.patch
>> @@ -0,0 +1,36 @@
>> +From 98e22511b0b134626b4ae38089ec1725100349de Mon Sep 17 00:00:00 2001
>> +From: Giulio Benetti <giulio.benetti@micronovasrl.com>
>> +Date: Wed, 3 Apr 2019 16:24:16 +0200
>> +Subject: [PATCH] bayer2rgb.h: add missing header
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=UTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +The ssize_t type requires the unistd.h header. This fixes build with
>> +musl libc:
>> +
>> +src/convert-dumb.cc:229:2: error: ?ssize_t? was not declared in this
>> +scope
>> +? ssize_t?? stride;
>> +? ^
>> +
>> +Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
>> +---
>> + src/bayer2rgb.h | 1 +
>> + 1 file changed, 1 insertion(+)
>> +
>> +diff --git a/src/bayer2rgb.h b/src/bayer2rgb.h
>> +index 3c96209..5337dbd 100644
>> +--- a/src/bayer2rgb.h
>> ++++ b/src/bayer2rgb.h
>> +@@ -19,6 +19,7 @@
>> +
>> + #include <stdlib.h>
>> + #include <stdint.h>
>> ++#include <unistd.h>
>> +
>> + #ifdef __cplusplus
>> + extern "C" {
>> +--
>> +2.17.1
>> +
>>
> 
> I've directly contacted the maintainers/constributors to upstream using 
> git log e-mails since I couldn't find any other way.
> 
> Added them in Cc.
> 
> Best regards

Main Git repository is not what I thought.
According to Enrico in Cc it is:
https://gitlab-ext.sigma-chemnitz.de/ensc/bayer2rgb

There he already remove the use of ssize_t type, so my patch to include 
<unistd.h> is useless.

I go for SITE changing from Http to Git and version bumping including 
this patch to fix build failure and 3 more:
git shortlog 45530cf67232b144f72c72a7c0496948353e9f67..
Enrico Scholz (4):
       use 'size_t', not 'ssize_t' for stride
       fixed position of __restrict__
       INSTALL: removed
       CI: updated name of docker image


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
