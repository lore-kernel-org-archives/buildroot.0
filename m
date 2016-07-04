From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 4 Jul 2016 11:23:44 +0200
Subject: [Buildroot] [PATCH 1/3] Move the host-pkgconf dependency from
 host-cmake to pkg-cmake
In-Reply-To: <20160702154337.GP22343@free.fr>
References: <1467388410-28135-1-git-send-email-luca@lucaceresoli.net>
 <1467388410-28135-2-git-send-email-luca@lucaceresoli.net>
 <14747128-2dd0-efb6-6c4c-faf744e8899a@mind.be>
 <20160702144455.GN22343@free.fr>
 <a3e6ad6e-525a-80c7-9764-16bac0149e75@mind.be>
 <20160702154337.GP22343@free.fr>
Message-ID: <577A2B20.4010400@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Arnout,

On 02/07/2016 17:43, Yann E. MORIN wrote:
> Arnout, All,
> 
> On 2016-07-02 16:52 +0200, Arnout Vandecappelle spake thusly:
>> On 02-07-16 16:44, Yann E. MORIN wrote:
>>> However, because the culprit for causing the dependency to host-pkgconf
>>> is cmake itslef, and not a cmake-based package, I would suggest that we
>>> do not consider this a hack, but the reality.
>>
>>  Isn't the problem that package foo uses FindBar from cmake, which uses
>> pkg-config to find the package? For me, the burden of depending on host-pkgconf
>> is on package foo in that case.
> 
> I don't agree. ;-) The use of pkg-config is an internal detail of the
> CMake modules, of which the package should have no knowledge.

Good point, you're right. FindBar might even be not using pkgconf in the
current CMake release, and start using it in a future release. As long
as it's provided among the CMake built-in modules, this should be
considered a CMake implementation detail.

Thus my comment to the patch should be changed, but the patch content is
still needed in case we skip building host-cmake. Either in the current
form...

> 
>>  That said, this hack really simplifies things so let's indeed keep it.
> 
> On which I'll close the discussion. Thanks! :-)
> 
>>  Actually, why don't we just always build host-pkgconf? On my machine 'make
>> host-pkgconf' takes 6.5 seconds, of which 4.7 seconds are parsing the makefiles.
>> Can we afford the cost of 1.5 seconds of build time and 844K of build size?

...or in the variant suggested by Arnout.

> If we decide so, then we should move this non-hack into the
> generic-package infra, so that it benefits all packages at once, not
> only cmake-based packages.

This might add an unneeded host-pkgconf build in a some corner cases,
thus it would be once again a "hack". But its cost is so negligible that
I would definitely consider it.

-- 
Luca
