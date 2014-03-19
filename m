From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 19 Mar 2014 14:41:37 +0000
Subject: [Buildroot] [PATCH] libtool: revert a commit which
 re-introduced an already fixed problem
In-Reply-To: <5329A0A3.9020805@mind.be>
References: <1395078022-37381-1-git-send-email-Vincent.Riera@imgtec.com>
 <87txaw4gwt.fsf@dell.be.48ers.dk> <5327F9E1.1020301@mind.be>
 <532823A9.9010603@imgtec.com> <53294D50.3040800@mind.be>
 <53296606.9070104@imgtec.com> <5329A0A3.9020805@mind.be>
Message-ID: <5329ACA1.2030105@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/19/2014 01:50 PM, Arnout Vandecappelle wrote:
> On 19/03/14 10:40, Vicente Olivert Riera wrote:
>> On 03/19/2014 07:54 AM, Arnout Vandecappelle wrote:
>>> On 03/18/14 11:44, Vicente Olivert Riera wrote:
>>>> On 03/18/2014 07:46 AM, Arnout Vandecappelle wrote:
>>>>> On 03/17/14 23:08, Peter Korsgaard wrote:
>>>>>>>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>>>>>>>>>>> writes:
>>>>>>
>>>>>>     > The commit ed73d1d2e3703290e74bb076bc6dd0417aa3ba21 modified the
>>>>>> changes
>>>>>>     > made by the commit 4268d3967e2d691c151d6b5629e4051deb077b9a. The
>>>>>> problem
>>>>>>     > that was fixed by the former commit is present again due to those
>>>>>>     > modifications. This patch reverts those modifications to have that
>>>>>>     > problem fixed again.
>>>>>>
>>>>>>     > Fixes:
>>>>>>     >
>>>>>> http://autobuild.buildroot.net/results/b86/b86a83c6549004f226e7255242e54ef4e50c5ec3/
>>>>>>
>>>>>>
>>>>>>
>>>>>> So this basically just reverts Arnouts fix for old automake
>>>>>> versions? Do
>>>>>> we understand why it doesn't work? Can we come up with a solution that
>>>>>> both fixes the n64 issue and old automake?
>>>>>
>>>>>     I indeed never tested if the issue of 4268d39 was still fixed. I just
>>>>> understood from the commit message that it is only relevant for the
>>>>> libtool.m4 that is installed in the host dir, so I made use of that.
>>>>>
>>>>>     It should be rather easy to get this right then: a patch that
>>>>> fixes up
>>>>> configure directly, rather than libtool.m4.
>>>>
>>>> Hello Arnout,
>>>>
>>>> how do you suggest to do it? Requiring an older automake would not be
>>>> possible because of this:
>>>>
>>>> dnl These are bootstrap requirements! Once built, libtool may work with
>>>> dnl much older releases of autoconf and automake.  See release notes.
>>>> dnl 1.11 is needed for color-tests, 1.11.1 fixes a security issue.
>>>> AM_INIT_AUTOMAKE([1.11.1 gnu subdir-objects dist-xz color-tests
>>>> parallel-tests])
>>>
>>>    I meant: create a patch that fixes up the configure script directly.
>>>
>>>    Can you give me a minimal defconfig that shows the problem (preferably
>>> using an external toolchain, e.g. from the autobuilders)? Then I can try
>>> to create that patch.
>>
>> Hello Arnout,
>>
>> unfortunately I don't have a minimal defconfig to reproduce that failure.
>> I use the one in the autobuild:
>>
>> http://autobuild.buildroot.net/results/b86/b86a83c6549004f226e7255242e54ef4e50c5ec3/
>
>   Okay, the issue is that that defconfig enables libtool for the target,
> and autoreconf adds $(STAGING_DIR)/usr/share/aclocal to the include path.
> So the unpatched libtool will take precedence.

Hello Arnout,

do you mean that enabling only BR2_PACKAGE_LIBTOOL and 
BR2_PACKAGE_LIBISCSI you can reproduce the failure?


>   Patch follows.
>
>   Regards,
>   Arnout
>
>


-- 
Vincent
