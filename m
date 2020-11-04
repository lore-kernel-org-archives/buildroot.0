From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 04 Nov 2020 21:01:52 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2020-10-25
In-Reply-To: <CANQCQpaurhRXOqqe34dO6Kzw77_JpjQLFb=F2SMcYGC625ZO8g@mail.gmail.com>
 (Matthew Weber's message of "Tue, 27 Oct 2020 08:32:39 -0500")
References: <b56105e96c0bfb86b803acc2ef6e0aad@tudorholton.com>
 <CANQCQpaurhRXOqqe34dO6Kzw77_JpjQLFb=F2SMcYGC625ZO8g@mail.gmail.com>
Message-ID: <874km43n7z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:

 > Tudor,
 > On Mon, Oct 26, 2020 at 4:08 AM Tudor Holton <tudor@tudorholton.com> wrote:
 >> 
 >> Hi all,
 >> 
 >> The CVE listed below appears only to relate to openjdk6 and openjdk7.
 >> The current package builds openjdk11.0.8 or openjdk14.0.2.
 >> 

 > The vulnerability database must not be mapping the impacted versions
 > correctly (ie.  CVE is applicable to which CPE or range of CPE
 > versions).   When I look at
 > https://nvd.nist.gov/vuln/detail/CVE-2013-0169 , I see specific
 > entries for 1.6 / 1.7 / 1.8 and an entry of
 > cpe:2.3:a:oracle:openjdk:-:*:*:*:*:*:*:* .  I wonder if we are
 > incorrectly string matching that "-" as a version?  +Gregory  any
 > ideas?

Yes, I believe we do so since:

commit 008ca2c583cb9dc70cd30c5318b3b1cbef57b06a
Author: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date:   Thu Aug 27 18:55:08 2020 +0200

    support/scripts/pkg-stats: consider "-" as a wildcard when doing CVE version matching

    Some CVE entries in the NVD database have version_value set to "-",
    which seems to indicate that it applies to all versions of the
    software project, or that they don't really know which versions are
    affected, and which are not.

    So, for the benefit of doubt, it seems more appropriate to consider
    such CVEs as affecting our packages.

    This makes the total number of CVEs affecting our next branch jump
    from 141 CVEs to 658 CVEs, but that number will go back down once we
    switch to the JSON 1.1 schema. Indeed, in the JSON 1.0 schema, there
    are often cases where a version_value is set to "=" *and* specific
    versions are set to.

    Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>


How should a '-' be interpreted?

-- 
Bye, Peter Korsgaard
