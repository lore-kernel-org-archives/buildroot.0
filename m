From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 5 Sep 2014 08:22:40 -0500
Subject: [Buildroot] [PATCH v4] fio: add missing libaio dependency
In-Reply-To: <CANQCQpayxq9ZRggLvysN3s87R8BoJj-1+Lq-H06-z8=+eTviFA@mail.gmail.com>
References: <1408031710-18439-1-git-send-email-Matthew.Weber@rockwellcollins.com>
 <20140814184120.5ebc56d2@free-electrons.com>
 <CANQCQpayxq9ZRggLvysN3s87R8BoJj-1+Lq-H06-z8=+eTviFA@mail.gmail.com>
Message-ID: <CANQCQpbKR4Z3gYunh3xh8UtDSyOU_jpEfnG9A+hqSmPz03DK6g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Thu, Aug 14, 2014 at 11:44 AM, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
> Thomas,
>
> On Thu, Aug 14, 2014 at 11:41 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Dear Matt Weber,
>>
>> On Thu, 14 Aug 2014 10:55:10 -0500, Matt Weber wrote:
>>> The fio package dlopen()s the libaio library at runtime
>>> when the ioengine function is selected as libaio.
>>>
>>> Signed-off-by Matt Weber <Matthew.Weber@rockwellcollins.com>
>>
>> I had a quick look at the fio code base, and the configure script
>> (which is not autoconf based) seems to have some code to detect whether
>> libaio is present, and only use it when available.
>>
>> Also, what seems to be dlopen()ed is not the libaio library itself, but
>> rather "external engines", i.e parts of fio.
>>
>> So I'm not sure about your patch, and I'd like to do some more testing
>> about it.
> Ok, I'll take a look a closer look and see if there is an approach
> that could be added to make libaio an optional configuration.

Disregard/disgard this patchset, after further code review, the shared
library open error is one of the expected failure outputs if you don't
have support for the specific dynamic "io library".  The build of the
fio package does correctly determine if the libaio lib is present or
not and correctly adds it to the ioengines list for use.  Then when
the package is executed, it looks up if a "set of operations" is
registered for that ioengine library.  If they are, it goes ahead and
uses them, if they need to be loaded, like in the case of libaio, it
attempts to load them no mater if previously fio was not built with
libaio support.

I'll post a note to the fio forum/mailing list that it maybe worth
improving the package to exclude ioengines from registering operations
if the application wasn't built with support for them.  By default if
the ioengine is built-in (ie operations are pre-registered at build
time) and not a dlopen()ed library, the correct checks are in place.

Thanks,

-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
