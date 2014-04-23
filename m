From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 23 Apr 2014 10:51:16 +0200
Subject: [Buildroot] Analysis of build results for 2014-04-19
In-Reply-To: <20140423092209.4d1454ec@skate>
References: <20140420063009.8B76B100DB9@stock.ovh.net>	<20140420104812.5bc926a9@skate>	<53569BBE.1020707@mind.be>	<20140422221958.6240077e@skate>	<5356E9C2.9050900@mind.be>
 <20140423092209.4d1454ec@skate>
Message-ID: <53577F04.1040409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/04/14 09:22, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
> 
> On Wed, 23 Apr 2014 00:14:26 +0200, Arnout Vandecappelle wrote:
> 
>>> True. Currently the KCONFIG_PROBABILITY is chosen between 1% and 35%.
>>> Should I reduce that to 30% ? 25% ?
>>
>>  25% still means 300 packages, and I think that that doesn't even include
>> their dependencies. Isn't that exaggerated? I think that any defconfig
>> with more than 50 packages is not very realistic anymore...
>>
>>  Also, the interesting failures (with missing dependencies) are more
>> likely to fall out when less packages are selected, right?
>>
>>  So my suggestion is to reduce the probability to 15% (still 180 packages
>> in the defconfig...).
> 
> Not really, because your calculations make the assumption that there is
> one BR2_PACKAGE_<foo> option per package. But that's not true: certain
> packages have several, sometimes dozens of BR2_PACKAGE_<foo> options
> (think Qt4, Qt5, Python, etc.). And the percentage of randomization is
> done per BR2_PACKAGE_<foo> options, not per package.
> 
> A quick analysis shows a total of 2832 BR2_PACKAGE_<foo> options
> defined in Buildroot for around 1200 packages, so in average we have a
> little more than 2 Config.in options per package.

 Ah correct, so my proposed 15% indeed becomes 30%.

> 
> Also, by having a much smaller percentage, I'm wondering if we have a
> lot less chances to trigger cases that require a fairly significant
> combination of options to be produced.

 Do we actually have examples of such a situation, that a combination of
packages leads to an error? It's more likely to lead to runtime errors I
expect.

> 
> I've anyway reduced the percentage from 1% to 30% (where it was 1% to
> 35%). I'm obviously open to more discussion on the matter, reducing to
> 30% was just an initial measure.
> 
>>> So let's say that I'll reduce the KCONFIG_PROBABILITY on one side, and
>>> increase the timeout for all builds by an hour on the other side. How
>>> does that look?
>>
>>  The timeout is already 4 hours, isn't it? That's already quite long IMHO.
> 
> Yes, that's quite large, but I've anyway increased it to 6 hours. The
> goal of the time out was *only* to make sure builds entering some quite
> of infinite loop terminate at some point (we used to have a PowerPC
> toolchain whose 'ld' was buggy, and was entering an infinite loop when
> building a certain package).

 True, if there is currently no situation that the timeout is "real",
then it doesn't hurt to increase the timeout. And if a real timeout does
start occuring, we can decrease the timeout again until it is solved.


 Regards,
 Arnout

> 
> Thanks,
> 
> Thomas
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
