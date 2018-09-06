From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Sep 2018 22:43:42 +0200
Subject: [Buildroot] [PATCH] flatcc: add dependency on C++11
In-Reply-To: <CAAjKBV9WAQQwxCzqTGYFaAgZ+gwRU8SDNuwWKJmp3=MpQFT+Yg@mail.gmail.com>
References: <1536261611-13825-1-git-send-email-JoelsonCarl@gmail.com>
 <87sh2m7745.fsf@dell.be.48ers.dk>
 <CAAjKBV9WAQQwxCzqTGYFaAgZ+gwRU8SDNuwWKJmp3=MpQFT+Yg@mail.gmail.com>
Message-ID: <20180906224342.592e16dc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 6 Sep 2018 13:58:15 -0600, Joel Carlson wrote:

> I will dig into this a bit deeper.  The immediate thing I had noticed
> was that CMakeLists.txt changed:
> - project (FlatCC C)
> + project (FlatCC C CXX)
> 
> I only see a single .cpp file, which is in a tests folder.  I will see
> if I can pass/set some options so that C++ isn't necessary, and will
> send a new patch if I find that to be the case.

I see two .cpp files, but indeed both in tests/

$ find . -name '*.cpp'
./test/benchmark/benchflatc/benchflatc.cpp
./test/monster_test_cpp/monster_test.cpp

There is already an option to enable/disable tests:

option(FLATCC_TEST "enable tests" ON)

and we already disable building tests in flatcc.mk:

# Disable build of tests and samples
FLATCC_CONF_OPTS += -DFLATCC_TEST=OFF
HOST_FLATCC_CONF_OPTS += -DFLATCC_TEST=OFF

The CMakeLists.txt needs to be fixed to only require a C++ compiler
when tests are enabled.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
