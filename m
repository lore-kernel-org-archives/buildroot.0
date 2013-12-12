From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 12 Dec 2013 15:27:01 +0100
Subject: [Buildroot] [PATCH v3] knock: Fix build failure due to missing
	README file.
In-Reply-To: <1386851218-19360-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Thu, 12 Dec 2013 12:26:58 +0000")
References: <1386851218-19360-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <871u1i2lhm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Apply upstream patch: 306a696c0882f28a5cd2e41d392c3a6ed14d45f4
 > The build process fails because Makefile.am includes README as part of
 > the documentation files, but actually it doesn't exist:

 > make[2]: *** No rule to make target `README', needed by `all-am'. Stop.

 > The right file is README.md, so making that replacement to Makefile.am
 > fixes the problem.

Ups, houston we have a problem:

>>> knock 7666f2e86e18d482eaad5fe1fea46d87d80b0555 Downloading
--2013-12-12 15:09:21--  https://github.com/jvinet/knock/tarball/master/knock-7666f2e86e18d482eaad5fe1fea46d87d80b0555.tar.gz
Resolving github.com (github.com)... 192.30.252.129
Connecting to github.com (github.com)|192.30.252.129|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://codeload.github.com/jvinet/knock/legacy.tar.gz/master [following]
--2013-12-12 15:09:22--  https://codeload.github.com/jvinet/knock/legacy.tar.gz/master
Resolving codeload.github.com (codeload.github.com)... 192.30.252.144
Connecting to codeload.github.com (codeload.github.com)|192.30.252.144|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: unspecified [application/x-gzip]
Saving to: `/var/lib/downloads/knock-7666f2e86e18d482eaad5fe1fea46d87d80b0555.tar.gz.tmp'

    [ <=>                                   ] 27,846      --.-K/s   in 0.001s  

2013-12-12 15:09:23 (41.6 MB/s) - `/var/lib/downloads/knock-7666f2e86e18d482eaad5fe1fea46d87d80b0555.tar.gz.tmp' saved [27846]

>>> knock 7666f2e86e18d482eaad5fe1fea46d87d80b0555 Extracting
gzip -d -c /var/lib/downloads/knock-7666f2e86e18d482eaad5fe1fea46d87d80b0555.tar.gz | tar --strip-components=1 -C /home/peko/source/buildroot/output/build/knock-7666f2e86e18d482eaad5fe1fea46d87d80b0555  -xf -
>>> knock 7666f2e86e18d482eaad5fe1fea46d87d80b0555 Patching

Applying knock-001-Fix-missing-README-file.patch using patch: 
patching file Makefile.am
Reversed (or previously applied) patch detected!  Skipping patch.

The github URL was wrong, so it always downloaded the latest version
from master.

With that fixed the patch is not needed (as the README -> README.md
rename only happeneded after 7666f2):

https://github.com/jvinet/knock/commit/4faa1daa4f8ab6825a2becf106f43220af395132

-- 
Bye, Peter Korsgaard
