From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Sep 2018 11:51:33 +0200
Subject: [Buildroot] [PATCH 1/3] package/Makefile.in: Use '-isystem'
 instead of '-I' in HOST_CFLAGS globally
In-Reply-To: <20180909153221.6b803c9f@windsurf.home>
References: <20180831142024.27548-1-david.degrave@mind.be>
 <20180909153221.6b803c9f@windsurf.home>
Message-ID: <5eeda9cf-ba1a-a83b-6413-d3e43f87dfff@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09/09/2018 15:32, Thomas Petazzoni wrote:
> Hello David,
> 
> On Fri, 31 Aug 2018 16:20:22 +0200, David De Grave (Essensium/Mind)
> wrote:
>>  As the $(HOST_DIR) is the buildroot's system install directory, and that
>> all the builds should use that one in priority (it's even mandatory for
>> uboot and linux), it make sense to use '-isystem' to ensure it is searched
>> right before the system directories and still let the possibility for the
>> packages to use specific ones using '-I'.
> 
> Could you give a few more details about the motivation for this change.
> Is it just because it is "cleaner" to refer to Buildroot
> $(HOST_DIR)/include using -isystem, or does this fix some actual
> problem/build issue ?

 It fixes the existing problem for u-boot and linux in a more generic way. Also,
the same issue might exist for any host package that we have. The exported
headers are often in an 'include' directory that is accessed with a -I flag. If
that -I flag is added after the CFLAGS passed in by us, then the compiler will
first find the host-installed headers rather than the local headers.
Autobuilders will usually not find such an issue, because they have a rather
minimal set of devel packages installed on the system.

 It's true that these issues are rare: normally the local -I flags are added
*before* the CFLAGS passed in by the user. However, I'm pretty sure that
packages do exist that don't do this (e.g. if the Makefile just does 'CFLAGS +=
...'). It's pretty hard to detect such cases, because *usually* it doesn't give
an error (because the system headers are probably compatible with the local
headers).

 Regards,
 Arnout

> 
> Doing such a change is pretty invasive, it could potentially cause
> some build failures, so I'd like to understand the motivation.
> 
> Thanks!
> 
> Thomas
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
