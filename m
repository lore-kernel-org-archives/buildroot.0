From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 28 Mar 2012 08:54:32 +0200
Subject: [Buildroot] [PATCH 2/2] microperl: install host-microperl in
	$(HOST_DIR)/opt/perl
In-Reply-To: <cb1e211a5de6c88c39cd9890dbf823c0ff1766c3.1332831974.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 27 Mar 2012 09:06:18 +0200")
References: <cover.1332831974.git.thomas.petazzoni@free-electrons.com>
 <cover.1332831974.git.thomas.petazzoni@free-electrons.com>
 <cb1e211a5de6c88c39cd9890dbf823c0ff1766c3.1332831974.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87fwctb4gn.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> This commit is a tentative at fixing some Perl-related build problems
 Thomas> we are having nowadays, due to the fact that microperl now depends on
 Thomas> host-microperl. Since the perl binary from host-microperl is installed
 Thomas> in $(HOST_DIR)/usr/bin, it gets picked up when we run host tools like
 Thomas> host-intltool, which were normally meant to be used against the
 Thomas> distribution-provided Perl.

Thanks, but I have fixed it a bit differently instead:

commit d0e5eb281f0e3b323ecb3446c1b16baf7f3baa69
Author: Peter Korsgaard <jacmet@sunsite.dk>
Date:   Tue Mar 27 17:11:36 2012 +0200

    libxml-parser-perl: fix host-intltool breakage when microperl is enabled
    
    Microperl will build host-microperl and install it into HOST_DIR/usr/bin,
    where other packages will pick it up as _CONFIGURE_OPTS / _MAKE_ENV
    prepends that to the path.
    
    libxml-parser-perl didn't though, so it would still be built against
    the system perl, causing host-intltool to fail when it would use
    host-microperl together with libxml-parser-perl if the system perl
    isn't compatible with host-microperl.
    
    Fix it by using HOST_CONFIGURE_OPTS and ensuring it is built after
    (host-)microperl if enabled.

-- 
Bye, Peter Korsgaard
