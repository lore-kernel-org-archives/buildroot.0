From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sun, 17 May 2020 20:20:34 +0000
Subject: [Buildroot] [Bug 12686] recipe for target 'install_dev' failed
 (libcrypto.so: file format not recognized)
In-Reply-To: <bug-12686-163@https.bugs.busybox.net/>
References: <bug-12686-163@https.bugs.busybox.net/>
Message-ID: <bug-12686-163-tJG1VqvfFj@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12686

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WORKSFORME

--- Comment #8 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> ---
The issue you are pointing to seems to be known in OpenSSL upstream:
 - https://github.com/openssl/openssl/issues/6641
 - https://github.com/openssl/openssl/issues/9086

So, I setup a Docker container with CentOS 7, checked out Buildroot 2020.02 and
built OpenSSL 1.1.1d, without any problem.

The first issue mentioned above indicates that the problem came from a perl
module called Text::Template, which I do not have installed in my Docker
container:

# perl -e 'use Text::Template; print $Text::Template::VERSION,"\n";'
Can't locate Text/Template.pm in @INC (@INC contains: /usr/local/lib64/perl5
/usr/local/share/perl5 /usr/lib64/perl5/vendor_perl
/usr/share/perl5/vendor_perl /usr/lib64/perl5 /usr/share/perl5 .) at -e line 1.
BEGIN failed--compilation aborted at -e line 1.

Since you mentioned you had some Perl-related environment variables defined,
perhaps there is an issue with this ?

Since we're not able to reproduce, we won't be able to help a lot here. Could
you work on some way of reproducing this?

-- 
You are receiving this mail because:
You are on the CC list for the bug.
