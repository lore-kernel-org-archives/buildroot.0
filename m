From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Nov 2020 17:54:03 +0100
Subject: [Buildroot] [PATCH 01/10] support/scripts/cve.py: properly
 match CPEs with version '*'
In-Reply-To: <CANQCQpb-yMdETe6FUTkGbqKK4oFzwsuAsBGNB_k79P-azdyemQ@mail.gmail.com>
References: <20201104145145.1316167-1-thomas.petazzoni@bootlin.com>
 <20201104145145.1316167-2-thomas.petazzoni@bootlin.com>
 <CANQCQpb-yMdETe6FUTkGbqKK4oFzwsuAsBGNB_k79P-azdyemQ@mail.gmail.com>
Message-ID: <20201104175403.4fb8b39f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 4 Nov 2020 10:45:32 -0600
Matthew Weber <matthew.weber@collins.com> wrote:

> > So it should be taken into account. In this specific case, it is
> > combined with an AND with CPE ID
> > cpe:2.3:o:suse:suse_linux:10:*:enterprise_server:*:*:*:*:* but since
> > we don't support this kind of matching, we'd better be on the safe
> > side, and report this CVE as affecting tar, do an analysis of the CVE
> > impact, and document it in TAR_IGNORE_CVES.  
> 
> I agree, it is better to over-report and give people the option of
> setting the ignore entry or to go work with the CPE dictionary team to
> make an update to how that CVE is being mapped to the CPE.

That is the idea. And among the new CVEs that appear, there are really
some CVEs where the NVD database just specify "*", without any
combination with a particular operating system or distribution: i.e the
CVE description is so imprecise that it doesn't even say which versions
of the software component are affected.

> I was interested to know if yocto has an existing listing of CVE they
> are ignoring as well.  I looked a bit at the cve-checker[2] but I
> couldn't find any existing list or metadata within yocto but instead a
> few forked tools that all allow you to create a Software Bill Of
> Materials (SBOM) and provide a list of overall excluded CVE [1].  It
> seems better to keep the initial refinement within Buildroot or to
> push instead for making a correction in the actual CVE mapping.  If
> the user wants to whitelist it outside of Buildroot for their specific
> use case, that could be a topic for a future patchset on creation of a
> Software Bill Of Materials matching/tailored for their defconfig.
> Thoughts?

Yes, we could certainly think of allowing the user to extend the list
of ignored CVEs. I haven't tried doing <pkg>_IGNORE_CVES +=
CVE-YYYY-XYZ in external.mk from an external tree. I don't know if it's
going to play well with the expansion ordering, though.

> Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
