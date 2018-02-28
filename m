From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 27 Feb 2018 22:12:18 -0600
Subject: [Buildroot] [NEXT 20/26] linux: add CPE id
In-Reply-To: <20180227231826.79f1bdec@windsurf.lan>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1519697441-54194-21-git-send-email-matthew.weber@rockwellcollins.com>
 <20180227231826.79f1bdec@windsurf.lan>
Message-ID: <CANQCQpaMEC_smNisciWyapbcLiMh9zccqFqeeAuEHm58t73KpA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, Feb 27, 2018 at 4:18 PM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> On Mon, 26 Feb 2018 20:10:35 -0600, Matt Weber wrote:
>
>> +LINUX_CPE_ID = $(LINUX_NAME):$(LINUX_NAME)_kernel:$(LINUX_VERSION)
>
> How is the CPE database reacting when LINUX_VERSION is some random Git
> SHA1, from a private Git tree that nobody has access to ?

I brought this up to one of my security guys and he had a good point.
He pointed out that since we keep the reporting seperate from any
proposed automated CVE analysis.  The user specific analysis could
manage taking the hash and manually doing the effort to tie that to a
linux version.  Then looking at the individual CVEs on top of that
version.  There isn't a good way to include that in the buildsystem
that we can see but most analysis tools have a way to keep notes with
a configuration.  For any buildroot automated CVE reporting I don't
think you'd run into this hash case for linux as there wouldn't be a
default version selected as a hash (so far at least that I know of)

For packages which use hashes, the suggestion was made to use the
major and minor syntax where we state the version to be the last
release and the next wildcard field is the minor version and set we
that to the hash.  So for validating a CPE is correct (pkg-stats
maintenance), we would just look at the major version.  However for
the analysis activity where a target CPE report is used to find CVEs,
they would take into account the major and also go look at the hash
manually to determine where that falls past the  major.  On the
buildroot side we could also add CVE_PATCHED items covering that delta
if we know what they are.  I should do an example of this in my next
patchset (one of the github packages).

Matt
