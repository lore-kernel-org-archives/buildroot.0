From: Stephan Hoffmann <sho@relinux.de>
Date: Mon, 03 Sep 2012 12:08:46 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2012-09-01
In-Reply-To: <CAHXCMMJB=uCvvgFqwBTz_MSfdpUx=6KV8x+pk23DN5jBnv=OnA@mail.gmail.com>
References: <20120902063244.629BF428001@lolut.humanoidz.org>
 <504319A8.5070903@relinux.de>
 <CAHXCMMJB=uCvvgFqwBTz_MSfdpUx=6KV8x+pk23DN5jBnv=OnA@mail.gmail.com>
Message-ID: <504481AE.9050702@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sam,

thank you for this hint. Unfortunatelly, I cannot get further, because
alsa-lib refuses to build after touching configure.in with lots of
messages like

> ../../lib/autoconf/lang.m4:194: AC_LANG_CONFTEST is expanded from...
> ../../lib/autoconf/general.m4:2662: _AC_LINK_IFELSE is expanded from...
> ../../lib/autoconf/general.m4:2679: AC_LINK_IFELSE is expanded from...
and
> ../../libtool: line 801: X--tag=CC: command not found
> ../../libtool: line 801: X--tag=CC: command not found
> ../../libtool: line 801: X--tag=CC: command not found
> ../../libtool: line 834: libtool: ignoring unknown tag : command not found

Seems alsa-lib isn't compatible with the version of autorools buildroot
uses.

Unfortunatelly, I am not familiar with autotools so I think I have to
give up at this point.

Can you or somebody else have a look at this and give a hint how I could
get further?

Kind regards

Stephan

Am 02.09.2012 11:01, schrieb Samuel Martin:
> Hi Stephan,
>
> 2012/9/2 Stephan Hoffmann <sho@relinux.de>:
>> Am 02.09.2012 08:32, schrieb Thomas Petazzoni:
>>> Hello,
>>>
>>> On 2012-09-01, 83 random build tests have been done and
>>> submitted on autobuild.buildroot.net.
>>>  56 builds have been successful
>>>  27 builds have failed
>>>
>>>
>>> Build 225b282a1e6ebf8f754d176a6732d80111856d8e
>>> ==============================================
>>>
>>> Status         : NOK
>>> Failure reason : alsa-lib-1.0.25
>>> Architecture   : bfin
>>> Submitted by   : Thomas Petazzoni (Free Electrons build server)
>>> Submitted at   : 2012-09-01 06:51:36
>>> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=666eb02be3cd4115a1ef8b78a63d64d12b24469e
>>> End of log     : http://autobuild.buildroot.net/results/225b282a1e6ebf8f754d176a6732d80111856d8e/build-end.log
>>> Complete log   : http://autobuild.buildroot.net/results/225b282a1e6ebf8f754d176a6732d80111856d8e/build.log.bz2
>>> Configuration  : http://autobuild.buildroot.net/results/225b282a1e6ebf8f754d176a6732d80111856d8e/config
>>> Defconfig      : http://autobuild.buildroot.net/results/225b282a1e6ebf8f754d176a6732d80111856d8e/defconfig
>>>
>> Hello,
>>
>> I just started looking at this. The cause of the problem is that the
>> tool chain lacks suppot for the "versionsort" routine.
>>
>> In uClinux there is a patch adding a versionsort to alsalib locally,
> Don't hesitate to add a link to that patch ;)
>
>> but this doesn't seem to be a good solution to me, especially since I assume
>> that most other toolchains have versionsort so that such a patch would
>> breal other architectures.
>>
>> There are also some other patches for alsa-lib that would be needed to
>> support blackfin. How shall we handle such architecture dependent patches?
> Since alsa-lib is an autotools-based package:
> - the configure script should check whether the toolchain has or not
> versionsort and define a preprocessor macro if needed;
> - the patch applied on the source should only add some code if the
> macro is defined.
>
> This way, the patch will have no effect if the toolchain has
> versionsort support.
>
> As example, you can check out:
> http://git.buildroot.net/buildroot/tree/package/lttng-tools/lttng-tools-no-sync-file-range-in-uclibc.patch
>
>
> Cheers,
>


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
