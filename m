From: Tudor Holton <tudor@smartguide.com.au>
Date: Mon, 25 Nov 2019 15:46:03 +1100
Subject: [Buildroot] Question about current OpenJDK source site.
In-Reply-To: <CADvTj4otBBgFvdbgJLydXU1t7CmRHVipZMtgVHh=+Ytrg+nRnA@mail.gmail.com>
References: <3e866d3c74fcf9fce2a49518cba0830a@smartguide.com.au>
 <CADvTj4otBBgFvdbgJLydXU1t7CmRHVipZMtgVHh=+Ytrg+nRnA@mail.gmail.com>
Message-ID: <375e82152d2d6fa19fd628e83de963a7@smartguide.com.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2019-11-25 12:56, James Hilliard wrote:
> On Sun, Nov 24, 2019 at 6:29 PM Tudor Holton <tudor@smartguide.com.au> 
> wrote:
>> 
>> Hello all,
>> 
>> I'm working on upstreaming some development we've done on OpenJDK for
>> Buildroot over the past few years and I'm in the process of trying to
>> simplifying the diffs for submission.
>> 
>> I have a simple question which I'm directing towards Adam Duskett, but
>> I'm open to answers for anyone who contributed to making this 
>> decision.
>> 
>> I understand, historically, that getting a mirrorable copy of OpenJDK
>> was hard because of previous issues with Mercurial forests.  Our own
>> previous versions of this package have used an intermediate Mercurial
>> forest consolidation server so we can easily restart source downloads.
>> However, recent developments in Buildroot makes this no longer an 
>> issue.
>> 
>> I'm hesitant to make a diff submission that changes OPENJDK_SITE, but 
>> I
>> cannot seem to find any authoritative reference that says that source
>> downloads should come from anywhere other than java.net.  The current
>> release comes from github.com/AdoptOpenJDK which references
>> adoptopenjdk.net.  AdoptOpenJDK.net states that they are "a community 
>> of
>> Java User Group (JUG) members, Java developers and vendors" but not
>> anything that is conclusive about their relationship with Oracle or
>> upstream OpenJDK itself, and java.net never references them in any 
>> way.
>> This makes me suspicious about the guarantees of the source.
> AdoptOpenJDK is generally the recommended source for java from what
> I've seen, it's fairly well know and run by companies such as Red Hat 
> last
> I checked.

Thanks for your input.

I did a quick package management check:
Debian: Pulls from openjdk.java.net
Ubuntu: 
https://git.launchpad.net/~openjdk/ubuntu/+source/openjdk/+git/openjdk 
which looks like hg.openjdk.java.net/jdk-updates
Fedora: References openjdk.java.net and lists their additional patches

>> 
>> Why does the current version of the OpenJDK package* use AdoptOpenJDK 
>> as
>> the upstream source rather than the official source release at
>> https://hg.openjdk.java.net/[project]/[release]/archive?
> The java.net site is closed/deprecated from the looks of it.

The official download of Java SE 13 at 
https://www.oracle.com/technetwork/java/javase/downloads/jdk13-downloads-5672538.html

says:

"Oracle also provides the latest OpenJDK release under the open source 
GPL License at jdk.java.net."

While java.net itself is deprecated as a website ("We're sorry the 
java.net site has closed."), the domain as a whole is still technically 
the official source as it hosts all java-related things in other ways, 
including current source code.

If you go to jdk.java.net, it's still working, with no indication 
anything is deprecated, and links go to openjdk.java.net which house the 
Mercurial forests with up-to-the-minute source code and official "GA" 
releases.

Additionally, AdoptOpenJDK says "AdoptOpenJDK has the same source code + 
minor patches (under the same GPLv2+CE license) as OpenJDK"

So, I conclude that AdoptOpenJDK is a downstream release, since they 
applied patches which are not necessarily upstream from the OpenJDK 
itself, which makes the "release" less consistent with upstream and more 
aimed at a specific use case, which isn't necessarily what Buildroot is 
aimed at, from our experience.

Furthermore, the current openjdk package in Buildroot has no patch 
files, which suggests it is pure when it isn't (since AdoptOpenJDK has 
applied patches).  This makes patching during Buildroot compilation more 
difficult and caused our earlier attempts to move to Buildroot mainline 
to fail.   This is the main reason we chose to go to the source (without 
patches) so that we could maintain a clear patchset that works with 
Buildroot.

>> 
>> Is this just historic or is there some intended reason to use a
>> downstream source?
> From what I've seen it's generally not recommended to use oracle 
> distributions
> due to unstable download urls. For example you can no longer download
> Java 8 from oracle without an account since the latest version they 
> distribute
> moved to commercial licensing.
>> 
>> Regards,
>> Tudor Holton
>> 
>> P.S. For clarity, I am specifically referring to packages/openjdk and
>> not packages/openjdk-bin.  I understand the need to obtain binaries 
>> from
>> certain sources.
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
