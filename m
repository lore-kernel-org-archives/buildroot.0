From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Jul 2020 21:02:22 +0200
Subject: [Buildroot] [PATCH] package/fastd: bump to v19
In-Reply-To: <0f6cea5d-1b7e-db81-bf00-2904c5b9888e@universe-factory.net>
 (Matthias Schiffer's message of "Mon, 27 Jul 2020 19:50:26 +0200")
References: <20200611192504.4058-1-post@lespocky.de>
 <871rlcxyr1.fsf@dell.be.48ers.dk>
 <20200727064234.xgzcmnvpfpcuxhoo@falbala.internal.home.lespocky.de>
 <0f6cea5d-1b7e-db81-bf00-2904c5b9888e@universe-factory.net>
Message-ID: <87365cvl1d.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matthias" == Matthias Schiffer <mschiffer@universe-factory.net> writes:

 > On 7/27/20 8:42 AM, Alexander Dahl wrote:
 >> Hei hei,
 >> 
 >> just returning from two weeks holiday ?
 >> 
 >> On Wed, Jul 15, 2020 at 11:19:14PM +0200, Peter Korsgaard wrote:
 >>>>>>>> "Alexander" == Alexander Dahl <post@lespocky.de> writes:
 >>> 
 >>> > Maintenance release, most important is OpenSSL 1.1+ support. See full
 >>> > release notes for details:
 >>> 
 >>> > https://fastd.readthedocs.io/en/stable/releases/v19.html
 >>> 
 >>> Does this mean that fastd 18 is broken with openssl 1.1?, E.G. does this
 >>> need to be backported to 2020.02.x?
 >> 
 >> From the top of my head, I would say no.  It probably means fastd is
 >> supposed to work with OpenSSL 1.1 or later now?  It would have caused
 >> build errors against OpenSSL 1.1 in the past, if that would not have
 >> been the case, right?
 >> 
 >> I put upstream in Cc, maybe he can answer this?
 >> 
 >> Greets
 >> Alex
 >> 

 > fastd 18 does not build against OpenSSL 1.1 without additional patches
 > (which had been backported to many desktop distributions).

 > At a glance, it looks like the buildroot fastd v18 package should not
 > compile when BR2_PACKAGE_OPENSSL is set.

Hmm, it does on 2020.02.x:

>>> libopenssl 1.1.1g Installing to target
..
>>> fastd 18 Configuring
(mkdir -p /home/peko/source/buildroot/output-fastd/build/fastd-18/ && cd /home/peko/source/buildroot/output-fastd/build/fastd-18/ && rm -f CMakeCache.txt && PATH="/home/peko/source/buildroot/output-fastd/host/bin:/home/peko/source/buildroot/output-fastd/host/sbin:/home/peko/bin:/home/peko/.local/bin:/home/peko/bin:/home/peko/.local/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"  /usr/bin/cmake /home/peko/source/buildroot/output-fastd/build/fastd-18/ -DCMAKE_TOOLCHAIN_FILE="/home/peko/source/buildroot/output-fastd/host/share/buildroot/toolchainfile.cmake" -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_COLOR_MAKEFILE=OFF -DBUILD_DOC=OFF -DBUILD_DOCS=OFF -DBUILD_EXAMPLE=OFF -DBUILD_EXAMPLES=OFF -DBUILD_TEST=OFF -DBUILD_TESTS=OFF -DBUILD_TESTING=OFF -DBUILD_SHARED_LIBS=ON  -DENABLE_LIBSODIUM=ON -DENABLE_OPENSSL=ON -DWITH_STATUS_SOCKET=ON -DENABLE_SYSTEMD=OFF -DENABLE_LTO=OFF )
..
>>> fastd 18 Building
..
/home/peko/source/buildroot/output-fastd/build/fastd-18/src/fastd.c: In function ?init_config?:
/home/peko/source/buildroot/output-fastd/build/fastd-18/src/fastd.c:506:2: warning: ?OPENSSL_config? is deprecated [-Wdeprecated-declarations]
  OPENSSL_config(NULL);
  ^
In file included from /home/peko/source/buildroot/output-fastd/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/openssl/e_os2.h:13:0,
                 from /home/peko/source/buildroot/output-fastd/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/openssl/bio.h:13,
                 from /home/peko/source/buildroot/output-fastd/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/openssl/conf.h:13,
                 from /home/peko/source/buildroot/output-fastd/build/fastd-18/src/fastd.c:58:
/home/peko/source/buildroot/output-fastd/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/openssl/conf.h:91:1: note: declared here
 DEPRECATEDIN_1_1_0(void OPENSSL_config(const char *config_name))
 ^
..
[100%] Linking C executable fastd
[100%] Built target fastd


I take it you are referring to this change for openssl 1.1 support?

https://github.com/NeoRaider/fastd/commit/8505374ee208d51a39e7b22846f9b781b9ccb452

But EVP_EncryptInit() is still available in 1.1.x:

nm target/usr/lib/libcrypto.a | grep 'EVP_EncryptInit$'
00000ef0 T EVP_EncryptInit

As described in the documentation:

The functions EVP_EncryptInit(), EVP_EncryptFinal(), EVP_DecryptInit(),
EVP_CipherInit() and EVP_CipherFinal() are obsolete but are retained for
compatibility with existing code

https://www.openssl.org/docs/man1.1.0/man3/EVP_EncryptInit.html

-- 
Bye, Peter Korsgaard
