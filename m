From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 26 Apr 2015 11:31:12 +0200
Subject: [Buildroot] [PATCH 6/6] package/perl-mail-spamassassin: new
	package
References: <1429970088-593-1-git-send-email-bernd.kuhls@t-online.de>
 <1429970088-593-6-git-send-email-bernd.kuhls@t-online.de>
 <20150425164617.43f7db2e@free-electrons.com>
 <XnsA487B2174A825berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
 <20150425181125.134ea730@free-electrons.com>
Message-ID: <XnsA488753013DD4berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8
@public.gmane.org> wrote in news:20150425181125.134ea730 at free-
electrons.com:

> Dear Bernd Kuhls,
> 
> On Sat, 25 Apr 2015 17:30:26 +0200, Bernd Kuhls wrote:
> 
>> the host-packages are only needed to please spamassassin afaics.
>> Their target variants however are really used by Spamassassin:
> 
> Then, can we get rid of Spamassassin silly checks on the host perl
> modules, to avoid having those unnecessary packages in Buildroot?

Hi,

maybe it is possible, but I do not know how. I tried patching
Mail-SpamAssassin-3.4.0/lib/Mail/SpamAssassin/Util/DependencyInfo.pm

by changing line 376 from

return $EXIT_STATUS;

to

return 0;

This fixed the first failure, but compilation is still broken:

>>> perl-mail-spamassassin 3.4.0 Building
cd /home/br/buildroot/output/build/perl-mail-spamassassin-3.4.0/ && if [ -f 
Build.PL ] ; then PERL5LIB= /home/br/buildroot/output/host/usr/bin/perl 
Build  build; else /usr/bin/make -j1 
PERL_INC=/home/br/buildroot/output/host/usr/i586-buildroot-linux-
uclibc/sysroot/usr/lib/perl5/5.20.2/i586-linux/CORE  pure_all; fi
make[1]: Entering directory `/home/br/buildroot/output/build/perl-mail-
spamassassin-3.4.0'
/home/br/buildroot/output/host/usr/bin/perl build/mkrules --exit_on_no_src 
--src rulesrc --out rules --manifest MANIFEST --manifestskip MANIFEST.SKIP
Can't locate NetAddr/IP.pm in @INC (you may need to install the NetAddr::IP 
module) (@INC contains: lib /home/br/buildroot/output/host/usr/lib/perl 
/home/br/buildroot/output/host/usr/lib/perl5/site_perl/5.20.2/x86_64-linux 
/home/br/buildroot/output/host/usr/lib/perl5/site_perl/5.20.2 
/home/br/buildroot/output/host/usr/lib/perl5/5.20.2/x86_64-linux 
/home/br/buildroot/output/host/usr/lib/perl5/5.20.2 .) at 
lib/Mail/SpamAssassin/Util.pm line 75.
BEGIN failed--compilation aborted at lib/Mail/SpamAssassin/Util.pm line 75.
Compilation failed in require at lib/Mail/SpamAssassin/Conf.pm line 85.
BEGIN failed--compilation aborted at lib/Mail/SpamAssassin/Conf.pm line 85.
Compilation failed in require at lib/Mail/SpamAssassin.pm line 71.
BEGIN failed--compilation aborted at lib/Mail/SpamAssassin.pm line 71.
Compilation failed in require at build/mkrules line 48.
BEGIN failed--compilation aborted at build/mkrules line 48.
make[1]: *** [build_rules] Error 2
make[1]: Leaving directory `/home/br/buildroot/output/build/perl-mail-
spamassassin-3.4.0'
make: *** [/home/br/buildroot/output/build/perl-mail-spamassassin-
3.4.0/.stamp_built] Error 2

Regards, Bernd
