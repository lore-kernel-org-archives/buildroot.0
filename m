From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Feb 2021 17:23:02 +0100
Subject: [Buildroot] [PATCH] package/libopenssl: security bump to
 version 1.1.1j
In-Reply-To: <20210216193134.5920-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 16 Feb 2021 20:31:34 +0100")
References: <20210216193134.5920-1-peter@korsgaard.com>
Message-ID: <87mtw23bq1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security issues:
 > - CVE-2021-23841: Null pointer deref in X509_issuer_and_serial_hash()

 >   The OpenSSL public API function X509_issuer_and_serial_hash() attempts to
 >   create a unique hash value based on the issuer and serial number data
 >   contained within an X509 certificate.  However it fails to correctly
 >   handle any errors that may occur while parsing the issuer field (which
 >   might occur if the issuer field is maliciously constructed).  This may
 >   subsequently result in a NULL pointer deref and a crash leading to a
 >   potential denial of service attack.

 >   The function X509_issuer_and_serial_hash() is never directly called by
 >   OpenSSL itself so applications are only vulnerable if they use this
 >   function directly and they use it on certificates that may have been
 >   obtained from untrusted sources.

 > - CVE-2021-23839: Incorrect SSLv2 rollback protection

 >   OpenSSL 1.0.2 supports SSLv2.  If a client attempts to negotiate SSLv2
 >   with a server that is configured to support both SSLv2 and more recent SSL
 >   and TLS versions then a check is made for a version rollback attack when
 >   unpadding an RSA signature.  Clients that support SSL or TLS versions
 >   greater than SSLv2 are supposed to use a special form of padding.  A
 >   server that supports greater than SSLv2 is supposed to reject connection
 >   attempts from a client where this special form of padding is present,
 >   because this indicates that a version rollback has occurred (i.e.  both
 >   client and server support greater than SSLv2, and yet this is the version
 >   that is being requested).

 >   The implementation of this padding check inverted the logic so that the
 >   connection attempt is accepted if the padding is present, and rejected if
 >   it is absent.  This means that such as server will accept a connection if
 >   a version rollback attack has occurred.  Further the server will
 >   erroneously reject a connection if a normal SSLv2 connection attempt is
 >   made.

 >   OpenSSL 1.1.1 does not have SSLv2 support and therefore is not vulnerable
 >   to this issue.  The underlying error is in the implementation of the
 >   RSA_padding_check_SSLv23() function.  This also affects the
 >   RSA_SSLV23_PADDING padding mode used by various other functions.  Although
 >   1.1.1 does not support SSLv2 the RSA_padding_check_SSLv23() function still
 >   exists, as does the RSA_SSLV23_PADDING padding mode.  Applications that
 >   directly call that function or use that padding mode will encounter this
 >   issue.  However since there is no support for the SSLv2 protocol in 1.1.1
 >   this is considered a bug and not a security issue in that version.

 > - CVE-2021-23840: Integer overflow in CipherUpdate

 >   Calls to EVP_CipherUpdate, EVP_EncryptUpdate and EVP_DecryptUpdate may
 >   overflow the output length argument in some cases where the input length
 >   is close to the maximum permissable length for an integer on the platform.
 >   In such cases the return value from the function call will be 1
 >   (indicating success), but the output length value will be negative.  This
 >   could cause applications to behave incorrectly or crash.

 > For more details, see the advisory:
 > https://www.openssl.org/news/secadv/20210216.txt

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 > ---
 >  package/libopenssl/libopenssl.hash | 4 ++--
 >  package/libopenssl/libopenssl.mk   | 2 +-
 >  2 files changed, 3 insertions(+), 3 deletions(-)

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
