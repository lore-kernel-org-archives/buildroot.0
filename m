From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 9 Oct 2018 10:22:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/dtc: fix include guards for
 older kernel/u-boot
In-Reply-To: <20181008193115.GI2869@scaer>
References: <20181008115146.17797-1-lothar.felten@gmail.com>
 <20181008180230.53ab7972@windsurf> <20181008163233.GH2869@scaer>
 <9062fe55-2457-66bf-48cc-74e787d95129@mind.be> <20181008193115.GI2869@scaer>
Message-ID: <c05396c3-9f67-4e1d-ea34-516c9eab9258@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 8/10/18 21:31, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2018-10-08 21:21 +0200, Arnout Vandecappelle spake thusly:
>> On 8/10/18 18:32, Yann E. MORIN wrote:
>>> On 2018-10-08 18:02 +0200, Thomas Petazzoni spake thusly:
>>>> However, I suppose it doesn't fix the problem when you have a
>>>> recent version of libfdt installed on your system (through your
>>>> distribution), that doesn't play well with those older Linux/U-Boot
>>>> versions. Correct ?
>>> Probably not, indeed, but that is still better (IMHO) than the few hacks
>>> we already tried with -isystem or the likes, which do not really work
>>> either...
>>  As far as we tested it, [1] *does* really work.
>> [1] http://patchwork.ozlabs.org/patch/964474/
> 
> No it does not. Please see commit 6f8162cf8c1abef7e0a4771fe0d6b26a28f5c2b6
> which got reverted by 255b6f80d395ef048f46cfcf75dba690c56af657, and which
> was supposed to fix a very similar issue...

 Ah, good that you saw this.

 Unfortunately 255b6f80d just says that there were too many issues.

 So I went back to the mail archives, and as far as I can see the only issue was
with python. Python's setup script will parse CPPFLAGS to find the include
directories, but it doesn't look at -isystem, only at -I. So it is actually
quite easy to fix.

 The reason that it got reverted so quickly without looking for a real fix is
that this was just before 2016.08-rc1, so the revert looked like the easy way
out. And nobody took the time back then to try to fix the issue fundamentally.

 For reference: the failures occur when building in a minimal environment
(particularly, no system zlib devel package). It happened for
host-python-setuptools, tvheadend and mongodb, at least.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
