From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sun, 15 Dec 2013 14:14:51 +0100
Subject: [Buildroot] [PATCH 2 of 2] infra: remove usage of pkgparentdir
 in favor of pkgdir
In-Reply-To: <CAAXf6LU6gjv-nH9r+az0gA1Ai=2BhEs1wf27f0-s63Sx403GAg@mail.gmail.com>
References: <patchbomb.1384170790@argentina>
 <8953db252a5816d2e988.1384170792@argentina>
 <52816529.9010704@mind.be>
 <CAAXf6LVMJ-EQemvYkvujm+zypQO_cufQq5=z7zz_tto2hug=Aw@mail.gmail.com>
 <20131112120904.4e65d13f@skate>
 <CAAXf6LX+_CGzfYwsAsLMQbUCYoO6Khvh7dcxkDRRt1BespkPGw@mail.gmail.com>
 <5282302C.7000005@mind.be>
 <CAAXf6LU6gjv-nH9r+az0gA1Ai=2BhEs1wf27f0-s63Sx403GAg@mail.gmail.com>
Message-ID: <CAAXf6LVMXekNupYD7=0xRDcoA+Qc1cs=qj6juOADKpYazPOKMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Thu, Dec 5, 2013 at 3:53 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Thomas,
>
> On Tue, Nov 12, 2013 at 2:42 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> [..]
>>>
>>>>
>>>>   <foo>_BUILDDIR => points to the package build directory in $(BUILD_DIR)
>>>>
>>>>   <foo>_SRCDIR => points to the package source directory (currently
>>>>                   identical to <foo>_BUILDDIR, would change when we
>>>>                   introduce OOT build for packages). Actually, more than
>>>>                   half of the patch set I have to introduce OOT is about
>>>>                   using <foo>_SRCDIR vs <foo>_BUILDDIR in the right
>>>>                   places.
>>>>
>>>>   <foo>_DL_DIR => same as before.
>>>
>>>
>>> In general, I think the new variable names make sense.
>>
>>
>>  +1.
>>
>>  ThomasP, perhaps you can resubmit the patches for <foo>_SRCDIR vs
>> <foo>_BUILDDIR, since they can be applied independently of OOT.
>>
>
> Thomas, could you resubmit or point me to these patches? Is it work in
> progress or pretty much ready?
>
> I'm going to take up this patch series during this release cycle...

Looking again to this, there already is a FOO_SRCDIR and FOO_BUILDDIR:

$(2)_DL_DIR     =  $$(DL_DIR)/$$($(2)_BASE_NAME)
$(2)_DIR        =  $$(BUILD_DIR)/$$($(2)_BASE_NAME)
$(2)_SRCDIR     = $$($(2)_DIR)/$$($(2)_SUBDIR)
$(2)_BUILDDIR   ?= $$($(2)_SRCDIR)

There may be some overlay between FOO_DIR and FOO_SRCDIR, which is
identical for many packages (those that do not have FOO_SUBDIR set).

Additionally, the naming policy is not uniform now (underscores). We
could either keep it as it is, or rename SRCDIR to SRC_DIR and
BUILDDIR to BUILD_DIR. There are only very few occurrences of these
variables, so it is certainly doable. However, there is also
FOO_OVERRIDE_SRCDIR which is something visible externally and may be
more difficult to change (from a usability perspective).
Inputs?

However, to meet the comments on this particular patch, I think we can simply:
- introduce $(2)_PKGDIR (or $(2)_PKG_DIR, depending on the above discussion)
- remove the fourth parameter to inner-generic package ($(pkgdir)), as
suggested by Arnout

What do you think?

Best regards,
Thomas
