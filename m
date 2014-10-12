From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 12 Oct 2014 10:13:34 +0200
Subject: [Buildroot] Topics to discuss at the meeting
In-Reply-To: <CAAXf6LVHz0qp3VsyAFRhrkH6ekaQ-evzJeoaYSZ+oCkg0cuTWA@mail.gmail.com>
References: <20141008105653.7252facd@free-electrons.com>
 <CAAXf6LVHz0qp3VsyAFRhrkH6ekaQ-evzJeoaYSZ+oCkg0cuTWA@mail.gmail.com>
Message-ID: <543A382E.4030504@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

we discussed your proposals yesterday. You can see the final decisions
on the Etherpad (https://etherpad.fr/p/Izjy5fFsA4). I'll take care of
sending patches to implement the planned changes.

Some more comments below.

Thomas De Schampheleire wrote:
> Hi Thomas,
>
> On Wed, Oct 8, 2014 at 10:56 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Hello,
>>
>> The meeting is approaching, so to foster some preliminary discussion,
>> here is the current list of topics we have in the Wiki:
>>
>>   - Look-back to action points from previous developer days at Fosdem
>>     2014: is everything that was decided done? What remains?
>>
>>   - Patch naming: current convention is
>>     package-number-description.patch, but a proposal was made on the
>>     list to simplify this to number-description.patch. Go or no-go?
>>
>>   - Since Luca will be present: state of legal-info infrastructure,
>>     improvements to be made?
>>
>>     - Could more details be added here (by Thomas DS, who proposed the
>>       topic)
>
> I thought, with Luca being present again after a few years, it would
> be a good idea to briefly see what may need to be improved / added to
> the legal-info infrastructure. Is there anything missing,
> feature-wise?
>
> There was a proposal to add the site URL to the manifest, but this has
> been merged meanwhile.
> We could consider improving the handling of the currently unhandled
> parts, like toolchain, buildroot itself, ...
>
> For toolchain, even if it is difficult to save the sources, we could
> consider identifying the packages contained in the toolchain, like
> which C library, compiler, etc. and provide version and license for
> each of them. This info could then be collected in the manifest as
> well. This should include info on the target files, like libstdc++,
> libgcc, ...

For the _LICENSE text, the infra already allows to state the license of
the external toolchain as a long string ("GPL (this), LGPL (that),
..."). This allows to add licenses without any addition to the
infrastructure, so we'll go that way. The ultimate goal is to provide
the info to our users without making Buildroot more complex.

Providing the source tarballs cannot be made "for free" as of now,
because the downloaded _SOURCE for the ext-toolchains is a binary.
But usually toolchain providers also provide a source tarball for
download, so that's the URL we'd like to have in the legal-info
manifest and download.

To meet that goal we evaluated two solutions:
  1. add a FOO_DONT_ADD_TO_LEGAL_MANIFEST (or any better name!),
     so the package can call legal-manifest its own, and
     download the actual source file on its own;
  2. add a FOO_ACTUAL_SOURCES (ditto) that, if defined, forces the
     legal infra to write that URL in the manifes, and download that
     URL to be store in the tarball directory instead of the FOO_SOURCE
     tarball.

We chose option 2.

>
> Also, to me it would make sense to place the code related to
> legal-info in one file, like legal-info.mk. Currently there are parts
> in Makefile, pkg-utils.mk and pkg-generic.mk. While pkg-generic can
> stay as it is, the lines from Makefile and pkg-utils.mk could be
> extracted to a single, separate file IMO.

We thought a little bit about this, and it looked like not enough code
to justify the creation of a new file.

-- 
Luca
