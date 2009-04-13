From: Luciano Greiner <luciano.greiner@gmail.com>
Date: Mon, 13 Apr 2009 16:32:15 -0300
Subject: [Buildroot] Error while configuring QTOPIA 4
In-Reply-To: <26fbce020904090749v529109bk2b301bcdda12f0d@mail.gmail.com>
References: <26fbce020904081145x3966a6f2sb118941d363ccd86@mail.gmail.com>
	<87hc0zynp9.fsf@macbook.be.48ers.dk>
	<26fbce020904081531u63830ad1x8875d79a93511f59@mail.gmail.com>
	<37c712e0904081612u554e9a1cg2e355be21689bcc3@mail.gmail.com>
	<26fbce020904081633m4802c5f0g11d1ebfbc071571e@mail.gmail.com>
	<37c712e0904090721h294a8612raabb77d37627b025@mail.gmail.com>
	<26fbce020904090749v529109bk2b301bcdda12f0d@mail.gmail.com>
Message-ID: <26fbce020904131232g2c2b1f0ana4cc0cd06450d599@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

i think the file not found error is something related to environment
variables. Looking at my staging_dir i found i have
usr/bin/i686-linux-uclibc-g++. So i updated CXX variable to
"i686-linux-uclibc-g++". just before ./configure on qtopia4.make. Now
it passes through configure command, but fails compilation with:

project.cpp:(.text+0xef14): undefined reference to
`QFile::open(_IO_FILE*, QFlags<QIODevice::OpenModeFlag>)'
project.o: In function `QMakeProject::read(QString const&,
QMap<QString, QStringList>&)':
project.cpp:(.text+0x1767c): undefined reference to
`QFile::open(_IO_FILE*, QFlags<QIODevice::OpenModeFlag>)'
collect2: ld returned 1 exit status
make[1]: ** [/mnt/lfs/buildroot/build_i686/qt-embedded-linux-opensource-src-4.5.0/bin/qmake]
Erro 1
make[1]: Saindo do diret?rio
`/mnt/lfs/buildroot/build_i686/qt-embedded-linux-opensource-src-4.5.0/qmake'
make: ** [/mnt/lfs/buildroot/build_i686/qt-embedded-linux-opensource-src-4.5.0/.configured]
Erro 2

Any ideas?

Thanks!

2009/4/9 Luciano Greiner <luciano.greiner@gmail.com>:
> 2009/4/9 Allan Clark <allanc@chickenandporn.com>:
>> Might want to provide a download URL for your config file; I am not sure if
>> you've sent that yet, but it helps anyone whose interest you've captured to
>> look at what's going on -- easier than trying to see your screen :)
> Sure! :) Here it goes:
>
> http://greiner.com.br/mybuildroot.config
>
> Thank you!
>
>
>> 2009/4/8 Luciano Greiner <luciano.greiner@gmail.com>
>>>
>>> Sorry, i meant CXX.
>>>
>>> My CXX variable value is g++
>>>
>>> Thanks
>>>
>>> 2009/4/8 Allan Clark <allanc@chickenandporn.com>:
>>> > Hi Luciano;
>>> > $(CC) isn't used. ?$(CXX) is used in the code snippets:
>>> >> ? ? ? ?echo $(CXX) -c -o $@ $(CXXFLAGS) property.cpp
>>> > You might want to provide Peter and the list with that macro's value as
>>> > well. ?Knowing the value of $(CC) is not very useful.
>>> > Allan
>>> >
>>> >
>>> > On Wed, Apr 8, 2009 at 18:31, Luciano Greiner
>>> > <luciano.greiner@gmail.com>
>>> > wrote:
>>> >>
>>> >> > Strange, seems like is doesn't like:
>>> >> >
>>> >> > property.o: property.cpp project.h option.h
>>> >> > ? ? ? ?$(CXX) -c -o $@ $(CXXFLAGS) property.cpp
>>> >> >
>>> >> > Which looks perfectly fine. Could you change the line in
>>> >> > qt-embedded-linux-opensource-src-4.5.0/qmake/Makefile to read:
>>> >> >
>>> >> > property.o: property.cpp project.h option.h
>>> >> > ? ? ? ?echo $(CXX) -c -o $@ $(CXXFLAGS) property.cpp
>>> >> > ? ? ? ?false
>>> >> >
>>> >> > And run make again?
>>> >>
>>> >> I couldn't edit qmake/Makefile because it is regenerated once
>>> >> configured is executed.
>>> >> Anyway i place an echo code to get $(CC) variable value before
>>> >> qtopia.mk configure command, and it's value is g++
>>> >>
>>> >> $(CC) = g++.
>>> >>
>>> >> Thanks
>>> >>
>>> >> Luciano Greiner
>>> >>
>>> >>
>>> >>
>>> >> On Wed, Apr 8, 2009 at 4:01 PM, Peter Korsgaard <jacmet@uclibc.org>
>>> >> wrote:
>>> >> >>>>>> "Luciano" == Luciano Greiner <luciano.greiner@gmail.com> writes:
>>> >> >
>>> >> > ?Luciano> Hello.
>>> >> > ?Luciano> I am using the trunk version of Buildroot. I am getting the
>>> >> > following
>>> >> > ?Luciano> error while it's configuring QTOPIA 4:
>>> >> >
>>> >> > ?Luciano> Creating qmake. Please wait...
>>> >> > ?Luciano> make[1]: Entering directory
>>> >> > ?Luciano>
>>> >> >
>>> >> > `/mnt/lfs/buildroot/build_i686/qt-embedded-linux-opensource-src-4.5.0/qmake'
>>> >> > ?Luciano> g++: @: No such file or directory
>>> >> > ?Luciano> make[1]: *** [property.o] Error 1
>>> >> >
>>> >> > ?Luciano> Dows anyone know what may be wrong here?
>>> >> >
>>> >> > Strange, seems like is doesn't like:
>>> >> >
>>> >> > property.o: property.cpp project.h option.h
>>> >> > ? ? ? ?$(CXX) -c -o $@ $(CXXFLAGS) property.cpp
>>> >> >
>>> >> > Which looks perfectly fine. Could you change the line in
>>> >> > qt-embedded-linux-opensource-src-4.5.0/qmake/Makefile to read:
>>> >> >
>>> >> > property.o: property.cpp project.h option.h
>>> >> > ? ? ? ?echo $(CXX) -c -o $@ $(CXXFLAGS) property.cpp
>>> >> > ? ? ? ?false
>>> >> >
>>> >> > And run make again?
>>> >> >
>>> >> > --
>>> >> > Bye, Peter Korsgaard
>>> >> >
>>> >> _______________________________________________
>>> >> buildroot mailing list
>>> >> buildroot at busybox.net
>>> >> http://lists.busybox.net/mailman/listinfo/buildroot
>>> >
>>> >
>>> >
>>> > --
>>> > allanc at chickenandporn.com ?"??" http://linkedin.com/in/goldfish
>>> > please, no proprietary attachments (http://tinyurl.com/cbgq)
>>> > Sent from New York, NY, United States
>>>
>>>
>>>
>>> --
>>> Luciano Greiner
>>
>>
>>
>> --
>> allanc at chickenandporn.com ?"??" http://linkedin.com/in/goldfish
>> please, no proprietary attachments (http://tinyurl.com/cbgq)
>>
>
>
>
> --
> Luciano Greiner
>



-- 
Luciano Greiner
