From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Date: Wed, 1 Aug 2018 16:17:13 +0200
Subject: [Buildroot] How to retain intentional absolute RPATH for target
 application?
Message-ID: <20180801141713.GT21354@australia>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have an application that has an RPATH containing (among some automatically
present values) an absolute path which is present on target but not a standard
search path, say /opt/foobar/lib , and also as first entry $ORIGIN/../lib.
The application is stored in /opt/foobar/bin.

Testing on target in a case where fix-rpath is not used (old buildroot version)
shows that the first entry in RPATH is used, i.e. $ORIGIN/../lib, resolving to
/opt/foobar/bin/../lib.

When going to current buildroot including fix-rpath, this application cannot be
loaded because the libraries are not found. Analysis shows that only standard
search paths are considered.

Manually checking the patchelf step shows that the RPATH is completely cleared.
I found a patch by Bryce Ferguson regarding endianness problems on PPC (this is
indeed a PPC target), but although it is applied and fixes the display of the
RPATH field in readelf after running fix-rpath, the actual issue remains:
RPATH is empty after running fix-rpath.

My question is now: how to allow preserving such an intentional RPATH, or at
least make sure that the libraries in /opt/foobar/lib are found?

Thanks,
Thomas
