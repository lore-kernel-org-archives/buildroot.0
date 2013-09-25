From: Matt Weber <mlweber1@rockwellcollins.com>
Date: Wed, 25 Sep 2013 14:41:55 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-09-19
In-Reply-To: <CAC2S8kgcLiKT7jGSwcuvi_uq0Lupbn_qAKdOiQZq4bdJNh50Bw@mail.gmail.com>
References: <20130920063008.7C55952C101@lolut.humanoidz.org>
 <CAC2S8kgcLiKT7jGSwcuvi_uq0Lupbn_qAKdOiQZq4bdJNh50Bw@mail.gmail.com>
Message-ID: <CAC2S8kj5UhTyp=JYVNGSozp2X00cWZ-etrUqrnziOcUWmZphOg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 20, 2013 at 8:29 PM, Matt Weber
<mlweber1@rockwellcollins.com> wrote:
>
> On Sep 20, 2013 1:30 AM, "Thomas Petazzoni"
> <thomas.petazzoni@free-electrons.com> wrote:
>>
>> Build statistics for 2013-09-19
>> ===============================
>>
>>         success : 70
>>        failures : 63
>>        timeouts : 0
>>           TOTAL : 133
>>
>> Classification of failures by reason
>> ====================================
>>
>>     trace-cmd-trace-cmd-v2.2.1 | 9
>>                  qt5base-5.0.2 | 4
>> make: *** [/home/test/test/... | 4
>> make: *** [/home/test/test/... | 4
>>                     orc-0.4.18 | 4
>>            python-pyzmq-13.1.0 | 3
>>                  dropwatch-1.4 | 3
>>       host-gcc-initial-4.8-arc | 3
>>                alsa-lib-1.0.26 | 3
>>                        bc-1.06 | 2
>
> Thanks for adding the flex depend to bc.
>
>> make: *** [/home/test/test/... | 2
>>                     ola-0.8.31 | 2
>>                       qt-4.8.5 | 1
>>              gstreamer-0.10.36 | 1
>>                w_scan-20130331 | 1
>>         host-util-linux-2.23.2 | 1
>>                   iozone-3_414 | 1
>>                   boost-1.53.0 | 1
>>                qt5script-5.0.2 | 1
>>                       icu-51.2 | 1
>>                qt5webkit-5.0.2 | 1
>>                  webkit-1.11.5 | 1
>> make: *** [/home/test/test/... | 1
>>                  omniorb-4.1.6 | 1
>
> Omniorb is failing because of how I'm building the host tools ( target
> cflags are getting used).  Working on a fix.

I've narrowed down the omniorb bug to a couple issues, one of which is
where a ?= is never evaluating to the "configure" default value on
Make's second "deferred" pass through the make files.  i.e. my
overload Env define of a value is working, but the value that
autotools populates in the make file does not get defined....
Something like the following is happening inside this package and I
haven't been able to track down why....

in omniorb/mk/beforeauto.mk CPP is defined as....
          CPP ?= /path/to/g++

(I've double checked and CPP is not redefined any where in the package)

Observations............
1) Externally if I provide CPP as an Env option to Make it overloads
correctly and I get CPP=/overloaded/path/to/g++

2) If I don't provide an overload of CPP to Make, CPP never gets
defined and defaults to CPP = g++ (which I assume is a Make default if
CPP doesn't exist? Because no where in the package build system is it
defined as just g++)

Thanks in advance for any tips/suggests,
Matt Weber




[snip]
