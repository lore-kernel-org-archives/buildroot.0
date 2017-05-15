From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 15 May 2017 10:30:06 +0200
Subject: [Buildroot] [PATCH] package/boost: disable boost-locale for
	static only build
In-Reply-To: <20170515091516.0b3e6112@free-electrons.com>
References: <20170514214556.17980-1-romain.naour@gmail.com>
 <20170515091516.0b3e6112@free-electrons.com>
Message-ID: <CAGm1_ksMXXjviJAact4vDgnRJCrfvQUMxKU2Jytjn2rBwBU2qw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Mon, May 15, 2017 at 9:15 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Sun, 14 May 2017 23:45:56 +0200, Romain Naour wrote:
>
>> diff --git a/package/boost/Config.in b/package/boost/Config.in
>> index 9825c09..6ffa8f0 100644
>> --- a/package/boost/Config.in
>> +++ b/package/boost/Config.in
>> @@ -98,8 +98,15 @@ config BR2_PACKAGE_BOOST_IOSTREAMS
>>
>>  config BR2_PACKAGE_BOOST_LOCALE
>>       bool "boost-locale"
>> +     # boost-locale build system try to link dynamically with icu
>> +     # see <link>shared and <runtime-link>shared in locale/build/Jamfile.v2
>> +     # Related to https://svn.boost.org/trac/boost/ticket/9685
>> +     depends on !BR2_STATIC_LIBS
>>       select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
>
> OK, but doesn't the problem occurs only when icu is enabled? Do we want
> to prevent from using boost-locale in static linking situations in all
> cases, or only when combined with icu?
>
> Perhaps we should keep it simple and do like you suggest, i.e make it
> unavailable for all static linking configurations, regardless of icu
> availability. I'm just trying to figure out the best/right approach
> between yours and the one proposed by Yegor.

Have you also tested regex module? It seems to have the same
structure/dependencies as locale module.

Yegor
