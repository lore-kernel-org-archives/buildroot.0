From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 4 Nov 2020 10:45:32 -0600
Subject: [Buildroot] [PATCH 01/10] support/scripts/cve.py: properly
 match CPEs with version '*'
In-Reply-To: <20201104145145.1316167-2-thomas.petazzoni@bootlin.com>
References: <20201104145145.1316167-1-thomas.petazzoni@bootlin.com>
 <20201104145145.1316167-2-thomas.petazzoni@bootlin.com>
Message-ID: <CANQCQpb-yMdETe6FUTkGbqKK4oFzwsuAsBGNB_k79P-azdyemQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,


On Wed, Nov 4, 2020 at 8:53 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Currently, when the version encoded in a CPE is '-', we assume all
> versions are affected, but when it's '*' with no further range
> information, we assume no version is affected.
>
> This doesn't make sense, so instead, we handle '*' and '-' in the same
> way. If there's no version information available in the CVE CPE ID, we
> assume all versions are affected.
>
> This increases quite a bit the number of CVEs and package affected:
>
> -    "total-cves": 302,
> -    "pkg-cves": 100,
> +    "total-cves": 597,
> +    "pkg-cves": 135,
>
> For example, CVE-2007-4476 has a CPE ID of:
>
>     cpe:2.3:a:gnu:tar:*:*:*:*:*:*:*:*
>
> So it should be taken into account. In this specific case, it is
> combined with an AND with CPE ID
> cpe:2.3:o:suse:suse_linux:10:*:enterprise_server:*:*:*:*:* but since
> we don't support this kind of matching, we'd better be on the safe
> side, and report this CVE as affecting tar, do an analysis of the CVE
> impact, and document it in TAR_IGNORE_CVES.


I agree, it is better to over-report and give people the option of
setting the ignore entry or to go work with the CPE dictionary team to
make an update to how that CVE is being mapped to the CPE.

I was interested to know if yocto has an existing listing of CVE they
are ignoring as well.  I looked a bit at the cve-checker[2] but I
couldn't find any existing list or metadata within yocto but instead a
few forked tools that all allow you to create a Software Bill Of
Materials (SBOM) and provide a list of overall excluded CVE [1].  It
seems better to keep the initial refinement within Buildroot or to
push instead for making a correction in the actual CVE mapping.  If
the user wants to whitelist it outside of Buildroot for their specific
use case, that could be a topic for a future patchset on creation of a
Software Bill Of Materials matching/tailored for their defconfig.
Thoughts?

Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>


[1] https://github.com/LairdCP/cve-checker/blob/master/cli.py
[2] https://hub.mender.io/t/how-to-run-cve-checks-using-the-yocto-project/1142
