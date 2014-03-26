From: Jeremie Scheer <jeremie.scheer@armadeus.com>
Date: Wed, 26 Mar 2014 11:35:31 +0100
Subject: [Buildroot] [PATCH 2/2] Compile Poppler over Qt
In-Reply-To: <20140304154446.42c57533@skate>
References: <1393940343-15899-1-git-send-email-jeremie.scheer@armadeus.com>
 <20140304154446.42c57533@skate>
Message-ID: <5332AD73.7010009@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/04/2014 03:44 PM, Thomas Petazzoni wrote:
> Dear jeremie.scheer at armadeus.com,
>
> On Tue,  4 Mar 2014 14:39:03 +0100, jeremie.scheer at armadeus.com wrote:
>> From: Jeremie Scheer <jeremie.scheer@armadeus.com>
>>
>>
>> Signed-off-by: Jeremie Scheer <jeremie.scheer@armadeus.com>
>> ---
>>  package/poppler/poppler.mk |    9 ++++++++-
>>  1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/poppler/poppler.mk b/package/poppler/poppler.mk
>> index 040327f..7dce7a0 100644
>> --- a/package/poppler/poppler.mk
>> +++ b/package/poppler/poppler.mk
>> @@ -7,10 +7,17 @@
>>  POPPLER_VERSION = 0.24.4
>>  POPPLER_SOURCE = poppler-$(POPPLER_VERSION).tar.xz
>>  POPPLER_SITE = http://poppler.freedesktop.org
>> -POPPLER_DEPENDENCIES = fontconfig
>>  POPPLER_LICENSE = GPLv2+
>>  POPPLER_LICENSE_FILES = COPYING
>>  POPPLER_CONF_OPT = --with-font-configuration=fontconfig
>> +POPPLER_INSTALL_STAGING = YES
>> +
>> +ifeq ($(BR2_PACKAGE_QT),y)
>> +	POPPLER_DEPENDENCIES = qt fontconfig
>> +else
>> +	POPPLER_DEPENDENCIES = fontconfig
>> +	POPPLER_CONF_OPT += --disable-poppler-qt4
> Why isn't the fontconfig dependency part of the if, and not kept
> outside, since it is not related to Qt ?
You're right, I will put it out of the Qt condition, as it is not
related to Qt.
>
> Also, if poppler has a --disable-poppler-qt4 in one case, it probably
> has a --enable-poppler-qt4 option in the other case, no?
No, there is no enable option for Qt4 compilation. By default, Poppler
tries to compile over Qt, but you can disable it with the
--disable-poppler-qt4 option.
>
> Thanks!
>
> Thomas


-- 
J?r?mie Scheer
Software Engineer
Tel: +33 (0)9 72 29 41 44
Fax: +33 (0)9 72 28 79 26
Armadeus Systems - A new vision of the embedded world
http://www.armadeus.com
