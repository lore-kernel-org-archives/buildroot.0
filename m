From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 18 Dec 2017 14:03:35 +0000
Subject: [Buildroot] [Bug 10511] Packages get downloaded uncompressed with
 wget
In-Reply-To: <bug-10511-163@https.bugs.busybox.net/>
References: <bug-10511-163@https.bugs.busybox.net/>
Message-ID: <bug-10511-163-9BUf82Jty2@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10511

--- Comment #2 from Frank Hunleth <fhunleth@troodon-software.com> ---
(In reply to Thomas Petazzoni from comment #1)

This is due to a change in behavior with wget 1.19.2. This discussion describes
the issue: http://lists.gnu.org/archive/html/bug-wget/2017-11/msg00000.html. To
reproduce, I installed wget 1.19.2 on my system and added the following line to
qemu_arm_versatile_defconfig:

BR2_PACKAGE_ERLANG=y

Here's the result of running "make source". You can see the MD5 mismatch from
the erlang.org copy. That's because it was automatically decompressed by wget.

umask 0022 && make -C /home/fhunleth/buildroot.upstream
O=/home/fhunleth/buildroot.upstream/o/wgettest/. source
>>> erlang 20.0 Downloading
--2017-12-18 08:46:07--  http://www.erlang.org/download/otp_src_20.0.tar.gz
Resolving www.erlang.org... 31.172.186.60
Connecting to www.erlang.org|31.172.186.60|:80... connected.
HTTP request sent, awaiting response... 301 Moved Permanently
Location: http://erlang.org/download/otp_src_20.0.tar.gz [following]
--2017-12-18 08:46:08--  http://erlang.org/download/otp_src_20.0.tar.gz
Resolving erlang.org... 192.121.151.106
Connecting to erlang.org|192.121.151.106|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 87346046 (83M) [application/x-tar]
Saving to:
?/home/fhunleth/buildroot.upstream/o/wgettest/build/.otp_src_20.0.tar.gz.5GQ6qy/output?

/home/fhunleth/buildroot.upstream/o/
100%[======================================================================>] 
83.30M   582KB/s    in 2m 27s  

2017-12-18 08:48:35 (582 KB/s) -
?/home/fhunleth/buildroot.upstream/o/wgettest/build/.otp_src_20.0.tar.gz.5GQ6qy/output?
saved [237383680]

ERROR: otp_src_20.0.tar.gz has wrong md5 hash:
ERROR: expected: 2faed2c3519353e6bc2501ed4d8e6ae7
ERROR: got     : 6d1210c2a3a9b178a751809016ef51d2
ERROR: Incomplete download, or man-in-the-middle (MITM) attack
--2017-12-18 08:48:35--  http://sources.buildroot.net/otp_src_20.0.tar.gz
Resolving sources.buildroot.net... 176.9.16.109
Connecting to sources.buildroot.net|176.9.16.109|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 87346046 (83M) [application/x-gzip]
Saving to:
?/home/fhunleth/buildroot.upstream/o/wgettest/build/.otp_src_20.0.tar.gz.hY7Oae/output?

/home/fhunleth/buildroot.upstream/o/
100%[======================================================================>] 
83.30M  3.56MB/s    in 23s     

2017-12-18 08:48:59 (3.59 MB/s) -
?/home/fhunleth/buildroot.upstream/o/wgettest/build/.otp_src_20.0.tar.gz.hY7Oae/output?
saved [87346046/87346046]

otp_src_20.0.tar.gz: OK (md5: 2faed2c3519353e6bc2501ed4d8e6ae7)
otp_src_20.0.tar.gz: OK (sha256:
fe80e1e14a2772901be717694bb30ac4e9a07eee0cc7a28988724cbd21476811)
otp_src_20.0.tar.gz: OK (md5: 2faed2c3519353e6bc2501ed4d8e6ae7)
otp_src_20.0.tar.gz: OK (sha256:
fe80e1e14a2772901be717694bb30ac4e9a07eee0cc7a28988724cbd21476811)

Verify that the invalidate MD5 was done on the uncompressed file:

$ gunzip otp_src_20.0.tar.gz 
$ md5sum otp_src_20.0.tar 
6d1210c2a3a9b178a751809016ef51d2  otp_src_20.0.tar

It seems like a configuration change on erlang.org could fix the problem as
well, but I'm not sure that's the right answer for Buildroot.

-- 
You are receiving this mail because:
You are on the CC list for the bug.
