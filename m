From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 Mar 2017 20:46:22 +0100
Subject: [Buildroot] [PATCH] fakeroot: bump version to 1.21-2
In-Reply-To: <ca4c849a-caa1-05f5-a298-a066fc19591a@mind.be>
References: <20161004115320.647-1-maxime.hadjinlian@gmail.com>
 <20161004163555.7c8af28f@free-electrons.com>
 <CAGduivwqAtheOrr_J0XWXR-9rjWNwPC9Y0dFCqKyBua+bir0ww@mail.gmail.com>
 <d5b7097f-1af5-1130-21b2-fb3c1278a646@andin.de>
 <20170313133220.62892a21@free-electrons.com>
 <216f6108-da26-92cc-8177-07117d20092c@andin.de>
 <20170313163306.GA3680@free.fr> <20170314091615.2de4a05b@free-electrons.com>
 <adf0f72b-286b-e056-a2ed-24389f852472@andin.de>
 <180611cf-c61b-736d-c753-9df57bb29bc7@andin.de>
 <f785c386-075b-ac22-3114-d09a79dbeffc@mind.be>
 <ece0d310-0f3d-9f1c-e045-70f0f5c4d777@andin.de>
 <ca4c849a-caa1-05f5-a298-a066fc19591a@mind.be>
Message-ID: <651a8b7e-4910-445e-6613-404be75af105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-03-17 20:07, Arnout Vandecappelle wrote:
> 
> 
> On 15-03-17 09:17, Andreas Naumann wrote:
>> Hi Arnout,
>>
>> Am 15.03.2017 um 01:20 schrieb Arnout Vandecappelle:
>>>
>>>
>>>  For the record, I can reproduce this on my side. I just do "fakeroot
>>> /bin/bash", then do the commands from the shell. Even an ls -l of the copied
>>> files within the fakeroot shell already shows the "arnout" instead of "root"
>>> user. My host fakeroot (Debian 1.21-3.1).
>> So are you saying you see this behaviour with your host fakeroot?
> 
>  That was only half a sentence, it should have been:
> 
> My host fakeroot (Debian 1.21-3.1) doesn't show the problem.

 Buildroot fakeroot works fine when I have libacl1-dev installed on my system -
the Debian package has a build dependency on libacl1-dev. So we would need to
add host-acl to FAKEROOT_DEPENDENCIES. That also pulls in host-attr. On my
system, it brings the time for 'make host-fakeroot' on a clean output from

real    0m12.230s
user    0m8.500s
sys     0m1.132s

to

real    0m21.945s
user    0m17.724s
sys     0m2.948s

so a significant slowdown... Although in absolute numbers it is just 10 seconds,
so maybe it is acceptable.

 Anyway, I'll send a patch that does this, let's see if others consider this
overhead acceptable.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
