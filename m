From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 24 Jun 2011 17:20:38 +0200
Subject: [Buildroot] cyrus-imapd in buildroot: imtest does not cross-compile
	correctly
In-Reply-To: <4E04828A.6030908@lucaceresoli.net>
References: <4E04828A.6030908@lucaceresoli.net>
Message-ID: <4E04AB46.2070704@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

trying to cross-compile cyrus-imapd 2.4.9 in buildroot, with most options
disabled to keep things simple, I got this:

   [...]
   ### Making install in /home/murray/devel/buildroot/output/build/cyrus-imapd-2.4.9/imtest
   make[2]: Entering directory `/home/murray/devel/buildroot/output/build/cyrus-imapd-2.4.9/imtest'
   /usr/bin/install -c -s -m 755 imtest /home/murray/devel/buildroot/output/target/usr/bin
   strip: Unable to recognise the format of the input file `/home/murray/devel/buildroot/output/target/usr/bin/imtest'
   /usr/bin/install: strip process terminated abnormally
   make[2]: *** [install] Error 1
   make[2]: Leaving directory `/home/murray/devel/buildroot/output/build/cyrus-imapd-2.4.9/imtest'
   [...]

Clearly, the host install (/usr/bin/install) is being used and it is normal that
it fails in stripping cross-compiled files.
What I don't know is how to tell ./configure that it should not instruct install
to strip files, i.e. not pass the -s option.

After a very brief research, I cowardly opted for patching cyrus-imapd to
completely disable imtest compilation, as I don't need it.

Any idea on how to really fix this issue, instead of just disabling imtest?
And how about adding a --disable-imtest option?

Attached are the build log and my awful patch.

Luca


-------------- next part --------------
A non-text attachment was scrubbed...
Name: cyrus-imapd-imtest.log.gz
Type: application/x-gzip
Size: 6664 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110624/7b28cc1f/attachment.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: cyrus-imapd-disable-imtest.patch
Type: text/x-patch
Size: 1755 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110624/7b28cc1f/attachment-0001.bin>
