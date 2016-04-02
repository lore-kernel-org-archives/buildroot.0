From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 2 Apr 2016 19:43:37 +0200
Subject: [Buildroot] [PATCH] yajl: fix static linking in a parallel build
In-Reply-To: <1459617080.18262.5.camel@embedded.rocks>
References: <1459538292-7023-1-git-send-email-joerg.krause@embedded.rocks>
 <20160402171318.653fec21@free-electrons.com>
 <1459614558.18262.3.camel@embedded.rocks>
 <CAHXCMMLwDB7Y-5LWxw_Gszcz=S6UxmDr8xMM5MUryu3DugzgMQ@mail.gmail.com>
 <1459617080.18262.5.camel@embedded.rocks>
Message-ID: <CAHXCMMLOeZQj83aKwszLwVZv_cP-fWeHzF28SQ6=L4wfCJbT3A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Apr 2, 2016 at 7:11 PM, J?rg Krause <joerg.krause@embedded.rocks> wrote:
> On Sa, 2016-04-02 at 19:05 +0200, Samuel Martin wrote:
>> On Sat, Apr 2, 2016 at 6:29 PM, J?rg Krause <joerg.krause@embedded.ro
>> cks> wrote:
>> >
>> > On Sa, 2016-04-02 at 17:13 +0200, Thomas Petazzoni wrote:
>> > >
>> > > Hello,
>> > >
>> > > On Fri,  1 Apr 2016 21:18:12 +0200, J?rg Krause wrote:
>> > >
>> > > >
>> > > >
>> > > > + FOREACH (test ${TESTS})
>> > > > +   GET_FILENAME_COMPONENT(testProg ${test} NAME_WE)
>> > > > +   ADD_EXECUTABLE(${testProg} ${test})
>> > > > +-  TARGET_LINK_LIBRARIES(${testProg} yajl m)
>> > > > ++  TARGET_LINK_LIBRARIES(${testProg} yajl_s m)
>> > > I am not sure to understand why this would fix the parallel build
>> > > issue. The parallel build problem comes from the fact that the
>> > > library
>> > > and tests sit in different directories, and that they are built
>> > > in
>> > > parallel with each other. Both the yajl and yajl_s libraries are
>> > > built
>> > > in the same directory, separate from the tests directory. So I
>> > > don't
>> > > quite see how changing from using yajl to yajl_s is going to make
>> > > a
>> > > difference here. But maybe I'm missing something.
>> > The issue is that we patch yajl (#0002) to build only the static
>> > library in a static build. So there is no shared library target for
>> > CMake to use as a dependency.
>> hmm... with that explaination, I nack this.
>> IMHO, the correct way to fix this would rather be:
>>
>> IF(BUILD_SHARED_LIBS)
>>   TARGET_LINK_LIBRARIES(${testProg} yajl m)
>> ELSE()
>>   TARGET_LINK_LIBRARIES(${testProg} yajl_s m)
>> ENDIF()
>>
>
> Yes, this would probably be best. However, the static library is build
> in shared and static builds.

I'm aware of that. Unfortunately, CMake is not equivalent to autotools
on that point.
CMake only provide one boolean flag to control the shared libs. build,
instead of a tristate option allowing building: shared libs only, or
static libs only, or shared and static libs.
That's why I made the choice of always building the static libs, and
keep BUILD_SHARED_LIBS driving the shared libs. build.

Though the static libs are always built, if the shared libs are built
as well, I'd tend to use the *.so at least to reduce the footprint...

Side note, this is breaking test. We usually don't care much about
building tests...

Regards,

-- 
Samuel
