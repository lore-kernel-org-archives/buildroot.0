From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 2 Aug 2013 10:50:44 +0200
Subject: [Buildroot] [PATCH 1 of 2 v2] infra: introduce
 suitable-extractor helper function
In-Reply-To: <20130802102851.388356b2@skate>
References: <patchbomb.1375390546@BEANTN0L019720>
 <b277803240198c7900d9.1375390547@BEANTN0L019720>
 <20130802102851.388356b2@skate>
Message-ID: <CAAXf6LWFBKk2mebh8eVdhR1Epcauf5Lmk4CZLqgDV4Us+SX+GA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 2, 2013 at 10:28 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Thu, 01 Aug 2013 22:55:47 +0200, Thomas De Schampheleire wrote:
>
>> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
>> --- a/package/pkg-utils.mk
>> +++ b/package/pkg-utils.mk
>> @@ -62,6 +62,8 @@ INFLATE.tbz2 = $(BZCAT)
>>  INFLATE.tgz  = $(ZCAT)
>>  INFLATE.xz   = $(XZCAT)
>>  INFLATE.tar  = cat
>> +# suitable-extractor(filename): returns extractor based on suffix
>> +suitable-extractor = $(firstword $(INFLATE$(suffix $(1))))
>
> Do you know why we need this $(firstword ...) call here? In all places
> in was using directly $(INFLATE$(...)), except in the package
> infrastructure where it was doing this firstword additional call.
>
> It was added by Peter in 2c6390a5d0c01420879e9f23bc89afb19976da4a.

It wasn't clear to me when I sent the patch, but I figured it didn't hurt.
But now I think I know: the inflate targets originate from the
.config, and users can add extra arguments there. In fact, the default
for $(ZCAT) is:
BR2_ZCAT="gzip -d -c"

To check the dependency, we only want to check for 'gzip', but to do
the actual inflate, we shouldn't use 'firstword'. So, the patch is
wrong, and I will fix it :)

Thanks for highlighting this!

Best regards,
Thomas
