From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Aug 2018 00:00:10 +0200
Subject: [Buildroot] [PATCH/next/RFC 1/1] package/nodejs: use
 host-libopenssl
In-Reply-To: <20180819165158.25255-1-bernd.kuhls@t-online.de>
References: <20180819165158.25255-1-bernd.kuhls@t-online.de>
Message-ID: <20180821000010.3d93612c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 19 Aug 2018 18:51:58 +0200, Bernd Kuhls wrote:
> host-nodejs is configured to build openssl by using its included openssl
> source code which is based on openssl 1.0.2. If host-libopenssl was
> already built its header files are being picked up during host-nodejs
> build, this was verified by adding debug code to
> $(HOST_DIR)/include/openssl/opensslv.h.
> 
> This situation was not a problem as long as host-libopenssl was the
> same version than the openssl code included in nodejs.
> 
> Some code in host-nodejs-8.11.4/src/node_crypto.cc is guarded by
> 
> 	#if OPENSSL_VERSION_NUMBER < 0x10100000L
> 
> to be used only with openssl 1.0.x.
> 
> This leads to problems if host-libopenssl 1.1.x was built before. Due
> to the usage of its header files some code in node_crypto.cc is not
> built leading to many linking errors later on, for example:
> 
> node_crypto.cc:(.text+0x1a1): undefined reference to `DH_get0_pqg'
> 
> When the nodejs package originally was added to buildroot back in
> March 2013:
> https://git.buildroot.net/buildroot/commit/?id=b31bc7d4387095091a109eb879464d54d37a5eab
> 
> We did not have a host-libopenssl package back then, it was added one
> month later:
> https://git.buildroot.net/buildroot/commit/?id=7842789cb539b6b64d61b03f5c8dbe6813f01da7
> 
> To fix the problem we use host-libopenssl for host-nodejs.
> By using host-libopenssl the build time of nodejs is reduced by ~15s.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/nodejs/nodejs.mk | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
