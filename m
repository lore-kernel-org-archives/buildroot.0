From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 27 Dec 2012 22:43:57 +0200
Subject: [Buildroot] [PATCH] new package: libpciaccess
In-Reply-To: <50DC9CCB.8060304@petroprogram.com>
References: <1356220309-22847-1-git-send-email-stefan.froberg@petroprogram.com>
 <87y5gpt9h0.fsf@dell.be.48ers.dk> <50D6F90F.7020104@petroprogram.com>
 <87txrcuaz8.fsf@dell.be.48ers.dk> <50D70F60.50503@petroprogram.com>
 <20121223162012.24cfdd64@skate> <50DC925D.4050805@petroprogram.com>
 <50DC9CCB.8060304@petroprogram.com>
Message-ID: <50DCB30D.2000501@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

27.12.2012 21:08, Stefan Fr?berg kirjoitti:
> 27.12.2012 20:24, Stefan Fr?berg kirjoitti:
>> Hi Thomas
>>
>> 23.12.2012 17:20, Thomas Petazzoni kirjoitti:
>>> Dear Stefan Fr?berg,
>>>
>>> On Sun, 23 Dec 2012 16:04:16 +0200, Stefan Fr?berg wrote:
>>>
>>>> That mesa3d updating beyond 7.10.3 (that I have here) seems especially
>>>> interesting challenge.
>>> Do you have more details about the issues involved in bumping mesa3d
>>> beyond 7.10.3 ?
>>>
>>> Thomas
>> Well, if you try to bump it to 8.0.5 version, it will abort at some point.
>>
>> It borks at the time it tries to compile glsl.
>>
>> It tries to build helper program (builtin_compiler) with system python
>> (shouldn't that be HOST_DIR/usr/bin/python ???)
>> and then it crashes.
>>
>> I have included here the actual screenshot of the situation.
>>
>> Regards
>> Stefan
> Update:
> The situation starts even earlier than 8.0.5. Right at version 7.11
> And changing system python to buildroot python (MESA3D_CONF_ENV +=
> PYTHON2= $(HOST_DIR)/usr/bin/python)
> didn't change anything.
>

Update2:
Found out that this has nothing to do with python. The mesa glsl stuff
building has changed since 7.10.3
so that it build some helper programs (like builtin_compiler and others)
and it builds them wrongly
with cross-compiler while it should use system compiler.

Solution:
Try to give correct variables (APP_CXX=g++ and APP_CC=gcc)  to
MESA3D_CONF_ENV and/or MESA3D_MAKE_ENV
and see if problem goes away.
If not, then make a patch that enforces the correct compiler for all
those helper programs under src/glsl and src/glsl/glcpp
