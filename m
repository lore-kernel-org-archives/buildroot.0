From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 11 Apr 2014 12:08:02 +0400
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-04-07
In-Reply-To: <20140411095149.7b9db2b2@skate>
References: <20140408063009.EA284100CF4@stock.ovh.net>
 <CAMo8BfL7qvw6HgUtB62XJne2i_irrgWCwB4wtkGBvpP-X1M72w@mail.gmail.com>
 <20140408234145.4ed87c17@skate>
 <CAMo8BfLKSdQnr2+a-WDCj9zJAPgXyitcM42fMDYhvDkzPfeR2Q@mail.gmail.com>
 <20140410234114.6c1c72cd@skate>
 <CAMo8BfJrBZ4Z6M5D_F8vS3EL5g4KM8YTHCByC4qQkyFyZuLg4A@mail.gmail.com>
 <20140411095149.7b9db2b2@skate>
Message-ID: <CAMo8BfLntHkRKv4PHHYTKyHGDi727ftj2XVpHdarK=3eAE7eCg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Apr 11, 2014 at 11:51 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>> Apparently this happens when
>>
>> BR2_PACKAGE_PHP_EXT_ICONV = y and
>> BR2_PACKAGE_LIBICONV is unset.
>>
>> In this case buildroot calls
>>
>> configure --with-iconv
>>
>> for php, omitting LIBICONV dir, and php adds system dirs to -I and -L
>> (though I'm not sure it does that correctly).
>>
>> Looks like we need to always select BR2_PACKAGE_LIBICONV when
>> BR2_PACKAGE_PHP_EXT_ICONV is selected, i.e.:

[...]

> I don't think this is correct, because libiconv is only needed for
> toolchains built without locale support. When the toolchain has locale
> support (either uClibc with locale support, or glibc/eglibc), the iconv
> functionality is provided directly by the C library.
>
> And in fact, your change is going to break the build

I see. Have run the test build which failed.

> I believe what should be
> investigated instead is how to ensure that the C library iconv
> functionality is properly detected by the PHP.

Ok, I'll look deeper at that ext/iconv/config.m4 and stuff around...

> I'm also puzzled as to why this doesn't seem to happen for other
> architecture. I would have to see if I can reproduce it on ARM or x86
> for example. Maybe it's a weird uClibc bug, or something?

-- 
Thanks.
-- Max
