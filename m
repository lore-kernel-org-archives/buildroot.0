From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 13 Sep 2013 09:52:20 +0200
Subject: [Buildroot] C++ Compiling
In-Reply-To: <15AE5A936F5E3A42A9144E66875A0A8934DC0F@server1-derijp.CLB-Benelux.lokaal>
References: <15AE5A936F5E3A42A9144E66875A0A8934DC07@server1-derijp.CLB-Benelux.lokaal>
 <CAGm1_kvR5zLfHRrcnKmoTSetC9SsiqOj2=xV2Xxa1502CkC8KA@mail.gmail.com>
 <15AE5A936F5E3A42A9144E66875A0A8934DC0F@server1-derijp.CLB-Benelux.lokaal>
Message-ID: <CAGm1_kuO8Bk00v7XicHNJPfSmtodNO_XH2EAG1Sp8im2zE+wxw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 13, 2013 at 9:37 AM, Ruud Commandeur <RCommandeur@clb.nl> wrote:
>
>> -----Oorspronkelijk bericht-----
>> Van: Yegor Yefremov [mailto:yegorslists at googlemail.com]
>> Verzonden: vrijdag 13 september 2013 9:09
>> Aan: Ruud Commandeur
>> CC: buildroot at uclibc.org
>> Onderwerp: Re: [Buildroot] C++ Compiling
>>
>> Hi Ruud,
>>
>> On Fri, Sep 13, 2013 at 9:00 AM, Ruud Commandeur
>> <RCommandeur@clb.nl> wrote:
>> > Hi Everyone,
>> >
>> > This week I tried build my 1st aplication using boost.
>> Adding the boost
>> > part was easy from buildroot, but when trying to build the
>> application,
>> > I get "Relocations in generic ELF" and "could not read
>> symbols: File in
>> > wrong format".
>>
>> Have you tried using CMake (http://cmake.org/)? CMake in BR
>> (http://buildroot.uclibc.org/downloads/manual/manual.html#_inf
>> rastructure_for_cmake_based_packages)
>>
>> This is how you include Boost modules:
>>
>> # Boost
>> find_package( Boost 1.36.0 COMPONENTS program_options REQUIRED)
>>
>> and here you link them:
>>
>> ADD_EXECUTABLE(test ${SOURCES})
>> TARGET_LINK_LIBRARIES(test ${Boost_LIBRARIES})
>>
>> That's it. CMake will check for working C++ compiler at
>> configuring stage.
>>
>
> OK, I did not think of using CMake yet. Since Boost is mostly header
> files, I thought it would be no different from my other simple
> C-application. I build this with a generic-package like this:
>
> define CLB_TEST_APP_BUILD_CMDS
>         $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
> endef
>
> Wouldn't this be possible for an application using Boost?

You should use TARGET_CXX instead of TARGET_CC. See
package/libjson/libjson.mk, package/qt/qt.mk and other
generic-packages for example.

>> > Obviously, this has to do with cross-compiling. When compiling a
>> > C-source, it uses arm-none-linux-gnueabi-gcc. But for a cpp
>> it uses g++,
>> > resulting in an Intel 80386 object file. Looking at the
>> internet, I read
>> > about an otion called "Toolchain has C++ support?". This
>> must be the one
>> > to use, but I can't find it. Neither in the Toolchain
>> section nor the
>> > System configuration.
>> >
>> > I am using Buildroot 2013.02 with CodeSourcery (Sourcery
>> Codebench) for
>> > ARM 2012.03.
>>
>> This toolchain always provides a C++ compiler, so you don't need to
>> configure it in BR.
>>
>
> OK, that explains why I couldn't find it :-). But, apart from the
> Boost-stuff, it doesn't explain why it doesn't use the arm-gcc in this
> case then. Should it be someting (the BUILD_CMD line?) in the mk-file of
> my custom package?

See above.

Yegor
