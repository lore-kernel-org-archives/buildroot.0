From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Sep 2017 19:13:44 +0200
Subject: [Buildroot] [PATCH 1/3] package/softether: fix hash
In-Reply-To: <20170920104143.21404-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Wed, 20 Sep 2017 12:41:41 +0200")
References: <20170920104143.21404-1-bernd.kuhls@t-online.de>
Message-ID: <87poalz41j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > The tarball downloaded today from github does not match the checksum
 > which once was valid.

 > Comparing both
 > https://github.com/SoftEtherVPN/SoftEtherVPN/archive/1e17c9bcfd7e7b31756aa5389bcbff76c2c9c88a/softether-1e17c9bcfd7e7b31756aa5389bcbff76c2c9c88a.tar.gz
 > http://sources.buildroot.net/softether-1e17c9bcfd7e7b31756aa5389bcbff76c2c9c88a.tar.gz
 > shows no differences in content.

That sucks :/ Did you try contacting github to hear why/what they
changed?

Running diffoscope on those two files I see:

??? stat {}
? @@ -1,8 +1,8 @@
?
?    Size: 4096         Blocks: 8          IO Block: 4096   directory
?  Links: 2
?  Access: (0755/drwxr-xr-x)  Uid: ( 1000/    peko)   Gid: ( 1000/    peko)
?
? -Modify: 2017-09-20 16:58:19.195219335 +0000
? +Modify: 2017-09-20 16:58:31.523105962 +0000
?
?   Birth: -
??? softether-1e17c9bcfd7e7b31756aa5389bcbff76c2c9c88a.tar.gz
??? softether-1e17c9bcfd7e7b31756aa5389bcbff76c2c9c88a.tar
?? No file format specific differences found inside, yet data differs (POSIX tar archive)
? ? @@ -1048569,8 +1048569,8 @@
? ?  00ffff80: 7970 746f 2e68 0063 3a5c 7072 6f67 7261  ypto.h.c:\progra
? ?  00ffff90: 6d20 6669 6c65 7320 2878 3836 295c 6d69  m files (x86)\mi
? ?  00ffffa0: 6372 6f73 6f66 7420 7669 7375 616c 2073  crosoft visual s
? ?  00ffffb0: 7475 6469 6f20 392e 305c 7663 5c69 6e63  tudio 9.0\vc\inc
? ?  00ffffc0: 6c75 6465 5c6d 616c 6c6f 632e 6800 633a  lude\malloc.h.c:
? ?  00ffffd0: 5c70 726f 6772 616d 2066 696c 6573 2028  \program files (
? ?  00ffffe0: 7838 3629 5c6d 6963 726f 736f 6674 2076  x86)\microsoft v
? ? -[ Too much input for diff (SHA1: 3e0df0eb8783dcfbbc16bf8126d2a176d9278df8) ]
? ? +[ Too much input for diff (SHA1: e7ea66ed795362d98a80e74d158683372f530c40) ]
??? stat {}
? ? @@ -1,8 +1,8 @@
? ?
? ? -  Size: 33696997   Blocks: 65824      IO Block: 4096   regular file
? ? +  Size: 33697009   Blocks: 65824      IO Block: 4096   regular file
? ?  Links: 1
? ?  Access: (0644/-rw-r--r--)  Uid: ( 1000/    peko)   Gid: ( 1000/    peko)
? ?
? ? -Modify: 2017-09-20 16:58:24.631169343 +0000
? ? +Modify: 2016-06-05 22:04:37.000000000 +0000
? ?
? ?   Birth: -

Diffing a hexdump of the (uncompressed) tarballs shows a difference in
the x86 and x64 directories:

@@ -6642548,9 +6642548,6 @@
 06749150  00 30 30 30 30 30 30 30  00 00 00 00 00 00 00 00  |.0000000........|
 06749160  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
 *
-06749200  78 36 34 2f 00 00 00 00  00 00 00 00 00 00 00 00  |x64/............|
-06749210  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
-*
 06749260  00 00 00 00 30 30 30 30  37 37 35 00 30 30 30 30  |....0000775.0000|
 06749270  30 30 30 00 30 30 30 30  30 30 30 00 30 30 30 30  |000.0000000.0000|
 06749280  30 30 30 30 30 30 30 00  31 32 37 30 37 31 35 36  |0000000.12707156|
@@ -6642568,7 +6642565,7 @@
 06749380  63 62 66 66 37 36 63 32  63 39 63 38 38 61 2f 73  |cbff76c2c9c88a/s|
 06749390  72 63 2f 62 69 6e 2f 68  61 6d 63 6f 72 65 2f 44  |rc/bin/hamcore/D|
 067493a0  72 69 76 65 72 50 61 63  6b 61 67 65 73 2f 53 65  |riverPackages/Se|
-067493b0  4c 6f 77 5f 57 69 6e 31  30 00 00 00 00 00 00 00  |Low_Win10.......|
+067493b0  4c 6f 77 5f 57 69 6e 31  30 2f 78 36 34 00 00 00  |Low_Win10/x64...|
 067493c0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
 *
 06749400  53 65 4c 6f 77 5f 57 69  6e 31 30 5f 78 36 34 2e  |SeLow_Win10_x64.|
@@ -6647001,9 +6646998,6 @@
 0675b540  68 b1 28 a6 37 a0 a9 04  62 00 00 00 00 00 00 00  |h.(.7...b.......|
 0675b550  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
 *
-0675b600  78 38 36 2f 00 00 00 00  00 00 00 00 00 00 00 00  |x86/............|
-0675b610  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
-*
 0675b660  00 00 00 00 30 30 30 30  37 37 35 00 30 30 30 30  |....0000775.0000|
 0675b670  30 30 30 00 30 30 30 30  30 30 30 00 30 30 30 30  |000.0000000.0000|
 0675b680  30 30 30 30 30 30 30 00  31 32 37 30 37 31 35 36  |0000000.12707156|
@@ -6647021,7 +6647015,7 @@
 0675b780  63 62 66 66 37 36 63 32  63 39 63 38 38 61 2f 73  |cbff76c2c9c88a/s|
 0675b790  72 63 2f 62 69 6e 2f 68  61 6d 63 6f 72 65 2f 44  |rc/bin/hamcore/D|
 0675b7a0  72 69 76 65 72 50 61 63  6b 61 67 65 73 2f 53 65  |riverPackages/Se|
-0675b7b0  4c 6f 77 5f 57 69 6e 31  30 00 00 00 00 00 00 00  |Low_Win10.......|
+0675b7b0  4c 6f 77 5f 57 69 6e 31  30 2f 78 38 36 00 00 00  |Low_Win10/x86...|
 0675b7c0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
 *
 0675b800  53 65 4c 6f 77 5f 57 69  6e 31 30 5f 78 38 36 2e  |SeLow_Win10_x86.|


The fact that we have a copy of the "old" tarball on s.b.o means that
these games don't break the builds, but they still aren't nice :/

Committed all 3, thanks.

-- 
Bye, Peter Korsgaard
