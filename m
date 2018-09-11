From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Tue, 11 Sep 2018 14:10:55 +0000
Subject: [Buildroot] [Bug 11341] New: Compiling qt5base-5.11.1 with libressl
 results in many 'was not declared in this scope' errors
Message-ID: <bug-11341-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=11341

            Bug ID: 11341
           Summary: Compiling qt5base-5.11.1 with libressl results in many
                    'was not declared in this scope' errors
           Product: buildroot
           Version: unspecified
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: richterphilipp.pops at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7776
  --> https://bugs.busybox.net/attachment.cgi?id=7776&action=edit
Config file enabling qt5base and libressl

Hello,

so qt5base-5.11.1 doesn't seem to like libressl.
The compiler complains about missing symbols like:
error: ?OPENSSL_STACK? was not declared in this scope

As of commit 8062700e2d48f2914638755961bea6a56f1d5d8f

To reproduce:

1) Enable openssl and change the provider to libressl

2) select qt5base

3) make

Attached is a config file to reproduce.

Output:

In file included from ssl/qsslsocket_openssl_symbols_p.h:220,
                 from ssl/qsslcertificate.cpp:116:
ssl/qsslsocket_openssl11_symbols_p.h:87:22: error: ?OPENSSL_STACK? was not
declared in this scope
 int q_OPENSSL_sk_num(OPENSSL_STACK *a);
                      ^~~~~~~~~~~~~
ssl/qsslsocket_openssl11_symbols_p.h:87:22: note: suggested alternative:
?OPENSSL_BLOCK?
 int q_OPENSSL_sk_num(OPENSSL_STACK *a);
                      ^~~~~~~~~~~~~
                      OPENSSL_BLOCK
ssl/qsslsocket_openssl11_symbols_p.h:87:37: error: ?a? was not declared in this
scope
 int q_OPENSSL_sk_num(OPENSSL_STACK *a);
                                     ^
ssl/qsslsocket_openssl11_symbols_p.h:88:28: error: variable or field
?q_OPENSSL_sk_pop_free? declared void
 void q_OPENSSL_sk_pop_free(OPENSSL_STACK *a, void (*b)(void *));
                            ^~~~~~~~~~~~~
ssl/qsslsocket_openssl11_symbols_p.h:88:28: error: ?OPENSSL_STACK? was not
declared in this scope
ssl/qsslsocket_openssl11_symbols_p.h:88:28: note: suggested alternative:
?OPENSSL_BLOCK?
 void q_OPENSSL_sk_pop_free(OPENSSL_STACK *a, void (*b)(void *));
                            ^~~~~~~~~~~~~
                            OPENSSL_BLOCK
ssl/qsslsocket_openssl11_symbols_p.h:88:43: error: ?a? was not declared in this
scope
 void q_OPENSSL_sk_pop_free(OPENSSL_STACK *a, void (*b)(void *));
                                           ^
ssl/qsslsocket_openssl11_symbols_p.h:88:53: error: ?b? was not declared in this
scope
 void q_OPENSSL_sk_pop_free(OPENSSL_STACK *a, void (*b)(void *));
                                                     ^
ssl/qsslsocket_openssl11_symbols_p.h:88:56: error: expected primary-expression
before ?void?
 void q_OPENSSL_sk_pop_free(OPENSSL_STACK *a, void (*b)(void *));
                                                        ^~~~
ssl/qsslsocket_openssl11_symbols_p.h:89:1: error: ?OPENSSL_STACK? does not name
a type; did you mean ?OPENSSL_BLOCK??
 OPENSSL_STACK *q_OPENSSL_sk_new_null();
 ^~~~~~~~~~~~~
 OPENSSL_BLOCK
ssl/qsslsocket_openssl11_symbols_p.h:90:24: error: variable or field
?q_OPENSSL_sk_push? declared void
 void q_OPENSSL_sk_push(OPENSSL_STACK *st, void *data);
                        ^~~~~~~~~~~~~
ssl/qsslsocket_openssl11_symbols_p.h:90:24: error: ?OPENSSL_STACK? was not
declared in this scope
ssl/qsslsocket_openssl11_symbols_p.h:90:24: note: suggested alternative:
?OPENSSL_BLOCK?
 void q_OPENSSL_sk_push(OPENSSL_STACK *st, void *data);
                        ^~~~~~~~~~~~~
                        OPENSSL_BLOCK
ssl/qsslsocket_openssl11_symbols_p.h:90:39: error: ?st? was not declared in
this scope
 void q_OPENSSL_sk_push(OPENSSL_STACK *st, void *data);
                                       ^~
ssl/qsslsocket_openssl11_symbols_p.h:90:39: note: suggested alternative: ?Qt?
 void q_OPENSSL_sk_push(OPENSSL_STACK *st, void *data);
                                       ^~
                                       Qt
ssl/qsslsocket_openssl11_symbols_p.h:90:43: error: expected primary-expression
before ?void?
 void q_OPENSSL_sk_push(OPENSSL_STACK *st, void *data);
                                           ^~~~
ssl/qsslsocket_openssl11_symbols_p.h:91:24: error: variable or field
?q_OPENSSL_sk_free? declared void
 void q_OPENSSL_sk_free(OPENSSL_STACK *a);
                        ^~~~~~~~~~~~~
ssl/qsslsocket_openssl11_symbols_p.h:91:24: error: ?OPENSSL_STACK? was not
declared in this scope
ssl/qsslsocket_openssl11_symbols_p.h:91:24: note: suggested alternative:
?OPENSSL_BLOCK?
 void q_OPENSSL_sk_free(OPENSSL_STACK *a);
                        ^~~~~~~~~~~~~
                        OPENSSL_BLOCK
ssl/qsslsocket_openssl11_symbols_p.h:91:39: error: ?a? was not declared in this
scope
 void q_OPENSSL_sk_free(OPENSSL_STACK *a);
                                       ^
ssl/qsslsocket_openssl11_symbols_p.h:92:27: error: ?OPENSSL_STACK? was not
declared in this scope
 void * q_OPENSSL_sk_value(OPENSSL_STACK *a, int b);
                           ^~~~~~~~~~~~~
ssl/qsslsocket_openssl11_symbols_p.h:92:27: note: suggested alternative:
?OPENSSL_BLOCK?
 void * q_OPENSSL_sk_value(OPENSSL_STACK *a, int b);
                           ^~~~~~~~~~~~~
                           OPENSSL_BLOCK
ssl/qsslsocket_openssl11_symbols_p.h:92:42: error: ?a? was not declared in this
scope
 void * q_OPENSSL_sk_value(OPENSSL_STACK *a, int b);
                                          ^
ssl/qsslsocket_openssl11_symbols_p.h:92:45: error: expected primary-expression
before ?int?
 void * q_OPENSSL_sk_value(OPENSSL_STACK *a, int b);
                                             ^~~
ssl/qsslsocket_openssl11_symbols_p.h:92:50: error: expression list treated as
compound expression in initializer [-fpermissive]
 void * q_OPENSSL_sk_value(OPENSSL_STACK *a, int b);
                                                  ^
ssl/qsslsocket_openssl11_symbols_p.h:95:45: error: ?OPENSSL_INIT_SETTINGS? does
not name a type; did you mean ?OPENSSL_INIT_ATFORK??
 int q_OPENSSL_init_ssl(uint64_t opts, const OPENSSL_INIT_SETTINGS *settings);
                                             ^~~~~~~~~~~~~~~~~~~~~
                                             OPENSSL_INIT_ATFORK
In file included from ssl/qsslsocket_openssl_symbols_p.h:220,
                 from ssl/qsslcertificate.cpp:116:
ssl/qsslsocket_openssl11_symbols_p.h:107:50: error: ?X509_STORE_CTX_verify_cb?
has not been declared
 void q_X509_STORE_set_verify_cb(X509_STORE *ctx, X509_STORE_CTX_verify_cb
verify_cb);
                                                  ^~~~~~~~~~~~~~~~~~~~~~~~
ssl/qsslsocket_openssl11_symbols_p.h:124:48: error: ?OPENSSL_INIT_SETTINGS?
does not name a type; did you mean ?OPENSSL_INIT_ATFORK??
 int q_OPENSSL_init_crypto(uint64_t opts, const OPENSSL_INIT_SETTINGS
*settings);
                                                ^~~~~~~~~~~~~~~~~~~~~
                                                OPENSSL_INIT_ATFORK
In file included from ssl/qsslcertificate.cpp:116:
ssl/qsslsocket_openssl_symbols_p.h:360:1: error: ?SSL_CONF_CTX? does not name a
type; did you mean ?SSL_AEAD_CTX??
 SSL_CONF_CTX *q_SSL_CONF_CTX_new();
 ^~~~~~~~~~~~
 SSL_AEAD_CTX
ssl/qsslsocket_openssl_symbols_p.h:361:26: error: variable or field
?q_SSL_CONF_CTX_free? declared void
 void q_SSL_CONF_CTX_free(SSL_CONF_CTX *a);
                          ^~~~~~~~~~~~
ssl/qsslsocket_openssl_symbols_p.h:361:26: error: ?SSL_CONF_CTX? was not
declared in this scope
ssl/qsslsocket_openssl_symbols_p.h:361:26: note: suggested alternative:
?SSL_AEAD_CTX?
 void q_SSL_CONF_CTX_free(SSL_CONF_CTX *a);
                          ^~~~~~~~~~~~
                          SSL_AEAD_CTX
ssl/qsslsocket_openssl_symbols_p.h:361:40: error: ?a? was not declared in this
scope
 void q_SSL_CONF_CTX_free(SSL_CONF_CTX *a);
                                        ^
ssl/qsslsocket_openssl_symbols_p.h:362:33: error: variable or field
?q_SSL_CONF_CTX_set_ssl_ctx? declared void
 void q_SSL_CONF_CTX_set_ssl_ctx(SSL_CONF_CTX *a, SSL_CTX *b);
                                 ^~~~~~~~~~~~
ssl/qsslsocket_openssl_symbols_p.h:362:33: error: ?SSL_CONF_CTX? was not
declared in this scope
ssl/qsslsocket_openssl_symbols_p.h:362:33: note: suggested alternative:
?SSL_AEAD_CTX?
 void q_SSL_CONF_CTX_set_ssl_ctx(SSL_CONF_CTX *a, SSL_CTX *b);
                                 ^~~~~~~~~~~~
                                 SSL_AEAD_CTX
ssl/qsslsocket_openssl_symbols_p.h:362:47: error: ?a? was not declared in this
scope
 void q_SSL_CONF_CTX_set_ssl_ctx(SSL_CONF_CTX *a, SSL_CTX *b);
                                               ^
ssl/qsslsocket_openssl_symbols_p.h:362:58: error: expected primary-expression
before ?*? token
 void q_SSL_CONF_CTX_set_ssl_ctx(SSL_CONF_CTX *a, SSL_CTX *b);
                                                          ^
ssl/qsslsocket_openssl_symbols_p.h:362:59: error: ?b? was not declared in this
scope
 void q_SSL_CONF_CTX_set_ssl_ctx(SSL_CONF_CTX *a, SSL_CTX *b);
                                                           ^
ssl/qsslsocket_openssl_symbols_p.h:363:39: error: ?SSL_CONF_CTX? was not
declared in this scope
 unsigned int q_SSL_CONF_CTX_set_flags(SSL_CONF_CTX *a, unsigned int b);
                                       ^~~~~~~~~~~~
ssl/qsslsocket_openssl_symbols_p.h:363:39: note: suggested alternative:
?SSL_AEAD_CTX?
 unsigned int q_SSL_CONF_CTX_set_flags(SSL_CONF_CTX *a, unsigned int b);
                                       ^~~~~~~~~~~~
                                       SSL_AEAD_CTX
ssl/qsslsocket_openssl_symbols_p.h:363:53: error: ?a? was not declared in this
scope
 unsigned int q_SSL_CONF_CTX_set_flags(SSL_CONF_CTX *a, unsigned int b);
                                                     ^
ssl/qsslsocket_openssl_symbols_p.h:363:56: error: expected primary-expression
before ?unsigned?
 unsigned int q_SSL_CONF_CTX_set_flags(SSL_CONF_CTX *a, unsigned int b);
                                                        ^~~~~~~~
ssl/qsslsocket_openssl_symbols_p.h:363:70: error: expression list treated as
compound expression in initializer [-fpermissive]
 unsigned int q_SSL_CONF_CTX_set_flags(SSL_CONF_CTX *a, unsigned int b);
                                                                      ^
ssl/qsslsocket_openssl_symbols_p.h:364:27: error: ?SSL_CONF_CTX? was not
declared in this scope
 int q_SSL_CONF_CTX_finish(SSL_CONF_CTX *a);
                           ^~~~~~~~~~~~
ssl/qsslsocket_openssl_symbols_p.h:364:27: note: suggested alternative:
?SSL_AEAD_CTX?
 int q_SSL_CONF_CTX_finish(SSL_CONF_CTX *a);
                           ^~~~~~~~~~~~
                           SSL_AEAD_CTX
ssl/qsslsocket_openssl_symbols_p.h:364:41: error: ?a? was not declared in this
scope
 int q_SSL_CONF_CTX_finish(SSL_CONF_CTX *a);
                                         ^
ssl/qsslsocket_openssl_symbols_p.h:365:20: error: ?SSL_CONF_CTX? was not
declared in this scope
 int q_SSL_CONF_cmd(SSL_CONF_CTX *a, const char *b, const char *c);
                    ^~~~~~~~~~~~
ssl/qsslsocket_openssl_symbols_p.h:365:20: note: suggested alternative:
?SSL_AEAD_CTX?
 int q_SSL_CONF_cmd(SSL_CONF_CTX *a, const char *b, const char *c);
                    ^~~~~~~~~~~~
                    SSL_AEAD_CTX
ssl/qsslsocket_openssl_symbols_p.h:365:34: error: ?a? was not declared in this
scope
 int q_SSL_CONF_cmd(SSL_CONF_CTX *a, const char *b, const char *c);
                                  ^
ssl/qsslsocket_openssl_symbols_p.h:365:37: error: expected primary-expression
before ?const?
 int q_SSL_CONF_cmd(SSL_CONF_CTX *a, const char *b, const char *c);
                                     ^~~~~
ssl/qsslsocket_openssl_symbols_p.h:365:52: error: expected primary-expression
before ?const?
 int q_SSL_CONF_cmd(SSL_CONF_CTX *a, const char *b, const char *c);
                                                    ^~~~~
ssl/qsslsocket_openssl_symbols_p.h:365:65: error: expression list treated as
compound expression in initializer [-fpermissive]
 int q_SSL_CONF_cmd(SSL_CONF_CTX *a, const char *b, const char *c);
                                                                 ^
make[4]: *** [Makefile:24347: .obj/qsslcertificate.o] Error 1
make[4]: *** Waiting for unfinished jobs....

-- 
You are receiving this mail because:
You are on the CC list for the bug.
