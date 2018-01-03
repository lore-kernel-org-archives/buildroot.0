From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 3 Jan 2018 21:37:03 +0100
Subject: [Buildroot] [PATCH v3 1/1] opentracing-cpp: new package
In-Reply-To: <20180103111020.0311f39c@windsurf.lan>
References: <1514014802-23736-2-git-send-email-heyleke@gmail.com>
 <1514969543-20452-1-git-send-email-heyleke@gmail.com>
 <1514969543-20452-2-git-send-email-heyleke@gmail.com>
 <20180103090357.4mgwa6xeo2iw25hi@sapphire.tkos.co.il>
 <CAGszK3jrDpyP6eyg8J3N371YVQpV+KUFB90=608LC0viDMFFbA@mail.gmail.com>
 <20180103092503.twpzntqwteqhb4oh@sapphire.tkos.co.il>
 <20180103111020.0311f39c@windsurf.lan>
Message-ID: <CAHXCMMJo24SinfZnTfbee5X3MjfF31cYHEJkH9=dJ=TmZpDDZg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Apologies for being late back in this thread :-/

On Wed, Jan 3, 2018 at 11:10 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Wed, 3 Jan 2018 11:50:32 +0200, Baruch Siach wrote:
>> Hi Jan,
>>
>> On Wed, Jan 03, 2018 at 10:07:51AM +0100, Jan Heylen wrote:
>> > I copied that infra from another package. Thomas also indicated already
>> > that there is something already generalised but not fully yet. So he
>> > adviced to keep it like this for the time being. If this is not nok, please
>> > advice differently.
>>
>> I see that rabbitmq-c is also doing that. I think that the -DBUILD_SHARED_LIBS
>> part is redundant. But the -DBUILD_STATIC_LIBS part might be needed, since the
>> generic code does not handle that.
>
> The generic code in pkg-cmake.mk is indeed not very consistent. It is
> strange to pass BUILD_SHARED_LIBS, but not BUILD_STATIC_LIBS.

Well, I think the code in pkg-cmake.mk has been done to stick as close
as possible to what is the default behavior of CMake.
But, it is true its default behavior is not really consistent since
CMake only offers a boolean variable driving the way the libraries are
built (see [1])

>
> On the other hand, there doesn't seem to be a real standardization of
> such options in the CMake world. I.e it's really up to each individual
> package to obey to BUILD_SHARED_LIBS/BUILD_STATIC_LIBS, and many CMake
> packages have their own custom options to enable/disable shared/static
> library build.
>
> But I guess for the sake of consistency pkg-cmake.mk should also pass
> BUILD_STATIC_LIBS, and we should accordingly cleanup the CMake packages
> that rely on BUILD_SHARED_LIBS/BUILD_STATIC_LIBS to not pass them
> explicitly, and rely on what the pkg-cmake infra is doing.

Adding BUILD_STATIC_LIBS will make thing a bit nicer (at least
symetric), though it is not standard in any way, which means some
projects may choose another name for a similar option and there is not
much we can do about this.

BTW, some projects still seems ignoring the existence of the
BUILD_SHARED_LIBS variable since they add a similar option with a
different name.


[1] https://cmake.org/cmake/help/v3.8/manual/cmake-variables.7.html#variables-that-change-behavior

Regards,

-- 
Samuel
