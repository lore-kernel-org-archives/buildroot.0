From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 May 2019 09:59:51 +0200
Subject: [Buildroot] [PATCH] package/libopenssl: security bump to
 version 1.1.1c
In-Reply-To: <20190530214336.16338-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 30 May 2019 23:43:36 +0200")
References: <20190530214336.16338-1-peter@korsgaard.com>
Message-ID: <87lfynvytk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > Prevent over long nonces in ChaCha20-Poly1305 (CVE-2019-1543)

 > ChaCha20-Poly1305 is an AEAD cipher, and requires a unique nonce input for
 > every encryption operation.  RFC 7539 specifies that the nonce value (IV)
 > should be 96 bits (12 bytes).  OpenSSL allows a variable nonce length and
 > front pads the nonce with 0 bytes if it is less than 12 bytes.  However it
 > also incorrectly allows a nonce to be set of up to 16 bytes.  In this case
 > only the last 12 bytes are significant and any additional leading bytes are
 > ignored.

 > It is a requirement of using this cipher that nonce values are unique.
 > Messages encrypted using a reused nonce value are susceptible to serious
 > confidentiality and integrity attacks.  If an application changes the
 > default nonce length to be longer than 12 bytes and then makes a change to
 > the leading bytes of the nonce expecting the new value to be a new unique
 > nonce then such an application could inadvertently encrypt messages with a
 > reused nonce.

 > Additionally the ignored bytes in a long nonce are not covered by the
 > integrity guarantee of this cipher.  Any application that relies on the
 > integrity of these ignored leading bytes of a long nonce may be further
 > affected.  Any OpenSSL internal use of this cipher, including in SSL/TLS, is
 > safe because no such use sets such a long nonce value.  However user
 > applications that use this cipher directly and set a non-default nonce
 > length to be longer than 12 bytes may be vulnerable.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
