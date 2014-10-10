From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 10 Oct 2014 11:50:56 +0200
Subject: [Buildroot] Topics to discuss at the meeting
In-Reply-To: <20141008181204.599a5e55@free-electrons.com>
References: <20141008105653.7252facd@free-electrons.com>
 <CAAXf6LVHz0qp3VsyAFRhrkH6ekaQ-evzJeoaYSZ+oCkg0cuTWA@mail.gmail.com>
 <20141008181204.599a5e55@free-electrons.com>
Message-ID: <CAAXf6LUXNKA-C9P9a97w=9Red=y=TCpMQK9Cndxj3E9trB2VWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 8, 2014 at 6:12 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Wed, 8 Oct 2014 13:56:56 +0200, Thomas De Schampheleire wrote:
>
>> I thought, with Luca being present again after a few years, it would
>> be a good idea to briefly see what may need to be improved / added to
>> the legal-info infrastructure. Is there anything missing,
>> feature-wise?
>
> Well, if no-one asks for any feature, there's nothing missing,
> right ? :-)
>
>> For toolchain, even if it is difficult to save the sources, we could
>> consider identifying the packages contained in the toolchain, like
>> which C library, compiler, etc. and provide version and license for
>> each of them. This info could then be collected in the manifest as
>> well. This should include info on the target files, like libstdc++,
>> libgcc, ...
>
> I guess you're talking about the external toolchains, right?

Yes indeed.

>
> Then yes, we need to do something about it, but I don't think there's a
> need to identify the C library, compiler and so on. Most of the
> external toolchain providers already provide a tarball of the sources
> they use to build the toolchain. At least that's the case for Sourcery
> CodeBench toolchains and Linaro toolchains. But I'm not sure how to
> integrate this with the licensing infrastructure, which assumes that
> what each package downloads is already the source code.

Sources are one thing, the manifest is the other. Both are pretty
independent. Even if you find some way of obtaining the sources for
the external toolchain, you still have to list the components used in
the manifest. For a toolchain, some components are host components
(the actual compiler, linker etc.) and some are target components,
like the C library, C++ library, libgcc, etc. Each of these have a
license, version etc.

>
> Certainly something we can discuss with Luca during the meeting.
>
>> Also, to me it would make sense to place the code related to
>> legal-info in one file, like legal-info.mk. Currently there are parts
>> in Makefile, pkg-utils.mk and pkg-generic.mk. While pkg-generic can
>> stay as it is, the lines from Makefile and pkg-utils.mk could be
>> extracted to a single, separate file IMO.
>
> Right. Generally speaking, I'd like the main Makefile to reduce in
> size, by moving "specific" things in other places, in a more organized
> way.
>
>> Looking at the package stats:
>> Packages having license information 1298
>> Packages not having licence information 73
>> Packages having license files information 1219
>> Packages not having licence files information 152
>>
>> So at that level we're pretty good, but ideally we can get these
>> second and fourth counters to 0.
>
> For the second, yes. For the fourth, there's unfortunately an issue: we
> don't distinguish packages for which we haven't yet filled the license
> files information from the packages we already had a look at, and for
> which unfortunately there isn't a file containing the license text. So
> it's hard to go to 0 for the fourth counter, because some packages
> simply do not have a license text built-in. What do we do for those
> packages? Add the license text in package/<foo>/ and copy it to the
> source tree as a post-extract hook ?

To be correct, this should be reported and fixed upstream.
In the meantime, adding the license to buildroot seems a bit odd.
Rather I would mark the package with some magic string (like
'(missing)' that indicates that the license text is missing. However,
I vaguely recall that we discussed that before, and that not everyone
was agreeing with such a magic string.

Best regards,
Thomas
