From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 26 Nov 2018 11:12:42 +0100
Subject: [Buildroot] [PATCH v2] package/libtool: Reduce target package
 to libltdl only
In-Reply-To: <1543225130.5778.5.camel@Nokia-N900>
References: <20181124165434.31651-1-alexander.sverdlin@gmail.com>
 <20181124184708.GB20308@scaer> <7ef83036-fe64-9ca2-e2d0-689f428f5fff@mind.be>
 <1543225130.5778.5.camel@Nokia-N900>
Message-ID: <b4e54580-453f-e184-4c82-531ed56cca8b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 26/11/2018 10:38, Alexander Sverdlin wrote:
> Hi!
> 
> On Mon Nov 26 10:28:29 2018 Arnout Vandecappelle <arnout@mind.be> wrote:
>>>> +HOST_LIBTOOL_SUBDIR = .
>>
>> ?  I guess the following doesn't work?
>>
>> HOST_LIBTOOL_SUBDIR =
> 
> But "." works (as it was working for glibc and gdb previously)...

 Indeed, but it's ugly.

 BTW: glibc?

 On second thought, maybe we should just remove the automatic inheritance for
_SUBDIR entirely.

 There are 15 host packages that set _SUBDIR.

 Of these, 6 are host-only (e.g. gcc) so the automatic inheritance is pointless.

 Of the remaining 9:
- 2 override only HOST_XXX_SUBDIR (asterisk, cxxtest).
- 1 has a different SUBDIR for host and target (gettext).
- 1 overrides HOST_XXX_SUBDIR back to its default (gdb).
- 1 defines both with the same value (icu).
- 4 actually use the inheritance (capnproto, libnspr, tcl, vim).

 So it hardly seems worth to have the automatic inheritance, if only 1/3 of its
occurences are actually useful.


>> ?  Ideally, the GPL-2.0+ part should also mention to what it applies. Like
>>
>> HOST_LIBTOOL_LICENSE = GPL-2.0+ (libtool), LGPLv2.1 (libltdl)
>>
>> (because I think libtool is the only thing that gets installed in
>> HOST_DIR, isn't it?)
> 
> Last time I've checked libltdl was installed in HOST_DIR (I cannot tell if it's used or not right now).

 I meant: I think libtool is the only thing that gets installed in HOST_DIR and
is covered by GPL-2.0+.

 Regards,
 Arnout
