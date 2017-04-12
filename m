From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Apr 2017 11:51:41 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2017-04-09
In-Reply-To: <20170411144331.699becca@free-electrons.com>
References: <20170410062848.062C02803A@b01ledav001.gho.pok.ibm.com>
 <20170411010019.GA2638@tungsten.ozlabs.ibm.com>
 <20170411144331.699becca@free-electrons.com>
Message-ID: <dbe8ce72-321e-f883-a46d-5d4a682cea7b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-04-17 14:43, Thomas Petazzoni wrote:
> Hello,
> 
> Adding the Buildroot mailing in Cc, and therefore keeping the full
> context.
> 
> On Tue, 11 Apr 2017 11:00:19 +1000, Sam Bobroff wrote:
> 
>> I had a look at this, but I'm not having much luck. Do you have any
>> advice?
>>
>> The error itself is clear from the build log, both during configure and
>> later at the link failure:
>>
>> From http://autobuild.buildroot.net/results/005/0050aa0d5360d166d07d4b6ee4484f4746b224f5/readline-7.0/config.log
>>
>> configure:6025: checking for tgetent in -lncurses
>> configure:6050:
>> /home/buildroot/build/instance-0/output/host/usr/bin/powerpc64-linux-gcc
>> -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
>> -D_FILE_OFFSET_BITS=64  -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
>> -D_FILE_OFFSET_BITS=64  conftest.c -lncurses   >&5
>> /home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64-buildroot-linux-gnu/5.4.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld: cannot find -lncurses
>>
>> From http://autobuild.buildroot.net/results/005/0050aa0d5360d166d07d4b6ee4484f4746b224f5/build-end.log
>>
>> /home/buildroot/build/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/powerpc64-buildroot-linux-gnu/5.4.0/../../../../powerpc64-buildroot-linux-gnu/bin/ld: cannot find -lncurses
>> collect2: error: ld returned 1 exit status
>>
>> (I do see why it's using ncurses even though it wasn't detected: the package
>> file forces -lncurses into LIBS.)
>>
>> There are no references to ncurses in the build-time.log file, so it
>> apparently wasn't built at all during this run.

 I suspect this is a circular dependency. Possibly

ncurses -> busybox -> libselinux -> python3 -> readline -> ncurses

 It would be nice to have the first 50 lines or so of the build log saved as
well, then we would see such a circular dependency.

>>
>> But the package file for readline has "READLINE_DEPENDENCIES = ncurses"
>> and "BR2_PACKAGE_NCURSES=y" *is* set in the Buildroot config.
>>
>> I can't replicate the failure locally, Buildroot always builds ncurses
>> as I expect from that configuration.

 Did you use the same .config?

>>
>> So the only explanation I can think of is that the autobuilder's target
>> directory is missing ncurses but the Buildroot stamp file must indicate
>> that it's already been installed.
>>
>> Am I missing something?
> 
> There is a -Wl,-rpath,/usr/lib in the link command link that isn't
> correct. This means that the compiler will try to link against the host
> ncurses if available, which is bad.

 I suspect that that is there just because ncurses wasn't detected. But I could
be wrong.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
