From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 5 Feb 2016 15:49:43 +0100
Subject: [Buildroot] [PATCH] bind: fix intermittent build issues with
	high BR2_JLEVEL
In-Reply-To: <CAAXf6LXhN0OiA-LMjRSqQViKE1oKPBep_GMRvUf6Yk3Jfh8X1A@mail.gmail.com>
References: <1446721054-15603-1-git-send-email-heyleke@gmail.com>
 <20151105224203.77337e4b@free-electrons.com>
 <CAGszK3iEXWFBRz4zmG5ky9AptekEX34sVYmRoK8JDremEbNPgA@mail.gmail.com>
 <20151106101913.4de92418@free-electrons.com>
 <CAAXf6LXhN0OiA-LMjRSqQViKE1oKPBep_GMRvUf6Yk3Jfh8X1A@mail.gmail.com>
Message-ID: <CAAXf6LWrBJ6a7yxxsYCp1EqcnDEhwN+eGRc7e8KA30G_0jPt-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 6, 2016 at 10:10 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Hi Thomas,
>
> On Fri, Nov 6, 2015 at 10:19 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Jan,
>>
>> On Fri, 6 Nov 2015 08:04:35 +0100, Jan Heylen wrote:
>>
>>> > I am not sure it is appropriate to send a patch in the name of someone
>>> > else. Maybe you're taking one of Peter's previous commit, and
>>> > re-applying it, but the context is different, so I believe it should be
>>> > under your own name.
>>> >
>>> OK, just wanted to point out it is the same issue (and the same solution).
>>
>> OK.
>>
>>
>>> make[1]: Leaving directory `<CUT>/output/build/bind-9.9.7'
>>> make: *** [<CUT>/output/build/bind-9.9.7/.stamp_built] Error 2
>>>
>>> How often are you able to reproduce it ? On what type of build machine ?
>
> We saw this issue from time to time. Definitely not always, but also
> definitely more than once. I don't have exact figures.
>
>>> >
>>>
>>> We are on the  2015.05, Released May 31st, 2015 Buildroot release.
>>
>> On master, we updated bind to 9.9.8. Do you also reproduce the issue
>> with bind 9.9.8 ?
>>
>> What I find weird is that our autobuilder infrastructure generally
>> catches pretty well the parallel build issues. And we currently have
>> zero failures on bind 9.9.7 and bind 9.9.8:
>>
>>   http://autobuild.buildroot.org/?reason=bind-9.9.7
>>   http://autobuild.buildroot.org/?reason=bind-9.9.8
>>
>>
>>> We do build multiple defconfigs (up to 8) (in separate buildroot working
>>> folders) at once on the same machine. But I see from the buildroot output
>>> that BR2_JLEVEL is set to '9' (cores +1) for each of these jobs?
>>
>> That's expected if you have left BR2_JLEVEL to its default of 0.
>>
>>> >>> bind 9.9.7 Building
>>> PATH="<CUT>/output/host/bin:<CUT>/output/host/sbin:<CUT>/output/host/usr/bin:<CUT>/output/host/usr/sbin:/usr/local/bin:/usr/bin"
>>>  /usr/bin/make -j9  -C <CUT>/output/build/bind-9.9.7/
>>> make[1]: Entering directory `<CUT>/output/build/bind-9.9.7'
>>> making all in <CUT>/output/build/bind-9.9.7/make
>>>
>>>
>>> Maybe the exact condition is to have multiple buildroot jobs (8) on 8 cores
>>> with BR2_JLEVEL set to 8 (so 8*8 = 64 'jobs').
>>>
>>> So we might optimize that on our side ;-), but still it shouldn't trigger
>>> this error?
>>
>> It should trigger this error indeed.
>
> From the bind website:
> https://kb.isc.org/article/AA-00291/46/Im-trying-to-compile-BIND-9-and-make-is-failing-due-to-files-not-being-found.-Why-.html
>
> "Using a parallel or distributed "make" to build BIND 9 is not
> supported, and doesn't work. If you are using one of these, use normal
> make or gmake instead."
>
> Based on our observed failures and the above upstream message that
> parallel make is not supported, shouldn't we take that into account in
> buildroot (and thus applying this patch) ?
>

Ping... I think this should go in for the release.
I should have discussed this on the Buildroot days, but forgot...
