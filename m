From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 14 May 2019 10:45:14 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-05-12
In-Reply-To: <20190513135520.6ced2ff2@windsurf.home> (Thomas Petazzoni's
 message of "Mon, 13 May 2019 13:55:20 +0200")
References: <20190513060042.2B05F852CF@fraxinus.osuosl.org>
 <20190513135520.6ced2ff2@windsurf.home>
Message-ID: <877eatpgpx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

Hi,

 >> aarch64 |                    whois-5.4.0 | NOK | http://autobuild.buildroot.net/results/d272b906cc0a1dcced2b8d48aad77b272300005a |     

 > 2019-05-12 13:20:06 ERROR 500: Internal Server Error.

 > on the Debian server + our mirror didn't had the tarball.

 > Peter, any idea why our mirror doesn't have the tarball ? The bump
 > dates back from January 2019, we should have mirrored the tarball since
 > then.

Hmm, no - Not really. I thought it might be related to the
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS dependency, but manually running make
whois-source did download it:

make whois-source
/usr/bin/make -j1 O=/home/jacmet/source/buildroot-mirror/output HOSTCC="/usr/bin/gcc" HOSTCXX="/usr/bin/g++" syncconfig
>>> whois 5.4.0 Downloading
--2019-05-14 08:36:40--  http://snapshot.debian.org/archive/debian/20181026T220636Z/pool/main/w/whois/whois_5.4.0.tar.xz
Resolving snapshot.debian.org (snapshot.debian.org)... 193.62.202.27, 185.17.185.185, 2001:1af8:4020:b030:deb::185, ...
Connecting to snapshot.debian.org (snapshot.debian.org)|193.62.202.27|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 83576 (82K)
Saving to: ?/home/jacmet/source/buildroot-mirror/output/build/.whois_5.4.0.tar.xz.0Bh8tA/output?

100%[==============================================================================================================>] 83,576       197KB/s   in 0.4s

2019-05-14 08:36:41 (197 KB/s) - ?/home/jacmet/source/buildroot-mirror/output/build/.whois_5.4.0.tar.xz.0Bh8tA/output? saved [83576/83576]

whois_5.4.0.tar.xz: OK (sha256: 3775ae0cfaa6dd8d886e5233c4826225cddcb88c99c2a08130d14e15fe58e378)


And the logic does end up passing whois-source to make, so I am not
sure. Perhaps one of the new dependencies.sh checks fails?

We indeed do have:

commit dc5553d2ce1d333cbecac563d2c55525aa8e14ef
Author: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date:   Tue Jun 5 20:13:47 2018 +0200

    dependencies.sh: add perl autodie for whois

    Add dependency on perl autodie if whois package is selected

And the s.b.o machine does not have autodie:

perl -e "require autodie"
Can't locate autodie.pm in @INC (@INC contains: /usr/local/lib64/perl5 /usr/local/share/perl5 /usr/lib64/perl5/vendor_perl /usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5 .) at -e line 1.

But that only explains it for the part where we run

make allyespackageconfig && make source

Anyway, I have now manually downloaded it.

-- 
Bye, Peter Korsgaard
