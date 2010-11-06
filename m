From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat,  6 Nov 2010 18:32:26 +0000 (UTC)
Subject: [Buildroot] [Bug 2773] New: squid with openssl support needs
	openssl on the host
Message-ID: <bug-2773-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=2773

           Summary: squid with openssl support needs openssl on the host
           Product: buildroot
           Version: 2010.05
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: major
          Priority: P5
         Component: Other
        AssignedTo: gustavo at zacarias.com.ar
        ReportedBy: thomas.petazzoni at free-electrons.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


When squid is compiled with OpenSSL support, openssl for the target is
correctly build before building squid. However, squid also builds a cf_gen tool
for the host, but this fails since OpenSSL for the host isn't build. So we
should add support in the OpenSSL package to build openssl for the host, and
add host-openssl as a dependency of squid.

Here is the relevant part of the build log:


/usr/bin/g++ -o cf_gen ./cf_gen.cc \
                ../lib/util.c ../lib/assert.c \
                -DNDEBUG -DBUILD_HOST_TOOL -I. -I. -I../include -I../include
-I../lib/libTrie/include 
In file included from ./squid.h:354,
                 from ./cf_gen.cc:51:
./ssl_support.h:40:25: error: openssl/ssl.h: No such file or directory
./ssl_support.h:43:25: error: openssl/err.h: No such file or directory
./ssl_support.h:46:28: error: openssl/engine.h: No such file or directory

To reproduce the problem, uninstall any OpenSSL development files from your
host machine, and then build squid with openssl support in Buildroot.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
