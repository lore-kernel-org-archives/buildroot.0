From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Mar 2020 21:08:18 +0100
Subject: [Buildroot] [PATCH 3/4] package/python-pycrypto: fix python3.8
 compatibility
In-Reply-To: <20200308183535.1206604-3-romain.naour@smile.fr> (Romain Naour's
 message of "Sun, 8 Mar 2020 19:35:34 +0100")
References: <20200308183535.1206604-1-romain.naour@smile.fr>
 <20200308183535.1206604-3-romain.naour@smile.fr>
Message-ID: <87h7yysj7x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:

 > As reported by [1], time clock was deprecated in Python 3.3 and removed in Python 3.8.
 > Apply the patch from the PR [2] since there is no upstream activity.

 > Fixes:
 >>>> optee-os 3.7.0 Building
 > Traceback (most recent call last):
 >   File "scripts/sign.py", line 234, in <module>
 >     main()
 >   File "scripts/sign.py", line 224, in main
 >     {
 >   File "scripts/sign.py", line 189, in sign_ta
 >     sig = signer.sign(h)
 >   File "/home/naourr/buildroot/test/qemu_arm_vexpress_tz/host/lib/python3.8/site-packages/Crypto/Signature/PKCS1_v1_5.py", line 112, in sign
 >     m = self._key.decrypt(em)
 >   File "/home/naourr/buildroot/test/qemu_arm_vexpress_tz/host/lib/python3.8/site-packages/Crypto/PublicKey/RSA.py", line 174, in decrypt
 >     return pubkey.pubkey.decrypt(self, ciphertext)
 >   File "/home/naourr/buildroot/test/qemu_arm_vexpress_tz/host/lib/python3.8/site-packages/Crypto/PublicKey/pubkey.py", line 93, in decrypt
 >     plaintext=self._decrypt(ciphertext)
 >   File "/home/naourr/buildroot/test/qemu_arm_vexpress_tz/host/lib/python3.8/site-packages/Crypto/PublicKey/RSA.py", line 235, in _decrypt
 >     r = getRandomRange(1, self.key.n-1, randfunc=self._randfunc)
 >   File "/home/naourr/buildroot/test/qemu_arm_vexpress_tz/host/lib/python3.8/site-packages/Crypto/Util/number.py", line 123, in getRandomRange
 >     value = getRandomInteger(bits, randfunc)
 >   File "/home/naourr/buildroot/test/qemu_arm_vexpress_tz/host/lib/python3.8/site-packages/Crypto/Util/number.py", line 104, in getRandomInteger
 >     S = randfunc(N>>3)
 >   File "/home/naourr/buildroot/test/qemu_arm_vexpress_tz/host/lib/python3.8/site-packages/Crypto/Random/_UserFriendlyRNG.py", line 202, in read
 >     return self._singleton.read(bytes)
 >   File "/home/naourr/buildroot/test/qemu_arm_vexpress_tz/host/lib/python3.8/site-packages/Crypto/Random/_UserFriendlyRNG.py", line 178, in read
 >     return _UserFriendlyRNG.read(self, bytes)
 >   File "/home/naourr/buildroot/test/qemu_arm_vexpress_tz/host/lib/python3.8/site-packages/Crypto/Random/_UserFriendlyRNG.py", line 129, in read
 >     self._ec.collect()
 >   File "/home/naourr/buildroot/test/qemu_arm_vexpress_tz/host/lib/python3.8/site-packages/Crypto/Random/_UserFriendlyRNG.py", line 77, in collect
 >     t = time.clock()
 > AttributeError: module 'time' has no attribute 'clock'

 > This issue could be reproduced on the target.

 > [1] https://github.com/dlitz/pycrypto/issues/283
 > [2] https://github.com/dlitz/pycrypto/pull/296

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > ---
 >  ...ock-with-time.process_time-time-cloc.patch | 35 +++++++++++++++++++
 >  1 file changed, 35 insertions(+)
 >  create mode 100644 package/python-pycrypto/0002-replaced-time.clock-with-time.process_time-time-cloc.patch

 > diff --git a/package/python-pycrypto/0002-replaced-time.clock-with-time.process_time-time-cloc.patch b/package/python-pycrypto/0002-replaced-time.clock-with-time.process_time-time-cloc.patch
 > new file mode 100644
 > index 0000000000..b12b58ddf1
 > --- /dev/null
 > +++ b/package/python-pycrypto/0002-replaced-time.clock-with-time.process_time-time-cloc.patch
 > @@ -0,0 +1,35 @@
 > +From 6d76976527096cf0138d61fc25bd932d725f8436 Mon Sep 17 00:00:00 2001
 > +From: Fabian Topfstedt <topfstedt@schneevonmorgen.com>
 > +Date: Mon, 18 Nov 2019 22:19:35 +0100
 > +Subject: [PATCH] replaced time.clock with time.process_time (time clock was
 > + flagged as deprecated in Python 3.3 and got removed in Python 3.8)
 > +
 > +Downloaded from github pull request [1].
 > +Related to issue [2].
 > +
 > +[1] https://github.com/dlitz/pycrypto/pull/296
 > +[2] https://github.com/dlitz/pycrypto/issues/283
 > +
 > +Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > +---
 > + lib/Crypto/Random/_UserFriendlyRNG.py | 4 ++--
 > + 1 file changed, 2 insertions(+), 2 deletions(-)
 > +
 > +diff --git a/lib/Crypto/Random/_UserFriendlyRNG.py b/lib/Crypto/Random/_UserFriendlyRNG.py
 > +index 957e006..f389cfc 100644
 > +--- a/lib/Crypto/Random/_UserFriendlyRNG.py
 > ++++ b/lib/Crypto/Random/_UserFriendlyRNG.py
 > +@@ -73,8 +73,8 @@ class _EntropyCollector(object):
 > +         t = time.time()
 > +         self._time_es.feed(struct.pack("@I", int(2**30 * (t - floor(t)))))
 > + 
 > +-        # Add the fractional part of time.clock()
 > +-        t = time.clock()
 > ++        # Add the fractional part of time.process_time()
 > ++        t = time.process_time()

This unfortunately does not work with python 2.x:

python
Python 2.7.16 (default, Oct 10 2019, 22:02:15)
[GCC 8.3.0] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>> import time
>>> time.process_time()
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
AttributeError: 'module' object has no attribute 'process_time'
>>> time.clock()
0.016955

So we will need to make it conditional as long as we support python 2.x.

-- 
Bye, Peter Korsgaard
