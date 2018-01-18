From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Thu, 18 Jan 2018 09:52:09 -0600
Subject: [Buildroot] Google Summer of Code 2018 ?
In-Reply-To: <20180118085153.57f7ba35@windsurf.lan>
References: <20180117215208.45dd61b9@windsurf>
 <CANQCQpa3v8pf2CvXd867Xv0e9UPCd-L+Q-9yFgZsRNdVvUnkSQ@mail.gmail.com>
 <20180118085153.57f7ba35@windsurf.lan>
Message-ID: <CANQCQpbt_OZC_8imSwCVe7EpdfrJnYz9-f8jLNYdF8+dYv0oAw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Thu, Jan 18, 2018 at 1:51 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> Hello,
>
> On Wed, 17 Jan 2018 16:50:13 -0600, Matthew Weber wrote:
>
> > >  - Follow upstream updates and CVEs of packages. I think this topic is
> > >    still relevant, and IMO is the most interesting topic.
> >
> > I'd second that this is an interesting one (even just a manual
> > approach to start with).  ie. Minimally having our legal-info (or a
> > new cpe-info) generate CPE compliant tags for our packages would be a
> > great addition.  Then those lists can be fed into various tools.
>
> Could you describe in more details what are those "CPE compliant tags" ?
>
> Ideally, what I'd like to see is a script that generates a webpage
> showing for each package the current version in Buildroot, the latest
> upstream version available, and whether the current version in
> Buildroot is affected by CVEs. Optionally, such a script could be used
> combined with the DEVELOPERS file to generate some notifications to
> Buildroot developers that the packages they are looking after should
> probably be upgraded (with a weekly notification, or something like
> that).
>

NIST maintains the "official" Common Platform Enumeration (CPE)
Dictionary.  It is basically a big xml file that is a collection of
COTS systems, software, and hardware available for commercial and
personal use.  The dictionary (defined by this xsd) contains tens of
thousands of CPEs (defined by this xsd).  When our security team does
CVE evaluations for a platform, we upstream any missing CPEs to NIST.
They run the suggestions through a normalization process checking for
duplicates, spelling, format, etc.  In the end, NIST updates the CPE
list every 24 hours with new inclusions.

If the buildroot legal-info (or something similar) could produce the
accurate CPE information for each specific software version in the
list, that data could easily be used to query the Mitre CVE database
or anything else that conforms to Security Content Automation Protocol
(SCAP).  This is easier said that done of course.  With buildroot
being on the bleeding edge for many software packages that can be
included, the CPE dictionary often hasn't caught up to the versions
included in buildroot.  For a specific company's case, that is
rectified by a security team upstreaming new CPEs to NIST.

An example of a recent CPE identifier that we upstreamed to NIST is:
cpe:2.3:a:bzip:bzip2:1.0.5:*:*:*:*:*:*:*  NIST link

We definitely agree with the vision of ultimately having a list of
CVEs available for a buildroot tag or even on demand.  This would most
easily be accomplished by connecting the "webpage" to a vulnerability
site that allows direct query of their vulnerability database via and
API.  Then for specific users, having a generated CPE list would allow
them to plug them into paid/corporate vulnerability management
database(s).  Having an accurate list of CPEs is the cornerstone for
buildroot users to be able to design their own process and generally
access current states of upstream.

As far as a concept.  We don't see any way to get the CPE information
into buildroot other than adding something to the package makefile
that the community maintains.  Sometimes the name of the package in
buildroot does not match the product name field in the CPE entry.  A
vendor field would have to be added.  The version field in buildroot
might be ok.  NIST has shown that having a community of engineers
trying to be consistent is a challenge, possibly some sort of
normalization would be necessary.  I don't know.

A CPE name then could be assembled in most cases by doing something like this:

LIBFUSE_VERSION = 2.9.7
LIBFUSE_SOURCE = fuse-$(LIBFUSE_VERSION).tar.gz
LIBFUSE_SITE = https://github.com/libfuse/libfuse/releases/download/fuse-$(LIBFUSE_VERSION)
+ LIBFUSE_VENDOR = libfuse_project
LIBFUSE_LICENSE = GPL-2.0, LGPL-2.1
LIBFUSE_LICENSE_FILES = COPYING COPYING.LIB
LIBFUSE_INSTALL_STAGING = YES
LIBFUSE_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
LIBFUSE_CONF_OPTS = \
        --disable-example \
        --enable-lib \
        --enable-util

+ LIBFUSE_CPE =
cpe:2.3:a:$(LIBFUSE_VENDOR):<packagename>:$(LIBFUSE_VERSION):*:*:*:*:*:*:*



Matt
