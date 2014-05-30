From: =?ISO-8859-1?Q?Peter_K=FCmmel?= <syntheticpp@gmx.net>
Date: Fri, 30 May 2014 22:41:00 +0200
Subject: [Buildroot] [PATCH 1/1] ti-gfx: pkg-config should also set
 parent include dir
In-Reply-To: <20140530222718.5cb42dd5@free-electrons.com>
References: <1401462022-10744-1-git-send-email-syntheticpp@gmx.net>	<CAEBucnAiAtrF1uthDyuTPyS5TF8OQdSBchCLZOwRuLJ+ZP67wg@mail.gmail.com>	<5388A9DC.1010204@gmx.net>	<CAEBucnDa_EjmUu2buXEA16by0_Wck+sp-RF1Rajc8uSOswb_Zg@mail.gmail.com>
 <20140530222718.5cb42dd5@free-electrons.com>
Message-ID: <5388ECDC.6050909@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30.05.2014 22:27, Thomas Petazzoni wrote:
> Dear Spenser Gilliland,
>
> On Fri, 30 May 2014 14:57:19 -0500, Spenser Gilliland wrote:
>
>>> Yes, Qt5's cmake files assume /usr/include not /usr/include/GLES2.
>>>
>>> I added -I${includedir} instead of removing only "GLES2" because then
>> nothing will break,
>>> and the other .pc file also sets both dirs.
>>> But it seems common practice is to not add the uppercase dir names in the
>> pkg-congig file.
>
> You should fix your e-mail client, as it very badly handles quotations.
>
>> This patch won't break anything.  But it would be nice if you could go back
>> and reverify this just to be sure.
>>
>> My reasoning is that,  /usr/include is a default include dir which all
>> compilers should use automatically.   There should not be a need to
>> manually specify it.
>
> Agreed, and therefore I'd like to understand in more details why the
> patch is needed. We typically don't commit things we don't understand
> why they are needed :)

In short: anybody assumes "#include <GLES2/gl2.h>" works when the search
paths of pkg-config are used. But when pkg-config reports /usr/include/GLES2
gl2.h could not be found, because there is no /usr/include/GLES2/GLES2/gl2.h.

Until now this doesn't pop up because by chance the directory GLES2
resides in /usr/include and this path is added by most by build systems.
But the cmake configure scripts of Qt5 test for "GLES2/gl2.h" only in the path
reported by pkg-config.

>
> Thanks,
>
> Thomas
>
