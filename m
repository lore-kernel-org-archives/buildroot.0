From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 07 Feb 2013 09:34:54 +0100
Subject: [Buildroot] [PATCH 3/5] qt: define license
In-Reply-To: <5112B733.6090103@mind.be>
References: <1360167853-7177-1-git-send-email-luca@lucaceresoli.net>
 <1360167853-7177-3-git-send-email-luca@lucaceresoli.net>
 <20130206175833.6c382929@skate> <5112B733.6090103@mind.be>
Message-ID: <5113672E.4030300@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout Vandecappelle wrote:
> On 06/02/13 17:58, Thomas Petazzoni wrote:
>> Dear Luca Ceresoli,
>>
>> On Wed,  6 Feb 2013 17:24:11 +0100, Luca Ceresoli wrote:
>>
>>> +QT_LICENSE = LGPLv2.1 with exceptions or GPLv3 or commercial
>>> +QT_LICENSE_FILES = LICENSE.LGPL LGPL_EXCEPTION.txt LICENSE.GPL3
>>
>> If Qt5, I've done:
>>
>> +ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
>> +QT5BASE_CONFIGURE_OPTS += -opensource -confirm-license
>> +QT5BASE_LICENSE = LGPLv2.1 or GPLv3.0
>
>   Isn't it GPLv3 rather than GPLv3.0?
>
>> +QT5BASE_LICENSE_FILES = LICENSE.GPL LICENSE.LGPL LGPL_EXCEPTION.txt
>> +else
>> +QT5BASE_LICENSE = Commercial license
>> +QT5BASE_REDISTRIBUTE = NO
>
>   Hm. If LICENSE_APPROVED is not set, it means that the compilation will
> stop to ask the user which license s/he wants. That doesn't necessarily
> imply the commercial license. So I prefer an OR construct here as well.
> And anyway, even if you hold a commercial license you're still free to
> distribute it under one of the other licenses.

How about the following?

QT_LICENSE = LGPLv2.1 with exceptions or GPLv3
ifneq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
QT_LICENSE += or Digia Qt Commercial license
endif
QT_LICENSE_FILES = LICENSE.LGPL LGPL_EXCEPTION.txt LICENSE.GPL3

This way we still cannot automatically (and safely) set
_REDISTRIBUTE = NO, unless we add an explicit "Use commercial license"
knob in menuconfig.

Luca


>
>   By the way, I'd also call it "Digia Qt Commercial license" to make it
> more explicit. But that's just an opinion.
