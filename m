From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 5 Feb 2019 06:25:49 -0600
Subject: [Buildroot] [PATCH] package/qpid-proton: openssl 1.1.x
 compatibility
In-Reply-To: <1549365482-36494-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1549365482-36494-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <CANQCQpaJR-OF0d3CsnzOkNDvurWkhK8oR1X=SEymWVNce=ZaCA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also ended up rejecting this one.  Found a libressl issue.  v2 is
close to ready.

On Tue, Feb 5, 2019 at 5:18 AM Matt Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> Updates are based on the original bug report upstream.
> https://issues.apache.org/jira/browse/PROTON-1326
>
> Fixes
> http://autobuild.buildroot.net/results/f90/f9085f223cd54c70daf29b12e6c66edb416f7243/
>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
> I attempted to pull this package forward to a newer version but things broke
> even worse, we are quite behind at 0.9.x when latest is 0.26.x.
> ---
>  ...-PROTON-1326-Modify-openssl-DH-code-to-wo.patch | 78 ++++++++++++++++++++++
>  ...-restore-anonymous-cyphers-by-lowering-Op.patch | 62 +++++++++++++++++
>  ...-fix-openssl-error-handling-causing-spuri.patch | 58 ++++++++++++++++
>  3 files changed, 198 insertions(+)
>  create mode 100644 package/qpid-proton/0001-PROTON-1381-PROTON-1326-Modify-openssl-DH-code-to-wo.patch
>  create mode 100644 package/qpid-proton/0002-PROTON-1326-restore-anonymous-cyphers-by-lowering-Op.patch
>  create mode 100644 package/qpid-proton/0003-PROTON-1587-fix-openssl-error-handling-causing-spuri.patch
>
> diff --git a/package/qpid-proton/0001-PROTON-1381-PROTON-1326-Modify-openssl-DH-code-to-wo.patch b/package/qpid-proton/0001-PROTON-1381-PROTON-1326-Modify-openssl-DH-code-to-wo.patch
> new file mode 100644
> index 0000000..1085804
> --- /dev/null
> +++ b/package/qpid-proton/0001-PROTON-1381-PROTON-1326-Modify-openssl-DH-code-to-wo.patch
> @@ -0,0 +1,78 @@
> +From bc872440428073e86ce2631276dc8b7f62da4c33 Mon Sep 17 00:00:00 2001
> +From: Andrew Stitcher <astitcher@apache.org>
> +Date: Tue, 17 Jan 2017 02:10:48 -0500
> +Subject: [PATCH] PROTON-1381, PROTON-1326: Modify openssl DH code to work with
> + openssl 1.1 Modified patch from Volker Diels-Grabsch
> +
> +Upstream: https://github.com/apache/qpid-proton/commit/bc872440428073e86ce2631276dc8b7f62da4c33
> +
> +Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> +---
> + proton-c/src/ssl/openssl.c | 37 +++++++++++++++++++++++++++----------
> + 1 file changed, 27 insertions(+), 10 deletions(-)
> +
> +diff --git a/proton-c/src/ssl/openssl.c b/proton-c/src/ssl/openssl.c
> +index 0b7d157..0c51c03 100644
> +--- a/proton-c/src/ssl/openssl.c
> ++++ b/proton-c/src/ssl/openssl.c
> +@@ -356,12 +356,22 @@ static int verify_callback(int preverify_ok, X509_STORE_CTX *ctx)
> +   return preverify_ok;
> + }
> +
> ++// This was introduced in v1.1
> ++#if OPENSSL_VERSION_NUMBER < 0x10100000
> ++int DH_set0_pqg(DH *dh, BIGNUM *p, BIGNUM *q, BIGNUM *g)
> ++{
> ++  dh->p = p;
> ++  dh->q = q;
> ++  dh->g = g;
> ++  return 1;
> ++}
> ++#endif
> +
> + // this code was generated using the command:
> + // "openssl dhparam -C -2 2048"
> + static DH *get_dh2048(void)
> + {
> +-  static const unsigned char dh2048_p[]={
> ++  static const unsigned char dhp_2048[]={
> +     0xAE,0xF7,0xE9,0x66,0x26,0x7A,0xAC,0x0A,0x6F,0x1E,0xCD,0x81,
> +     0xBD,0x0A,0x10,0x7E,0xFA,0x2C,0xF5,0x2D,0x98,0xD4,0xE7,0xD9,
> +     0xE4,0x04,0x8B,0x06,0x85,0xF2,0x0B,0xA3,0x90,0x15,0x56,0x0C,
> +@@ -385,17 +395,24 @@ static DH *get_dh2048(void)
> +     0xA4,0xED,0xFD,0x49,0x0B,0xE3,0x4A,0xF6,0x28,0xB3,0x98,0xB0,
> +     0x23,0x1C,0x09,0x33,
> +   };
> +-  static const unsigned char dh2048_g[]={
> ++  static const unsigned char dhg_2048[]={
> +     0x02,
> +   };
> +-  DH *dh;
> +-
> +-  if ((dh=DH_new()) == NULL) return(NULL);
> +-  dh->p=BN_bin2bn(dh2048_p,sizeof(dh2048_p),NULL);
> +-  dh->g=BN_bin2bn(dh2048_g,sizeof(dh2048_g),NULL);
> +-  if ((dh->p == NULL) || (dh->g == NULL))
> +-    { DH_free(dh); return(NULL); }
> +-  return(dh);
> ++  DH *dh = DH_new();
> ++  BIGNUM *dhp_bn, *dhg_bn;
> ++
> ++  if (dh == NULL)
> ++    return NULL;
> ++  dhp_bn = BN_bin2bn(dhp_2048, sizeof (dhp_2048), NULL);
> ++  dhg_bn = BN_bin2bn(dhg_2048, sizeof (dhg_2048), NULL);
> ++  if (dhp_bn == NULL || dhg_bn == NULL
> ++      || !DH_set0_pqg(dh, dhp_bn, NULL, dhg_bn)) {
> ++    DH_free(dh);
> ++    BN_free(dhp_bn);
> ++    BN_free(dhg_bn);
> ++    return NULL;
> ++  }
> ++  return dh;
> + }
> +
> + typedef struct {
> +--
> +1.9.1
> +
> diff --git a/package/qpid-proton/0002-PROTON-1326-restore-anonymous-cyphers-by-lowering-Op.patch b/package/qpid-proton/0002-PROTON-1326-restore-anonymous-cyphers-by-lowering-Op.patch
> new file mode 100644
> index 0000000..2adba9a
> --- /dev/null
> +++ b/package/qpid-proton/0002-PROTON-1326-restore-anonymous-cyphers-by-lowering-Op.patch
> @@ -0,0 +1,62 @@
> +From 8c54c62516671375de4068158ccaa0bc1dba0a4a Mon Sep 17 00:00:00 2001
> +From: Cliff Jansen <cjansen@redhat.com>
> +Date: Wed, 2 Aug 2017 16:34:39 -0700
> +Subject: [PATCH] PROTON-1326: restore anonymous cyphers by lowering OpenSSL
> + v1.1 security level just for the PN_SSL_ANONYMOUS_PEER verification mode
> +
> +Upstream: https://github.com/apache/qpid-proton/commit/8c54c62516671375de4068158ccaa0bc1dba0a4a
> +
> +Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> +---
> + proton-c/src/ssl/openssl.c | 14 ++++++++++++++
> + 1 file changed, 14 insertions(+)
> +
> +diff --git a/proton-c/src/ssl/openssl.c b/proton-c/src/ssl/openssl.c
> +index 8cb4e7b..f37cf49 100644
> +--- a/proton-c/src/ssl/openssl.c
> ++++ b/proton-c/src/ssl/openssl.c
> +@@ -72,6 +72,9 @@ struct pn_ssl_domain_t {
> +   char *trusted_CAs;
> +
> +   int   ref_count;
> ++#if OPENSSL_VERSION_NUMBER >= 0x10100000
> ++  int default_seclevel;
> ++#endif
> +   pn_ssl_mode_t mode;
> +   pn_ssl_verify_mode_t verify_mode;
> +
> +@@ -524,6 +527,9 @@ pn_ssl_domain_t *pn_ssl_domain( pn_ssl_mode_t mode )
> +   // Mitigate the CRIME vulnerability
> +   SSL_CTX_set_options(domain->ctx, SSL_OP_NO_COMPRESSION);
> + #endif
> ++#if OPENSSL_VERSION_NUMBER >= 0x10100000
> ++    domain->default_seclevel = SSL_CTX_get_security_level(domain->ctx);
> ++#endif
> +
> +   // by default, allow anonymous ciphers so certificates are not required 'out of the box'
> +   if (!SSL_CTX_set_cipher_list( domain->ctx, CIPHERS_ANONYMOUS )) {
> +@@ -647,6 +653,10 @@ int pn_ssl_domain_set_peer_authentication(pn_ssl_domain_t *domain,
> +   case PN_SSL_VERIFY_PEER:
> +   case PN_SSL_VERIFY_PEER_NAME:
> +
> ++#if OPENSSL_VERSION_NUMBER >= 0x10100000
> ++    SSL_CTX_set_security_level(domain->ctx, domain->default_seclevel);
> ++#endif
> ++
> +     if (!domain->has_ca_db) {
> +       pn_transport_logf(NULL, "Error: cannot verify peer without a trusted CA configured.\n"
> +                  "       Use pn_ssl_domain_set_trusted_ca_db()");
> +@@ -685,6 +695,10 @@ int pn_ssl_domain_set_peer_authentication(pn_ssl_domain_t *domain,
> +     break;
> +
> +   case PN_SSL_ANONYMOUS_PEER:   // hippie free love mode... :)
> ++#if OPENSSL_VERSION_NUMBER >= 0x10100000
> ++    // Must use lowest OpenSSL security level to enable anonymous ciphers.
> ++    SSL_CTX_set_security_level(domain->ctx, 0);
> ++#endif
> +     SSL_CTX_set_verify( domain->ctx, SSL_VERIFY_NONE, NULL );
> +     break;
> +
> +--
> +1.9.1
> +
> diff --git a/package/qpid-proton/0003-PROTON-1587-fix-openssl-error-handling-causing-spuri.patch b/package/qpid-proton/0003-PROTON-1587-fix-openssl-error-handling-causing-spuri.patch
> new file mode 100644
> index 0000000..bbd3c7b
> --- /dev/null
> +++ b/package/qpid-proton/0003-PROTON-1587-fix-openssl-error-handling-causing-spuri.patch
> @@ -0,0 +1,58 @@
> +From c31ca95ac73d0da462f7e324e1c3a33b11c39f2c Mon Sep 17 00:00:00 2001
> +From: Alan Conway <aconway@redhat.com>
> +Date: Wed, 27 Sep 2017 18:37:24 -0400
> +Subject: [PATCH] PROTON-1587: fix openssl error handling, causing spurious
> + errors
> +
> +From the SSL_get_error() man page:
> +
> +       In addition  to ssl and ret, SSL_get_error() inspects the current thread's OpenSSL error
> +       queue.  Thus, SSL_get_error() must be used in the same thread that performed the TLS/SSL I/O
> +       operation, and no other OpenSSL function calls should appear in between.  The current
> +       thread's error queue must be empty before the TLS/SSL I/O operation is attempted, or
> +       SSL_get_error() will not work reliably.
> +
> +Proton was not clearing the error queue, so the "shutdown-during-init"
> +error (which was introduced recently in OpenSSL) was left dangling, and was
> +reported incorrectly when the thread was used to serve another transport.
> +
> +Upstream: https://github.com/apache/qpid-proton/commit/c31ca95ac73d0da462f7e324e1c3a33b11c39f2c
> +
> +Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> +---
> + proton-c/src/ssl/openssl.c | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/proton-c/src/ssl/openssl.c b/proton-c/src/ssl/openssl.c
> +index 5c750b0..3a4e1a3 100644
> +--- a/proton-c/src/ssl/openssl.c
> ++++ b/proton-c/src/ssl/openssl.c
> +@@ -206,7 +206,7 @@ static int ssl_failed(pn_transport_t *transport)
> +   // fake a shutdown so the i/o processing code will close properly
> +   SSL_set_shutdown(ssl->ssl, SSL_SENT_SHUTDOWN|SSL_RECEIVED_SHUTDOWN);
> +   // try to grab the first SSL error to add to the failure log
> +-  char buf[128] = "Unknown error.";
> ++  char buf[256] = "Unknown error";
> +   unsigned long ssl_err = ERR_get_error();
> +   if (ssl_err) {
> +     ERR_error_string_n( ssl_err, buf, sizeof(buf) );
> +@@ -909,6 +909,7 @@ static ssize_t process_input_ssl( pn_transport_t *transport, unsigned int layer,
> +
> +   do {
> +     work_pending = false;
> ++    ERR_clear_error();
> +
> +     // Write to network bio as much as possible, consuming bytes/available
> +
> +@@ -1058,6 +1059,8 @@ static ssize_t process_output_ssl( pn_transport_t *transport, unsigned int layer
> +
> +   do {
> +     work_pending = false;
> ++    ERR_clear_error();
> ++
> +     // first, get any pending application output, if possible
> +
> +     if (!ssl->app_output_closed && ssl->out_count < ssl->out_size) {
> +--
> +1.9.1
> +
> --
> 1.9.1
>


--

Matthew Weber | Pr. Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.


Any export restricted material should be shared using my
matthew.weber at corp.rockwellcollins.com address.
