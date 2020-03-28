From: Akshay Bhat <akshay.bhat@timesys.com>
Date: Sat, 28 Mar 2020 11:07:39 -0400
Subject: [Buildroot] [PATCH 1/1] package/lz4: annotate CVE-2014-4715
In-Reply-To: <20200328150827.64a9f714@windsurf.home>
References: <20200328095138.959798-1-fontaine.fabrice@gmail.com>
 <20200328150827.64a9f714@windsurf.home>
Message-ID: <CACrMeVCfVxi3BEUq5EgXV=OMF+36HtT6sDqwG=D8qMCD_Cs3GA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Mar 28, 2020 at 10:08 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> So I've applied this patch, but what can we do to fix this properly?
> The NVD database says that versions < r118 are affected, but of course
> with the project having changed its numbering scheme (current version
> is 1.9.2), making comparisons is difficult.
>
> Indeed, after r131, the next version was v1.7.3. Can we ask the NVD
> maintainers to indicate that versions earlier than v1.7.3 are
> vulnerable ?

Interesting case! The fix has been there since r118 (including).
(Expand the tags in the github link:
https://github.com/lz4/lz4/commit/140e6e72ddb6fc5f7cd28ce0c8ec3812ef4a9c08)

Thankfully CVE-2014-4715 is the only CVE using the old version scheme.
So the 2 easy options are:
1. Live with the patch from Fabrice for ignore CVEs since we don't
expect this list to grow (OR)
2. Since there are only 2 tagged releases before r118, ask NVD to
change the affected version:
From
cpe:2.3:a:yann_collet:lz4:*:*:*:*:*:*:*:*  Up to (including) r118
To
cpe:2.3:a:yann_collet:lz4:r116:*:*:*:*:*:*:*
cpe:2.3:a:yann_collet:lz4:r117:*:*:*:*:*:*:*

This way comparing the new versions (eg:1.9.2) will not match with
either r116 or r117 since there is no  "<=" check involved.
I would not recommend changing it to earlier than v1.7.3 since r118 to
r131 that are technically less than v1.7.3 and those versions are not
affected by this CVE.

Looks like Yocto decided to go the ignore cve route as well:
http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-support/lz4/lz4_1.9.2.bb?h=master#n21

I can shoot an email to NVD if the above explicit calling out of
r116/r117 versions seems a better route.

Thanks,
Akshay
