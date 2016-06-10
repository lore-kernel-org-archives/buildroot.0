From: Ubaldo Porcheddu <ubaldo@eja.it>
Date: Fri, 10 Jun 2016 10:43:02 +0100
Subject: [Buildroot] [PATCH 1/1] eja: new package (revised)
In-Reply-To: <20160610002714.0705f36d@free-electrons.com>
References: <1462185476-18775-1-git-send-email-ubaldo@eja.it>
 <20160610002714.0705f36d@free-electrons.com>
Message-ID: <4dde5f9b7e0d6641315e3c02b7233ede@eja.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

Il 2016-06-09 23:27 Thomas Petazzoni ha scritto:
> Hello,
> 
> Thanks for this new iteration. However, I did not realize that eja was
> your own creation. How widely is it used? Looking at the Github page,
> it really looks like a personal project that isn't that widely used, so
> I am not sure to which point a Buildroot package makes sense.

eja is mostly a standard Lua interpreter with embedded support for 
sockets, forking, ioctl and very basic http support that can compile 
libraries in machine portable bytecode. I of course don't know how 
widely it is used apart the installations under my direct knowledge 
which are several thousand of ARM STB and some hundreds of servers, the 
only "oficial" data in my hands are the number of time it has been 
downloaded from SourceForge 
(https://sourceforge.net/projects/eja/files/stats/timeline?dates=2016-01-01+to+2016-06-10).

If it could help it is in Debian Sid and Testing 
(https://packages.debian.org/testing/eja) and going to be in the next 
version of Ubuntu (http://packages.ubuntu.com/yakkety/web/eja).

My idea was to contribute to this project, which I really like a lot, 
with a piece of software that I think and hope could be useful for 
others because it has been designed to run on a very similar 
environment.


> I also have some other comments.
> 
> First, your commit title should not contain "(revised)" otherwise this
> will be kept forever in the Git history. See the Buildroot manual for
> details on how to send new iterations of a patch: adding a version and
> a changelog.

ok

> On Mon,  2 May 2016 10:37:56 +0000, Ubaldo Porcheddu wrote:
> 
>>  menu "Interpreter languages and scripting"
>> +	source "package/eja/Config.in"
> 
> Does it quality as a Language interpreter, or as a web-server? I
> couldn't really understand.

I thought to put it under this section because on Buildroot I personally 
tend to use it more like a Lua interpreter than a web server.

>> +EJA_VERSION = 9.4.22
>> +EJA_SOURCE = $(EJA_VERSION).tar.gz
>> +EJA_SITE = https://github.com/ubaldus/eja/archive
>> +
>> +ifeq ($(BR2_STATIC_LIBS),y)
>> +EJA_CFLAGS = -DLUA_USE_POSIX -DLUA_COMPAT_ALL
>> +EJA_MYLIBS = -static -w
>> +else
>> +EJA_CFLAGS = -DLUA_USE_POSIX -DLUA_COMPAT_ALL -DLUA_USE_DLOPEN
>> +EJA_MYLIBS = -ldl
>> +endif
>> +
>> +define EJA_BUILD_CMDS
>> +	$(MAKE) \
>> +        CC="$(TARGET_CC)" RANLIB="$(TARGET_RANLIB)" \
>> +        CFLAGS="$(TARGET_CFLAGS) $(EJA_CFLAGS)" \
>> +        MYLIBS="$(EJA_MYLIBS)" AR="$(TARGET_CROSS)ar rcu" -C $(@D)
>> +endef
> 
> Instead of duplicating the Lua interpreter source code into the Eja
> project, why don't you link with the Lua interpreter library instead?
> This makes sure that when the Lua interpreter is updated (to fix bugs,
> etc.), Eja also gets fixed.

The new Makefile is indeed checking if the libraries are already 
installed or not and if so it is using the installed ones, I didn't test 
it on Buildroot yet because I am waiting to update ejaBox to the 
Buildroot 16.05. I still have to keep the Lua source code in case I need 
to compile static like on Android for instance 
(https://play.google.com/store/apps/details?id=it.eja.box)

> Finally, if it's a server, shouldn't it have an initscript? I see that
> you've added one in your ejabox project, why isn't it part of this
> package?
> 
> But again, overall, I'm questioning the value of packaging a piece of
> software that seems to be very confidential, but I admit that my
> position may be controversial, and other people in the Buildroot
> community may prefer that we accept patches for all packages,
> regardless of their "popularity".

As I said before I really like Buildroot and I tend to think about it as 
a Linux "distro" focused on minimal devices thus by my point of view it 
would make sense to have selected piece of software that can be useful 
for this kind of environment even if they are not widely used.
