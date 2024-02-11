Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6378C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 21:49:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F74C831F8;
	Sun, 11 Feb 2024 21:49:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W-G35tGw2HUT; Sun, 11 Feb 2024 21:49:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C40D5850FB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C40D5850FB;
	Sun, 11 Feb 2024 21:49:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 015321BF2EF
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:49:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E292260FB8
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:49:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q4Jhxtk57oPb for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 21:49:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1E400600C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E400600C6
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1E400600C6
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 21:49:10 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-363b8429f03so7562175ab.1
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 13:49:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707688149; x=1708292949;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tb9Cb4ojz1LMM1DR169gLPJKvQZkGq02S4aXYByfh20=;
 b=a1tn4bq15hxvvMBrt21KOPqop3QFtQMFVWIfbzVZ1KhKdVY+0faPfa9qjz8C2UtgGZ
 nH3uwJKzgFoe/o2LGxWQ5wy54HgS7OYOmHh4eP28Ta0fDeJ9KXnTljZjuyCeJiSTbuu5
 cIQnWvoqNjdwck5K7Qgt5S9BfLnGg9GtRkybsjbKIv3AWnFY4yUgCYEo2xZVEsDTm9qn
 DgbuEfzGZKKIl1LrrtTD/uT/ChA03imp4hSjBrD55j3X7I2OmfdSB8W+csoUyaMXQGoG
 KxPknfuPYxnbCxbYJy5wFa3RLY3m2/jBiXEYjkmuU07RmcIfsg0e2vwhKxeD3AHB6+VP
 7w7A==
X-Gm-Message-State: AOJu0YzL0ssLzHLCZ/auawLsqb+fDtTtIAHEKw9VIjUgKAdbp+niQMzz
 YlHFUpLHAsnqZF1wxvYHPUUlclb19I8f8EbN7fiB0+wSD+8I+kr4QMWHGNOD2io=
X-Google-Smtp-Source: AGHT+IEc5jvrXe/GPwBKtavgcs4Rlde6zQXJw2k0N7P1+aNPYvjsGxexb8uROGkrmKujuyNtxV7nuA==
X-Received: by 2002:a92:c902:0:b0:363:bc94:7ea6 with SMTP id
 t2-20020a92c902000000b00363bc947ea6mr5452121ilp.31.1707688149271; 
 Sun, 11 Feb 2024 13:49:09 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVvJMBJTt5JDrGyBpwULLBAYKPMYaD1KJ0KkR0MDWF+qhJEj2/5JPkIrBePGSQg+U80sifQRZ2qUgzoZAHFQXW5ZWSZtaHCUoy1Epeqwc6iaDNnpd1F29mOTKQIMFkN9X2hE1I7mU2+IcBT4tS89tuyzxXLVLxf6MczKXKysREgoTrGcMP9Udcx9zj1SQ7kfLIfauoXn5wsuy4HmEHFZwU=
Received: from james-x399.localdomain (71-218-247-10.hlrn.qwest.net.
 [71.218.247.10]) by smtp.gmail.com with ESMTPSA id
 17-20020a5d9c11000000b007c41e541b8fsm1148747ioe.32.2024.02.11.13.49.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Feb 2024 13:49:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 14:49:03 -0700
Message-Id: <20240211214904.89575-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707688149; x=1708292949; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Tb9Cb4ojz1LMM1DR169gLPJKvQZkGq02S4aXYByfh20=;
 b=d2Dqik+SItQqPVH95eKYwRyo+0ZscOd7hEyBjb5qs613GmSwsFSsAEaSjeeHQ0LJEh
 ytsGUFNXMtCxunOP12J1rZyJ2cjPvmdfXhsOOUu2EIkqrFcSj7zH+8vh9myKKnpzUBHZ
 sbFuumgYx6LzshOlo1FUc3s2No1H+db2YJxAqFeUykMh1ocxAPmHXQIGmhsIaENfaCuw
 SYijeamgU1PnFS7Q5bLv3EWxvY0guIiA3Sxrp9Bf0yycEBIx5541dmAl4rOznce1Yv6Y
 TSoANamtY/+RDBrOrb1Qz4qJ6iFRWhRaJDoKKFlt+S1vpcBMvB3PvCgW3rI3HKY80BUJ
 X0Zw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=d2Dqik+S
Subject: [Buildroot] [PATCH v2 1/2] package/python-uvloop: add support for
 cython3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add patches from pending upstream pull request which add cython3
compatibility.

These patches have been in use by gentoo so they should be have
a decent amount of real world testing/usage.

See:
https://github.com/gentoo/gentoo/commit/cd37f8eb287497af5a30b3c68beafc82412cd88d

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - fix header for check-package
---
 .../0001-Updates-for-Cython3.patch            | 630 ++++++++++++++++++
 ...ebug-has-args-difference-in-python-3.patch |  29 +
 .../0003-fix-tests-on-python-3.8.patch        |  30 +
 .../0004-fix-arg-count-for-wrap.patch         |  51 ++
 4 files changed, 740 insertions(+)
 create mode 100644 package/python-uvloop/0001-Updates-for-Cython3.patch
 create mode 100644 package/python-uvloop/0002-_set_coroutine_debug-has-args-difference-in-python-3.patch
 create mode 100644 package/python-uvloop/0003-fix-tests-on-python-3.8.patch
 create mode 100644 package/python-uvloop/0004-fix-arg-count-for-wrap.patch

diff --git a/package/python-uvloop/0001-Updates-for-Cython3.patch b/package/python-uvloop/0001-Updates-for-Cython3.patch
new file mode 100644
index 0000000000..5ed1c7536f
--- /dev/null
+++ b/package/python-uvloop/0001-Updates-for-Cython3.patch
@@ -0,0 +1,630 @@
+From 087a2983c8022598232cb7ed0a49da334d7af9ff Mon Sep 17 00:00:00 2001
+From: Alan Brooks <12380017+alan-brooks@users.noreply.github.com>
+Date: Thu, 28 Dec 2023 12:18:15 +0000
+Subject: [PATCH] Updates for Cython3 Remove SSL depreciation warnings buillt
+ on debian 12.6 python-3.22 Cython-3.0.7 libuv-1.46.0
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://github.com/MagicStack/uvloop/pull/587
+---
+ Makefile                         |  2 +-
+ setup.py                         |  6 ++++--
+ tests/test_process.py            |  4 ++--
+ tests/test_tcp.py                | 19 ++++++++++++-------
+ uvloop/_testbase.py              |  4 +++-
+ uvloop/cbhandles.pyx             |  4 ++--
+ uvloop/dns.pyx                   |  4 ++--
+ uvloop/handles/basetransport.pxd |  4 ++--
+ uvloop/handles/basetransport.pyx |  4 ++--
+ uvloop/handles/handle.pyx        |  2 +-
+ uvloop/handles/pipe.pyx          |  2 +-
+ uvloop/handles/poll.pxd          |  2 +-
+ uvloop/handles/poll.pyx          |  2 +-
+ uvloop/handles/stream.pyx        | 16 ++++++++++------
+ uvloop/handles/udp.pyx           |  4 ++--
+ uvloop/includes/consts.pxi       | 25 -------------------------
+ uvloop/includes/fork_handler.h   |  6 +++++-
+ uvloop/includes/system.h         | 16 ++++++++++++++++
+ uvloop/includes/system.pxd       | 12 ++++--------
+ uvloop/includes/uv.pxd           |  6 +++---
+ uvloop/loop.pxd                  | 28 ++++++++++++++++++++++++----
+ uvloop/loop.pyx                  | 10 +++++-----
+ uvloop/sslproto.pxd              |  4 ++--
+ uvloop/sslproto.pyx              |  4 ++--
+ 24 files changed, 107 insertions(+), 83 deletions(-)
+ delete mode 100644 uvloop/includes/consts.pxi
+ create mode 100755 uvloop/includes/system.h
+
+diff --git a/Makefile b/Makefile
+index 4375e5d..6a0475a 100644
+--- a/Makefile
++++ b/Makefile
+@@ -9,7 +9,7 @@ _default: compile
+ 
+ 
+ clean:
+-	rm -fr dist/ doc/_build/ *.egg-info uvloop/loop.*.pyd
++	rm -fr dist/ doc/_build/ *.egg-info uvloop/loop.*.pyd uvloop/loop_d.*.pyd
+ 	rm -fr uvloop/*.c uvloop/*.html uvloop/*.so
+ 	rm -fr uvloop/handles/*.html uvloop/includes/*.html
+ 	find . -name '__pycache__' | xargs rm -rf
+diff --git a/setup.py b/setup.py
+index ba15af5..8fdf0e5 100644
+--- a/setup.py
++++ b/setup.py
+@@ -21,7 +21,7 @@ from setuptools.command.build_ext import build_ext
+ from setuptools.command.sdist import sdist
+ 
+ 
+-CYTHON_DEPENDENCY = 'Cython(>=0.29.36,<0.30.0)'
++CYTHON_DEPENDENCY = 'Cython(>=0.29.36)'
+ MACHINE = platform.machine()
+ MODULES_CFLAGS = [os.getenv('UVLOOP_OPT_CFLAGS', '-O2')]
+ _ROOT = pathlib.Path(__file__).parent
+@@ -144,7 +144,9 @@ class uvloop_build_ext(build_ext):
+             self.distribution.ext_modules[:] = cythonize(
+                 self.distribution.ext_modules,
+                 compiler_directives=directives,
+-                annotate=self.cython_annotate)
++                annotate=self.cython_annotate,
++                compile_time_env=dict(DEFAULT_FREELIST_SIZE=250, SSL_READ_MAX_SIZE=256 * 1024),
++                emit_linenums=True)
+ 
+         super().finalize_options()
+ 
+diff --git a/tests/test_process.py b/tests/test_process.py
+index bfcbba1..95e1c9e 100644
+--- a/tests/test_process.py
++++ b/tests/test_process.py
+@@ -912,7 +912,7 @@ class Test_UV_Process_Delayed(tb.UVTestCase):
+                 stdin=subprocess.PIPE,
+                 stdout=subprocess.PIPE,
+                 stderr=subprocess.PIPE,
+-                __uvloop_sleep_after_fork=True))
++                uvloop_sleep_after_fork=True))
+         self.assertIsNot(transport, None)
+         self.assertEqual(transport.get_returncode(), 0)
+         self.assertEqual(
+@@ -931,7 +931,7 @@ class Test_UV_Process_Delayed(tb.UVTestCase):
+                 stdin=None,
+                 stdout=subprocess.PIPE,
+                 stderr=subprocess.PIPE,
+-                __uvloop_sleep_after_fork=True))
++                uvloop_sleep_after_fork=True))
+         self.assertIsNot(transport, None)
+         self.assertEqual(transport.get_returncode(), 0)
+         self.assertEqual(
+diff --git a/tests/test_tcp.py b/tests/test_tcp.py
+index 812e62b..213e2d9 100644
+--- a/tests/test_tcp.py
++++ b/tests/test_tcp.py
+@@ -1630,17 +1630,22 @@ class _TestSSL(tb.SSLTestCase):
+             self.fail("unexpected call to connection_made()")
+ 
+     def test_ssl_connect_accepted_socket(self):
+-        if hasattr(ssl, 'PROTOCOL_TLS'):
+-            proto = ssl.PROTOCOL_TLS
++        if hasattr(ssl, 'PROTOCOL_TLS_SERVER'):
++            server_proto = ssl.PROTOCOL_TLS_SERVER
++            client_proto = ssl.PROTOCOL_TLS_CLIENT
+         else:
+-            proto = ssl.PROTOCOL_SSLv23
+-        server_context = ssl.SSLContext(proto)
++            if hasattr(ssl, 'PROTOCOL_TLS'):
++                client_proto = server_proto = ssl.PROTOCOL_TLS
++            else:
++                client_proto = server_proto = ssl.PROTOCOL_SSLv23
++
++        server_context = ssl.SSLContext(server_proto)
+         server_context.load_cert_chain(self.ONLYCERT, self.ONLYKEY)
+         if hasattr(server_context, 'check_hostname'):
+             server_context.check_hostname = False
+         server_context.verify_mode = ssl.CERT_NONE
+ 
+-        client_context = ssl.SSLContext(proto)
++        client_context = ssl.SSLContext(client_proto)
+         if hasattr(server_context, 'check_hostname'):
+             client_context.check_hostname = False
+         client_context.verify_mode = ssl.CERT_NONE
+@@ -2233,7 +2238,7 @@ class _TestSSL(tb.SSLTestCase):
+         sslctx.use_privatekey_file(self.ONLYKEY)
+         sslctx.use_certificate_chain_file(self.ONLYCERT)
+         client_sslctx = self._create_client_ssl_context()
+-        if hasattr(ssl, 'OP_NO_TLSv1_3'):
++        if sys.version_info < (3, 8) and hasattr(ssl, 'OP_NO_TLSv1_3'):
+             client_sslctx.options |= ssl.OP_NO_TLSv1_3
+ 
+         def server(sock):
+@@ -2592,7 +2597,7 @@ class _TestSSL(tb.SSLTestCase):
+         sslctx_openssl.use_privatekey_file(self.ONLYKEY)
+         sslctx_openssl.use_certificate_chain_file(self.ONLYCERT)
+         client_sslctx = self._create_client_ssl_context()
+-        if hasattr(ssl, 'OP_NO_TLSv1_3'):
++        if sys.version_info < (3, 8) and hasattr(ssl, 'OP_NO_TLSv1_3'):
+             client_sslctx.options |= ssl.OP_NO_TLSv1_3
+ 
+         future = None
+diff --git a/uvloop/_testbase.py b/uvloop/_testbase.py
+index c4a7595..e620e15 100644
+--- a/uvloop/_testbase.py
++++ b/uvloop/_testbase.py
+@@ -269,7 +269,9 @@ def find_free_port(start_from=50000):
+ class SSLTestCase:
+ 
+     def _create_server_ssl_context(self, certfile, keyfile=None):
+-        if hasattr(ssl, 'PROTOCOL_TLS'):
++        if hasattr(ssl, 'PROTOCOL_TLS_SERVER'):
++            sslcontext = ssl.SSLContext(ssl.PROTOCOL_TLS_SERVER)
++        elif hasattr(ssl, 'PROTOCOL_TLS'):
+             sslcontext = ssl.SSLContext(ssl.PROTOCOL_TLS)
+         else:
+             sslcontext = ssl.SSLContext(ssl.PROTOCOL_SSLv23)
+diff --git a/uvloop/cbhandles.pyx b/uvloop/cbhandles.pyx
+index 2914b42..8bcc5aa 100644
+--- a/uvloop/cbhandles.pyx
++++ b/uvloop/cbhandles.pyx
+@@ -76,8 +76,8 @@ cdef class Handle:
+                     self.arg1, self.arg2, self.arg3, self.arg4)
+ 
+             else:
+-                raise RuntimeError('invalid Handle.cb_type: {}'.format(
+-                    cb_type))
++                raise RuntimeError('invalid Handle.cb_type: {} {!r}/{!r}'.format(
++                    cb_type, self.args1, self.args2))
+ 
+         except (KeyboardInterrupt, SystemExit):
+             raise
+diff --git a/uvloop/dns.pyx b/uvloop/dns.pyx
+index 7aad631..09b9282 100644
+--- a/uvloop/dns.pyx
++++ b/uvloop/dns.pyx
+@@ -298,7 +298,7 @@ cdef class AddrInfo:
+             uv.uv_freeaddrinfo(self.data)  # returns void
+             self.data = NULL
+ 
+-    cdef void set_data(self, system.addrinfo *data):
++    cdef void set_data(self, system.addrinfo *data) noexcept:
+         self.data = data
+ 
+     cdef unpack(self):
+@@ -326,7 +326,7 @@ cdef class AddrInfo:
+         return result
+ 
+     @staticmethod
+-    cdef int isinstance(object other):
++    cdef int isinstance(object other) noexcept:
+         return type(other) is AddrInfo
+ 
+ 
+diff --git a/uvloop/handles/basetransport.pxd b/uvloop/handles/basetransport.pxd
+index ba356a7..8112622 100644
+--- a/uvloop/handles/basetransport.pxd
++++ b/uvloop/handles/basetransport.pxd
+@@ -47,8 +47,8 @@ cdef class UVBaseTransport(UVSocketHandle):
+     # === overloads ===
+ 
+     cdef _new_socket(self)
+-    cdef size_t _get_write_buffer_size(self)
++    cdef size_t _get_write_buffer_size(self) noexcept
+ 
+-    cdef bint _is_reading(self)
++    cdef bint _is_reading(self) noexcept
+     cdef _start_reading(self)
+     cdef _stop_reading(self)
+diff --git a/uvloop/handles/basetransport.pyx b/uvloop/handles/basetransport.pyx
+index 28b3079..a8592f2 100644
+--- a/uvloop/handles/basetransport.pyx
++++ b/uvloop/handles/basetransport.pyx
+@@ -18,7 +18,7 @@ cdef class UVBaseTransport(UVSocketHandle):
+ 
+         self._closing = 0
+ 
+-    cdef size_t _get_write_buffer_size(self):
++    cdef size_t _get_write_buffer_size(self) noexcept:
+         return 0
+ 
+     cdef inline _schedule_call_connection_made(self):
+@@ -211,7 +211,7 @@ cdef class UVBaseTransport(UVSocketHandle):
+             self._extra_info = {}
+         self._extra_info[name] = obj
+ 
+-    cdef bint _is_reading(self):
++    cdef bint _is_reading(self) noexcept:
+         raise NotImplementedError
+ 
+     cdef _start_reading(self):
+diff --git a/uvloop/handles/handle.pyx b/uvloop/handles/handle.pyx
+index 6efe375..2c96458 100644
+--- a/uvloop/handles/handle.pyx
++++ b/uvloop/handles/handle.pyx
+@@ -363,7 +363,7 @@ cdef void __uv_close_handle_cb(uv.uv_handle_t* handle) noexcept with gil:
+             Py_DECREF(h)  # Was INCREFed in UVHandle._close
+ 
+ 
+-cdef void __close_all_handles(Loop loop):
++cdef void __close_all_handles(Loop loop) noexcept:
+     uv.uv_walk(loop.uvloop,
+                __uv_walk_close_all_handles_cb,
+                <void*>loop)  # void
+diff --git a/uvloop/handles/pipe.pyx b/uvloop/handles/pipe.pyx
+index 195576c..d30a736 100644
+--- a/uvloop/handles/pipe.pyx
++++ b/uvloop/handles/pipe.pyx
+@@ -25,7 +25,7 @@ cdef __pipe_init_uv_handle(UVStream handle, Loop loop):
+ cdef __pipe_open(UVStream handle, int fd):
+     cdef int err
+     err = uv.uv_pipe_open(<uv.uv_pipe_t *>handle._handle,
+-                          <uv.uv_file>fd)
++                          <uv.uv_os_fd_t>fd)
+     if err < 0:
+         exc = convert_error(err)
+         raise exc
+diff --git a/uvloop/handles/poll.pxd b/uvloop/handles/poll.pxd
+index d07030b..c220540 100644
+--- a/uvloop/handles/poll.pxd
++++ b/uvloop/handles/poll.pxd
+@@ -10,7 +10,7 @@ cdef class UVPoll(UVHandle):
+     cdef inline _poll_start(self, int flags)
+     cdef inline _poll_stop(self)
+ 
+-    cdef int is_active(self)
++    cdef int is_active(self) noexcept
+ 
+     cdef is_reading(self)
+     cdef is_writing(self)
+diff --git a/uvloop/handles/poll.pyx b/uvloop/handles/poll.pyx
+index fca5981..c905e9b 100644
+--- a/uvloop/handles/poll.pyx
++++ b/uvloop/handles/poll.pyx
+@@ -29,7 +29,7 @@ cdef class UVPoll(UVHandle):
+         handle._init(loop, fd)
+         return handle
+ 
+-    cdef int is_active(self):
++    cdef int is_active(self) noexcept:
+         return (self.reading_handle is not None or
+                 self.writing_handle is not None)
+ 
+diff --git a/uvloop/handles/stream.pyx b/uvloop/handles/stream.pyx
+index d4e02e3..09df887 100644
+--- a/uvloop/handles/stream.pyx
++++ b/uvloop/handles/stream.pyx
+@@ -1,4 +1,8 @@
+-DEF __PREALLOCED_BUFS = 4
++cdef extern from *:
++    '''
++    enum {__PREALLOCED_BUFS = 4};
++    '''
++    const bint __PREALLOCED_BUFS
+ 
+ 
+ @cython.no_gc_clear
+@@ -279,7 +283,7 @@ cdef class UVStream(UVBaseTransport):
+     cdef inline _close_on_read_error(self):
+         self.__read_error_close = 1
+ 
+-    cdef bint _is_reading(self):
++    cdef bint _is_reading(self) noexcept:
+         return self.__reading
+ 
+     cdef _start_reading(self):
+@@ -578,7 +582,7 @@ cdef class UVStream(UVBaseTransport):
+ 
+         self._maybe_resume_protocol()
+ 
+-    cdef size_t _get_write_buffer_size(self):
++    cdef size_t _get_write_buffer_size(self) noexcept:
+         if self._handle is NULL:
+             return 0
+         return ((<uv.uv_stream_t*>self._handle).write_queue_size +
+@@ -755,7 +759,7 @@ cdef inline bint __uv_stream_on_read_common(
+     UVStream sc,
+     Loop loop,
+     ssize_t nread,
+-):
++) noexcept:
+     if sc._closed:
+         # The stream was closed, there is no reason to
+         # do any work now.
+@@ -818,7 +822,7 @@ cdef inline void __uv_stream_on_read_impl(
+     uv.uv_stream_t* stream,
+     ssize_t nread,
+     const uv.uv_buf_t* buf,
+-):
++) noexcept:
+     cdef:
+         UVStream sc = <UVStream>stream.data
+         Loop loop = sc._loop
+@@ -849,7 +853,7 @@ cdef inline void __uv_stream_on_read_impl(
+ cdef inline void __uv_stream_on_write_impl(
+     uv.uv_write_t* req,
+     int status,
+-):
++) noexcept:
+     cdef:
+         _StreamWriteContext ctx = <_StreamWriteContext> req.data
+         UVStream stream = <UVStream>ctx.stream
+diff --git a/uvloop/handles/udp.pyx b/uvloop/handles/udp.pyx
+index bbe60d5..fdd1d8b 100644
+--- a/uvloop/handles/udp.pyx
++++ b/uvloop/handles/udp.pyx
+@@ -127,12 +127,12 @@ cdef class UDPTransport(UVBaseTransport):
+             exc = convert_error(err)
+             raise exc
+ 
+-    cdef size_t _get_write_buffer_size(self):
++    cdef size_t _get_write_buffer_size(self) noexcept:
+         if self._handle is NULL:
+             return 0
+         return (<uv.uv_udp_t*>self._handle).send_queue_size
+ 
+-    cdef bint _is_reading(self):
++    cdef bint _is_reading(self) noexcept:
+         return self.__receiving
+ 
+     cdef _start_reading(self):
+diff --git a/uvloop/includes/consts.pxi b/uvloop/includes/consts.pxi
+deleted file mode 100644
+index f765053..0000000
+--- a/uvloop/includes/consts.pxi
++++ /dev/null
+@@ -1,25 +0,0 @@
+-DEF UV_STREAM_RECV_BUF_SIZE = 256000  # 250kb
+-
+-DEF FLOW_CONTROL_HIGH_WATER = 64  # KiB
+-DEF FLOW_CONTROL_HIGH_WATER_SSL_READ = 256  # KiB
+-DEF FLOW_CONTROL_HIGH_WATER_SSL_WRITE = 512  # KiB
+-
+-DEF DEFAULT_FREELIST_SIZE = 250
+-DEF DNS_PYADDR_TO_SOCKADDR_CACHE_SIZE = 2048
+-
+-DEF DEBUG_STACK_DEPTH = 10
+-
+-
+-DEF __PROCESS_DEBUG_SLEEP_AFTER_FORK = 1
+-
+-
+-DEF LOG_THRESHOLD_FOR_CONNLOST_WRITES = 5
+-
+-
+-# Number of seconds to wait for SSL handshake to complete
+-# The default timeout matches that of Nginx.
+-DEF SSL_HANDSHAKE_TIMEOUT = 60.0
+-# Number of seconds to wait for SSL shutdown to complete
+-# The default timeout mimics lingering_time
+-DEF SSL_SHUTDOWN_TIMEOUT = 30.0
+-DEF SSL_READ_MAX_SIZE = 256 * 1024
+diff --git a/uvloop/includes/fork_handler.h b/uvloop/includes/fork_handler.h
+index 47bbe03..9d3573a 100644
+--- a/uvloop/includes/fork_handler.h
++++ b/uvloop/includes/fork_handler.h
+@@ -1,7 +1,10 @@
++#ifndef UVLOOP_FORK_HANDLER_H_
++#define UVLOOP_FORK_HANDLER_H_
++
+ volatile uint64_t MAIN_THREAD_ID = 0;
+ volatile int8_t MAIN_THREAD_ID_SET = 0;
+ 
+-typedef void (*OnForkHandler)();
++typedef void (*OnForkHandler)(void);
+ 
+ OnForkHandler __forkHandler = NULL;
+ 
+@@ -36,3 +39,4 @@ void setMainThreadID(uint64_t id) {
+     MAIN_THREAD_ID = id;
+     MAIN_THREAD_ID_SET = 1;
+ }
++#endif
+diff --git a/uvloop/includes/system.h b/uvloop/includes/system.h
+new file mode 100755
+index 0000000..e143bb5
+--- /dev/null
++++ b/uvloop/includes/system.h
+@@ -0,0 +1,16 @@
++#ifndef UVLOOP_SYSTEM_H_
++#define UVLOOP_SYSTEM_H_
++#if defined(_WIN32) || defined(MS_WINDOWS) || defined(_MSC_VER)
++#include "Winsock2.h"
++#include "ws2def.h"
++#include "includes/fork_handler.h"
++#else
++#include "arpa/inet.h"
++#include "sys/socket.h"
++#include "sys/un.h"
++#include "unistd.h"
++#include "pthread.h"
++#endif
++#endif
++
++
+diff --git a/uvloop/includes/system.pxd b/uvloop/includes/system.pxd
+index 367fedd..d1da74e 100644
+--- a/uvloop/includes/system.pxd
++++ b/uvloop/includes/system.pxd
+@@ -1,13 +1,9 @@
+ from libc.stdint cimport int8_t, uint64_t
+ 
+-cdef extern from "arpa/inet.h" nogil:
+-
+-    int ntohl(int)
+-    int htonl(int)
+-    int ntohs(int)
+-
+-
+-cdef extern from "sys/socket.h" nogil:
++cdef extern from "includes/system.h":
++    int ntohl(int) nogil
++    int htonl(int) nogil
++    int ntohs(int) nogil
+ 
+     struct sockaddr:
+         unsigned short sa_family
+diff --git a/uvloop/includes/uv.pxd b/uvloop/includes/uv.pxd
+index 8765130..ddd9738 100644
+--- a/uvloop/includes/uv.pxd
++++ b/uvloop/includes/uv.pxd
+@@ -220,7 +220,7 @@ cdef extern from "uv.h" nogil:
+         UV_LEAVE_GROUP = 0,
+         UV_JOIN_GROUP
+ 
+-    cpdef enum uv_fs_event:
++    cdef enum uv_fs_event:
+         UV_RENAME = 1,
+         UV_CHANGE = 2
+ 
+@@ -282,7 +282,7 @@ cdef extern from "uv.h" nogil:
+     int uv_loop_close(uv_loop_t* loop)
+     int uv_loop_alive(uv_loop_t* loop)
+     int uv_loop_fork(uv_loop_t* loop)
+-    int uv_backend_fd(uv_loop_t* loop)
++    uv_os_fd_t uv_backend_fd(uv_loop_t* loop)
+ 
+     void uv_update_time(uv_loop_t* loop)
+     uint64_t uv_now(const uv_loop_t*)
+@@ -378,7 +378,7 @@ cdef extern from "uv.h" nogil:
+     # Pipes
+ 
+     int uv_pipe_init(uv_loop_t* loop, uv_pipe_t* handle, int ipc)
+-    int uv_pipe_open(uv_pipe_t* handle, uv_file file)
++    int uv_pipe_open(uv_pipe_t* handle, uv_os_fd_t file)
+     int uv_pipe_bind(uv_pipe_t* handle, const char* name)
+ 
+     void uv_pipe_connect(uv_connect_t* req, uv_pipe_t* handle,
+diff --git a/uvloop/loop.pxd b/uvloop/loop.pxd
+index 5613473..f90c704 100644
+--- a/uvloop/loop.pxd
++++ b/uvloop/loop.pxd
+@@ -1,15 +1,35 @@
+ # cython: language_level=3
+ 
++cdef extern from *:
++    '''
++    enum { UV_STREAM_RECV_BUF_SIZE = 256000,
++           SSL_READ_MAX_SIZE = 256 * 1024,  // 250kb
++          };
++    const float SSL_HANDSHAKE_TIMEOUT = 60.0; // Number of seconds to wait for SSL handshake to complete The default timeout matches that of Nginx.
++    const float SSL_SHUTDOWN_TIMEOUT  = 30.0; // Number of seconds to wait for SSL shutdown to complete The default timeout mimics lingering_time
++    '''
++    const bint UV_STREAM_RECV_BUF_SIZE
++    const bint SSL_READ_MAX_SIZE
++
++    const float SSL_HANDSHAKE_TIMEOUT
++    const float SSL_SHUTDOWN_TIMEOUT
++
++cdef enum:
++    FLOW_CONTROL_HIGH_WATER = 64  # KiB
++    FLOW_CONTROL_HIGH_WATER_SSL_READ = 256  # KiB
++    FLOW_CONTROL_HIGH_WATER_SSL_WRITE = 512  # KiB
++
++    DNS_PYADDR_TO_SOCKADDR_CACHE_SIZE = 2048
++    DEBUG_STACK_DEPTH = 10
++    __PROCESS_DEBUG_SLEEP_AFTER_FORK = 1
++    LOG_THRESHOLD_FOR_CONNLOST_WRITES = 5
++
+ 
+ from .includes cimport uv
+ from .includes cimport system
+ 
+ from libc.stdint cimport uint64_t, uint32_t, int64_t
+ 
+-
+-include "includes/consts.pxi"
+-
+-
+ cdef extern from *:
+     ctypedef int vint "volatile int"
+ 
+diff --git a/uvloop/loop.pyx b/uvloop/loop.pyx
+index 334d8d5..53e1160 100644
+--- a/uvloop/loop.pyx
++++ b/uvloop/loop.pyx
+@@ -43,7 +43,7 @@ from cpython.pycapsule cimport PyCapsule_New, PyCapsule_GetPointer
+ from . import _noop
+ 
+ 
+-include "includes/consts.pxi"
++
+ include "includes/stdlib.pxi"
+ 
+ include "errors.pyx"
+@@ -1118,7 +1118,7 @@ cdef class Loop:
+ 
+     cdef _sock_set_reuseport(self, int fd):
+         cdef:
+-            int err
++            int err = 0
+             int reuseport_flag = 1
+ 
+         err = system.setsockopt(
+@@ -1397,7 +1397,7 @@ cdef class Loop:
+         self._debug = bool(enabled)
+         if self.is_running():
+             self.call_soon_threadsafe(
+-                self._set_coroutine_debug, self, self._debug)
++                self._set_coroutine_debug, self._debug)
+ 
+     def is_running(self):
+         """Return whether the event loop is currently running."""
+@@ -2750,7 +2750,7 @@ cdef class Loop:
+                                executable=None,
+                                pass_fds=(),
+                                # For tests only! Do not use in your code. Ever.
+-                               __uvloop_sleep_after_fork=False):
++                               uvloop_sleep_after_fork=False):
+ 
+         # TODO: Implement close_fds (might not be very important in
+         # Python 3.5, since all FDs aren't inheritable by default.)
+@@ -2770,7 +2770,7 @@ cdef class Loop:
+         if executable is not None:
+             args[0] = executable
+ 
+-        if __uvloop_sleep_after_fork:
++        if uvloop_sleep_after_fork:
+             debug_flags |= __PROCESS_DEBUG_SLEEP_AFTER_FORK
+ 
+         waiter = self._new_future()
+diff --git a/uvloop/sslproto.pxd b/uvloop/sslproto.pxd
+index 3da10f0..68e4d57 100644
+--- a/uvloop/sslproto.pxd
++++ b/uvloop/sslproto.pxd
+@@ -122,7 +122,7 @@ cdef class SSLProtocol:
+     # Flow control for writes from APP socket
+ 
+     cdef _control_app_writing(self, object context=*)
+-    cdef size_t _get_write_buffer_size(self)
++    cdef size_t _get_write_buffer_size(self) noexcept
+     cdef _set_write_buffer_limits(self, high=*, low=*)
+ 
+     # Flow control for reads to APP socket
+@@ -134,5 +134,5 @@ cdef class SSLProtocol:
+ 
+     cdef _control_ssl_reading(self)
+     cdef _set_read_buffer_limits(self, high=*, low=*)
+-    cdef size_t _get_read_buffer_size(self)
++    cdef size_t _get_read_buffer_size(self) noexcept
+     cdef _fatal_error(self, exc, message=*)
+diff --git a/uvloop/sslproto.pyx b/uvloop/sslproto.pyx
+index 42bb764..0a43746 100644
+--- a/uvloop/sslproto.pyx
++++ b/uvloop/sslproto.pyx
+@@ -861,7 +861,7 @@ cdef class SSLProtocol:
+                     'protocol': self,
+                 })
+ 
+-    cdef size_t _get_write_buffer_size(self):
++    cdef size_t _get_write_buffer_size(self) noexcept:
+         return self._outgoing.pending + self._write_buffer_size
+ 
+     cdef _set_write_buffer_limits(self, high=None, low=None):
+@@ -903,7 +903,7 @@ cdef class SSLProtocol:
+         self._incoming_high_water = high
+         self._incoming_low_water = low
+ 
+-    cdef size_t _get_read_buffer_size(self):
++    cdef size_t _get_read_buffer_size(self) noexcept:
+         return self._incoming.pending
+ 
+     # Flow control for writes to SSL socket
+-- 
+2.34.1
+
diff --git a/package/python-uvloop/0002-_set_coroutine_debug-has-args-difference-in-python-3.patch b/package/python-uvloop/0002-_set_coroutine_debug-has-args-difference-in-python-3.patch
new file mode 100644
index 0000000000..0567eebe82
--- /dev/null
+++ b/package/python-uvloop/0002-_set_coroutine_debug-has-args-difference-in-python-3.patch
@@ -0,0 +1,29 @@
+From 8b63801bfdb1f0cf7fde4f58e96f8628a587b186 Mon Sep 17 00:00:00 2001
+From: Alan Brooks <12380017+alan-brooks@users.noreply.github.com>
+Date: Thu, 28 Dec 2023 16:17:49 +0000
+Subject: [PATCH] _set_coroutine_debug has args difference in python 3.11
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://github.com/MagicStack/uvloop/pull/587
+---
+ uvloop/loop.pyx | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/uvloop/loop.pyx b/uvloop/loop.pyx
+index 53e1160..5ca718e 100644
+--- a/uvloop/loop.pyx
++++ b/uvloop/loop.pyx
+@@ -1396,8 +1396,9 @@ cdef class Loop:
+     def set_debug(self, enabled):
+         self._debug = bool(enabled)
+         if self.is_running():
++            args = (self, self._debug) if sys.version_info < (3, 11) else (self._debug,)
+             self.call_soon_threadsafe(
+-                self._set_coroutine_debug, self._debug)
++                self._set_coroutine_debug, *args)
+ 
+     def is_running(self):
+         """Return whether the event loop is currently running."""
+-- 
+2.34.1
+
diff --git a/package/python-uvloop/0003-fix-tests-on-python-3.8.patch b/package/python-uvloop/0003-fix-tests-on-python-3.8.patch
new file mode 100644
index 0000000000..e9bed5e877
--- /dev/null
+++ b/package/python-uvloop/0003-fix-tests-on-python-3.8.patch
@@ -0,0 +1,30 @@
+From ef5c3e5c6f331692ebcbea9e4c6aead8b2187038 Mon Sep 17 00:00:00 2001
+From: alan-brooks <12380017+alan-brooks@users.noreply.github.com>
+Date: Thu, 28 Dec 2023 19:58:11 +0000
+Subject: [PATCH] fix tests on python 3.8
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://github.com/MagicStack/uvloop/pull/587
+---
+ uvloop/loop.pyx | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/uvloop/loop.pyx b/uvloop/loop.pyx
+index 5ca718e..75b915a 100644
+--- a/uvloop/loop.pyx
++++ b/uvloop/loop.pyx
+@@ -1396,9 +1396,8 @@ cdef class Loop:
+     def set_debug(self, enabled):
+         self._debug = bool(enabled)
+         if self.is_running():
+-            args = (self, self._debug) if sys.version_info < (3, 11) else (self._debug,)
+-            self.call_soon_threadsafe(
+-                self._set_coroutine_debug, *args)
++            args = ((self, self._debug),) if sys.version_info < (3, 11) else (self._debug,)
++            self.call_soon_threadsafe(self._set_coroutine_debug, *args)
+ 
+     def is_running(self):
+         """Return whether the event loop is currently running."""
+-- 
+2.34.1
+
diff --git a/package/python-uvloop/0004-fix-arg-count-for-wrap.patch b/package/python-uvloop/0004-fix-arg-count-for-wrap.patch
new file mode 100644
index 0000000000..d19923a5bc
--- /dev/null
+++ b/package/python-uvloop/0004-fix-arg-count-for-wrap.patch
@@ -0,0 +1,51 @@
+From afef6364c2c3100ab23c2bb2de82d2da330b258c Mon Sep 17 00:00:00 2001
+From: alan-brooks <12380017+alan-brooks@users.noreply.github.com>
+Date: Fri, 29 Dec 2023 11:24:19 +0000
+Subject: [PATCH] fix arg count for wrap()
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://github.com/MagicStack/uvloop/pull/587
+---
+ uvloop/loop.pxd | 2 +-
+ uvloop/loop.pyx | 5 ++---
+ 2 files changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/uvloop/loop.pxd b/uvloop/loop.pxd
+index f90c704..d34ffeb 100644
+--- a/uvloop/loop.pxd
++++ b/uvloop/loop.pxd
+@@ -220,7 +220,7 @@ cdef class Loop:
+     cdef inline _ceval_process_signals(self)
+     cdef _invoke_signals(self, bytes data)
+ 
+-    cdef _set_coroutine_debug(self, bint enabled)
++    cpdef _set_coroutine_debug(self, bint enabled)
+ 
+     cdef _print_debug_info(self)
+ 
+diff --git a/uvloop/loop.pyx b/uvloop/loop.pyx
+index 75b915a..a3eeb60 100644
+--- a/uvloop/loop.pyx
++++ b/uvloop/loop.pyx
+@@ -1131,7 +1131,7 @@ cdef class Loop:
+         if err < 0:
+             raise convert_error(-errno.errno)
+ 
+-    cdef _set_coroutine_debug(self, bint enabled):
++    cpdef _set_coroutine_debug(self, bint enabled):
+         enabled = bool(enabled)
+         if self._coroutine_debug_set == enabled:
+             return
+@@ -1396,8 +1396,7 @@ cdef class Loop:
+     def set_debug(self, enabled):
+         self._debug = bool(enabled)
+         if self.is_running():
+-            args = ((self, self._debug),) if sys.version_info < (3, 11) else (self._debug,)
+-            self.call_soon_threadsafe(self._set_coroutine_debug, *args)
++             self.call_soon_threadsafe(self._set_coroutine_debug, self._debug)
+ 
+     def is_running(self):
+         """Return whether the event loop is currently running."""
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
