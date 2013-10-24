From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 24 Oct 2013 08:51:58 +0200
Subject: [Buildroot] [PATCH] uboot-tools: fix license issues
In-Reply-To: <20131023113944.2e370a3b@skate>
References: <1382452676-2514-1-git-send-email-gustavo@zacarias.com.ar>
 <CAAXf6LW3ob7ev6VBpG3ajRR=aMSdgN0mM=O7a7wX2+cLd6fRBA@mail.gmail.com>
 <20131023113944.2e370a3b@skate>
Message-ID: <CAAXf6LVeND62F7qgxLhcYcqw-QDy6QO+7+A7CZHB5gonp+AsTA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Oct 23, 2013 at 11:39 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Tue, 22 Oct 2013 16:57:31 +0200, Thomas De Schampheleire wrote:
>
>> Maybe the legal-info target should warn for non-existing files, rather
>> than error out.
>
> I disagree. Before 376c3aad61dbeb8e2126e13658fd150b70746afb
> ("legal-info: fail trying to copy a non-existent license file"), what
> was happening is exactly what you're suggesting.
>
> The problem is that we didn't notice when legal information were wrong,
> because nobody looks at warnings, and because autobuilders result were
> saying "OK" even though the legal info wasn't ok. So at the time (back
> in May this year), we discussed that, and we agreed that legal-info
> should error out if it cannot find a license file referenced by
> <pkg>_LICENSE_FILES, so that autobuilder results loudly say that
> something failed.
>
> And interestingly, the precise reason why we noticed the legal-info
> were wrong was because the autobuilder build failed, and we fixed it. I
> very much prefer that than having the <pkg>_LICENSE_FILES remain wrong
> for many weeks/months without anybody noticing.

My comment was too one-sided. I still agree with the commit that
changed the warning into an error.
But now we are in a special situation: for packages that support
multiple versions, we currently assume that these all have the same
LICENSE and LICENSE_FILES, which is not necessarily true. For such
packages, we _expect_ that the LICENSE_FILES definition will not be
correct for some versions, and this will cause buildroot to fail on
the legal-info. However, we cannot simply fix that failure by changing
LICENSE_FILES, because it will fail on the other versions.

We could envision a strategy where we can pass some version annotation
to LICENSE(_FILES) that the legal-info infrastructure can recognize,
which would work for packages with known versions only.
However, in the case of linux, u-boot, and probably others, we allow
the user to specify an arbitrary version, for which we don't know the
license unless with some deeper checking of the base version. Maybe
this last case is more of an exception, and we should warn the user
that we are not sure which license to use if he is using an arbitrary
version.

Best regards,
Thomas
