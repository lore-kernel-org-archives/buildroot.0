From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 24 Jun 2011 15:03:06 +0200
Subject: [Buildroot] cyrus-sasl in buildroot: installs files with
	"arm-linux-" prefix
In-Reply-To: <4E04828A.6030908@lucaceresoli.net>
References: <4E04828A.6030908@lucaceresoli.net>
Message-ID: <4E048B0A.8080003@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

after somehow working around the two previous issues I reported in
cross-compiling cyrus-sasl in buildroot ("apparent CFLAGS mismatch on 
saslauthd"
and "fix HOSTCC and related variables") I finally got buildroot to complete
compilation and installation of cyrus-sasl!

Alas, not all is perfect. While libraries look correctly installed, the 
manpages
and executables are installed with an unwanted "arm-linux-" prefix:

   $ make cyrus-sasl-install-target
   [...]
   $ find output/target/ -name "*sasl*"
   output/target/usr/man/man3/arm-linux-sasl_verifyfile_t.3
   output/target/usr/man/man3/arm-linux-sasl_idle.3
   output/target/usr/man/man3/arm-linux-sasl_checkpass.3
   output/target/usr/man/man3/arm-linux-sasl_canon_user_t.3
   [...]
   output/target/usr/man/man3/arm-linux-sasl_getrealm_t.3
   output/target/usr/man/man8/arm-linux-saslpasswd2.8
   output/target/usr/man/man8/arm-linux-sasldblistusers2.8
   output/target/usr/sbin/arm-linux-sasldblistusers2
   output/target/usr/sbin/arm-linux-saslpasswd2
   output/target/usr/lib/libsasl2.so.2
   output/target/usr/lib/libsasl2.so
   output/target/usr/lib/libsasl2.la
   output/target/usr/lib/libsasl2.so.2.0.24
   output/target/usr/lib/libsasl2.a
   output/target/usr/lib/sasl2
   output/target/usr/lib/sasl2/libsasldb.so.2.0.24
   output/target/usr/lib/sasl2/libsasldb.so.2
   output/target/usr/lib/sasl2/libsasldb.la
   output/target/usr/lib/sasl2/libsasldb.a
   output/target/usr/lib/sasl2/libsasldb.so
   output/target/usr/include/sasl
   output/target/usr/include/sasl/sasl.h
   output/target/usr/include/sasl/saslutil.h
   output/target/usr/include/sasl/saslplug.h
   $

Once more, the install log is attached.

This might not be a real issue for manpages and static libs, which are 
removed
by buildroot later in the build process (unless one wants them 
installed, which
is uncommon in an embedded device).

It is more annoying for sasldblistusers2 and saslpasswd2.

I currently have no solution to this problem; instructing buildroot to 
rename
the two files in a post-install hook would be trivial, but if anybody 
came up
with a solution that fixes the problem at its root, it sure would be better.

Luca

-------------- next part --------------
A non-text attachment was scrubbed...
Name: cyrus-sasl-install.log.gz
Type: application/x-gzip
Size: 2151 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110624/f8a84d83/attachment.bin>
