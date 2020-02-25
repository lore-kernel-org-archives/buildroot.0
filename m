From: Michael Walle <michael@walle.cc>
Date: Tue, 25 Feb 2020 09:58:27 +0100
Subject: [Buildroot] CVEs not matching buildroot packages
Message-ID: <e9268b49623925add8aeac91e8059012@walle.cc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Yesterday, Heiko noticed that CVE-2020-8597 doesn't match the
pppd package, because the product name doesn't match the package
name.

So apparently there need to be a mapping between these two. But
that comes with some caveats. Let's assume there would be a
pkg_NVD_CPE variable. One could think of having a default value
of this variable, eg by default "pkg_NVD_CPE = pkg". [This is,
as far as I understand it, the current behaviour, because there
is no mapping right now; correct me if I'm wrong]. BUT in my
optinion there MUST NOT be a default value for this mapping,
because then you cannot distiguish between a package which just
uses the default name and a package which wasn't ever touched
regarding CVEs. And this is really bad for statistics, eg you
can't even say we have this many packages checked for CVEs,
because you don't know which packages actually has a correct
mapping.

So if a pkg_NVD_CPE variable is introduced this would need to
done manually per package; which would mean a lot of work. Of
course there could be some scripts which check if there was ever
a CVE for package x and x is a buildroot package. That would be
a strong indication that this is a correct mapping. There could
also be a checkpackage script which checks if pkg has no
pkg_NVD_CPE variable, but there is a CVE for that package name.

Then a statistics script could gather:
   (1) how many packages don't have a mapping, eg. the CVE status
       is unknown. [package has no pkg_NVD_CPE]
   (2) how many packages are not affected by a CVE [package has
       pkg_NVD_CPE and doesn't match any CVEs]
   (3) how many packages are affected by a CVE [package has
       pkg_NVD_CPE and doesn't match any CVEs]

To minimize efforts in the beginning (1) could be split into
  (1a) how many packages don't have a mapping and no CVE matches
       the package name, therefore the status is still unknown
       [package has no pkg_NVD_CPE and there is no CVE matching
       the package name]
  (1b) how many packages don't have a mapping but there is a CVE
       matching the package name. Thus there is a high chance
       this package is actually affected by this CVE, but this
       is just a strong indication and would need further manual
       steps, eg. adding pkg_NVE_CPE to the package .mk.

So packages could incrementally moved from (1a) to (1b).

Any comments? ;)

-michael
