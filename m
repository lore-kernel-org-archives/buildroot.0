From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 24 Oct 2013 09:20:12 +0100
Subject: [Buildroot] [PATCH] uboot-tools: fix license issues
In-Reply-To: <CAAXf6LVeND62F7qgxLhcYcqw-QDy6QO+7+A7CZHB5gonp+AsTA@mail.gmail.com>
References: <1382452676-2514-1-git-send-email-gustavo@zacarias.com.ar>
 <CAAXf6LW3ob7ev6VBpG3ajRR=aMSdgN0mM=O7a7wX2+cLd6fRBA@mail.gmail.com>
 <20131023113944.2e370a3b@skate>
 <CAAXf6LVeND62F7qgxLhcYcqw-QDy6QO+7+A7CZHB5gonp+AsTA@mail.gmail.com>
Message-ID: <2e6a07b0-2c59-47f7-a320-9f4ba3ddffe2@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Thomas De Schampheleire <patrickdepinguin@gmail.com> ha scritto:
>Hi Thomas,
>
>On Wed, Oct 23, 2013 at 11:39 AM, Thomas Petazzoni
><thomas.petazzoni@free-electrons.com> wrote:
>> Dear Thomas De Schampheleire,
>>
>> On Tue, 22 Oct 2013 16:57:31 +0200, Thomas De Schampheleire wrote:
>>
>>> Maybe the legal-info target should warn for non-existing files,
>rather
>>> than error out.
>>
>> I disagree. Before 376c3aad61dbeb8e2126e13658fd150b70746afb
>> ("legal-info: fail trying to copy a non-existent license file"), what
>> was happening is exactly what you're suggesting.
>>
>> The problem is that we didn't notice when legal information were
>wrong,
>> because nobody looks at warnings, and because autobuilders result
>were
>> saying "OK" even though the legal info wasn't ok. So at the time
>(back
>> in May this year), we discussed that, and we agreed that legal-info
>> should error out if it cannot find a license file referenced by
>> <pkg>_LICENSE_FILES, so that autobuilder results loudly say that
>> something failed.
>>
>> And interestingly, the precise reason why we noticed the legal-info
>> were wrong was because the autobuilder build failed, and we fixed it.
>I
>> very much prefer that than having the <pkg>_LICENSE_FILES remain
>wrong
>> for many weeks/months without anybody noticing.
>
>My comment was too one-sided. I still agree with the commit that
>changed the warning into an error.
>But now we are in a special situation: for packages that support
>multiple versions, we currently assume that these all have the same
>LICENSE and LICENSE_FILES, which is not necessarily true. For such
>packages, we _expect_ that the LICENSE_FILES definition will not be
>correct for some versions, and this will cause buildroot to fail on
>the legal-info. However, we cannot simply fix that failure by changing
>LICENSE_FILES, because it will fail on the other versions.
>
>We could envision a strategy where we can pass some version annotation
>to LICENSE(_FILES) that the legal-info infrastructure can recognize,
>which would work for packages with known versions only.
>However, in the case of linux, u-boot, and probably others, we allow
>the user to specify an arbitrary version, for which we don't know the
>license unless with some deeper checking of the base version. Maybe
>this last case is more of an exception, and we should warn the user
>that we are not sure which license to use if he is using an arbitrary
>version.

Instead of special annotations in the _LICENSE* fields, I think we have two better options.

First, we may conditionally define _LICENSE* fields based on versions. Simple, but this would never handle cases where the bootloader or kernel is obtained from a custom git repo.

Or we may override the <pkg>-legal-info target for those few packages. The overridden target may do anything, e.g. try to copy a license file and, if not found, copy another one, failing only if both are missing. Or it could launch a script doing fancy things...

Not tried any of the two, but I feel the latter is more flexible and still quite simple in terms of infrastructure. Both would let the "normal" packages be handled in the old, simple way.


-- 
Luca
