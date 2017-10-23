From: Barbarien, Joeri (Nokia - BE/Antwerp) <joeri.barbarien@nokia.com>
Date: Mon, 23 Oct 2017 14:41:37 +0000
Subject: [Buildroot] Advice needed: Problem with clashing make variables in
 pkg-generic.mk when building perl-xml-sax package.
Message-ID: <DB5PR0701MB1992E58350C8DE5036F4DA61E0460@DB5PR0701MB1992.eurprd07.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

When building perl-xml-sax (and its dependency perl-xml-sax-base) I noticed something strange in output/build/packages-file-list.txt:

---> perl-xml-sax-0.99,./usr/lib/perl5/site_perl/5.24.1/XML/SAX/Base.pm
---> perl-xml-sax-0.99,./usr/lib/perl5/site_perl/5.24.1/arm-linux/auto/X
---> ML/SAX/Base/.packlist
---> perl-xml-sax-0.99,./usr/share/man/man3/XML::SAX::Base.3
---> perl-xml-sax-0.99,./usr/lib/perl5/site_perl/5.24.1/XML/SAX/BuildSAX
---> Base.pl 
---> perl-xml-sax-0.99,./usr/lib/perl5/site_perl/5.24.1/XML/SAX/Exceptio
---> n.pm
---> perl-xml-sax-0.99,./usr/share/man/man3/XML::SAX::Exception.3
---> perl-xml-sax-0.99,./usr/share/man/man3/XML::SAX::BuildSAXBase.3
perl-xml-sax,./usr/share/man/man3/XML::SAX::DocumentLocator.3
perl-xml-sax,./usr/lib/perl5/site_perl/5.24.1/arm-linux/auto/XML/SAX/.packlist
perl-xml-sax,./usr/lib/perl5/site_perl/5.24.1/XML/SAX/PurePerl/Reader/UnicodeExt.pm
perl-xml-sax,./usr/lib/perl5/site_perl/5.24.1/XML/SAX/PurePerl/NoUnicodeExt.pm
perl-xml-sax,./usr/share/man/man3/XML::SAX::ParserFactory.3
perl-xml-sax,./usr/lib/perl5/site_perl/5.24.1/XML/SAX/PurePerl/Reader/URI.pm
perl-xml-sax,./usr/lib/perl5/site_perl/5.24.1/XML/SAX/PurePerl/EncodingDetect.pm
perl-xml-sax,./usr/lib/perl5/site_perl/5.24.1/XML/SAX/DocumentLocator.pm
perl-xml-sax,./usr/share/man/man3/XML::SAX::PurePerl::Reader.3
perl-xml-sax,./usr/share/man/man3/XML::SAX::PurePerl.3
perl-xml-sax,./usr/lib/perl5/site_perl/5.24.1/XML/SAX/PurePerl/DTDDecls.pm
perl-xml-sax,./usr/lib/perl5/site_perl/5.24.1/XML/SAX/PurePerl/Productions.pm
perl-xml-sax,./usr/lib/perl5/site_perl/5.24.1/XML/SAX.pm
perl-xml-sax,./usr/lib/perl5/site_perl/5.24.1/XML/SAX/PurePerl/Reader.pm
perl-xml-sax,./usr/lib/perl5/site_perl/5.24.1/XML/SAX/PurePerl/Exception.pm
perl-xml-sax,./usr/lib/perl5/site_perl/5.24.1/XML/SAX/PurePerl/XMLDecl.pm
perl-xml-sax,./usr/lib/perl5/site_perl/5.24.1/XML/SAX/PurePerl/Reader/Stream.pm
perl-xml-sax,./usr/lib/perl5/site_perl/5.24.1/XML/SAX/Intro.pod
perl-xml-sax,./usr/lib/perl5/site_perl/5.24.1/XML/SAX/PurePerl/UnicodeExt.pm
perl-xml-sax,./usr/lib/perl5/site_perl/5.24.1/XML/SAX/PurePerl/Reader/String.pm
perl-xml-sax,./usr/lib/perl5/site_perl/5.24.1/XML/SAX/PurePerl.pm
perl-xml-sax,./usr/share/man/man3/XML::SAX::Intro.3
perl-xml-sax,./usr/lib/perl5/site_perl/5.24.1/XML/SAX/ParserFactory.pm
perl-xml-sax,./usr/lib/perl5/site_perl/5.24.1/XML/SAX/PurePerl/Reader/NoUnicodeExt.pm
perl-xml-sax,./usr/lib/perl5/site_perl/5.24.1/XML/SAX/PurePerl/DebugHandler.pm
perl-xml-sax,./usr/share/man/man3/XML::SAX.3
perl-xml-sax,./usr/lib/perl5/site_perl/5.24.1/XML/SAX/PurePerl/DocType.pm

The files that are listed for perl-xml-sax-0.99 are actually those built by perl-xml-sax-base

This is due to a clash of make variables in package/pkg-generic.mk:

$(2)_BASE_NAME  = $$(if $$($(2)_VERSION),$(1)-$$($(2)_VERSION),$(1))
$(2)_RAW_BASE_NAME = $$(if $$($(2)_VERSION),$$($(2)_RAWNAME)-$$($(2)_VERSION),$$($(2)_RAWNAME))
$(2)_DL_DIR =  $$(DL_DIR)
$(2)_DIR  =  $$(BUILD_DIR)/$$($(2)_BASE_NAME)

Due to the unfortunate naming of the packages,

$($(2)_BASE_NAME) for perl-xml-sax clashes with as $($(2)_NAME) for perl-xml-sax-base, leading to this wrong behavior.

I made a quick fix by renaming the _BASE_NAME suffix to _BR_BASE_NAME but perhaps a more comprehensive / cleaner solution is preferred.

Could you please advise on how this should be "properly" fixed? Some fast ideas:

1) Make sure common part of suffixes is in the front, e.g. _NAME, _NAME_BASE, _NAME_BASE_RAW
2) Use lowercase for internal suffixes so they cannot clash with by construction uppercase $(PKG)
3) A check on allowed package names ensuring clashes cannot happen

Kind regards,

Joeri Barbarien
