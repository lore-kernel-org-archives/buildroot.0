From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Wed, 23 Oct 2019 13:19:16 +0100
Subject: [Buildroot] [PATCH] pkgconf: Add HOST_MAKE_ENV sytem include
 and lib
In-Reply-To: <d489e8b8-3265-3b15-d284-6ba1009ad565@mind.be>
References: <20191021123810.23135-1-thomas.preston@codethink.co.uk>
 <20191021161828.6ee9f412@windsurf>
 <d489e8b8-3265-3b15-d284-6ba1009ad565@mind.be>
Message-ID: <49ba985d-1c14-be8a-644a-094625c7332c@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/10/2019 20:31, Arnout Vandecappelle wrote:
> On 21/10/2019 16:18, Thomas Petazzoni wrote:
>> On Mon, 21 Oct 2019 13:38:10 +0100
>> Thomas Preston <thomas.preston@codethink.co.uk> wrote:
>>
>>> Recently, a change to the pkg-config wrapper made it more explicit about
>>> where the system include and library directories are, so that pkgconf
>>> does not print them. See upstream commit 9cc8680.
>>>
>>> By default, we configure the pkg-config wrapper for the target sysroot,
>>> however the default system include and library directories are not
>>> reconfigured for the host build environment (they still point at the
>>> target sysroot). Fix this by adding the host system include and library
>>> directories to HOST_MAKE_ENV.
>>>
>>> Note: this isn't likely to fix any bugs at present, but the incorrect
>>> configuration may hide an include-order related error which the original
>>> patch was supposed to fix!
>>
>> I think this could potentially fix:
>>
>>   https://bugs.busybox.net/show_bug.cgi?id=11776
>>   https://bugs.busybox.net/show_bug.cgi?id=12131
>>
>> which are precisely include-order related.
> 
>  It's not very likely that a change in HOST_MAKE_ENV will fix an issue when
> building a target package...
> 
>  However, the recently-applied commit 9cc8680fe5 may indeed do so. I'll do a
> test build and update the issues if they're fixed.
> 

fwiw I just tested the last posted config [0] based on 37be55a5db (no fix)
and master + HOST_MAKE_ENV fix, and see the same error in both:

	/mnt/output/host/i586-buildroot-linux-gnu/include/c++/9.2.0/cstdlib:75:15: fatal error: stdlib.h: No such file or directory
	   75 | #include_next <stdlib.h>

Which suggest these patches don't fix this particular issue.

[0] https://bugs.busybox.net/show_bug.cgi?id=11776#c4
