From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 4 Apr 2016 17:46:12 -0700
Subject: [Buildroot] [PATCH v3] Update libaio to 0.3.110
In-Reply-To: <CAKmqyKNS6ONN_-acLxpNEJwmAjM-hJFX1ZB45mmb=XS-TAAr1Q@mail.gmail.com>
References: <1455824391-23524-1-git-send-email-alistair.francis@xilinx.com>
 <56FFEB04.9090800@gmail.com>
 <CAKmqyKNS6ONN_-acLxpNEJwmAjM-hJFX1ZB45mmb=XS-TAAr1Q@mail.gmail.com>
Message-ID: <CAKmqyKNP2XuUkFyNNyW38UQnLBTt=+WTX-bfVU-BfRnzAh-MVA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 4, 2016 at 5:41 PM, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> On Sat, Apr 2, 2016 at 8:53 AM, Romain Naour <romain.naour@gmail.com> wrote:
>> Hi Alistair, Thomas, All,
>>
>> Le 18/02/2016 20:39, Alistair Francis a ?crit :
>>> Update libaio from 0.3.108 to 0.3.110. This adds AArch64 support.
>>>
>>> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
>>> ---
>>>  package/libaio/0001-arches.patch | 454 ++-------------------------------------
>>>  package/libaio/Config.in         |   2 +-
>>>  package/libaio/libaio.hash       |   4 +-
>>>  package/libaio/libaio.mk         |   2 +-
>>>  4 files changed, 20 insertions(+), 442 deletions(-)
>>>
>>
>> Since the libaio bump, the blktrace package is broken on powerpc [1].
>>
>> /home/peko/autobuild/instance-1/output/host/usr/bin/powerpc-linux-gnu-gcc
>> -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -I. -I..
>> -I../btt -D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 -UCOUNT_IOS
>> -UDEBUG -DNDEBUG -o btreplay btreplay.o -laio -lrt -lpthread
>> [...]ld: btreplay: hidden symbol `_restgpr_29_x' in [..]libgcc.a(crtresxgpr.o)
>> is referenced by DSO
>> [...]ld: final link failed: Nonrepresentable section on output
>>
>> It's seems that only powerpc is affected by this issue...
>> I'm not sure about a proper fixes but adding -shared to the command line fixes
>> the build (not runtime tested though).
>>
>> Can you take a look ?
>
> Good catch, thanks for pointing this out.
>
> It appears to be a common issue and the workaround is to disable pie
> and fpie support.
>
> See: http://patchwork.openembedded.org/patch/86515/
>
> I can't work out how to remove the -fPIC option though. Any ideas?

Spoke too soon. It's forced in the libaio Makefile.

Is everyone happy with me adding a patch that removes that?
It seems to be the way others are doing it.

Thanks,

Alistair

>
> Thanks,
>
> Alistair
>
>>
>> Best regards,
>> Romain Naour
>>
>> [1] http://autobuild.buildroot.net/?reason=blktrace-1.1.0
>>
