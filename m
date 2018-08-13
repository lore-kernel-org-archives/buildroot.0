From: Christopher McCrory <chrismcc@gmail.com>
Date: Mon, 13 Aug 2018 10:56:43 -0700
Subject: [Buildroot] [RFC PATCH 0/2] Hack for perl module subdirectories
Message-ID: <20180813175645.11088-1-chrismcc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When perl modules have Makefiles in subdirectories, not all of the
arguments to Makefile.PL get propagated to subdirectory/Makefile.PL.
This causes compile failures.  Two examples are template-toolkit and
xml-parser. A hack is to fix them after the usual configure step.
Something like this:

$(SED) "s:^AR = .*:AR = $(TARGET_AR):g" $(@D)/Expat/Makefile

for AR, CC, xFLAGS, etc.  This "works", but there should be a better
way. Hence the RFC.


Also there is a package, libxml-parser-perl, that is a host only perl
xml-parser package needed by host-intltool and metacity.  Should they
stay seprate or be merged?

Christopher McCrory (2):
  perl-template-toolkit: new package
  perl-xml-parser: new package

 DEVELOPERS                                         |  2 ++
 package/Config.in                                  |  2 ++
 package/perl-template-toolkit/Config.in            | 11 ++++++++
 .../perl-template-toolkit.hash                     |  6 ++++
 .../perl-template-toolkit/perl-template-toolkit.mk | 32 ++++++++++++++++++++++
 5 files changed, 53 insertions(+)
 create mode 100644 package/perl-template-toolkit/Config.in
 create mode 100644 package/perl-template-toolkit/perl-template-toolkit.hash
 create mode 100644 package/perl-template-toolkit/perl-template-toolkit.mk

-- 
2.14.4
