From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 24 May 2018 22:49:07 -0500
Subject: [Buildroot] [PATCH] utils/genrandconfig: filter microblaze GCC
 < 8 bug
In-Reply-To: <CANQCQpaB5E1pQn+xttcWJFMgGWd7G0t477kUfd02SwkVc3hkMg@mail.gmail.com>
References: <1527112426-21842-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20180524133029.1a7a22e9@windsurf>
 <CANQCQpaB5E1pQn+xttcWJFMgGWd7G0t477kUfd02SwkVc3hkMg@mail.gmail.com>
Message-ID: <CANQCQpZfqWK4zaq_4hUZkzhX2WvdWwKGzRKsXPJ0NhubWQDfng@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Thu, May 24, 2018 at 10:14 PM, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
> Thomas,
>
> On Thu, May 24, 2018 at 6:30 AM, Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
>>
>> Hello Matt,
>>
>> On Wed, 23 May 2018 16:53:46 -0500, Matt Weber wrote:
>
>>  - gcc bug #85180, which affects gcc 6.x and gcc 7.x, but is fixed in
>>    gcc 8.x. It affects packages such as flare-engine, boost and
>>    gst-ffmpeg.
>>
>>    So, for this one, rather than autobuilder exception, I would like to
>>    see something like this:
>>
>> config BR2_TOOLCHAIN_HAS_GCC_BUG_85180
>>         bool
>>         default y if BR2_microblaze
>>
>> and we'll adjust this with a "depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8"
>> when gcc 8.x support is added in Buildroot.
>>
>> flare-engine is not selected by any package (flare-game depends on
>> flare-engine).
>>
>> gst-ffmpeg is not selected by any package.
>>
>> boost has lots of reverse dependencies however. But perhaps we can nail
>> down the specific boost sub-option(s) that exhibit the problem, and
>> only add the gcc bug dependency on those suboptions?
>
> Sure, I'll take a look.

Looks like it doesn't really matter what you enable/disable for boost
options as it's when the bjam tool is getting called that it gets
stuck.  I  can start to look at all the reverse dependencies
tomorrow....

(output from when I kill the bjam process)
2018-05-24T22:39:43 common.copy stage/lib/libboost_thread.so.1.66.0
2018-05-24T22:39:43 ln-UNIX stage/lib/libboost_thread.so
2018-05-24T22:40:06 /bin/sh: line 1: 22677 Terminated
PATH="/accts/mlweber1/rc-buildroot/output/host/bin:/accts/mlweber1/rc-buildroot/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
./bjam -j65 -q --user-config=/accts/mlweber1/rc-buildroot/output/build/boost-1.66.0/user-config.jam
toolset=gcc threading=multi abi=sysv variant=release link=shared
runtime-link=shared -d+1 --ignore-site-config --layout=system
2018-05-24T22:40:06 make: ***
[/accts/mlweber1/rc-buildroot/output/build/boost-1.66.0/.stamp_built]
Error 143

Matt
