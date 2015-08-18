From: Brendan Heading <brendanheading@gmail.com>
Date: Tue, 18 Aug 2015 15:28:58 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/canfestival: fix musl
	compilation
In-Reply-To: <1439876243.1710.8.camel@embedded.rocks>
References: <1439848293-26836-1-git-send-email-brendanheading@gmail.com>
 <1439876243.1710.8.camel@embedded.rocks>
Message-ID: <CA+BsyQ6Okyed-B9qSou+8zOoYfVBkBnNCg6O8DdGacK=3SAh4w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18 August 2015 at 06:37, J?rg Krause <joerg.krause@embedded.rocks> wrote:
> On Mo, 2015-08-17 at 22:51 +0100, Brendan Heading wrote:
>> Fixes: http://autobuild.buildroot.net/results/75a/75aa6e7e4f3dcd74e4b
>> 65496060328ec7bd0e747/
>>
>> ANSI signal handlers take an int parameter, not sigval_t.
>
> This is true for uClibc, but for other libc timer_notify is asigned to
> the `sigev_notify_function` function which has an `union sigval` as
> argument [1].

Jorg,

Well spotted. I failed to check the non-uclibc case.

The code is a bit strange; I'm not sure why they've decided to do it
differently in uclibc. I would have thought timer_create would behave
in the same way.

Do you think it would suffice to add another #ifdef __UCLIBC__ on the
signal handler, or should I dive a bit deeper ?

Brendan
