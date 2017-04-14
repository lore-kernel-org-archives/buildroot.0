From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 14 Apr 2017 19:04:51 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2017-04-09
In-Reply-To: <20170414094440.70fd14a9@free-electrons.com>
References: <20170410062848.062C02803A@b01ledav001.gho.pok.ibm.com>
 <20170411010019.GA2638@tungsten.ozlabs.ibm.com>
 <20170411144331.699becca@free-electrons.com>
 <20170412095212.1A18EB2050@b01ledav03.gho.pok.ibm.com>
 <20170413053406.GA4103@tungsten.ozlabs.ibm.com>
 <54038d3c-376b-b5cb-d4d2-671d1119d722@mind.be>
 <20170414094440.70fd14a9@free-electrons.com>
Message-ID: <9f5cf5ff-934a-c0bd-6ac2-39b8f1f7062b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-04-17 09:44, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 14 Apr 2017 00:14:08 +0200, Arnout Vandecappelle wrote:
> 
>>  I don't think the rpath is wrong. For the target, it *is* indeed /usr/lib.
>> AFAIU the RPATH is *not* used as an extra -L equivalent at link time, except
>> when -rpath-link is given.
> 
> Not really clear to me what happens here. The ld documentation says:

 I was also pondering over that section and couldn't get to a conclusion :-)

[snip]
> I've did a few experiments, building a dummy shared library and a
> program that links to it:
> 
> thomas at skate:/tmp/toto$ ls
> libtoto.so  libtoto.so.1  main.c  toto.c  toto.o
> 
> # -L allows the link to proceed
> 
> thomas at skate:/tmp/toto$ gcc -L/tmp/toto -o main main.c -ltoto
> thomas at skate:/tmp/toto$ 
> 
> # Neither -rpath nor -rpath-link allows ld to find libtoto

 Great.

> 
> thomas at skate:/tmp/toto$ gcc -Wl,-rpath,/tmp/toto -o main main.c -ltoto
> /usr/bin/ld: cannot find -ltoto
> collect2: error: ld returned 1 exit status
> 
> thomas at skate:/tmp/toto$ gcc -Wl,-rpath-link,/tmp/toto -o main main.c -ltoto
> /usr/bin/ld: cannot find -ltoto
> collect2: error: ld returned 1 exit status
> 
> # -L + -rpath, and you get the rpath encoded in the program

 Of course.

> 
> thomas at skate:/tmp/toto$ gcc -L/tmp/toto -Wl,-rpath,/tmp/toto -o main main.c -ltoto
> 
> thomas at skate:/tmp/toto$ readelf -d main| grep rpath
>  0x000000000000000f (RPATH)              Library rpath: [/tmp/toto]
> 
> # -L + -rpath-link, and you don't get the rpath encoded in the program

 Doesn't matter, we don't use rpath-link :-)

> 
> thomas at skate:/tmp/toto$ gcc -L/tmp/toto -Wl,-rpath-link,/tmp/toto -o main main.c -ltoto
> thomas at skate:/tmp/toto$ readelf -d main| grep rpath
> thomas at skate:/tmp/toto$ 

 You're missing one important case here: when toto.so is linked with -rpath to
some /tmp/other directory which contains a library you link against, or that is
NEEDED by toto.

 And then there is also the question of the effect of --sysroot.

 Not to forget the evil that can be done by libtool.

 Sigh.
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
