From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 28 Oct 2017 09:10:17 +0200
Subject: [Buildroot] [PATCH] wget: security bump to version 1.19.2
In-Reply-To: <20171027120208.1159-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Fri, 27 Oct 2017 14:02:08 +0200")
References: <20171027120208.1159-1-peter@korsgaard.com>
Message-ID: <87k1zfn3xi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > CVE-2017-13089: The http.c:skip_short_body() function is called in some
 > circumstances, such as when processing redirects.  When the response is sent
 > chunked, the chunk parser uses strtol() to read each chunk's length, but
 > doesn't check that the chunk length is a non-negative number.  The code then
 > tries to skip the chunk in pieces of 512 bytes by using the MIN() macro, but
 > ends up passing the negative chunk length to connect.c:fd_read().  As
 > fd_read() takes an int argument, the high 32 bits of the chunk length are
 > discarded, leaving fd_read() with a completely attacker controlled length
 > argument.

 > CVE-2017-13090: The retr.c:fd_read_body() function is called when processing
 > OK responses.  When the response is sent chunked, the chunk parser uses
 > strtol() to read each chunk's length, but doesn't check that the chunk
 > length is a non-negative number.  The code then tries to read the chunk in
 > pieces of 8192 bytes by using the MIN() macro, but ends up passing the
 > negative chunk length to retr.c:fd_read().  As fd_read() takes an int
 > argument, the high 32 bits of the chunk length are discarded, leaving
 > fd_read() with a completely attacker controlled length argument.  The
 > attacker can corrupt malloc metadata after the allocated buffer.

 > Drop now upstreamed patch and change to .tar.lz as .tar.xz is no longer
 > available.

 > Also add a hash for the license file while we're at it.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
